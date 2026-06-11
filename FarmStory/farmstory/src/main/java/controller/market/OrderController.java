package controller.market;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import DTO.CartDTO;
import DTO.ProductDTO;
import DTO.MemberDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.Cartservice;

@WebServlet("/market/order.do")
public class OrderController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final Cartservice cartservice = Cartservice.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/market/order.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        MemberDTO sessMember = (MemberDTO) session.getAttribute("sessMember");
        String memberid = sessMember != null ? sessMember.getMemberid() : null;

        String[] cartnos = req.getParameterValues("cartno");
        if (cartnos == null || cartnos.length == 0) {
            resp.sendRedirect(req.getContextPath() + "/market/cart.do");
            return;
        }

        List<CartDTO> allCartList = cartservice.getCartList(memberid);
        List<CartDTO> orderList = new ArrayList<>();
        int totalAmount = 0;

        List<String> cartnoList = Arrays.asList(cartnos);
        for (CartDTO cart : allCartList) {
            if (cartnoList.contains(String.valueOf(cart.getCartno()))) {
                orderList.add(cart);
                totalAmount += cart.getTotalprice();
            }
        }

        // CartDTO → ProductDTO 변환
        List<ProductDTO> products = new ArrayList<>();
        for (CartDTO cart : orderList) {
            ProductDTO product = new ProductDTO();
            product.setProductno(cart.getProductno());
            product.setProductname(cart.getProductname());
            product.setProductimg(cart.getProductimg());
            product.setProductcate(cart.getProductcate());
            product.setProductprice(cart.getProductprice());
            products.add(product);
        }

        req.setAttribute("orderList", orderList);
        req.setAttribute("products", products);  // 추가
        req.setAttribute("totalAmount", totalAmount);
        req.setAttribute("totalCount", orderList.size());

        req.getRequestDispatcher("/WEB-INF/views/market/order.jsp").forward(req, resp);
    }
}