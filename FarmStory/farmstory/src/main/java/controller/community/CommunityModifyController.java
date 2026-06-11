package controller.community;

import java.io.File;
import java.io.IOException;
import java.util.List;
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

@WebServlet("/community/modify.do")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)
public class CommunityModifyController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CommunityDAO communityDAO = CommunityDAO.getInstance();
    private FileDAO fileDAO = FileDAO.getInstance();

    private static final String UPLOAD_DIR = "C:/upload/farmstory/community";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        HttpSession session = req.getSession();
        MemberDTO sessMember = (MemberDTO) session.getAttribute("sessMember");

        if (sessMember == null) {
            resp.sendRedirect(req.getContextPath() + "/user/login.do");
            return;
        }

        String commnoParam = req.getParameter("commno");

        if (commnoParam == null || commnoParam.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/community/notice.do");
            return;
        }

        int commno = 0;

        try {
            commno = Integer.parseInt(commnoParam);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/community/notice.do");
            return;
        }

        CommunityDTO community = communityDAO.selectCommunity(commno);

        if (community == null) {
            resp.sendRedirect(req.getContextPath() + "/community/notice.do");
            return;
        }

        // 작성자 본인만 수정 가능
        if (!sessMember.getMemberid().equals(community.getWriter())) {
            resp.sendRedirect(req.getContextPath() + "/communtiy/view.do?commno=" + commno);
            return;
        }

        List<FileDTO> files = fileDAO.selectFilesByCommno(commno);

        req.setAttribute("community", community);
        req.setAttribute("files", files);

        req.getRequestDispatcher("/WEB-INF/views/community/modify.jsp")
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

        String commnoParam = req.getParameter("commno");
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        int commno = 0;

        try {
            commno = Integer.parseInt(commnoParam);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/community/notice.do");
            return;
        }

        CommunityDTO original = communityDAO.selectCommunity(commno);

        if (original == null) {
            resp.sendRedirect(req.getContextPath() + "/community/notice.do");
            return;
        }

        // 작성자 본인만 수정 가능
        if (!sessMember.getMemberid().equals(original.getWriter())) {
            resp.sendRedirect(req.getContextPath() + "/community/view.do?commno=" + commno);
            return;
        }

        // 제목/내용 수정
        CommunityDTO dto = new CommunityDTO();
        dto.setCommno(commno);
        dto.setTitle(title);
        dto.setContent(content);

        communityDAO.updateCommunity(dto);

        // 기존 첨부파일 삭제 처리
        String[] deleteFilenos = req.getParameterValues("deleteFile");

        if (deleteFilenos != null) {
            for (String filenoStr : deleteFilenos) {
                try {
                    int fileno = Integer.parseInt(filenoStr);

                    FileDTO fileDTO = fileDAO.selectFile(fileno);

                    if (fileDTO != null && fileDTO.getCommno() == commno) {
                        File realFile = new File(UPLOAD_DIR, fileDTO.getSfname());

                        if (realFile.exists()) {
                            realFile.delete();
                        }

                        fileDAO.deleteFile(fileno);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        // 새 첨부파일 추가
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
        }

        // 최종 첨부파일 개수 확인 후 filecheck 갱신
        int fileCount = fileDAO.selectFileCountByCommno(commno);

        if (fileCount > 0) {
            communityDAO.updateCommunityFilecheck(commno, 1);
        } else {
            communityDAO.updateCommunityFilecheck(commno, 0);
        }

        resp.sendRedirect(req.getContextPath() + "/community/view.do?commno=" + commno);
    }
}