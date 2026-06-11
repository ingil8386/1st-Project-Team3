package controller.user;

import java.io.IOException;

import DAO.MemberDAO;
import DTO.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/leave.do")
public class UserLeaveController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MemberDAO memberDAO = MemberDAO.getInstance();

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

        req.getRequestDispatcher("/WEB-INF/views/user/leave.jsp")
           .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        HttpSession session = req.getSession();
        MemberDTO sessMember = (MemberDTO) session.getAttribute("sessMember");

        if (sessMember == null) {
            resp.sendRedirect(req.getContextPath() + "/user/login.do");
            return;
        }

        String memberid = sessMember.getMemberid();
        String memberpass = req.getParameter("memberpass");

        if (memberpass == null || memberpass.trim().isEmpty()) {
            resp.getWriter().println("<script>");
            resp.getWriter().println("alert('비밀번호를 입력해주세요.');");
            resp.getWriter().println("history.back();");
            resp.getWriter().println("</script>");
            return;
        }

        boolean isMatched = memberDAO.checkMemberPassword(memberid, memberpass);

        if (!isMatched) {
            resp.getWriter().println("<script>");
            resp.getWriter().println("alert('비밀번호가 일치하지 않습니다.');");
            resp.getWriter().println("history.back();");
            resp.getWriter().println("</script>");
            return;
        }

        int result = memberDAO.deleteMember(memberid);

        if (result > 0) {
            session.invalidate();

            resp.getWriter().println("<script>");
            resp.getWriter().println("alert('회원탈퇴가 완료되었습니다.');");
            resp.getWriter().println("location.href='" + req.getContextPath() + "/index.do';");
            resp.getWriter().println("</script>");
        } else {
            resp.getWriter().println("<script>");
            resp.getWriter().println("alert('회원탈퇴에 실패했습니다. 관리자에게 문의하세요.');");
            resp.getWriter().println("history.back();");
            resp.getWriter().println("</script>");
        }
    }
}