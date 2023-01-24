package semi.heritage.heritageInfo.service;

import static semi.heritage.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import semi.heritage.heritageInfo.dao.HertiageReviewDAO;
import semi.heritage.heritageInfo.vo.HertiageReview;

public class HeritageReviewService {
	private HertiageReviewDAO dao = new HertiageReviewDAO();

	public int getHertiageReview_Count(int heritageNo) {
		Connection conn = getConnection();
		int result = dao.getHertiageReview_Count(conn, heritageNo);
		close(conn);
		return result;
	}

	public List<HertiageReview> getHertiageReview_ByNo(int heritageNo) {
		Connection conn = getConnection();
		List<HertiageReview> list = dao.getHertiageReview_ByNo(conn, heritageNo);
		close(conn);
		return list;
	}
	
	public List<HertiageReview> getHertiageReviewByUno(int uNo) {
		Connection conn = getConnection();
		List<HertiageReview> list = dao.getHertiageReviewByUno(conn, uNo);
		close(conn);
		return list;
	}

	public int save(HertiageReview hreview) {
		Connection conn = getConnection();
		int result = 0;

		if (hreview.getRevNo() != 0) {//-> 쓰여진 리뷰가 있을 경우
			result = dao.update_HertiageReview(conn, hreview);
		} else {//-> 쓰여진 리뷰가 없을 경우
			result = dao.insert_HertiageReview(conn, hreview);
		}
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int delete(int revNo) {
		Connection conn = getConnection();
		int result = dao.delete_HertiageReview(conn, revNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}
}
