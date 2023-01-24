
package semi.heritage.heritageInfo.controller;

import java.util.List;

import semi.heritage.common.util.PageInfo;
import semi.heritage.heritageInfo.api.HeritageImageApi;
//import semi.heritage.heritageInfo.api.heritageImageApi;
import semi.heritage.heritageInfo.api.HeritageInfoDetail;
import semi.heritage.heritageInfo.api.HeritageVideoApi;
import semi.heritage.heritageInfo.service.HeritageService;
import semi.heritage.heritageInfo.vo.HeritageImage;
import semi.heritage.heritageInfo.vo.HeritageMain;
import semi.heritage.heritageInfo.vo.Heritage;
import semi.heritage.heritageInfo.vo.HeritageVideo;


public class HeritageController {

	private HeritageService hService = new HeritageService();

	int threadCount = 0;
	int threadMaxCount = 10;

	// 문화재 DB INSERT
	public void initHeritage() {
		while (true) {
			while (threadCount > threadMaxCount) {
				try {
					Thread.sleep(100);
				} catch (InterruptedException e1) {
				}
			}
			new Thread(new Runnable() {
				@Override
				public void run() {
					threadCount++;
					List<Heritage> list = HeritageInfoDetail.callCurrentHeritageListByXML();

					if (list == null || list.isEmpty()) {
						return;
					}

					for (Heritage heritagevo : list) {
						hService.insert(heritagevo);
					}
					threadCount--;
				}
			}).start();
			;
			try {
				Thread.sleep(100);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
		}
	}

	// 문화재이미지 DB INSERT
	public void initHeritageImage() {

		while (true) {
			List<HeritageImage> list = HeritageImageApi.callCurrentHeritageImageByXML();

			if (list == null || list.isEmpty()) {
				continue;
			}

			for (HeritageImage heritageimage : list) {
				hService.insertImage(heritageimage);
			}
		}
	}

	// 문화재동영상 DB INSERT
	public void initHeritageVideo() {

		while (true) {
			List<HeritageVideo> list = HeritageVideoApi.callCurrentHeritageVideoByXML();

			if (list == null || list.isEmpty()) {
				continue;
			}

			for (HeritageVideo heritagevideo : list) {
				hService.insertVideo(heritagevideo);
			}
		}
	}
	
	// 메인 검색
	public List<HeritageMain> selectByHeritageName(String ccbaMnm, PageInfo pageInfo){
		return hService.selectByHeritageName(ccbaMnm, pageInfo);
	}
	
	// 메인 인기문화명소
	public List<HeritageMain> mainByFavorite(){
		return hService.mainByFavorite();
	}
}
