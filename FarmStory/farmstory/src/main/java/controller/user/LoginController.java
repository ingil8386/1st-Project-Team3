package controller.user;

import java.io.IOException;

import DTO.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.Memberservice;

@WebServlet("/user/login.do")
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private Memberservice service = Memberservice.INSTANCE;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        req.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String ctxPath = req.getContextPath();

        // login.jsp name 기준
        String memberid = req.getParameter("userid");
        String memberpass = req.getParameter("pass");

        MemberDTO member = service.login(memberid, memberpass);
        

        // 로그인 실패
        if (member == null) {
            resp.sendRedirect(ctxPath + "/user/login.do?login=fail");
            return;
        }

        // 로그인 성공
        HttpSession session = req.getSession();
        session.setAttribute("sessMember", member);
        session.setMaxInactiveInterval(60 * 30);

        resp.sendRedirect(ctxPath + "/index.do");
    }
}
