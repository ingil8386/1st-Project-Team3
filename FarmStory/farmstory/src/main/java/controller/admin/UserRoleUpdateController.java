package controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.Memberservice;

@WebServlet("/admin/user/update_role.do")
public class UserRoleUpdateController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private Memberservice service = Memberservice.INSTANCE;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String memberid = req.getParameter("memberid");
        String memberrole = req.getParameter("memberrole");

        service.updateMemberRole(memberid, memberrole);

        resp.sendRedirect(req.getContextPath() + "/admin/user/user_list.do");
    }
}