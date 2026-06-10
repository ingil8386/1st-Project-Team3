package controller.admin;

import java.io.File;
import java.io.IOException;

import DAO.ProductDAO;
import DTO.ProductDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/admin/product/product_register.do")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 20
)
public class ProductRegisterController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ProductDAO dao = ProductDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/WEB-INF/views/admin/product/product_register.jsp")
           .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String productname = req.getParameter("productname");
        String productcate = req.getParameter("productcate");
        String productprice = req.getParameter("productprice");
        String productstock = req.getParameter("productstock");
        String productcontent = req.getParameter("productcontent");
        String productdiscount = req.getParameter("productdiscount");
        String productpoint = req.getParameter("productpoint");

        if (productcontent == null || productcontent.trim().isEmpty()) {
            productcontent = "";
        }

        int price = 0;
        int stock = 0;
        int discount = 0;
        int point = 0;
        int finalprice = 0;

        try {
            price = Integer.parseInt(productprice.replace(",", "").trim());
            stock = Integer.parseInt(productstock.replace(",", "").trim());

            if (productdiscount == null || productdiscount.trim().isEmpty()) {
                productdiscount = "0";
            }

            if (productpoint == null || productpoint.trim().isEmpty()) {
                productpoint = "0";
            }

            discount = Integer.parseInt(productdiscount.replace(",", "").trim());
            point = Integer.parseInt(productpoint.replace(",", "").trim());

            finalprice = price - (price * discount / 100);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/admin/product/product_register.do?result=numberError");
            return;
        }

        // 기본 이미지
        String productimg = "/images/market_item1.jpg";

        // 상품목록 이미지 input name
        Part thumb120 = req.getPart("thumb120");
        
        

        if (thumb120 != null && thumb120.getSize() > 0) {

            String originalFileName = getFileName(thumb120);

            if (originalFileName != null && !originalFileName.isEmpty()) {

                String ext = "";
                int dotIndex = originalFileName.lastIndexOf(".");

                if (dotIndex != -1) {
                    ext = originalFileName.substring(dotIndex);
                }

                String saveFileName = "product_list_" + System.currentTimeMillis() + ext;

                
                String uploadPath = "C:/Users/GGG/Desktop/workspace/uploads/product";

                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                thumb120.write(uploadPath + File.separator + saveFileName);

                System.out.println("=== 상품 이미지 업로드 경로 확인 ===");
                System.out.println("업로드 디렉토리 경로: " + uploadPath);
                System.out.println("저장된 최종 파일명: " + saveFileName);
                System.out.println("실제 저장된 위치: " + uploadPath + File.separator + saveFileName);
                System.out.println("================================");
                
                // DB에는 컨텍스트 경로 제외하고 저장
                productimg = "/images/product/" + saveFileName;
                }
        }

        ProductDTO dto = new ProductDTO();

        dto.setProductname(productname);
        dto.setProductcate(productcate);
        dto.setProductprice(price);
        dto.setProductdiscount(discount);
        dto.setProductpoint(point);
        dto.setProductfinalprice(finalprice);
        dto.setProductstock(stock);
        dto.setProductcontent(productcontent);
        dto.setProductimg(productimg);

        dao.insertProduct(dto);

        resp.sendRedirect(req.getContextPath() + "/admin/product/product_list.do");
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");

        if (contentDisposition == null) {
            return null;
        }

        String[] tokens = contentDisposition.split(";");

        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 1).trim().replace("\"", "");
            }
        }

        return null;
    }
}