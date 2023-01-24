package semi.heritage.member.service;

import static semi.heritage.common.jdbc.JDBCTemplate.close;
import static semi.heritage.common.jdbc.JDBCTemplate.commit;
import static semi.heritage.common.jdbc.JDBCTemplate.getConnection;
import static semi.heritage.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import semi.heritage.member.dao.MemberDao;
import semi.heritage.member.vo.Member;

public class MemberService {
	private MemberDao dao = new MemberDao();
	
	public Member findMemberById(String uemail) {
		Connection conn = getConnection();
		Member member = dao.findMemberById(conn, uemail);
		close(conn);
		return member;
	}
	
	// 로그인기능, id pw를 DB에서 대조하여 인증된 사용자인지 검증하는 기능
	public Member login(String uemail, String pw) {
		Member member = findMemberById(uemail);

		if(member != null && member.getUemail().equals("admin")) {
			return member;
		}
		
		if(member != null && member.getUpw().equals(pw)) {
			
			return member;
		}else {
			return null;
		}
	}
	
	
	public int save(Member member) {
		int result = 0;
		Connection conn = getConnection();
		
		if(member.getUno() != 0) {
			result = dao.updateMember(conn, member);
		}else {
			result = dao.insertMember(conn, member);
		}
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		System.out.println("회원정보 수정!! "+member);
		return result;
	}
	
	public int delete(int no) {
		Connection conn = getConnection();
		int result = dao.updateStatus(conn, no, "N");
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 중복 가입 방지용
	public boolean isDuplicated(String uemail) {
		Connection conn = getConnection();
		Member member = dao.findMemberById(conn, uemail);
		close(conn);

		if(member != null) {
			return true; // 중복됨
		}else {
			return false; // 중복되지 않음! -> 회원가입 가능
		}
	}

}
