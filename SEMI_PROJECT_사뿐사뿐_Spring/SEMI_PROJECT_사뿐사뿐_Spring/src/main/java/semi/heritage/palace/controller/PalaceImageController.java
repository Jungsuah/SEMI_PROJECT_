package semi.heritage.palace.controller;

import java.util.List;

import semi.heritage.palace.api.PalaceImageAPI;
import semi.heritage.palace.service.PalaceImageService;
import semi.heritage.palace.vo.PalaceImage;



public class PalaceImageController {
	private PalaceImageService pjsi_service = new PalaceImageService();
	
	public void initPalace_Jongmyo_Sangse_Image() {
		
		while(true) {
			List<PalaceImage> list = PalaceImageAPI.callPalaceJongmyoSangseListByXML();
			
			if(list == null || list.isEmpty()) {
				continue;
			}
			for(PalaceImage pjs : list) {
				pjsi_service.insert(pjs);
			}
		}
	}
	
	public List<PalaceImage> selectAll(){
		return pjsi_service.selectAll();
	}

}
