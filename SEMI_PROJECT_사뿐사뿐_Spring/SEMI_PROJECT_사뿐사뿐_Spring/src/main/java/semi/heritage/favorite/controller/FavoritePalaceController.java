package semi.heritage.favorite.controller;

import java.util.List;

import semi.heritage.favorite.service.FavoritePalaceService;
import semi.heritage.favorite.vo.FavoritePalace;

public class FavoritePalaceController {
	
	FavoritePalaceService fps = new FavoritePalaceService();

	public List<FavoritePalace> sortedByFavoritePalace(){
		return fps.sortedByFavoritePalace();
	}
	
	public static void main(String[] args) {
		FavoritePalaceController fps = new FavoritePalaceController();
		fps.sortedByFavoritePalace();
	}
}
