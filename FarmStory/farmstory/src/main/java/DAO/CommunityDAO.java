package DAO;

import java.sql.SQLException;
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

    private CommunityDAO() {
    }

    public List<CommunityDTO> selectCommunities(int boardno, String search) {
        List<CommunityDTO> communities = new ArrayList<>();

        try {
            conn = getConnection();

            if (search == null || search.trim().isEmpty()) {
                psmt = conn.prepareStatement(SQL2.SELECT_COMMUNITIES_BY_BOARD);
                psmt.setInt(1, boardno);
            } else {
                psmt = conn.prepareStatement(SQL2.SELECT_COMMUNITIES_BY_BOARD_SEARCH);
                psmt.setInt(1, boardno);
                psmt.setString(2, "%" + search + "%");
                psmt.setString(3, "%" + search + "%");
            }

            rs = psmt.executeQuery();

            while (rs.next()) {
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

                communities.add(dto);
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

        return communities;
    }
    
    public void insertCommunity(CommunityDTO dto) {

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.INSERT_COMMUNITY);

            psmt.setInt(1, dto.getBoardno());
            psmt.setString(2, dto.getTitle());
            psmt.setString(3, dto.getContent());
            psmt.setString(4, dto.getWriter());
            psmt.setString(5, dto.getRegip());

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
    
    
 // 게시글 1개 조회
    public CommunityDTO selectCommunity(int commno) {
        CommunityDTO dto = null;

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SELECT_COMMUNITY);
            psmt.setInt(1, commno);

            rs = psmt.executeQuery();

            if (rs.next()) {
                dto = new CommunityDTO();

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

        return dto;
    }

    // 조회수 증가
    public void updateCommunityHit(int commno) {

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.UPDATE_COMMUNITY_HIT);
            psmt.setInt(1, commno);

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
    
 // 게시글 수정
    public void updateCommunity(CommunityDTO dto) {

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.UPDATE_COMMUNITY);

            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setInt(3, dto.getCommno());

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
    
    
 // 게시글 삭제
    public void deleteCommunity(int commno) {

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.DELETE_COMMUNITY);

            psmt.setInt(1, commno);

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
    
    
    
 // 댓글 수 증가
    public void updateCommunityCommentCountPlus(int commno) {

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.UPDATE_COMMUNITY_COMMENT_COUNT_PLUS);
            psmt.setInt(1, commno);

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

    // 댓글 수 감소
    public void updateCommunityCommentCountMinus(int commno) {

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.UPDATE_COMMUNITY_COMMENT_COUNT_MINUS);
            psmt.setInt(1, commno);

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