package controller.story;

import java.io.IOException;

import DAO.CommentDAO;
import DAO.CommunityDAO;
import DTO.CommentDTO;
import DTO.CommunityDTO;
import DTO.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/story/comment/write.do")
public class CommentWriteController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CommentDAO commentDAO = CommentDAO.getInstance();
    private CommunityDAO communityDAO = CommunityDAO.getInstance();

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
        String content = req.getParameter("content");

        int commno = 0;

        try {
            commno = Integer.parseInt(commnoParam);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
            return;
        }

        CommunityDTO community = communityDAO.selectCommunity(commno);

        if (community == null) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
            return;
        }

        CommentDTO dto = new CommentDTO();
        dto.setCommno(commno);
        dto.setContent(content);
        dto.setWriter(sessMember.getMemberid());
        dto.setRegip(req.getRemoteAddr());

        commentDAO.insertComment(dto);

        communityDAO.updateCommunityCommentCountPlus(commno);

        resp.sendRedirect(req.getContextPath() + "/story/view.do?commno=" + commno);
    }
}