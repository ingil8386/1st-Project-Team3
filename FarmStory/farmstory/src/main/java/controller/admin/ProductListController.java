package controller.admin;

import java.io.IOException;
import java.util.List;

import DAO.ProductDAO;
import DTO.ProductDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/product/product_list.do")
public class ProductListController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ProductDAO dao = ProductDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String productcate = req.getParameter("productcate");

        List<ProductDTO> products = dao.selectProducts(productcate);

        req.setAttribute("products", products);

        req.getRequestDispatcher("/WEB-INF/views/admin/product/product_list.jsp")
           .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String[] productnos = req.getParameterValues("productno");

        if (productnos != null) {
            for (String productno : productnos) {
                dao.deleteProduct(Integer.parseInt(productno));
            }
        }

        resp.sendRedirect(req.getContextPath() + "/admin/product/product_list.do");
    }
}