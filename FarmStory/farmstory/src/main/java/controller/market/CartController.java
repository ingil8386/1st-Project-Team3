package controller.market;
import java.util.Arrays;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import DTO.CartDTO;
import DTO.MemberDTO;
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
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = req.getSession();
        MemberDTO sessMember = (MemberDTO) session.getAttribute("sessMember");
        String memberid = sessMember != null ? sessMember.getMemberid() : null;
        
        // 로그인 체크
        if (memberid == null) {
            resp.sendRedirect(req.getContextPath() + "/user/login.do");
            return;
        }
        
        List<CartDTO> cartList = cartservice.getCartList(memberid);
        req.setAttribute("cartList", cartList);
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
                CartDTO dto = new CartDTO();
                dto.setMemberid(memberid);
                dto.setProductno(Integer.parseInt(req.getParameter("productno")));
                dto.setCartcount(Integer.parseInt(req.getParameter("cartcount")));
                cartservice.addCart(dto);

                // 전체 목록 조회 후 해당 productno와 일치하는 항목 찾기
                List<CartDTO> allCartList = cartservice.getCartList(memberid);

                if (allCartList == null || allCartList.isEmpty()) {
                    resp.sendRedirect(req.getContextPath() + "/market/cart.do");
                    return;
                }

                // productno로 방금 담은 항목 찾기
                int productno = Integer.parseInt(req.getParameter("productno"));
                CartDTO latestCart = null;
                for (CartDTO cart : allCartList) {
                    if (cart.getProductno() == productno) {
                        latestCart = cart;
                    }
                }

                if (latestCart == null) {
                    resp.sendRedirect(req.getContextPath() + "/market/cart.do");
                    return;
                }

                List<CartDTO> orderList = new ArrayList<>();
                orderList.add(latestCart);
                int totalAmount = latestCart.getTotalprice();

                req.setAttribute("orderList", orderList);
                req.setAttribute("totalAmount", totalAmount);
                req.setAttribute("totalCount", orderList.size());

                req.getRequestDispatcher("/WEB-INF/views/market/order.jsp").forward(req, resp);
                break;
            }
        }
    }
}