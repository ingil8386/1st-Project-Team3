package controller.community;

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

@WebServlet("/community/delete.do")
public class CommunityDeleteController extends HttpServlet {

    private static final long serialVersionUID = 1L;

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

        int boardno = community.getBoardno();

        // 작성자 본인만 삭제 가능
        if (!sessMember.getMemberid().equals(community.getWriter())) {
            resp.sendRedirect(req.getContextPath() + "/community/view.do?commno=" + commno);
            return;
        }

        communityDAO.deleteCommunity(commno);

        if (boardno == 4) {
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
            resp.sendRedirect(req.getContextPath() + "/community/notice.do");
        }
    }
}