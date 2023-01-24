package semi.heritage.palace.service;

import static semi.heritage.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import semi.heritage.palace.dao.PalaceJongmyoDetailMovieDao;
import semi.heritage.palace.vo.PalaceJongmyoDetailMovie;


public class PalaceJongmyoDetailMovieService {
	private PalaceJongmyoDetailMovieDao pjsm_dao = new PalaceJongmyoDetailMovieDao();
	private Connection conn = null;
	
	public PalaceJongmyoDetailMovieService() {
		conn = getConnection();
	}
	
	public List<PalaceJongmyoDetailMovie> selectAll() {
		return pjsm_dao.selectAll(conn);
	}
	
	public int insert(PalaceJongmyoDetailMovie pjs) {
		Connection conn2 = getConnection();
		int result = pjsm_dao.insert(conn2, pjs);
		if(result > 0) {
			commit(conn2);
		}else {
			rollback(conn2);
		}
		close(conn2);
		return result;
	}
}
