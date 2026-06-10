package controller.market;

import java.io.IOException;

import DAO.ProductDAO;
import DTO.ProductDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/market/detail.do")
public class DetailController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ProductDAO productDAO = ProductDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String productnoParam = req.getParameter("productno");

        if (productnoParam == null || productnoParam.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/market/list.do");
            return;
        }

        int productno = 0;

        try {
            productno = Integer.parseInt(productnoParam);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/market/list.do");
            return;
        }

        ProductDTO product = productDAO.selectProduct(productno);

        if (product == null) {
            resp.sendRedirect(req.getContextPath() + "/market/list.do");
            return;
        }

        req.setAttribute("product", product);

        req.getRequestDispatcher("/WEB-INF/views/market/detail.jsp")
           .forward(req, resp);
    }
}