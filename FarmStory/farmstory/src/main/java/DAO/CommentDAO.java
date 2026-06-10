package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.CommentDTO;
import util.DBHelper;
import util.SQL2;

public class CommentDAO extends DBHelper {

    private static final CommentDAO INSTANCE = new CommentDAO();

    public static CommentDAO getInstance() {
        return INSTANCE;
    }

    private CommentDAO() {
    }

    // 댓글 목록 조회
    public List<CommentDTO> selectComments(int commno) {
        List<CommentDTO> comments = new ArrayList<>();

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SELECT_COMMUNITY_COMMENTS);
            psmt.setInt(1, commno);

            rs = psmt.executeQuery();

            while (rs.next()) {
                CommentDTO dto = new CommentDTO();

                dto.setCommentno(rs.getInt("commentno"));
                dto.setCommno(rs.getInt("commno"));
                dto.setContent(rs.getString("content"));
                dto.setWriter(rs.getString("writer"));
                dto.setRegip(rs.getString("regip"));
                dto.setWdate(rs.getString("wdate"));

                comments.add(dto);
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

        return comments;
    }

    // 댓글 1개 조회
    public CommentDTO selectComment(int commentno) {
        CommentDTO dto = null;

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SELECT_COMMUNITY_COMMENT);
            psmt.setInt(1, commentno);

            rs = psmt.executeQuery();

            if (rs.next()) {
                dto = new CommentDTO();

                dto.setCommentno(rs.getInt("commentno"));
                dto.setCommno(rs.getInt("commno"));
                dto.setContent(rs.getString("content"));
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

    // 댓글 작성
    public void insertComment(CommentDTO dto) {

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.INSERT_COMMUNITY_COMMENT);

            psmt.setInt(1, dto.getCommno());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getWriter());
            psmt.setString(4, dto.getRegip());

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

    // 댓글 삭제
    public void deleteComment(int commentno) {

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.DELETE_COMMUNITY_COMMENT);
            psmt.setInt(1, commentno);

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