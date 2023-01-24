package semi.heritage.palace.service;

import static semi.heritage.common.jdbc.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import semi.heritage.palace.dao.PalaceMovieDao;
import semi.heritage.palace.vo.PalaceMovie;



public class PalaceMovieService {
	private PalaceMovieDao pjsm_dao = new PalaceMovieDao();
	private Connection conn = null;
	
	public PalaceMovieService() {
		conn = getConnection();
	}
	
	public List<PalaceMovie> selectAll() {
		return pjsm_dao.selectAll(conn);
	}
	
	public int insert(PalaceMovie pjs) {
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
