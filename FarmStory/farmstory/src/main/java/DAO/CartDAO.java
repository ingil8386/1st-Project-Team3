package DAO;

import java.util.ArrayList;
import java.util.List;

import DTO.CartDTO;
import util.DBHelper;
import util.SQL;
import util.SQL2;

public class CartDAO extends DBHelper {

    private static final CartDAO INSTANCE = new CartDAO();

    public static CartDAO getInstance() {
        return INSTANCE;
    }

    private CartDAO() {}

    public void insertCart(CartDTO dto) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.INSERT_CART);

            psmt.setString(1, dto.getMemberid());
            psmt.setInt(2, dto.getProductno());
            psmt.setInt(3, dto.getCartcount());

            psmt.executeUpdate();
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<CartDTO> selectCarts(String memberid) {
        List<CartDTO> carts = new ArrayList<>();

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_CARTS);
            psmt.setString(1, memberid);

            rs = psmt.executeQuery();

            while (rs.next()) {
                CartDTO dto = new CartDTO();

                dto.setCartno(rs.getInt("cartno"));
                dto.setMemberid(rs.getString("memberid"));
                dto.setProductno(rs.getInt("productno"));
                dto.setCartcount(rs.getInt("cartcount"));
                dto.setRdate(rs.getString("rdate"));

                dto.setProductcate(rs.getString("productcate"));
                dto.setProductname(rs.getString("productname"));
                dto.setProductprice(rs.getInt("productprice"));
                dto.setProductimg(rs.getString("productimg"));
                dto.setProductstock(rs.getInt("productstock"));

                carts.add(dto);
            }
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return carts;
    }

    public void updateCartCount(int cartno, int cartcount) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.UPDATE_CART_COUNT);

            psmt.setInt(1, cartcount);
            psmt.setInt(2, cartno);

            psmt.executeUpdate();
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
    }

    public void deleteCart(int cartno) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.DELETE_CART);
            psmt.setInt(1, cartno);

            psmt.executeUpdate();

            closeAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteCarts(String[] cartnos) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.DELETE_CART);

            for (String cartno : cartnos) {
                psmt.setInt(1, Integer.parseInt(cartno));
                psmt.addBatch();
            }

            psmt.executeBatch();
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}