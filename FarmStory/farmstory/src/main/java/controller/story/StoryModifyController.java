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

@WebServlet("/story/modify.do")
public class StoryModifyController extends HttpServlet {

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

        // 작성자 본인만 수정 가능
        if (!sessMember.getMemberid().equals(community.getWriter())) {
            resp.sendRedirect(req.getContextPath() + "/story/view.do?commno=" + commno);
            return;
        }

        req.setAttribute("community", community);

        req.getRequestDispatcher("/WEB-INF/views/story/modify.jsp")
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
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
            return;
        }

        CommunityDTO original = communityDAO.selectCommunity(commno);

        if (original == null) {
            resp.sendRedirect(req.getContextPath() + "/story/intro.do");
            return;
        }

        // 작성자 본인만 수정 가능
        if (!sessMember.getMemberid().equals(original.getWriter())) {
            resp.sendRedirect(req.getContextPath() + "/story/view.do?commno=" + commno);
            return;
        }

        CommunityDTO dto = new CommunityDTO();
        dto.setCommno(commno);
        dto.setTitle(title);
        dto.setContent(content);

        communityDAO.updateCommunity(dto);

        resp.sendRedirect(req.getContextPath() + "/story/view.do?commno=" + commno);
    }
}