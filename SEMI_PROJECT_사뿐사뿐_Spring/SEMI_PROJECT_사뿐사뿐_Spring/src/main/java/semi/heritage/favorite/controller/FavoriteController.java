package semi.heritage.favorite.controller;

import java.util.List;

import semi.heritage.favorite.service.FavoriteService;
import semi.heritage.favorite.vo.FavoriteMyPage;
import semi.heritage.favorite.vo.FavoritePalace;
import semi.heritage.favorite.vo.Favorite;

public class FavoriteController {
	
	FavoriteService fs = new FavoriteService();
	
	public int insert(int uNo, int no) {
		return fs.insert(uNo, no);
	}

	public int delete(int uNo, int no) {
		return fs.delete(uNo, no);
	}
	
	public List<FavoriteMyPage> selectAll(int uNo) {
		return fs.selectAll(uNo);
	}
	
	public int CountFavoriteByNo(int no){
		return fs.CountFavoriteByNo(no);
	}
	

}
