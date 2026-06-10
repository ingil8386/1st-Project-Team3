package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.ProductDTO;
import util.DBHelper;
import util.SQL2;

public class ProductDAO extends DBHelper {

    private static final ProductDAO INSTANCE = new ProductDAO();

    public static ProductDAO getInstance() {
        return INSTANCE;
    }

    private ProductDAO() {
    }

    // 상품 등록
    public void insertProduct(ProductDTO dto) {

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.INSERT_PRODUCT);

            psmt.setString(1, dto.getProductcate());
            psmt.setString(2, dto.getProductname());
            psmt.setInt(3, dto.getProductprice());
            psmt.setInt(4, dto.getProductdiscount());
            psmt.setInt(5, dto.getProductpoint());
            psmt.setInt(6, dto.getProductfinalprice());
            psmt.setString(7, dto.getProductcontent());
            psmt.setString(8, dto.getProductimg());
            psmt.setInt(9, dto.getProductstock());

            psmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                closeAll();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // 상품 1개 조회 - 상세페이지용
    public ProductDTO selectProduct(int productno) {
        ProductDTO dto = null;

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SELECT_PRODUCT);
            psmt.setInt(1, productno);

            rs = psmt.executeQuery();

            if (rs.next()) {
                dto = new ProductDTO();

                dto.setProductno(rs.getInt("productno"));
                dto.setProductcate(rs.getString("productcate"));
                dto.setProductname(rs.getString("productname"));
                dto.setProductprice(rs.getInt("productprice"));
                dto.setProductdiscount(rs.getInt("productdiscount"));
                dto.setProductpoint(rs.getInt("productpoint"));
                dto.setProductfinalprice(rs.getInt("productfinalprice"));
                dto.setProductcontent(rs.getString("productcontent"));
                dto.setProductimg(rs.getString("productimg"));
                dto.setProductstock(rs.getInt("productstock"));
                dto.setRdate(rs.getString("rdate"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                closeAll();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return dto;
    }

    // 상품 전체 조회 - 관리자 상품목록 / 장보기 목록용
    public List<ProductDTO> selectProducts() {
        List<ProductDTO> products = new ArrayList<>();

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SELECT_PRODUCTS);
            rs = psmt.executeQuery();

            while (rs.next()) {
                ProductDTO dto = new ProductDTO();

                dto.setProductno(rs.getInt("productno"));
                dto.setProductcate(rs.getString("productcate"));
                dto.setProductname(rs.getString("productname"));
                dto.setProductprice(rs.getInt("productprice"));
                dto.setProductdiscount(rs.getInt("productdiscount"));
                dto.setProductpoint(rs.getInt("productpoint"));
                dto.setProductfinalprice(rs.getInt("productfinalprice"));
                dto.setProductcontent(rs.getString("productcontent"));
                dto.setProductimg(rs.getString("productimg"));
                dto.setProductstock(rs.getInt("productstock"));
                dto.setRdate(rs.getString("rdate"));

                products.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                closeAll();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return products;
    }

    // 상품 수정
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

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                closeAll();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // 상품 삭제
    public void deleteProduct(int productno) {

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.DELETE_PRODUCT);
            psmt.setInt(1, productno);

            psmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                closeAll();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}