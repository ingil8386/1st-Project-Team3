package controller.user;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.Memberservice;

@WebServlet("/user/resetPass.do")
public class ResetPassController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Memberservice service = Memberservice.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// 세션에서 저장해둔 ID 꺼내기
        HttpSession session = req.getSession();
        String memberid = (String) session.getAttribute("resetId");
        
        // 만약 ID가 없다면(비정상적인 접근) 로그인 페이지로 보내기
        if (memberid == null) {
            resp.sendRedirect("/farmstory/user/login.do");
            return;
        }
        
        // request에 담아서 JSP로 보내주기
        req.setAttribute("memberid", memberid);
        req.getRequestDispatcher("/WEB-INF/views/user/resetPass.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        HttpSession session = req.getSession();
        String memberid = (String) session.getAttribute("resetId");
        
        if (memberid == null || memberid.isEmpty()) {
            memberid = req.getParameter("memberid");
        }

        String memberpass = req.getParameter("memberpass");
        String memberpass2 = req.getParameter("memberpass2");

        req.setAttribute("memberid", memberid);

        if (memberpass != null && !memberpass.isEmpty() && memberpass.equals(memberpass2)) {
            
            int result = service.updatePass(memberid, memberpass);
            
            if (result > 0) {
                System.out.println("디버깅 - 비밀번호 변경 성공! memberid: " + memberid);
                
                session.invalidate(); 
                
                resp.sendRedirect(req.getContextPath() + "/user/login.do?success=200");
            } else {
                req.setAttribute("result", "fail");
                req.getRequestDispatcher("/WEB-INF/views/user/resetPass.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("result", "passMismatch");
            req.getRequestDispatcher("/WEB-INF/views/user/resetPass.jsp").forward(req, resp);
        }
    }
}