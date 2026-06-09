package controller.admin;

import java.io.IOException;
import java.util.List;

import DTO.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.Memberservice;

@WebServlet("/admin/user/user_list.do")
public class UserListController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private Memberservice service = Memberservice.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        List<MemberDTO> members = service.selectAllMembers();

        req.setAttribute("members", members);

        req.getRequestDispatcher("/WEB-INF/views/admin/user/user_list.jsp")
           .forward(req, resp);
    }
}