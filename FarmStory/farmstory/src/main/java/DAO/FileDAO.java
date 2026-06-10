package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.FileDTO;
import util.DBHelper;
import util.SQL2;

public class FileDAO extends DBHelper {

    private static final FileDAO INSTANCE = new FileDAO();

    public static FileDAO getInstance() {
        return INSTANCE;
    }

    private FileDAO() {
    }

    // 첨부파일 저장
    public void insertFile(FileDTO dto) {

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.INSERT_FILE);

            psmt.setInt(1, dto.getCommno());
            psmt.setString(2, dto.getOfname());
            psmt.setString(3, dto.getSfname());

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

    // 게시글 첨부파일 목록 조회
    public List<FileDTO> selectFilesByCommno(int commno) {
        List<FileDTO> files = new ArrayList<>();

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SELECT_FILES_BY_COMMNO);
            psmt.setInt(1, commno);

            rs = psmt.executeQuery();

            while (rs.next()) {
                FileDTO dto = new FileDTO();

                dto.setFileno(rs.getInt("fileno"));
                dto.setCommno(rs.getInt("commno"));
                dto.setOfname(rs.getString("ofname"));
                dto.setSfname(rs.getString("sfname"));
                dto.setDownload(rs.getInt("download"));
                dto.setRdate(rs.getString("rdate"));

                files.add(dto);
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

        return files;
    }

    // 첨부파일 1개 조회
    public FileDTO selectFile(int fileno) {
        FileDTO dto = null;

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SELECT_FILE);
            psmt.setInt(1, fileno);

            rs = psmt.executeQuery();

            if (rs.next()) {
                dto = new FileDTO();

                dto.setFileno(rs.getInt("fileno"));
                dto.setCommno(rs.getInt("commno"));
                dto.setOfname(rs.getString("ofname"));
                dto.setSfname(rs.getString("sfname"));
                dto.setDownload(rs.getInt("download"));
                dto.setRdate(rs.getString("rdate"));
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

    // 다운로드 수 증가
    public void updateFileDownload(int fileno) {

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.UPDATE_FILE_DOWNLOAD);
            psmt.setInt(1, fileno);

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

    // 첨부파일 삭제
    public void deleteFile(int fileno) {

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.DELETE_FILE);
            psmt.setInt(1, fileno);

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

    // 게시글 첨부파일 개수 조회
    public int selectFileCountByCommno(int commno) {
        int count = 0;

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SELECT_FILE_COUNT_BY_COMMNO);
            psmt.setInt(1, commno);

            rs = psmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt("cnt");
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

        return count;
    }
}