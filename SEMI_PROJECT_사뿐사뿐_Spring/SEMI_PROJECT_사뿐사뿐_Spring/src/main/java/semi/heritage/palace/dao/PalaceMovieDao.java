package semi.heritage.palace.dao;

import static semi.heritage.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import semi.heritage.palace.vo.PalaceMovie;



public class PalaceMovieDao {

	// result
	public List<PalaceMovie> selectAll(Connection conn) {
		List<PalaceMovie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM Palace_Jongmyo_Movie_Sangse ORDER BY 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int count = 1;

				// 12개
				int serial_number = rs.getInt(count++);
				int gung_number = rs.getInt(count++);
				int detail_code = rs.getInt(count++);

				String movieIndex = rs.getString(count++);
				String movieContentsKor = rs.getString(count++);
				String movieContentsEng = rs.getString(count++);
				String movieContentsChi = rs.getString(count++);
				String movieContentsJpa = rs.getString(count++);
				String movieUrlKor = rs.getString(count++);
				String movieUrlEng = rs.getString(count++);
				String movieUrlChi = rs.getString(count++);
				String movieUrlJpa = rs.getString(count++);

				PalaceMovie info = new PalaceMovie(serial_number, gung_number,
						detail_code, movieIndex, movieContentsKor, movieContentsEng, movieContentsChi, movieContentsJpa,
						movieUrlKor, movieUrlEng, movieUrlChi, movieUrlJpa);
				list.add(info);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	public int insert(Connection conn, PalaceMovie pjs) {
		try {
			String sql = "INSERT INTO "
					+ " Palace_Jongmyo_Movie_Sangse( "
					+ "						serial_number, gung_number, detail_code, "
					+ "						movieIndex, "
					+ "						movieContentsKor, movieContentsEng, movieContentsChi, movieContentsJpa,"
					+ "						movieUrlKor, movieUrlEng, movieUrlChi, movieUrlJpa) "
					+ " VALUES(				?, ?, ?, "
					+ "						?, "
					+ "						?, ?, ?, ?, "
					+ "						?, ?, ?, ?) ";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			int cnt = 1;
			pstmt.setInt(cnt++, pjs.getSerial_number());
			pstmt.setInt(cnt++, pjs.getGung_number());
			pstmt.setInt(cnt++, pjs.getDetail_code());

			pstmt.setString(cnt++, pjs.getMovieIndex());
			pstmt.setString(cnt++, pjs.getMovieContentsKor());
			pstmt.setString(cnt++, pjs.getMovieContentsEng());
			pstmt.setString(cnt++, pjs.getMovieContentsChi());
			pstmt.setString(cnt++, pjs.getMovieContentsJpa());
			pstmt.setString(cnt++, pjs.getMovieUrlKor());
			pstmt.setString(cnt++, pjs.getMovieUrlEng());
			pstmt.setString(cnt++, pjs.getMovieUrlChi());
			pstmt.setString(cnt++, pjs.getMovieUrlJpa());

			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
