package semi.heritage.palace.controller;

import java.util.List;

import semi.heritage.palace.api.PalaceAPI;
import semi.heritage.palace.service.PalaceService;
import semi.heritage.palace.vo.Palace;


public class PalaceController {
	private PalaceService pjss = new PalaceService();
	
	public void initPalace_Jongmyo_Sangse() {
		
		while(true) {
			List<Palace> list = PalaceAPI.callPalaceJongmyoSangseListByXML();
			
			if(list == null || list.isEmpty()) {
				continue;
			}
			for(Palace pjs : list) {
				pjss.insert(pjs);
			}
		}
	}
	
	public List<Palace> selectAll(){
		return pjss.selectAll();
	}

}
