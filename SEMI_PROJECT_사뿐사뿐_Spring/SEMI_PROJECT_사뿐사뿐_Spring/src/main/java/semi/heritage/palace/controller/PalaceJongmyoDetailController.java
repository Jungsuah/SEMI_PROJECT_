package semi.heritage.palace.controller;

import java.util.List;

import semi.heritage.palace.api.PalaceJongmyoDetailAPI;
import semi.heritage.palace.service.PalaceJongmyoDetailService;
import semi.heritage.palace.vo.PalaceJongmyoDetail;

public class PalaceJongmyoDetailController {
	private PalaceJongmyoDetailService pjss = new PalaceJongmyoDetailService();
	
	public void initPalace_Jongmyo_Sangse() {
		
		while(true) {
			List<PalaceJongmyoDetail> list = PalaceJongmyoDetailAPI.callPalaceJongmyoSangseListByXML();
			
			if(list == null || list.isEmpty()) {
				continue;
			}
			for(PalaceJongmyoDetail pjs : list) {
				pjss.insert(pjs);
			}
		}
	}
	
	public List<PalaceJongmyoDetail> selectAll(){
		return pjss.selectAll();
	}

}
