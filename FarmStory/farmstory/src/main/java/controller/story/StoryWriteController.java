package controller.story;

import java.io.IOException;

import DAO.CommunityDAO;
import DTO.CommunityDTO;
import DTO.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/story/write.do")
public class StoryWriteController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CommunityDAO communityDAO = CommunityDAO.getInstance();

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

        CommunityDTO dto = new CommunityDTO();
        dto.setBoardno(boardno);
        dto.setTitle(title);
        dto.setContent(content);
        dto.setWriter(sessMember.getMemberid());
        dto.setRegip(req.getRemoteAddr());

        communityDAO.insertCommunity(dto);

        if (boardno == 1) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
        } else if (boardno == 2) {
            resp.sendRedirect(req.getContextPath() + "/story/garden.do");
        } else if (boardno == 3) {
            resp.sendRedirect(req.getContextPath() + "/story/school.do");
        } else {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
        }
    }
}