package controller.market;

import java.io.IOException;
import java.util.List;

import DAO.ProductDAO;
import DTO.ProductDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/market/list.do")
public class ListController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ProductDAO productDAO = ProductDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        List<ProductDTO> products = productDAO.selectProducts();

        req.setAttribute("products", products);

        req.getRequestDispatcher("/WEB-INF/views/market/list.jsp")
           .forward(req, resp);
    }
}