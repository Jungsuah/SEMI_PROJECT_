package semi.heritage.favorite.dao;

import static semi.heritage.common.jdbc.JDBCTemplate.close;
import static semi.heritage.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import semi.heritage.favorite.vo.FavoriteMyPage;
import semi.heritage.favorite.vo.Favorite;

public class FavoriteDao {

	public int insert(Connection conn, int uNo, int no) {

		// 일반 문화재 찜 추가
		try {
			String sql = "INSERT INTO hFavorite VALUES(SEQ_hfavNum.NEXTVAL, ?, ?)";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, uNo);
			pstmt.setInt(2, no);

			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;
		} catch (Exception e) {
		}
		return -1;
	}

	// 일반 문화재 찜 삭제
	public int delete(Connection conn, int uNo, int no) {
		try {
			String sql = "DELETE FROM hFavorite WHERE uNo = ? AND no = ? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, uNo);
			pstmt.setInt(2, no);

			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// 일반 문화재 찜 전체 삭제
		public int Alldelete(Connection conn, int uNo) {
			try {
				String sql = "DELETE FROM hFavorite WHERE uNo = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, uNo);

				int result = pstmt.executeUpdate();
				pstmt.close();
				return result;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;
		}

	// 마이페이지에서 찜목록 출력
	public List<FavoriteMyPage> selectAll(Connection conn, int uNo) {
		List<FavoriteMyPage> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = " SELECT h.no, HFV.hfavNum, H.CCMANAME, H.CCBAMNM1, H.CCBALCAD, H.IMAGEURL, H.CONTENT " + " FROM "
					+ " heritage H, hFavorite HFV " + " WHERE " + " H.no = HFV.no AND " + " HFV.uNO = ? "
					+ " order by HFV.hfavNum desc";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uNo);
			rs = pstmt.executeQuery();

			while (rs.next() == true) {
				int hfavNum = rs.getInt("hfavNum");
				int hNo = rs.getInt("NO");
				String ccmaName = rs.getString("ccmaName");
				String ccbaMnm1 = rs.getString("ccbaMnm1");
				String ccbaLcad = rs.getString("ccbaLcad");
				String imageUrl = rs.getString("imageUrl");
				String content = rs.getString("content");
				FavoriteMyPage mypage = new FavoriteMyPage(hfavNum,hNo, ccmaName, ccbaMnm1, ccbaLcad, imageUrl,
						content);
				list.add(mypage);
			}
			System.out.println(list.toString());
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return null;
	}

	// 문화재 번호로 해당 찜 개수 구하기
	public int CountFavoriteByNo(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(uno) from hfavorite group by no having no = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}

	// 문화재 번호로 찜 객체 가져오기 (insert할때, 찜목록 상세보기)
	public Favorite findFavoriteVObyNo(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Favorite f = null;
		String query = "select HFAVNUM, UNO, NO from hfavorite WHERE NO = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				f = new Favorite();
				f.setFavNum(rs.getInt("HFAVNUM"));
				f.setuNo(rs.getInt("UNO"));
				f.setNo(rs.getInt("NO"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return f;
	}

	// 찜리스트 수정
	public int update(Connection conn, Favorite fv) {
		PreparedStatement pstmt = null;
		String query = "UPDATE hFavorite SET HFAVNUM=?,UNO=? WHERE NO=? ";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, fv.getFavNum());
			pstmt.setInt(2, fv.getuNo());
			pstmt.setInt(3, fv.getNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public static void main(String[] args) {
		FavoriteDao fdao = new FavoriteDao();
		Connection conn = getConnection();
		fdao.selectAll(conn, 6);
	}
}
