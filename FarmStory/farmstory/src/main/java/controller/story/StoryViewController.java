package controller.story;

import java.io.IOException;
import java.util.List;

import DAO.CommentDAO;
import DAO.CommunityDAO;
import DTO.CommentDTO;
import DTO.CommunityDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/story/view.do")
public class StoryViewController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CommunityDAO communityDAO = CommunityDAO.getInstance();
    private CommentDAO commentDAO = CommentDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String commnoParam = req.getParameter("commno");

        if (commnoParam == null || commnoParam.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
            return;
        }

        int commno = 0;

        try {
            commno = Integer.parseInt(commnoParam);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
            return;
        }

        // 조회수 증가
        communityDAO.updateCommunityHit(commno);

        // 게시글 조회
        CommunityDTO community = communityDAO.selectCommunity(commno);

        if (community == null) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
            return;
        }

        // 댓글 목록 조회
        List<CommentDTO> comments = commentDAO.selectComments(commno);

        req.setAttribute("community", community);
        req.setAttribute("comments", comments);

        req.getRequestDispatcher("/WEB-INF/views/story/view.jsp")
           .forward(req, resp);
    }
}