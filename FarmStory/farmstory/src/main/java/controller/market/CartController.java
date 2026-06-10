package controller.market;
import java.io.IOException;
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
        }
    }
}