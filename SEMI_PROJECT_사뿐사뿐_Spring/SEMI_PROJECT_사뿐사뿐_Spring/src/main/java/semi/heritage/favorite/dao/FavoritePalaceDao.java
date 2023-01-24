package semi.heritage.favorite.dao;

import static semi.heritage.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import semi.heritage.favorite.vo.FavoritePalace;

public class FavoritePalaceDao {
	public List<FavoritePalace> sortedByFavoritePalace(Connection conn) {
		List<FavoritePalace> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT ROWNUM, FPV.*"
					   + " FROM(SELECT seq_pj_ss from favoritePalace group by seq_pj_ss order by COUNT(uno) desc) FPV"
					   + " WHERE ROWNUM BETWEEN 1 AND 10";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int count = 1;
				int rowNum = rs.getInt(count++);
				int seq_pj_ss = rs.getInt(count++);

				FavoritePalace favRank = new FavoritePalace(rowNum, seq_pj_ss);
				list.add(favRank);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return null;
	}
}
