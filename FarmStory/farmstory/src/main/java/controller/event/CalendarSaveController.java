package controller.event;

import java.io.IOException;

import DAO.EventDAO;
import DTO.EventDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/event/calendar/save.do")
public class CalendarSaveController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private EventDAO eventDAO = EventDAO.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/plain; charset=UTF-8");

        String title = req.getParameter("title");
        String startdate = req.getParameter("startdate");

        if (title == null || title.trim().isEmpty()
                || startdate == null || startdate.trim().isEmpty()) {

            resp.getWriter().write("fail");
            return;
        }

        EventDTO dto = new EventDTO();
        dto.setTitle(title);
        dto.setStartdate(startdate);

        int eventno = eventDAO.insertEvent(dto);

        if (eventno > 0) {
            resp.getWriter().write(String.valueOf(eventno));
        } else {
            resp.getWriter().write("fail");
        }
    }
}