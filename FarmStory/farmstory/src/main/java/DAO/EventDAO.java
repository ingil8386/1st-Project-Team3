package DAO;

import java.sql.SQLException;
import java.sql.Statement;
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

    // 이벤트 저장 후 생성된 eventno 반환
    public int insertEvent(EventDTO dto) {
        int eventno = 0;

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.INSERT_EVENT, Statement.RETURN_GENERATED_KEYS);

            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getStartdate());

            psmt.executeUpdate();

            rs = psmt.getGeneratedKeys();

            if (rs.next()) {
                eventno = rs.getInt(1);
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

        return eventno;
    }

    // 이벤트 목록 조회
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

    // 이벤트 삭제
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