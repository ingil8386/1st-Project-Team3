package controller.admin;

import java.io.IOException;
import java.util.List;

import DAO.CartDAO;
import DTO.CartDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/order/order_list.do")
public class OrderListController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CartDAO dao = CartDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        List<CartDTO> carts = dao.selectCartList();

        req.setAttribute("carts", carts);

        req.getRequestDispatcher("/WEB-INF/views/admin/order/order_list.jsp")
           .forward(req, resp);
    }
}