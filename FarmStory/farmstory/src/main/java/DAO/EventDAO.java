package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.EventDTO;
import util.DBHelper;
import util.SQL2;

public class EventDAO extends DBHelper {

    private static final EventDAO INSTANCE = new EventDAO();

    public static EventDAO getInstance() {
        return INSTANCE;
    }

    private EventDAO() {
    }

    public void insertEvent(EventDTO dto) {

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.INSERT_EVENT);

            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getStartdate());

            psmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                closeAll();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public List<EventDTO> selectEvents() {
        List<EventDTO> events = new ArrayList<>();

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SELECT_EVENTS);
            rs = psmt.executeQuery();

            while (rs.next()) {
                EventDTO dto = new EventDTO();

                dto.setEventno(rs.getInt("eventno"));
                dto.setTitle(rs.getString("title"));
                dto.setStartdate(rs.getString("startdate"));
                dto.setRdate(rs.getString("rdate"));

                events.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                closeAll();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return events;
    }
    
    public void deleteEvent(int eventno) {

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.DELETE_EVENT);
            psmt.setInt(1, eventno);

            psmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                closeAll();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    
}