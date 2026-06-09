package DAO;

import java.util.ArrayList;
import java.util.List;

import DTO.ProductDTO;
import util.DBHelper;
import util.SQL;
import util.SQL2;

public class ProductDAO extends DBHelper {

    private static final ProductDAO INSTANCE = new ProductDAO();

    public static ProductDAO getInstance() {
        return INSTANCE;
    }

    private ProductDAO() {}

    public void insertProduct(ProductDTO dto) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.INSERT_PRODUCT);

            psmt.setString(1, dto.getProductcate());
            psmt.setString(2, dto.getProductname());
            psmt.setInt(3, dto.getProductprice());
            psmt.setString(4, dto.getProductcontent());
            psmt.setString(5, dto.getProductimg());
            psmt.setInt(6, dto.getProductstock());

            psmt.executeUpdate();
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ProductDTO selectProduct(int productno) {
        ProductDTO dto = null;

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_PRODUCT);
            psmt.setInt(1, productno);

            rs = psmt.executeQuery();

            if (rs.next()) {
                dto = new ProductDTO();

                dto.setProductno(rs.getInt("productno"));
                dto.setProductcate(rs.getString("productcate"));
                dto.setProductname(rs.getString("productname"));
                dto.setProductprice(rs.getInt("productprice"));
                dto.setProductcontent(rs.getString("productcontent"));
                dto.setProductimg(rs.getString("productimg"));
                dto.setProductstock(rs.getInt("productstock"));
                dto.setRdate(rs.getString("rdate"));
            }
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }

    public List<ProductDTO> selectProducts(String productcate) {
        List<ProductDTO> products = new ArrayList<>();

        try {
            conn = getConnection();

            if (productcate == null || productcate.equals("")) {
                psmt = conn.prepareStatement(SQL2.SELECT_PRODUCTS);
            } else {
                psmt = conn.prepareStatement(SQL2.SELECT_PRODUCTS_BY_CATE);
                psmt.setString(1, productcate);
            }

            rs = psmt.executeQuery();

            while (rs.next()) {
                ProductDTO dto = new ProductDTO();

                dto.setProductno(rs.getInt("productno"));
                dto.setProductcate(rs.getString("productcate"));
                dto.setProductname(rs.getString("productname"));
                dto.setProductprice(rs.getInt("productprice"));
                dto.setProductcontent(rs.getString("productcontent"));
                dto.setProductimg(rs.getString("productimg"));
                dto.setProductstock(rs.getInt("productstock"));
                dto.setRdate(rs.getString("rdate"));

                products.add(dto);
            }
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }

    public void updateProduct(ProductDTO dto) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.UPDATE_PRODUCT);

            psmt.setString(1, dto.getProductcate());
            psmt.setString(2, dto.getProductname());
            psmt.setInt(3, dto.getProductprice());
            psmt.setString(4, dto.getProductcontent());
            psmt.setString(5, dto.getProductimg());
            psmt.setInt(6, dto.getProductstock());
            psmt.setInt(7, dto.getProductno());

            psmt.executeUpdate();
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int productno) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.DELETE_PRODUCT);
            psmt.setInt(1, productno);

            psmt.executeUpdate();
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}