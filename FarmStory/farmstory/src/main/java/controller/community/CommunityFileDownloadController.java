package controller.community;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import DAO.FileDAO;
import DTO.FileDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/community/file/download.do")
public class CommunityFileDownloadController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private FileDAO fileDAO = FileDAO.getInstance();

    private static final String UPLOAD_DIR = "C:/upload/farmstory/community";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String filenoParam = req.getParameter("fileno");

        if (filenoParam == null || filenoParam.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/community/notice.do");
            return;
        }

        int fileno = 0;

        try {
            fileno = Integer.parseInt(filenoParam);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/community/notice.do");
            return;
        }

        FileDTO fileDTO = fileDAO.selectFile(fileno);

        if (fileDTO == null) {
            resp.sendRedirect(req.getContextPath() + "/community/notice.do");
            return;
        }

        File file = new File(UPLOAD_DIR, fileDTO.getSfname());

        if (!file.exists()) {
            resp.setContentType("text/html; charset=UTF-8");
            resp.getWriter().println("<script>");
            resp.getWriter().println("alert('파일이 존재하지 않습니다.');");
            resp.getWriter().println("history.back();");
            resp.getWriter().println("</script>");
            return;
        }

        fileDAO.updateFileDownload(fileno);

        String encodedName = URLEncoder.encode(fileDTO.getOfname(), "UTF-8")
                .replaceAll("\\+", "%20");

        resp.setContentType("application/octet-stream");
        resp.setHeader("Content-Disposition", "attachment; filename=\"" + encodedName + "\"");
        resp.setHeader("Content-Length", String.valueOf(file.length()));

        try (
                FileInputStream fis = new FileInputStream(file);
                OutputStream out = resp.getOutputStream();
        ) {
            byte[] buffer = new byte[1024 * 8];
            int len;

            while ((len = fis.read(buffer)) != -1) {
                out.write(buffer, 0, len);
            }

            out.flush();
        }
    }
}