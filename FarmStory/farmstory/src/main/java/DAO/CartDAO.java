package DAO;

import java.util.ArrayList;
import java.util.List;

import DTO.CartDTO;
import util.DBHelper;
import util.SQL2;

public class CartDAO extends DBHelper {

    private static final CartDAO INSTANCE = new CartDAO();

    public static CartDAO getInstance() {
        return INSTANCE;
    }

    private CartDAO() {}

    public List<CartDTO> selectCartList(String memberid) {
        List<CartDTO> carts = new ArrayList<>();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SELECT_CART_LIST);
            psmt.setString(1, memberid); // memberid 세팅
            rs = psmt.executeQuery();
            while (rs.next()) {
                CartDTO dto = new CartDTO();
                dto.setProductimg(rs.getString("상품이미지"));
                dto.setProductcate(rs.getString("상품종류"));
                dto.setProductname(rs.getString("상품명"));
                dto.setCartcount(rs.getInt("주문수량"));
                dto.setTotalprice(rs.getInt("가격합계"));
                dto.setRdate(rs.getString("rdate"));
                carts.add(dto);
            }
            closeAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return carts;
    }
    
    public void insertCart(CartDTO dto) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.INSERT_CART);
            psmt.setString(1, dto.getMemberid());
            psmt.setInt(2, dto.getProductno());
            psmt.setInt(3, dto.getCartcount());
            
            psmt.executeUpdate();

            closeAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // 장바구니 수량 수정
    public void updateCart(CartDTO dto) {
        
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.UPDATE_CART_COUNT);
            psmt.setInt(1, dto.getCartcount());
            psmt.setInt(2, dto.getCartno());
            
            psmt.executeUpdate();
            
            closeAll();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

    // 장바구니 삭제
    public void deleteCart(int cartno) {
        
        
        
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.DELETE_CART);
            psmt.setInt(1, cartno);
            
            psmt.executeUpdate();
            
            closeAll();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
       
    }
}