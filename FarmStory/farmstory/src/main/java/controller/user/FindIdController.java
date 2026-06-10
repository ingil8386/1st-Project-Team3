package controller.user;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.Memberservice;

@WebServlet("/user/findId.do")
public class FindIdController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Memberservice service = Memberservice.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 아이디 찾기 화면 띄우기
        req.getRequestDispatcher("/WEB-INF/views/user/findId.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String membername = req.getParameter("membername");
        String memberemail = req.getParameter("memberemail");

        // DB에서 이름과 이메일로 아이디 조회
        String memberid = service.selectMemberId(membername, memberemail);

        if (memberid != null) {
            // 아이디를 찾았으면 화면에 띄워주기 위해 request에 담음
            req.setAttribute("foundId", memberid);
            req.getRequestDispatcher("/WEB-INF/views/user/findId.jsp").forward(req, resp);
        } else {
            // 정보가 틀려서 못 찾았으면 fail 파라미터를 달아서 리다이렉트
            resp.sendRedirect("/farmstory/user/findId.do?success=fail");
        }
    }
}