package DAO;

import java.util.ArrayList;
import java.util.List;

import DTO.FileDTO;
import util.DBHelper;
import util.SQL;
import util.SQL2;

public class FileDAO extends DBHelper {

    private static final FileDAO INSTANCE = new FileDAO();

    public static FileDAO getInstance() {
        return INSTANCE;
    }

    private FileDAO() {}

    public void insertFile(FileDTO dto) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.INSERT_FILE);

            psmt.setInt(1, dto.getCommno());
            psmt.setString(2, dto.getOfname());
            psmt.setString(3, dto.getSfname());

            psmt.executeUpdate();
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<FileDTO> selectFiles(int commno) {
        List<FileDTO> files = new ArrayList<>();

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.SELECT_FILES);
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
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return files;
    }

    public FileDTO selectFile(int fileno) {
        FileDTO dto = null;

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_FILE);
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
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }

    public void updateDownload(int fileno) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL2.UPDATE_DOWNLOAD);
            psmt.setInt(1, fileno);

            psmt.executeUpdate();
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteFile(int fileno) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.DELETE_FILE);
            psmt.setInt(1, fileno);

            psmt.executeUpdate();
            closeAll();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}