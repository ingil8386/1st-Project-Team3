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

        if (productcontent == null || productcontent.trim().isEmpty()) {
            productcontent = "";
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

                String uploadPath = req.getServletContext().getRealPath("/images");

                File uploadDir = new File(uploadPath);

                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                thumb120.write(uploadPath + File.separator + saveFileName);

                // DB에는 컨텍스트 경로 제외하고 저장
                productimg = "/images/" + saveFileName;
            }
        }

        ProductDTO dto = new ProductDTO();

        dto.setProductname(productname);
        dto.setProductcate(productcate);
        dto.setProductprice(Integer.parseInt(productprice));
        dto.setProductstock(Integer.parseInt(productstock));
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