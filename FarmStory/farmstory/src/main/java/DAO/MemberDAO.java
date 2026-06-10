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

	public void deleteMember(String memberid) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL2.DELETE_MEMBER);
			psmt.setString(1, memberid);

			psmt.executeUpdate();
			closeAll();

		} catch (Exception e) {
			e.printStackTrace();
		}
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

}