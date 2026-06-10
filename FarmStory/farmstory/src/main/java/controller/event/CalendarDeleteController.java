package controller.event;

import java.io.IOException;

import DAO.EventDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/event/calendar/delete.do")
public class CalendarDeleteController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private EventDAO eventDAO = EventDAO.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/plain; charset=UTF-8");

        String eventno = req.getParameter("eventno");

        if (eventno == null || eventno.trim().isEmpty()) {
            resp.getWriter().write("fail");
            return;
        }

        try {
            int no = Integer.parseInt(eventno);
            eventDAO.deleteEvent(no);

            resp.getWriter().write("success");

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("fail");
        }
    }
}