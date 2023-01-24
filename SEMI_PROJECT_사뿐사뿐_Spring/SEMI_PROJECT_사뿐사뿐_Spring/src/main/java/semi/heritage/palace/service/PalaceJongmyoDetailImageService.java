package semi.heritage.palace.service;

import static semi.heritage.common.jdbc.JDBCTemplate.*;


import java.sql.Connection;
import java.util.List;

import semi.heritage.palace.dao.PalaceJongmyoDetailImageDao;
import semi.heritage.palace.vo.PalaceJongmyoDetailImage;



public class PalaceJongmyoDetailImageService {
	private PalaceJongmyoDetailImageDao pjsi_dao = new PalaceJongmyoDetailImageDao();
	private Connection conn = null;
	
	public PalaceJongmyoDetailImageService() {
		conn = getConnection();
	}
	
	public List<PalaceJongmyoDetailImage> selectAll() {
		return pjsi_dao.selectAll(conn);
	}
	
	public int insert(PalaceJongmyoDetailImage pjs) {
		Connection conn2 = getConnection();
		int result = pjsi_dao.insert(conn2, pjs);
		if(result > 0) {
			commit(conn2);
		}else {
			rollback(conn2);
		}
		close(conn2);
		return result;
	}
}
