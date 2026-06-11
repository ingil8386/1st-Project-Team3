package controller.story;

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
        "/story/intro.do",
        "/story/garden.do",
        "/story/school.do"
})
public class StoryListController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CommunityDAO communityDAO = CommunityDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String uri = req.getRequestURI();

        int boardno = 1;
        String view = "/WEB-INF/views/story/intro.jsp";
        String listUrl = req.getContextPath() + "/story/intro.do";

        if (uri.endsWith("/intro.do")) {
            boardno = 1;
            view = "/WEB-INF/views/story/intro.jsp";
            listUrl = req.getContextPath() + "/story/intro.do";
        } else if (uri.endsWith("/garden.do")) {
            boardno = 2;
            view = "/WEB-INF/views/story/garden.jsp";
            listUrl = req.getContextPath() + "/story/garden.do";
        } else if (uri.endsWith("/school.do")) {
            boardno = 3;
            view = "/WEB-INF/views/story/school.jsp";
            listUrl = req.getContextPath() + "/story/school.do";
        }

        String search = req.getParameter("search");

        int page = 1;
        String pageParam = req.getParameter("page");

        try {
            if (pageParam != null && !pageParam.trim().isEmpty()) {
                page = Integer.parseInt(pageParam);
            }
        } catch (Exception e) {
            page = 1;
        }

        int pageSize = 8;
        int start = (page - 1) * pageSize;

        int totalCount = communityDAO.selectCommunityCount(boardno, search);
        int lastPage = (int) Math.ceil(totalCount / (double) pageSize);

        if (lastPage == 0) {
            lastPage = 1;
        }

        int pageGroupSize = 5;
        int startPage = ((page - 1) / pageGroupSize) * pageGroupSize + 1;
        int endPage = startPage + pageGroupSize - 1;

        if (endPage > lastPage) {
            endPage = lastPage;
        }

        List<CommunityDTO> communities =
                communityDAO.selectCommunities(boardno, search, start, pageSize);

        req.setAttribute("communities", communities);
        req.setAttribute("boardno", boardno);
        req.setAttribute("search", search == null ? "" : search);

        req.setAttribute("page", page);
        req.setAttribute("lastPage", lastPage);
        req.setAttribute("startPage", startPage);
        req.setAttribute("endPage", endPage);
        req.setAttribute("listUrl", listUrl);

        req.getRequestDispatcher(view).forward(req, resp);
    }
}