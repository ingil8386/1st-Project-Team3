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
        String memberid = req.getParameter("memberid");
        String memberpass = req.getParameter("memberpass");

        MemberDTO memberDTO = service.login(memberid, memberpass);

		if(memberDTO != null) {
			// 회원 맞음 -> 세션 저장 후 글목록 이동
			HttpSession session = req.getSession(); // request 객체로 현재 사용자(session) 구하기
			session.setAttribute("sessMember", memberDTO);
			
			// 💥 [추가] 세션에 잘 들어갔는지 자바 콘솔에 찍어보기
		    System.out.println("======= 로그인 세션 디버깅 =======");
		    System.out.println("세션 ID: " + session.getId());
		    System.out.println("세션 객체 확인: " + session.getAttribute("sessMember"));
		    System.out.println("=================================");
		    
			resp.sendRedirect("/farmstory/index.do");			
		}else {
			// 회원 아님 -> 로그인 이동
			resp.sendRedirect("/farmstory/user/login.do?login=fail");			
		}
    }
}
