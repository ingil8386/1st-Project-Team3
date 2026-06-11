package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.MemberDTO;
import util.DBHelper;
import util.SQL;
import util.SQL2;

public class MemberDAO extends DBHelper {

	private static final MemberDAO INSTANCE = new MemberDAO();

	public static MemberDAO getInstance() {
		return INSTANCE;
	}

	private MemberDAO() {
	}

	public void insertMember(MemberDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.INSERT_MEMBER);

			psmt.setString(1, dto.getMemberid());
			psmt.setString(2, dto.getMemberpass());
			psmt.setString(3, dto.getMembername());
			psmt.setString(4, dto.getMembernick());
			psmt.setString(5, dto.getMemberemail());
			psmt.setString(6, dto.getMemberhp());
			psmt.setString(7, dto.getMemberzip());
			psmt.setString(8, dto.getMemberaddr1());
			psmt.setString(9, dto.getMemberaddr2());
			psmt.setString(10, dto.getRegip());

			psmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public MemberDTO selectMember(String memberid) {

		// 반환용 DTO
		MemberDTO dto = null;

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL2.SELECT_MEMBER);
			psmt.setString(1, memberid);

			rs = psmt.executeQuery();

			if (rs.next()) {
				dto = new MemberDTO();

			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public MemberDTO selectMember(String memberid, String memberpass) {
		MemberDTO dto = null;

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_MEMBER_WITH_PASS);
			psmt.setString(1, memberid);
			psmt.setString(2, memberpass);

			rs = psmt.executeQuery();

			if (rs.next()) {
				dto = new MemberDTO();
				dto.setMemberid(rs.getString("memberid"));
				dto.setMemberpass(rs.getString("memberpass"));
				dto.setMembername(rs.getString("membername"));
				dto.setMembernick(rs.getString("membernick"));
				dto.setMemberemail(rs.getString("memberemail"));
				dto.setMemberhp(rs.getString("memberhp"));
				dto.setMemberrole(rs.getString("memberrole"));
				dto.setMemberzip(rs.getString("memberzip"));
				dto.setMemberaddr1(rs.getString("memberaddr1"));
				dto.setMemberaddr2(rs.getString("memberaddr2"));
				dto.setRegip(rs.getString("regip"));
				dto.setRdate(rs.getString("rdate"));
				dto.setLeavedate(rs.getString("leavedate"));
				closeAll();
			} 

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return dto;
	}

	public int selectCountId(String memberid) {
		return selectCount(SQL2.SELECT_COUNT_ID, memberid);
	}

	public int selectCountNick(String membernick) {
		return selectCount(SQL2.SELECT_COUNT_NICK, membernick);
	}

	public int selectCountEmail(String memberemail) {
		return selectCount(SQL2.SELECT_COUNT_EMAIL, memberemail);
	}

	public int selectCountHp(String memberhp) {
		return selectCount(SQL2.SELECT_COUNT_HP, memberhp);
	}

	public int selectCount(String type, String value) {
		int count = 0;

		String sql = SQL.SELECT_COUNT_MEMBER;

		if (type.equals("memberid")) {
			sql += SQL.WHERE_MEMBERID;
		} else if (type.equals("nick")) {
			sql += SQL.WHERE_NICK;
		} else if (type.equals("email")) {
			sql += SQL.WHERE_EMAIL;
		} else if (type.equals("hp")) {
			sql += SQL.WHERE_HP;
		}

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, value);

			rs = psmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	public List<MemberDTO> selectAllMembers() {
		List<MemberDTO> members = new ArrayList<>();

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL2.SELECT_ALL_MEMBERS);
			rs = psmt.executeQuery();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();

				dto.setMemberid(rs.getString("memberid"));
				dto.setMembername(rs.getString("membername"));
				dto.setMembernick(rs.getString("membernick"));
				dto.setMemberemail(rs.getString("memberemail"));
				dto.setMemberhp(rs.getString("memberhp"));
				dto.setMemberrole(rs.getString("memberrole"));
				dto.setMemberzip(rs.getString("memberzip"));
				dto.setMemberaddr1(rs.getString("memberaddr1"));
				dto.setMemberaddr2(rs.getString("memberaddr2"));
				dto.setRegip(rs.getString("regip"));
				dto.setRdate(rs.getString("rdate"));
				dto.setLeavedate(rs.getString("leavedate"));

				members.add(dto);
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

		return members;
	}
	
	// 1. 아이디 찾기 (이름과 이메일로 아이디 조회)
	public String selectMemberId(String name, String email) {
	    String memberid = null;
	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(SQL.SELECT_MEMBER_ID); // SQL 클래스에 정의된 쿼리 사용
	        psmt.setString(1, name);
	        psmt.setString(2, email);
	        rs = psmt.executeQuery();
	        if (rs.next()) {
	            memberid = rs.getString(1);
	        }
	        closeAll();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return memberid;
	}

	// 2. 비밀번호 찾기 1단계 (아이디와 이메일로 존재 여부 확인)
	public int selectMemberForPass(String id, String email) {
	    int count = 0;
	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(SQL.SELECT_MEMBER_FOR_PASS);
	        psmt.setString(1, id);
	        psmt.setString(2, email);
	        rs = psmt.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }
	        closeAll();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return count;
	}

	// 3. 비밀번호 찾기 2단계 (새 비밀번호 업데이트)
	public int updatePass(String id, String pass) {
	    int result = 0;
	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(SQL.UPDATE_MEMBER_PASS);
	        psmt.setString(1, pass); // SHA2 암호화는 SQL 쿼리에서 수행
	        psmt.setString(2, id);
	        result = psmt.executeUpdate();
	        closeAll();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return result;
	}
	public void updateMember(MemberDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL2.UPDATE_MEMBER);

			psmt.setString(1, dto.getMemberpass());
			psmt.setString(2, dto.getMembernick());
			psmt.setString(3, dto.getMemberemail());
			psmt.setString(4, dto.getMemberhp());
			psmt.setString(5, dto.getMemberzip());
			psmt.setString(6, dto.getMemberaddr1());
			psmt.setString(7, dto.getMemberaddr2());
			psmt.setString(8, dto.getMemberid());

			psmt.executeUpdate();
			closeAll();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원탈퇴
	public int deleteMember(String memberid) {
	    int result = 0;

	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(SQL2.DELETE_MEMBER);
	        psmt.setString(1, memberid);

	        result = psmt.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            closeAll();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return result;
	}
	
	// 비밀번호 포함 회원정보 수정
	public void updateMemberMyinfoWithPass(MemberDTO dto) {

	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(SQL2.UPDATE_MEMBER_MYINFO_WITH_PASS);

	        psmt.setString(1, dto.getMemberpass());
	        psmt.setString(2, dto.getMembernick());
	        psmt.setString(3, dto.getMemberemail());
	        psmt.setString(4, dto.getMemberhp());
	        psmt.setString(5, dto.getMemberzip());
	        psmt.setString(6, dto.getMemberaddr1());
	        psmt.setString(7, dto.getMemberaddr2());
	        psmt.setString(8, dto.getMemberid());

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

	// 비밀번호 제외 회원정보 수정
	public void updateMemberMyinfoWithoutPass(MemberDTO dto) {

	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(SQL2.UPDATE_MEMBER_MYINFO_WITHOUT_PASS);

	        psmt.setString(1, dto.getMembernick());
	        psmt.setString(2, dto.getMemberemail());
	        psmt.setString(3, dto.getMemberhp());
	        psmt.setString(4, dto.getMemberzip());
	        psmt.setString(5, dto.getMemberaddr1());
	        psmt.setString(6, dto.getMemberaddr2());
	        psmt.setString(7, dto.getMemberid());

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
	
	
	// 비밀번호 확인
	public boolean checkMemberPassword(String memberid, String memberpass) {
	    boolean result = false;

	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(SQL2.CHECK_MEMBER_PASSWORD);

	        psmt.setString(1, memberid);
	        psmt.setString(2, memberpass);

	        rs = psmt.executeQuery();

	        if (rs.next()) {
	            result = rs.getInt("cnt") > 0;
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

	    return result;
	}


	
	
	
	// 회원정보 수정
	public void updateMemberMyinfo(MemberDTO dto) {

	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(SQL2.UPDATE_MEMBER_MYINFO);

	        psmt.setString(1, dto.getMemberpass());
	        psmt.setString(2, dto.getMembernick());
	        psmt.setString(3, dto.getMemberemail());
	        psmt.setString(4, dto.getMemberhp());
	        psmt.setString(5, dto.getMemberzip());
	        psmt.setString(6, dto.getMemberaddr1());
	        psmt.setString(7, dto.getMemberaddr2());
	        psmt.setString(8, dto.getMemberid());

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

	// 회원 1명 조회
	public MemberDTO selectMemberById(String memberid) {
	    MemberDTO dto = null;

	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(SQL2.SELECT_MEMBER_BY_ID);
	        psmt.setString(1, memberid);

	        rs = psmt.executeQuery();

	        if (rs.next()) {
	            dto = new MemberDTO();

	            dto.setMemberid(rs.getString("memberid"));
	            dto.setMemberpass(rs.getString("memberpass"));
	            dto.setMembername(rs.getString("membername"));
	            dto.setMembernick(rs.getString("membernick"));
	            dto.setMemberemail(rs.getString("memberemail"));
	            dto.setMemberhp(rs.getString("memberhp"));
	            dto.setMemberrole(rs.getString("memberrole"));
	            dto.setMemberzip(rs.getString("memberzip"));
	            dto.setMemberaddr1(rs.getString("memberaddr1"));
	            dto.setMemberaddr2(rs.getString("memberaddr2"));
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
	
	
	

	public void updateMemberRole(String memberid, String memberrole) {

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL2.UPDATE_MEMBER_ROLE);

			psmt.setString(1, memberrole);
			psmt.setString(2, memberid);

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
	
	// 회원 관련 데이터 삭제 후 회원탈퇴
	public int deleteMemberWithData(String memberid) {
	    int result = 0;

	    try {
	        conn = getConnection();

	        // 장바구니 삭제
	        psmt = conn.prepareStatement(SQL2.DELETE_CART_BY_MEMBER);
	        psmt.setString(1, memberid);
	        psmt.executeUpdate();
	        psmt.close();

	        // 댓글 삭제
	        psmt = conn.prepareStatement(SQL2.DELETE_COMMENTS_BY_MEMBER);
	        psmt.setString(1, memberid);
	        psmt.executeUpdate();
	        psmt.close();

	        // 게시글 삭제
	        psmt = conn.prepareStatement(SQL2.DELETE_COMMUNITY_BY_MEMBER);
	        psmt.setString(1, memberid);
	        psmt.executeUpdate();
	        psmt.close();

	        // 회원 삭제
	        psmt = conn.prepareStatement(SQL2.DELETE_MEMBER);
	        psmt.setString(1, memberid);
	        result = psmt.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            closeAll();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    return result;
	}
	
	
	

}