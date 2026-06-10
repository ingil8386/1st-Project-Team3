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

@WebServlet("/story/delete.do")
public class StoryDeleteController extends HttpServlet {

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

        CommunityDTO community = communityDAO.selectCommunity(commno);

        if (community == null) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
            return;
        }

        int boardno = community.getBoardno();

        // 작성자 본인만 삭제 가능
        if (!sessMember.getMemberid().equals(community.getWriter())) {
            resp.sendRedirect(req.getContextPath() + "/story/view.do?commno=" + commno);
            return;
        }

        communityDAO.deleteCommunity(commno);

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