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

@WebServlet("/user/modify.do")
public class UserModifyController extends HttpServlet {

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

        req.getRequestDispatcher("/WEB-INF/views/user/modify.jsp")
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

        String memberid = sessMember.getMemberid();

        String memberpass = req.getParameter("memberpass");
        String membernick = req.getParameter("membernick");
        String memberemail = req.getParameter("memberemail");
        String memberhp = req.getParameter("memberhp");
        String memberzip = req.getParameter("memberzip");
        String memberaddr1 = req.getParameter("memberaddr1");
        String memberaddr2 = req.getParameter("memberaddr2");

        MemberDTO dto = new MemberDTO();
        dto.setMemberid(memberid);
        dto.setMembernick(membernick);
        dto.setMemberemail(memberemail);
        dto.setMemberhp(memberhp);
        dto.setMemberzip(memberzip);
        dto.setMemberaddr1(memberaddr1);
        dto.setMemberaddr2(memberaddr2);

        if (memberpass != null && !memberpass.trim().isEmpty()) {
            dto.setMemberpass(memberpass);
            memberDAO.updateMemberMyinfoWithPass(dto);
        } else {
            memberDAO.updateMemberMyinfoWithoutPass(dto);
        }

        // 수정 후 DB에서 다시 조회해서 세션 갱신
        MemberDTO updatedMember = memberDAO.selectMemberById(memberid);
        session.setAttribute("sessMember", updatedMember);

        resp.setContentType("text/html; charset=UTF-8");
        resp.getWriter().println("<script>");
        resp.getWriter().println("alert('수정이 완료되었습니다.');");
        resp.getWriter().println("location.href='" + req.getContextPath() + "/user/myinfo.do';");
        resp.getWriter().println("</script>");
    }
}