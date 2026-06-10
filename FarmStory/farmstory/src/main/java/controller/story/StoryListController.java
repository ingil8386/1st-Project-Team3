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

        if (uri.endsWith("/intro.do")) {
            boardno = 1; // 농작물 이야기
            view = "/WEB-INF/views/story/intro.jsp";
        } else if (uri.endsWith("/garden.do")) {
            boardno = 2; // 텃밭가꾸기
            view = "/WEB-INF/views/story/garden.jsp";
        } else if (uri.endsWith("/school.do")) {
            boardno = 3; // 귀농학교
            view = "/WEB-INF/views/story/school.jsp";
        }

        String search = req.getParameter("search");

        List<CommunityDTO> communities = communityDAO.selectCommunities(boardno, search);

        req.setAttribute("communities", communities);
        req.setAttribute("boardno", boardno);
        req.setAttribute("search", search);

        req.getRequestDispatcher(view).forward(req, resp);
    }
}