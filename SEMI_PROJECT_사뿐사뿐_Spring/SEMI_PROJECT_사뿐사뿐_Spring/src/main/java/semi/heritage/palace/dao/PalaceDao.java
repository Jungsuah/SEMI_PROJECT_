package semi.heritage.palace.dao;

import static semi.heritage.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import semi.heritage.palace.vo.Palace;


public class PalaceDao {

	// result
	public List<Palace> selectAll(Connection conn) {
		List<Palace> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM Palace_Jongmyo_Sangse ORDER BY 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int count = 1;

				// 13개
				int seq_pj_ss = rs.getInt(count++);
				int serial_number = rs.getInt(count++);
				int gung_number = rs.getInt(count++);
				int detail_code = rs.getInt(count++);
				String contents_kor = rs.getString(count++);
				String contents_eng = rs.getString(count++);
				String contents_jpa = rs.getString(count++);
				String contents_chi = rs.getString(count++);
				String explanation_kor = rs.getString(count++);
				String explanation_eng = rs.getString(count++);
				String explanation_jpa = rs.getString(count++);
				String explanation_chi = rs.getString(count++);

				String imgUrl = rs.getString(count++);

				Palace info = new Palace(seq_pj_ss, serial_number, gung_number,
						detail_code, contents_kor, contents_eng, contents_jpa, contents_chi, explanation_kor,
						explanation_eng, explanation_jpa, explanation_chi, imgUrl);
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

	public int insert(Connection conn, Palace pjs) {
		try {
			String sql = "INSERT INTO " + " Palace_Jongmyo_Sangse( "
					+ "						seq_pj_ss, serial_number, gung_number, detail_code, "
					+ "						contents_kor, contents_eng, contents_jpa, contents_chi, "
					+ "						explanation_kor, explanation_eng, explanation_jpa, explanation_chi, "
					+ "						imgUrl) "
					+ " VALUES(seq_pj_ss.NEXTVAL, ?, ?, ?, "
					+ "							?, ?, ?, ?, "
					+ "							?, ?, ?, ?, "
					+ "							?) ";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			int cnt = 1;
			pstmt.setInt(cnt++, pjs.getSerial_number());
			pstmt.setInt(cnt++, pjs.getGung_number());
			pstmt.setInt(cnt++, pjs.getDetail_code());
			pstmt.setString(cnt++, pjs.getContents_kor());
			pstmt.setString(cnt++, pjs.getContents_eng());
			pstmt.setString(cnt++, pjs.getContents_jpa());
			pstmt.setString(cnt++, pjs.getContents_chi());
			pstmt.setString(cnt++, pjs.getExplanation_kor());
			pstmt.setString(cnt++, pjs.getExplanation_eng());
			pstmt.setString(cnt++, pjs.getExplanation_jpa());
			pstmt.setString(cnt++, pjs.getExplanation_chi());

			pstmt.setString(cnt++, pjs.getImgUrl());

			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
