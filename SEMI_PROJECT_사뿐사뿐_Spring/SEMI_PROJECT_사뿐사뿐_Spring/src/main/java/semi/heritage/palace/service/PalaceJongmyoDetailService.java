package semi.heritage.palace.service;

import static semi.heritage.common.jdbc.JDBCTemplate.*;


import java.sql.Connection;
import java.util.List;

import semi.heritage.palace.dao.PalaceJongmyoDetailDao;
import semi.heritage.palace.vo.PalaceJongmyoDetail;


public class PalaceJongmyoDetailService {
	private PalaceJongmyoDetailDao sdao1 = new PalaceJongmyoDetailDao();
	private Connection conn = null;
	
	public PalaceJongmyoDetailService() {
		conn = getConnection();
	}
	
	public List<PalaceJongmyoDetail> selectAll() {
		return sdao1.selectAll(conn);
	}
	
	public int insert(PalaceJongmyoDetail pjs) {
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
