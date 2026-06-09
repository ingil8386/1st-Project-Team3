package DAO;

import java.util.ArrayList;
import java.util.List;

import DTO.CommentDTO;
import util.DBHelper;
import util.SQL;
import util.SQL2;

public class CommentDAO extends DBHelper {

    private static final CommentDAO INSTANCE = new CommentDAO();

    public static CommentDAO getInstance() {
        return INSTANCE;
    }

    private CommentDAO() {}

    public void insertComment(CommentDTO dto) {
        try {
            conn = getConnection();
            conn.setAutoCommit(false);

            psmt = conn.prepareStatement(SQL.INSERT_COMMENT);
            psmt.setInt(1, dto.getCommno());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getWriter());
            psmt.setString(4, dto.getRegip());
            psmt.executeUpdate();

            psmtEtc1 = conn.prepareStatement(SQL2.UPDATE_COMMENT_COUNT_PLUS);
            psmtEtc1.setInt(1, dto.getCommno());
            psmtEtc1.executeUpdate();

            conn.commit();
            closeAll();

        } catch (Exception e) {
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }

            e.printStackTrace();

        } finally {
        }
    }

    public List<CommentDTO> selectComments(int commno) {
        List<CommentDTO> comments = new ArrayList<>();

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SELECT_COMMENTS);
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
                dto.setMembernick(rs.getString("membernick"));

                comments.add(dto);
                closeAll();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return comments;
    }

    public void updateComment(CommentDTO dto) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.UPDATE_COMMENT);

            psmt.setString(1, dto.getContent());
            psmt.setInt(2, dto.getCommentno());

            psmt.executeUpdate();
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteComment(int commentno, int commno) {
        try {
            conn = getConnection();
            conn.setAutoCommit(false);

            psmt = conn.prepareStatement(SQL.DELETE_COMMENT);
            psmt.setInt(1, commentno);
            psmt.executeUpdate();

            psmtEtc1 = conn.prepareStatement(SQL2.UPDATE_COMMENT_COUNT_MINUS);
            psmtEtc1.setInt(1, commno);
            psmtEtc1.executeUpdate();

            conn.commit();
            closeAll();

        } catch (Exception e) {
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }

            e.printStackTrace();

        }
    }
}