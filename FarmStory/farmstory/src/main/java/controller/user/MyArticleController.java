package controller.user;

import java.io.IOException;
import java.util.List;

import DAO.CommunityDAO;
import DTO.CommunityDTO;
import DTO.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/myarticle.do")
public class MyArticleController extends HttpServlet {

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

        List<CommunityDTO> articles =
                communityDAO.selectMyArticles(sessMember.getMemberid());

        req.setAttribute("articles", articles);

        req.getRequestDispatcher("/WEB-INF/views/user/myarticle.jsp")
           .forward(req, resp);
    }
}