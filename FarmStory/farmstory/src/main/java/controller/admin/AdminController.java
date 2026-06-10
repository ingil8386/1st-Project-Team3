package controller.admin;

import java.io.IOException;
import java.util.List;

import DAO.MemberDAO;
import DAO.ProductDAO;
import DTO.MemberDTO;
import DTO.ProductDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/admin.do")
public class AdminController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ProductDAO productDAO = ProductDAO.getInstance();
    private MemberDAO memberDAO = MemberDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        List<ProductDTO> products = productDAO.selectProducts();
        List<MemberDTO> members = memberDAO.selectAllMembers();

        req.setAttribute("products", products);
        req.setAttribute("members", members);

        req.getRequestDispatcher("/WEB-INF/views/admin/admin.jsp")
           .forward(req, resp);
    }
}