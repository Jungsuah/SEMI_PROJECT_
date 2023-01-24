package semi.heritage.palace.service;

import static semi.heritage.common.jdbc.JDBCTemplate.*;


import java.sql.Connection;
import java.util.List;

import semi.heritage.palace.dao.PalaceImageDao;
import semi.heritage.palace.vo.PalaceImage;


public class PalaceImageService {
	private PalaceImageDao pjsi_dao = new PalaceImageDao();
	private Connection conn = null;
	
	public PalaceImageService() {
		conn = getConnection();
	}
	
	public List<PalaceImage> selectAll() {
		return pjsi_dao.selectAll(conn);
	}
	
	public int insert(PalaceImage pjs) {
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
