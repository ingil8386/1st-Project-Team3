package controller.event;

import java.io.IOException;
import java.util.List;

import DAO.EventDAO;
import DTO.EventDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/event/calendar.do")
public class CalendarController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private EventDAO eventDAO = EventDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        List<EventDTO> events = eventDAO.selectEvents();

        req.setAttribute("events", events);

        req.getRequestDispatcher("/WEB-INF/views/event/calendar.jsp")
           .forward(req, resp);
    }
}