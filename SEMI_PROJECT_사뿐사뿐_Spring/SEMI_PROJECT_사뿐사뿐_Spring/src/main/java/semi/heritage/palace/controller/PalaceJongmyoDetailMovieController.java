package semi.heritage.palace.controller;

import java.util.List;

import semi.heritage.palace.api.PalaceJongmyoDetailMovieAPI;
import semi.heritage.palace.service.PalaceJongmyoDetailMovieService;
import semi.heritage.palace.vo.PalaceJongmyoDetailMovie;


public class PalaceJongmyoDetailMovieController {
	private PalaceJongmyoDetailMovieService pjsm_service = new PalaceJongmyoDetailMovieService();
	
	public void initPalace_Jongmyo_Sangse_Movie() {
		
		while(true) {
			List<PalaceJongmyoDetailMovie> list = PalaceJongmyoDetailMovieAPI.callPalaceJongmyoSangseListByXML();
			
			if(list == null || list.isEmpty()) {
				continue;
			}
			for(PalaceJongmyoDetailMovie pjs : list) {
				pjsm_service.insert(pjs);
			}
		}
	}
	
	public List<PalaceJongmyoDetailMovie> selectAll(){
		return pjsm_service.selectAll();
	}

}
