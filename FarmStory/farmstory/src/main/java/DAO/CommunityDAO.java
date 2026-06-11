package DAO;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

// 게시글 목록 조회 + 페이징
	public List<CommunityDTO> selectCommunities(int boardno, String search, int start, int pageSize) {
		List<CommunityDTO> communities = new ArrayList<>();

		try {
			conn = getConnection();

			if (search == null || search.trim().isEmpty()) {
				psmt = conn.prepareStatement(SQL2.SELECT_COMMUNITIES_BY_BOARD);
				psmt.setInt(1, boardno);
				psmt.setInt(2, start);
				psmt.setInt(3, pageSize);
			} else {
				psmt = conn.prepareStatement(SQL2.SELECT_COMMUNITIES_BY_BOARD_SEARCH);
				psmt.setInt(1, boardno);
				psmt.setString(2, "%" + search + "%");
				psmt.setString(3, "%" + search + "%");
				psmt.setInt(4, start);
				psmt.setInt(5, pageSize);
			}

			rs = psmt.executeQuery();

			while (rs.next()) {
				CommunityDTO dto = new CommunityDTO();

				dto.setCommno(rs.getInt("commno"));
				dto.setBoardno(rs.getInt("boardno"));
				dto.setBoardpostno(rs.getInt("boardpostno"));
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

	// 게시글 개수 조회
	public int selectCommunityCount(int boardno, String search) {
		int count = 0;

		try {
			conn = getConnection();

			if (search == null || search.trim().isEmpty()) {
				psmt = conn.prepareStatement(SQL2.SELECT_COMMUNITY_COUNT_BY_BOARD);
				psmt.setInt(1, boardno);
			} else {
				psmt = conn.prepareStatement(SQL2.SELECT_COMMUNITY_COUNT_BY_BOARD_SEARCH);
				psmt.setInt(1, boardno);
				psmt.setString(2, "%" + search + "%");
				psmt.setString(3, "%" + search + "%");
			}

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

// 게시글 작성
	public int insertCommunity(CommunityDTO dto) {
		int commno = 0;

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL2.INSERT_COMMUNITY, Statement.RETURN_GENERATED_KEYS);

			psmt.setInt(1, dto.getBoardno());
			psmt.setInt(2, dto.getBoardpostno());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getWriter());
			psmt.setString(6, dto.getRegip());

			psmt.executeUpdate();

			rs = psmt.getGeneratedKeys();

			if (rs.next()) {
				commno = rs.getInt(1);
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

		return commno;
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
				dto.setBoardpostno(rs.getInt("boardpostno"));
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

	// 게시판별 다음 글번호 조회
	public int selectNextBoardPostNo(int boardno) {
		int nextNo = 1;

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL2.SELECT_NEXT_BOARD_POST_NO);
			psmt.setInt(1, boardno);

			rs = psmt.executeQuery();

			if (rs.next()) {
				nextNo = rs.getInt("nextNo");
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

		return nextNo;
	}

	// 게시글 첨부파일 여부 수정
	public void updateCommunityFilecheck(int commno, int filecheck) {

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL2.UPDATE_COMMUNITY_FILECHECK);

			psmt.setInt(1, filecheck);
			psmt.setInt(2, commno);

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
	
	
	// 내가 쓴 글 목록
	public List<CommunityDTO> selectMyArticles(String writer) {
	    List<CommunityDTO> articles = new ArrayList<>();

	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(SQL2.SELECT_MY_ARTICLES);
	        psmt.setString(1, writer);

	        rs = psmt.executeQuery();

	        while (rs.next()) {
	            CommunityDTO dto = new CommunityDTO();

	            dto.setCommno(rs.getInt("commno"));
	            dto.setBoardno(rs.getInt("boardno"));
	            dto.setBoardpostno(rs.getInt("boardpostno"));
	            dto.setTitle(rs.getString("title"));
	            dto.setContent(rs.getString("content"));
	            dto.setCommentcount(rs.getInt("commentcount"));
	            dto.setFilecheck(rs.getInt("filecheck"));
	            dto.setHit(rs.getInt("hit"));
	            dto.setWriter(rs.getString("writer"));
	            dto.setRegip(rs.getString("regip"));
	            dto.setWdate(rs.getString("wdate"));

	            articles.add(dto);
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

	    return articles;
	}

	public int countCommunities(int boardno, String search) {

	    String sql = "SELECT COUNT(*) FROM community WHERE boardno = ?";

	    if (search != null && !search.isEmpty()) {
	        sql += " AND title LIKE ?";
	    }

	    try (Connection conn = getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setInt(1, boardno);

	        if (search != null && !search.isEmpty()) {
	            ps.setString(2, "%" + search + "%");
	        }

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            return rs.getInt(1);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return 0;
	}
}