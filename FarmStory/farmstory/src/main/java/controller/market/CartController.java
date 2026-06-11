package controller.market;
import java.util.Arrays;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import DAO.ProductDAO;
import DTO.CartDTO;
import DTO.MemberDTO;
import DTO.ProductDTO;
import service.Cartservice;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/market/cart.do")
public class CartController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    Cartservice cartservice = Cartservice.INSTANCE;
    ProductDAO productDAO = ProductDAO.getInstance();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = req.getSession();
        MemberDTO sessMember = (MemberDTO) session.getAttribute("sessMember");
        String memberid = sessMember != null ? sessMember.getMemberid() : null;
        
        if (memberid == null) {
            resp.sendRedirect(req.getContextPath() + "/user/login.do");
            return;
        }
        
        List<CartDTO> cartList = cartservice.getCartList(memberid);

     // CartDTO → ProductDTO 변환
     List<ProductDTO> products = new ArrayList<>();
     for (CartDTO cart : cartList) {
         ProductDTO product = new ProductDTO();
         product.setProductno(cart.getProductno());
         product.setProductname(cart.getProductname());
         product.setProductimg(cart.getProductimg());
         product.setProductcate(cart.getProductcate());
         product.setProductprice(cart.getProductprice());
         products.add(product);
     }

     req.setAttribute("cartList", cartList);
     req.setAttribute("products", products);  // 추가
     req.getRequestDispatcher("/WEB-INF/views/market/cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        MemberDTO sessMember = (MemberDTO) session.getAttribute("sessMember");
        String memberid = sessMember != null ? sessMember.getMemberid() : null;
        

        switch (action) {
            case "add": {
                CartDTO dto = new CartDTO();
                dto.setMemberid(memberid);
                dto.setProductno(Integer.parseInt(req.getParameter("productno")));
                dto.setCartcount(Integer.parseInt(req.getParameter("cartcount")));
                cartservice.addCart(dto);
                resp.sendRedirect(req.getContextPath() + "/market/cart.do");
                break;
            }
            case "update": {
                CartDTO dto = new CartDTO();
                dto.setCartno(Integer.parseInt(req.getParameter("cartno")));
                dto.setCartcount(Integer.parseInt(req.getParameter("cartcount")));
                cartservice.modifyCart(dto);
                resp.sendRedirect(req.getContextPath() + "/market/cart.do?update=success&cartno=" + dto.getCartno());
                break;
            }
            case "delete": {
                int cartno = Integer.parseInt(req.getParameter("cartno"));
                cartservice.removeCart(cartno);
                resp.sendRedirect(req.getContextPath() + "/market/cart.do?delete=success&cartno=" + cartno);
                break;  
            }
            case "deleteSelected": {
                String[] cartnos = req.getParameterValues("cartno");
                if (cartnos != null) {
                    for (String cartno : cartnos) {
                        cartservice.removeCart(Integer.parseInt(cartno));
                    }
                }
                resp.sendRedirect(req.getContextPath() + "/market/cart.do");
                break;
            }
            case "order": {
                String[] cartnos = req.getParameterValues("cartno");

                if (cartnos == null || cartnos.length == 0) {
                    resp.sendRedirect(req.getContextPath() + "/market/cart.do");
                    return;
                }

                // 기존 getCartList 재사용 - 전체 목록에서 체크된 cartno만 필터링
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

                req.setAttribute("orderList", orderList);
                req.setAttribute("totalAmount", totalAmount);
                req.setAttribute("totalCount", orderList.size());

                req.getRequestDispatcher("/WEB-INF/views/market/order.jsp").forward(req, resp);
                break;
            }
            case "addAndOrder": {
                int productno = Integer.parseInt(req.getParameter("productno"));
                int cartcount = Integer.parseInt(req.getParameter("cartcount"));

                // 카트 저장 없이 상품 직접 조회
                ProductDTO product = productDAO.selectProduct(productno);

                if (product == null) {
                    resp.sendRedirect(req.getContextPath() + "/market/cart.do");
                    return;
                }

                CartDTO orderItem = new CartDTO();
                orderItem.setProductno(productno);
                orderItem.setProductname(product.getProductname());
                orderItem.setProductimg(product.getProductimg());
                orderItem.setProductprice(product.getProductprice());
                orderItem.setProductcate(product.getProductcate());
                orderItem.setCartcount(cartcount);
                orderItem.setTotalprice(product.getProductprice() * cartcount);

                List<CartDTO> orderList = new ArrayList<>();
                orderList.add(orderItem);
                int totalAmount = orderItem.getTotalprice();

                req.setAttribute("orderList", orderList);
                req.setAttribute("totalAmount", totalAmount);
                req.setAttribute("totalCount", orderList.size());

                req.getRequestDispatcher("/WEB-INF/views/market/order.jsp").forward(req, resp);
                break;
            }
        }
    }
}