package controller.user;

import java.io.IOException;

import DTO.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.Memberservice;

@WebServlet("/user/register.do")
public class RegisterController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
	// 서비스 가져오기(열거상수 객체)
	private Memberservice service = Memberservice.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        req.getRequestDispatcher("/WEB-INF/views/user/register.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
		// 전송 데이터 수신
		String memberid = req.getParameter("memberid");
		String pass = req.getParameter("memberpass");
		String pass2    = req.getParameter("memberpass2");
		String name = req.getParameter("membername");
		String nick = req.getParameter("membernick");
		String email = req.getParameter("memberemail");		
		String hp = req.getParameter("memberhp");
		String zip = req.getParameter("memberzip");
		String addr1 = req.getParameter("memberaddr1");
		String addr2 = req.getParameter("memberaddr2");
		String regip = req.getRemoteAddr(); // 사용자 IP주소
		
		// 디버깅: 값이 제대로 들어오는지 확인
	    System.out.println("디버깅 - ID: " + memberid);
	    System.out.println("디버깅 - PW: " + pass);
	    System.out.println("디버깅 - NAME: " + name);
	    
		// DTO 생성
		MemberDTO dto = new MemberDTO();
		dto.setMemberid(memberid);
		dto.setMemberpass(pass);
		dto.setMembername(name);
		dto.setMembernick(nick);
		dto.setMemberemail(email);		
		dto.setMemberhp(hp);		
		dto.setMemberzip(zip);
		dto.setMemberaddr1(addr1);
		dto.setMemberaddr2(addr2);
		dto.setRegip(regip); // 사용자 IP주소
		
		// 서비스 호출
		service.register(dto);
		
		// 로그인 이동
		resp.sendRedirect("/farmstory/user/login.do?register=success");
    }
}
