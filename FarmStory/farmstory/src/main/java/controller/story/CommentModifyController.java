package controller.story;

import java.io.IOException;

import DAO.CommentDAO;
import DTO.CommentDTO;
import DTO.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/story/comment/modify.do")
public class CommentModifyController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CommentDAO commentDAO = CommentDAO.getInstance();

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

        String commentnoParam = req.getParameter("commentno");
        String content = req.getParameter("content");

        int commentno = 0;

        try {
            commentno = Integer.parseInt(commentnoParam);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
            return;
        }

        CommentDTO original = commentDAO.selectComment(commentno);

        if (original == null) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
            return;
        }

        int commno = original.getCommno();

        // 댓글 작성자 본인만 수정 가능
        if (!sessMember.getMemberid().equals(original.getWriter())) {
            resp.sendRedirect(req.getContextPath() + "/story/view.do?commno=" + commno);
            return;
        }

        CommentDTO dto = new CommentDTO();
        dto.setCommentno(commentno);
        dto.setContent(content);

        commentDAO.updateComment(dto);

        resp.sendRedirect(req.getContextPath() + "/story/view.do?commno=" + commno);
    }
}