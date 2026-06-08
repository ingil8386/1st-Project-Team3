package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({
        "/index.do",

        "/about/greeting.do",
        "/about/direction.do",

        "/market/list.do",
        "/market/detail.do",
        "/market/cart.do",
        "/market/order.do",
        "/market/view.do",

        "/story/intro.do",
        "/story/garden.do",
        "/story/school.do",

        "/event/calendar.do",

        "/community/notice.do",
        "/community/qna.do",
        "/community/faq.do",
        "/community/meal.do",
        "/community/menu.do",
        "/community/chef.do",
        "/community/view.do",
        "/community/grow.do",
        "/community/school.do",

        "/user/login.do",
        "/user/terms.do",
        "/user/register.do",

        "/admin/index.do"
})
public class MainController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String uri = req.getRequestURI();
        String ctx = req.getContextPath();
        String path = uri.substring(ctx.length());

        String view = null;

        switch (path) {

            case "/index.do":
                view = "/WEB-INF/index.jsp";
                break;

            // about
            case "/about/greeting.do":
                view = "/WEB-INF/views/about/greeting.jsp";
                break;

            case "/about/direction.do":
                view = "/WEB-INF/views/about/direction.jsp";
                break;

            // market
            case "/market/list.do":
                view = "/WEB-INF/views/market/list.jsp";
                break;

            case "/market/detail.do":
            case "/market/view.do":
                view = "/WEB-INF/views/market/detail.jsp";
                break;

            case "/market/cart.do":
                view = "/WEB-INF/views/market/cart.jsp";
                break;

            case "/market/order.do":
                view = "/WEB-INF/views/market/order.jsp";
                break;

            // story
            case "/story/intro.do":
                view = "/WEB-INF/views/story/intro.jsp";
                break;

            case "/story/garden.do":
                view = "/WEB-INF/views/story/garden.jsp";
                break;

            case "/story/school.do":
                view = "/WEB-INF/views/story/school.jsp";
                break;

            // event
            case "/event/calendar.do":
                view = "/WEB-INF/views/event/calendar.jsp";
                break;

            // community
            case "/community/notice.do":
                view = "/WEB-INF/views/community/notice.jsp";
                break;

            case "/community/qna.do":
                view = "/WEB-INF/views/community/qna.jsp";
                break;

            case "/community/faq.do":
                view = "/WEB-INF/views/community/faq.jsp";
                break;

            case "/community/meal.do":
            case "/community/menu.do":
                view = "/WEB-INF/views/community/meal.jsp";
                break;

            case "/community/chef.do":
                view = "/WEB-INF/views/community/chef.jsp";
                break;

            case "/community/view.do":
                view = "/WEB-INF/views/community/view.jsp";
                break;

            case "/community/grow.do":
                view = "/WEB-INF/views/community/grow.jsp";
                break;

            case "/community/school.do":
                view = "/WEB-INF/views/community/school.jsp";
                break;

            // user
            case "/user/login.do":
                view = "/WEB-INF/views/user/login.jsp";
                break;

            case "/user/terms.do":
                view = "/WEB-INF/views/user/terms.jsp";
                break;

            case "/user/register.do":
                view = "/WEB-INF/views/user/register.jsp";
                break;

            // admin
            case "/admin/index.do":
                view = "/WEB-INF/views/admin/index.jsp";
                break;
        }

        if (view == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        req.getRequestDispatcher(view).forward(req, resp);
    }
}