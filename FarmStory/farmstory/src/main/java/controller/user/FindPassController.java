package controller.user;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.Memberservice;

@WebServlet("/user/findPass.do")
public class FindPassController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Memberservice service = Memberservice.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 비밀번호 찾기 화면 띄우기
        req.getRequestDispatcher("/WEB-INF/views/user/findPass.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String memberid = req.getParameter("memberid");
        String memberemail = req.getParameter("memberemail");

        // DB에서 아이디와 이메일이 일치하는 회원이 있는지 확인 (1이면 존재, 0이면 없음)
        int result = service.selectMemberForPass(memberid, memberemail);

        if (result > 0) {
            // 회원이 맞으면, 누구의 비밀번호를 바꿀지 세션에 임시로 저장해두고 변경 페이지로 이동
            HttpSession session = req.getSession();
            session.setAttribute("resetId", memberid);
            
            // 주의: 비밀번호 변경 컨트롤러와 화면(resetPass.do)도 향후 만들어야 합니다.
            resp.sendRedirect("/farmstory/user/resetPass.do");
        } else {
            // 회원이 아니면 실패 파라미터 달고 리다이렉트
            resp.sendRedirect("/farmstory/user/findPass.do?success=fail");
        }
    }
}