package DAO;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import DTO.CommunityDTO;
import util.DBHelper;
import util.SQL2;

public class CommunityDAO extends DBHelper {

    private static final CommunityDAO INSTANCE = new CommunityDAO();

    public static CommunityDAO getInstance() {
        return INSTANCE;
    }

    private CommunityDAO() {}

    public int insertCommunity(CommunityDTO dto) {
        int commno = 0;

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.INSERT_COMMUNITY, Statement.RETURN_GENERATED_KEYS);

            psmt.setInt(1, dto.getBoardno());
            psmt.setString(2, dto.getTitle());
            psmt.setString(3, dto.getContent());
            psmt.setInt(4, dto.getFilecheck());
            psmt.setString(5, dto.getWriter());
            psmt.setString(6, dto.getRegip());

            psmt.executeUpdate();

            rs = psmt.getGeneratedKeys();

            if (rs.next()) {
                commno = rs.getInt(1);
            }
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return commno;
    }

    public CommunityDTO selectCommunity(int commno) {
        CommunityDTO dto = null;

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SELECT_COMMUNITY);
            psmt.setInt(1, commno);

            rs = psmt.executeQuery();

            if (rs.next()) {
                dto = setCommunityDTO(rs);
            }
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }

    public List<CommunityDTO> selectCommunities(int boardno) {
        List<CommunityDTO> communities = new ArrayList<>();

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SELECT_COMMUNITIES);
            psmt.setInt(1, boardno);

            rs = psmt.executeQuery();

            while (rs.next()) {
                CommunityDTO dto = setCommunityDTO(rs);
                communities.add(dto);
            }
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return communities;
    }

    public List<CommunityDTO> searchCommunities(int boardno, String keyword) {
        List<CommunityDTO> communities = new ArrayList<>();

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SEARCH_COMMUNITIES);
            psmt.setInt(1, boardno);
            psmt.setString(2, "%" + keyword + "%");

            rs = psmt.executeQuery();

            while (rs.next()) {
                CommunityDTO dto = setCommunityDTO(rs);
                communities.add(dto);
            }
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return communities;
    }

    public void updateHit(int commno) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.UPDATE_HIT);
            psmt.setInt(1, commno);

            psmt.executeUpdate();
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateCommunity(CommunityDTO dto) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.UPDATE_COMMUNITY);

            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setInt(3, dto.getCommno());

            psmt.executeUpdate();
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteCommunity(int commno) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.DELETE_COMMUNITY);
            psmt.setInt(1, commno);

            psmt.executeUpdate();
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private CommunityDTO setCommunityDTO(java.sql.ResultSet rs) throws Exception {
        CommunityDTO dto = new CommunityDTO();

        dto.setCommno(rs.getInt("commno"));
        dto.setBoardno(rs.getInt("boardno"));
        dto.setTitle(rs.getString("title"));
        dto.setContent(rs.getString("content"));
        dto.setCommentcount(rs.getInt("commentcount"));
        dto.setFilecheck(rs.getInt("filecheck"));
        dto.setHit(rs.getInt("hit"));
        dto.setWriter(rs.getString("writer"));
        dto.setRegip(rs.getString("regip"));
        dto.setWdate(rs.getString("wdate"));
        dto.setMembernick(rs.getString("membernick"));

        return dto;
    }
}