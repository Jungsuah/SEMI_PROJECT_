package semi.heritage.member.dao;

import static semi.heritage.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import semi.heritage.member.vo.Member;

public class MemberDao {

	Member memver = new Member();

	// 회원가입
	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO USERINFO VALUES(SEQ_UNO.NEXTVAL,?, ?, ?, "
				+ "DEFAULT, DEFAULT,DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT)";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUemail());
			pstmt.setString(2, member.getUpw());
			pstmt.setString(3, member.getUname());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	// 회원정보 수정
	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		String query = "UPDATE USERINFO SET upn=?, uadr=?, "
				+ " ORIGINAL_PHOTO=?, RENAMED_PHOTO=?, introduce=?,"
				+ " twt=?, insta=?, facebook=? WHERE UNO=?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUpn());
			pstmt.setString(2, member.getUadr());
			pstmt.setString(3, member.getOriginalPhoto());
			pstmt.setString(4, member.getRenamedPhoto());
			pstmt.setString(5, member.getIntroduce());
			pstmt.setString(6, member.getTwt());
			pstmt.setString(7, member.getInsta());
			pstmt.setString(8, member.getFacebook());
			pstmt.setInt(9, member.getUno());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 탈퇴하기
	public int updateStatus(Connection conn, int uNo, String status) {
		PreparedStatement pstmt = null;
		String query = "UPDATE USERINFO SET STATUS=? WHERE uNO=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, status);
			pstmt.setInt(2, uNo);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 로그인을 위한 아이디 검색 (탈퇴했는지 안했는지 알아봄)
	public Member findMemberById(Connection conn, String uemail) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = " SELECT * FROM USERINFO WHERE uemail=? AND STATUS='Y' ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uemail);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Member m = new Member();
				m.setUno(rs.getInt("uNo"));
				m.setUemail(rs.getString("uEmail"));
				m.setUpw(rs.getString("uPW"));
				m.setUname(rs.getString("uName"));
				m.setUpn(rs.getString("uPN"));
				m.setUadr(rs.getString("uAdr"));
				m.setOriginalPhoto(rs.getString("ORIGINAL_PHOTO"));
				m.setRenamedPhoto(rs.getString("RENAMED_PHOTO"));
				m.setIntroduce(rs.getString("introduce"));
				m.setTwt(rs.getString("twt"));
				m.setInsta(rs.getString("insta"));
				m.setFacebook(rs.getString("facebook"));
				m.setStatus(rs.getString("STATUS"));

				return m;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return null;
	}

}
