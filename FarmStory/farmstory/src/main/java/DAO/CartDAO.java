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

    public List<CartDTO> selectCartList() {
        List<CartDTO> carts = new ArrayList<>();

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SELECT_CART_LIST);
            rs = psmt.executeQuery();

            while (rs.next()) {
                CartDTO dto = new CartDTO();

                dto.setCartno(rs.getInt("cartno"));
                dto.setMemberid(rs.getString("memberid"));
                dto.setMembername(rs.getString("membername"));
                dto.setProductno(rs.getInt("productno"));
                dto.setProductname(rs.getString("productname"));
                dto.setProductcate(rs.getString("productcate"));
                dto.setProductprice(rs.getInt("productprice"));
                dto.setCartcount(rs.getInt("cartcount"));
                dto.setTotalprice(rs.getInt("totalprice"));
                dto.setRdate(rs.getString("rdate"));

                carts.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeAll();
        }

        return carts;
    }
}