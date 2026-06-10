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
        // 1. 파라미터 수집
        String memberid = req.getParameter("memberid");
        String memberpass = req.getParameter("memberpass");
        String memberpass2 = req.getParameter("memberpass2");

        // 2. 유효성 검사
        if (memberpass != null && memberpass.equals(memberpass2)) {
            
            // 3. Service 호출
            int result = service.updatePass(memberid, memberpass);
            
            if (result > 0) {
                resp.sendRedirect(req.getContextPath() + "/user/login.do?success=200");
                HttpSession session = req.getSession();
                session.invalidate(); // 세션 전체 초기화
            } else {
                System.out.println("디버깅 - 업데이트 행(row)이 0임 (SQL 조건 문제)");
                req.setAttribute("result", "fail");
                req.getRequestDispatcher("/WEB-INF/views/user/resetPass.jsp").forward(req, resp);
            }
        } else {
            System.out.println("디버깅 - 비밀번호 불일치 혹은 null");
            req.setAttribute("result", "passMismatch");
            req.getRequestDispatcher("/WEB-INF/views/user/resetPass.jsp").forward(req, resp);
        }
    }
}