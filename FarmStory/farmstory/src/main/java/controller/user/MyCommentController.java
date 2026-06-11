package controller.user;

import java.io.IOException;
import java.util.List;

import DAO.CommentDAO;
import DTO.CommentDTO;
import DTO.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/mycomment.do")
public class MyCommentController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CommentDAO commentDAO = CommentDAO.getInstance();

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

        List<CommentDTO> comments =
                commentDAO.selectMyComments(sessMember.getMemberid());

        req.setAttribute("comments", comments);

        req.getRequestDispatcher("/WEB-INF/views/user/mycomment.jsp")
           .forward(req, resp);
    }
}