package controller.story;

import java.io.IOException;

import DAO.CommentDAO;
import DAO.CommunityDAO;
import DTO.CommentDTO;
import DTO.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/story/comment/delete.do")
public class CommentDeleteController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CommentDAO commentDAO = CommentDAO.getInstance();
    private CommunityDAO communityDAO = CommunityDAO.getInstance();

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

        String commentnoParam = req.getParameter("commentno");

        if (commentnoParam == null || commentnoParam.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
            return;
        }

        int commentno = 0;

        try {
            commentno = Integer.parseInt(commentnoParam);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
            return;
        }

        CommentDTO comment = commentDAO.selectComment(commentno);

        if (comment == null) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
            return;
        }

        int commno = comment.getCommno();

        // 댓글 작성자 본인만 삭제 가능
        if (!sessMember.getMemberid().equals(comment.getWriter())) {
            resp.sendRedirect(req.getContextPath() + "/story/view.do?commno=" + commno);
            return;
        }

        commentDAO.deleteComment(commentno);

        // 댓글 수 감소
        communityDAO.updateCommunityCommentCountMinus(commno);

        resp.sendRedirect(req.getContextPath() + "/story/view.do?commno=" + commno);
    }
}