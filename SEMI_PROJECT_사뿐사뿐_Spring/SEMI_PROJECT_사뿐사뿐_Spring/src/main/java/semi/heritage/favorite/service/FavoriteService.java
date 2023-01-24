package semi.heritage.favorite.service;

import static semi.heritage.common.jdbc.JDBCTemplate.close;
import static semi.heritage.common.jdbc.JDBCTemplate.commit;
import static semi.heritage.common.jdbc.JDBCTemplate.getConnection;
import static semi.heritage.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;


import semi.heritage.favorite.dao.FavoriteDao;
import semi.heritage.favorite.vo.FavoriteMyPage;
import semi.heritage.favorite.vo.Favorite;

public class FavoriteService {

	private FavoriteDao dao = new FavoriteDao();
	private Connection conn = null;
	
	public FavoriteService() {
		conn = getConnection();
	}
	
	// 문화재 찜 insert
	public int insert(int uNo, int no) {
		int result = dao.insert(conn, uNo, no);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	// 문화재 찜 delete
	public int delete(int uNo, int no) {
		int result = dao.delete(conn, uNo, no);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
	
	// 문화재 찜 Alldelete
		public int Alldelete(int uNo) {
			int result = dao.Alldelete(conn, uNo);
			if (result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			return result;
		}
	
	// 문화재 찜하기 DB 저장
	public int save(Favorite fv) {
		Connection conn = getConnection();
		int result = 0;
		
		if(fv.getNo() != 0) {
			result = dao.update(conn, fv);
		}else {
			result = dao.insert(conn, fv.getuNo() , fv.getNo());
		}
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 마이페이지 문화재 찜목록 출력
	public List<FavoriteMyPage> selectAll(int uNo) {
		return dao.selectAll(conn, uNo);
	}
	
	// 문화재 번호로 찜 개수 구하기
	public int CountFavoriteByNo(int no){
		return dao.CountFavoriteByNo(conn, no);
	}
	
	// 문화재 번호로 찜목록 출력
	public Favorite findFavoriteVObyNo(int no){
		return dao.findFavoriteVObyNo(conn, no);
	}

//	public static void main(String[] args) {
//		List<HeritageMainVO> list = new ArrayList<HeritageMainVO>();
//		int no = 0;
//		favoriteDao d = new favoriteDao();
//		Connection conn = getConnection();
//		for (int j = 0; j < list.size(); j++) {
//			no = d.CountFavoriteByNo(conn, list.get(j).getNo());
//		}
//	}
}
