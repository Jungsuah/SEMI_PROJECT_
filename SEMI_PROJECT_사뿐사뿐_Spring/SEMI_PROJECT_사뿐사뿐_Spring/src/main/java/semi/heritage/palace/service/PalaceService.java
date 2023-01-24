package semi.heritage.palace.service;

import static semi.heritage.common.jdbc.JDBCTemplate.*;


import java.sql.Connection;
import java.util.List;

import semi.heritage.palace.dao.PalaceDao;
import semi.heritage.palace.vo.Palace;

public class PalaceService {
	private PalaceDao sdao1 = new PalaceDao();
	private Connection conn = null;
	
	public PalaceService() {
		conn = getConnection();
	}
	
	public List<Palace> selectAll() {
		return sdao1.selectAll(conn);
	}
	
	public int insert(Palace pjs) {
		Connection conn2 = getConnection();
		int result = sdao1.insert(conn2, pjs);
		if(result > 0) {
			commit(conn2);
		}else {
			rollback(conn2);
		}
		close(conn2);
		return result;
	}
}
