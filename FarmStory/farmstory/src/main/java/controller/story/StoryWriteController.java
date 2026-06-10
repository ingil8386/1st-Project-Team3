package controller.story;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import DAO.CommunityDAO;
import DAO.FileDAO;
import DTO.CommunityDTO;
import DTO.FileDTO;
import DTO.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/story/write.do")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)
public class StoryWriteController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CommunityDAO communityDAO = CommunityDAO.getInstance();
    private FileDAO fileDAO = FileDAO.getInstance();

    private static final String UPLOAD_DIR = "C:/upload/farmstory/community";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String boardno = req.getParameter("boardno");

        if (boardno == null || boardno.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
            return;
        }

        req.setAttribute("boardno", boardno);

        req.getRequestDispatcher("/WEB-INF/views/story/write.jsp")
           .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        MemberDTO sessMember = (MemberDTO) session.getAttribute("sessMember");

        if (sessMember == null) {
            resp.sendRedirect(req.getContextPath() + "/user/login.do");
            return;
        }

        String boardnoParam = req.getParameter("boardno");
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        int boardno = 1;

        try {
            boardno = Integer.parseInt(boardnoParam);
        } catch (Exception e) {
            boardno = 1;
        }

        Part filePart = req.getPart("file");

        boolean hasFile = filePart != null
                && filePart.getSize() > 0
                && filePart.getSubmittedFileName() != null
                && !filePart.getSubmittedFileName().trim().isEmpty();

        if (hasFile && filePart.getSize() > 1024 * 1024 * 10) {
            resp.setContentType("text/html; charset=UTF-8");
            resp.getWriter().println("<script>");
            resp.getWriter().println("alert('첨부파일은 최대 10MB까지만 업로드 가능합니다.');");
            resp.getWriter().println("history.back();");
            resp.getWriter().println("</script>");
            return;
        }

        int nextNo = communityDAO.selectNextBoardPostNo(boardno);

        CommunityDTO dto = new CommunityDTO();
        dto.setBoardno(boardno);
        dto.setBoardpostno(nextNo);
        dto.setTitle(title);
        dto.setContent(content);
        dto.setWriter(sessMember.getMemberid());
        dto.setRegip(req.getRemoteAddr());

        int commno = communityDAO.insertCommunity(dto);

        if (commno == 0) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
            return;
        }

        if (hasFile) {
            File uploadDir = new File(UPLOAD_DIR);

            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            String ofname = filePart.getSubmittedFileName();

            String ext = "";
            int dotIndex = ofname.lastIndexOf(".");
            if (dotIndex != -1) {
                ext = ofname.substring(dotIndex);
            }

            String sfname = UUID.randomUUID().toString() + ext;
            String savePath = UPLOAD_DIR + File.separator + sfname;

            filePart.write(savePath);

            FileDTO fileDTO = new FileDTO();
            fileDTO.setCommno(commno);
            fileDTO.setOfname(ofname);
            fileDTO.setSfname(sfname);

            fileDAO.insertFile(fileDTO);

            communityDAO.updateCommunityFilecheck(commno, 1);
        }

        if (boardno == 1) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
        } else if (boardno == 2) {
            resp.sendRedirect(req.getContextPath() + "/story/garden.do");
        } else if (boardno == 3) {
            resp.sendRedirect(req.getContextPath() + "/story/school.do");
        } else if (boardno == 4) {
            resp.sendRedirect(req.getContextPath() + "/community/notice.do");
        } else if (boardno == 5) {
            resp.sendRedirect(req.getContextPath() + "/community/meal.do");
        } else if (boardno == 6) {
            resp.sendRedirect(req.getContextPath() + "/community/chef.do");
        } else if (boardno == 7) {
            resp.sendRedirect(req.getContextPath() + "/community/qna.do");
        } else if (boardno == 8) {
            resp.sendRedirect(req.getContextPath() + "/community/faq.do");
        } else {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
        }
    }
}