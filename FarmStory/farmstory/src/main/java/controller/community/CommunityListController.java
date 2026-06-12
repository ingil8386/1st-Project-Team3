package controller.community;

import java.io.IOException;
import java.util.List;

import DAO.CommunityDAO;
import DTO.CommunityDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({
        "/community/chef.do",
        "/community/faq.do",
        "/community/meal.do",
        "/community/notice.do",
        "/community/qna.do"
})
public class CommunityListController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private CommunityDAO communityDAO = CommunityDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String uri = req.getRequestURI();

        int boardno = 4;
        String view = "/WEB-INF/views/community/notice.jsp";

        if (uri.endsWith("/notice.do")) {
            boardno = 4;
            view = "/WEB-INF/views/community/notice.jsp";
        } else if (uri.endsWith("/meal.do")) {
            boardno = 5;
            view = "/WEB-INF/views/community/meal.jsp";
        } else if (uri.endsWith("/chef.do")) {
            boardno = 6;
            view = "/WEB-INF/views/community/chef.jsp";
        } else if (uri.endsWith("/qna.do")) {
            boardno = 7;
            view = "/WEB-INF/views/community/qna.jsp";
        } else if (uri.endsWith("/faq.do")) {
            boardno = 8;
            view = "/WEB-INF/views/community/faq.jsp";
        }

        // =========================
        // 1. 페이지 처리
        // =========================
        int pageSize = 8;
        int currentPage = 1;

        String pg = req.getParameter("page");
        if (pg != null && !pg.isEmpty()) {
            try {
                currentPage = Integer.parseInt(pg);
            } catch (NumberFormatException e) {
                currentPage = 1;
            }
        }

        int start = (currentPage - 1) * pageSize;

        // =========================
        // 2. 검색
        // =========================
        String search = req.getParameter("search");

        // =========================
        // 3. 리스트 조회
        // =========================
        List<CommunityDTO> communities =
                communityDAO.selectCommunities(boardno, search, start, pageSize);

        // =========================
        // 4. 전체 개수 (페이징 핵심)
        // =========================
        int totalCount = communityDAO.countCommunities(boardno, search);

        int lastPage = (int) Math.ceil(totalCount / (double) pageSize);

        int pageGroup = 5;

        int startPage = ((currentPage - 1) / pageGroup) * pageGroup + 1;

        int endPage = startPage + pageGroup - 1;

        if (endPage > lastPage) {
            endPage = lastPage;
        }

        // =========================
        // 5. JSP 전달 (핵심)
        // =========================
        req.setAttribute("communities", communities);
        req.setAttribute("boardno", boardno);
        req.setAttribute("search", search);

        req.setAttribute("page", currentPage);
        req.setAttribute("lastPage", lastPage);
        req.setAttribute("startPage", startPage);
        req.setAttribute("endPage", endPage);
        
        req.setAttribute("listUrl", req.getRequestURI());

        // =========================
        // 6. 이동
        // =========================
        req.getRequestDispatcher(view).forward(req, resp);
    }
}