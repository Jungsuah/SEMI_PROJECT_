package semi.heritage.favorite.service;

import static semi.heritage.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import semi.heritage.favorite.dao.FavoritePalaceDao;
import semi.heritage.favorite.vo.FavoritePalace;

public class FavoritePalaceService {
	
	private FavoritePalaceDao dao = new FavoritePalaceDao();
	private Connection conn = null;
	
	public FavoritePalaceService() {
		conn = getConnection();
	}
	
	// 찜이 많이 된 궁/종묘순 정렬
	public List<FavoritePalace> sortedByFavoritePalace() {
		return dao.sortedByFavoritePalace(conn);
	}
}
