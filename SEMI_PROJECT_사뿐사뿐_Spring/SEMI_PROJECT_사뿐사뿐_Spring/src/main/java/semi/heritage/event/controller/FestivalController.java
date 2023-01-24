package semi.heritage.event.controller;


import java.util.List;

import semi.heritage.event.api.FestivalOpenApiManager;
import semi.heritage.event.service.FestivalService;
import semi.heritage.event.vo.Festival;

public class FestivalController {
	
	FestivalService festivalService = new FestivalService();
	
	public void initFestival() {

		while (true) {
			List<Festival> list = FestivalOpenApiManager.callFestivalListByXML();

			if (list == null || list.isEmpty()) {
				continue;
			}

			for (Festival fv : list) {
				festivalService.insert(fv);
			}
		}
	}

	
	public static void main(String[] args) {
		FestivalController fc = new FestivalController();
		fc.initFestival();
	}

}
