package semi.heritage.palace.controller;

import java.util.List;

import semi.heritage.palace.api.PalaceJongmyoDetailImageAPI;
import semi.heritage.palace.service.PalaceJongmyoDetailImageService;
import semi.heritage.palace.vo.PalaceJongmyoDetailImage;


public class PalaceJongmyoDetailImageController {
	private PalaceJongmyoDetailImageService pjsi_service = new PalaceJongmyoDetailImageService();
	
	public void initPalace_Jongmyo_Sangse_Image() {
		
		while(true) {
			List<PalaceJongmyoDetailImage> list = PalaceJongmyoDetailImageAPI.callPalaceJongmyoSangseListByXML();
			
			if(list == null || list.isEmpty()) {
				continue;
			}
			for(PalaceJongmyoDetailImage pjs : list) {
				pjsi_service.insert(pjs);
			}
		}
	}
	
	public List<PalaceJongmyoDetailImage> selectAll(){
		return pjsi_service.selectAll();
	}

}
