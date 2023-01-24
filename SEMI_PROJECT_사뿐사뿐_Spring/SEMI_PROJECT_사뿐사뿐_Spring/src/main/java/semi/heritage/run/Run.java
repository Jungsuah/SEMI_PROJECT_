package semi.heritage.run;


import semi.heritage.event.controller.FestivalController;
import semi.heritage.heritageInfo.controller.HeritageController;
import semi.heritage.palace.controller.PalaceController;
import semi.heritage.palace.controller.PalaceImageController;
import semi.heritage.palace.controller.PalaceMovieController;

public class Run {

		public static void main(String[] args) {
			
			
//======================================= 궁궐 종묘 파싱 ====================================================
			
//			Palace_Jongmyo_Sangse_Controller pjsc = new Palace_Jongmyo_Sangse_Controller();
//			pjsc.initPalace_Jongmyo_Sangse();
//			
//			Palace_Jongmyo_Sangse_Image_Controller pjsIc = new Palace_Jongmyo_Sangse_Image_Controller();
//			pjsIc.initPalace_Jongmyo_Sangse_Image();
//			
//			Palace_Jongmyo_Sangse_Movie_Controller pjsMc = new Palace_Jongmyo_Sangse_Movie_Controller();
//			pjsMc.initPalace_Jongmyo_Sangse_Movie();
//=======================================================================================================	

			
//=========================================== 행사 파싱 ====================================================
			FestivalController fc = new FestivalController();
			fc.initFestival();
//=======================================================================================================
			
			
//=========================================== 문화재 파싱 ====================================================
			HeritageController hc = new HeritageController();
//			hc.initHeritage();
//			hc.initHeritageImage();
//			hc.initHeritageVideo();
			
//=======================================================================================================
	}
}
