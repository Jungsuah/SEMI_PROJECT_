package semi.heritage.event.service;

import static semi.heritage.common.jdbc.JDBCTemplate.*;


import java.sql.Connection;
import java.util.List;

import semi.heritage.common.util.PageInfo;
import semi.heritage.event.dao.FestivalDao;
import semi.heritage.event.vo.Festival;



public class FestivalService {
	private FestivalDao dao = new FestivalDao();
	private Connection conn = null;
	
	public FestivalService() {
		conn = getConnection();
	}
	public List<Festival> findAll(PageInfo pageInfo, String eventMonth) {
		return dao.findAll(conn, pageInfo, eventMonth);
	}
	
	public int getBoardCount( String eventMonth) {
		return dao.getBoardCount(conn, eventMonth);
	}
	

	public int insert(Festival festival) {
		Connection conn = getConnection();
		int result = dao.insert(conn, festival);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		try {
			Thread.sleep(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		close(conn);
		return result;
	}
}
