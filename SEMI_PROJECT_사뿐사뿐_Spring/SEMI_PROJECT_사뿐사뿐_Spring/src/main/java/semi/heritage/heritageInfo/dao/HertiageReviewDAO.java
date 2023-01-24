package semi.heritage.heritageInfo.dao;

import static semi.heritage.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import semi.heritage.heritageInfo.vo.HertiageReview;

public class HertiageReviewDAO {

	// 문화재 고유번호에 따라 달린 리뷰의 갯수를 가져오는 쿼리문 -> 문화재 고유번호, 리뷰갯수
	public int getHertiageReview_Count(Connection conn, int heritageNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(revNo) FROM HertiageReview group by no having no = ? order by COUNT(revNo) desc";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, heritageNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println(result);
		return result;
	}

	// 문화재에 달린 리플을 가져오는 쿼리 -- 문화재 리뷰 리스트 조회 -> 회원 이메일, 문화재리뷰내용 , 리뷰작성날짜
	public List<HertiageReview> getHertiageReview_ByNo(Connection conn, int heritageNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HertiageReview> list = new ArrayList<>();
		String query = "select HR.no, U.uEmail , HR.revContents, HR.revDate " + " FROM HertiageReview HR, USERINFO U "
				+ " WHERE HR.uNo = U.uNo AND HR.STATUS = 'Y' AND HR.no= ? ORDER BY HR.revNo DESC";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, heritageNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int count = 1;
				int rev_no = rs.getInt(count++);
				String rev_userEmail = rs.getString(count++);
				String revContents = rs.getString(count++);
				Date revDate = rs.getDate(count++);
				HertiageReview reviewInfo = new HertiageReview(rev_no, rev_userEmail, revContents, revDate);
				list.add(reviewInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println(list.toString());
		return list;
	}

	// 유저 넘버로 리플 조회
	public List<HertiageReview> getHertiageReviewByUno(Connection conn, int uNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<HertiageReview> list = new ArrayList<>();
		String query = "select HR.REVNO, HR.uNo, U.uEmail , HR.revContents, HR.revDate "
				+ " FROM HertiageReview HR, USERINFO U "
				+ "WHERE HR.uNo = U.uNo AND HR.STATUS = 'Y' AND HR.uno= ? ORDER BY HR.revNo DESC";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, uNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int count = 1;
				int revNo = rs.getInt(count++);
				int rev_uNo = rs.getInt(count++);
				String rev_userEmail = rs.getString(count++);
				String revContents = rs.getString(count++);
				Date revDate = rs.getDate(count++);
				HertiageReview reviewInfo = new HertiageReview(revNo, rev_uNo, rev_userEmail, revContents, revDate);
				list.add(reviewInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println(list.toString());
		return list;
	}

	// 리플 쓰기 기능
	public int insert_HertiageReview(Connection conn, HertiageReview review) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO HertiageReview VALUES(SEQ_revNo.NEXTVAL, ? , DEFAULT,?, ?, DEFAULT, DEFAULT)";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, review.getRevContents());
			pstmt.setInt(2, review.getRev_uNo());
			pstmt.setInt(3, review.getrevHNo());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 리뷰 수정
	public int update_HertiageReview(Connection conn, HertiageReview hreview) {
		PreparedStatement pstmt = null;
		String query = "UPDATE HertiageReview SET revNo=?,revContents=?,uNo=?,MODIFY_DATE=SYSDATE WHERE NO=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, hreview.getRevNo());
			pstmt.setString(2, hreview.getRevContents());
			pstmt.setInt(3, hreview.getRev_uNo());
			pstmt.setInt(4, hreview.getrevHNo());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 리플 삭제 기능
	public int delete_HertiageReview(Connection conn, int revNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "DELETE HertiageReview WHERE revNo = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, revNo);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
