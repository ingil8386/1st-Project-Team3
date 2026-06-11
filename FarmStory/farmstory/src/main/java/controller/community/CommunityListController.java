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
            boardno = 4; // 공지사항
            view = "/WEB-INF/views/community/notice.jsp";
        } else if (uri.endsWith("/meal.do")) {
            boardno = 5; // 오늘의 식단
            view = "/WEB-INF/views/community/meal.jsp";
        } else if (uri.endsWith("/chef.do")) {
            boardno = 6; // 나도요리사
            view = "/WEB-INF/views/community/chef.jsp";
        } else if (uri.endsWith("/qna.do")) {
            boardno = 7; // 1:1고객문의
            view = "/WEB-INF/views/community/qna.jsp";
        } else if (uri.endsWith("/faq.do")) {
            boardno = 8; // 자주묻는질문
            view = "/WEB-INF/views/community/faq.jsp";
        } 
        
        String pg = req.getParameter("pg");

        int currentPage = 1;

        if (pg != null && !pg.isEmpty()) {
            currentPage = Integer.parseInt(pg);
        }

        String search = req.getParameter("search");

        int pageSize = 10;
        int start = (currentPage - 1) * pageSize;

        /* 전체 게시글 수 */
        int totalCount = communityDAO.selectCommunityCount(boardno, search);

        /* 마지막 페이지 */
        int lastPage = (int)Math.ceil(totalCount / (double)pageSize);

        /* 페이지 그룹 */
        int startPage = ((currentPage - 1) / 10) * 10 + 1;
        int endPage = startPage + 9;

        if(endPage > lastPage){
            endPage = lastPage;
        }

        /* 게시글 목록 */
        List<CommunityDTO> communities =
                communityDAO.selectCommunities(
                        boardno,
                        search,
                        start,
                        pageSize
                );

        req.setAttribute("communities", communities);
        req.setAttribute("boardno", boardno);
        req.setAttribute("search", search);

        /* 페이징 */
        req.setAttribute("page", currentPage);
        req.setAttribute("lastPage", lastPage);
        req.setAttribute("startPage", startPage);
        req.setAttribute("endPage", endPage);
        req.setAttribute("listUrl", req.getRequestURI());

        req.getRequestDispatcher(view).forward(req, resp);
    }
}