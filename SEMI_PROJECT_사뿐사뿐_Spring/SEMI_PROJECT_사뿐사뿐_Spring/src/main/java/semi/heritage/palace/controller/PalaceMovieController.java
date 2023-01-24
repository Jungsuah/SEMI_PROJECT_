package semi.heritage.palace.controller;

import java.util.List;

import semi.heritage.palace.api.PalaceMovieAPI;
import semi.heritage.palace.service.PalaceMovieService;
import semi.heritage.palace.vo.PalaceMovie;



public class PalaceMovieController {
	private PalaceMovieService pjsm_service = new PalaceMovieService();
	
	public void initPalace_Jongmyo_Sangse_Movie() {
		
		while(true) {
			List<PalaceMovie> list = PalaceMovieAPI.callPalaceJongmyoSangseListByXML();
			
			if(list == null || list.isEmpty()) {
				continue;
			}
			for(PalaceMovie pjs : list) {
				pjsm_service.insert(pjs);
			}
		}
	}
	
	public List<PalaceMovie> selectAll(){
		return pjsm_service.selectAll();
	}

}
