package semi.heritage.heritageInfo.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.heritage.favorite.service.FavoriteService;
import semi.heritage.heritageInfo.service.HeritageReviewService;
import semi.heritage.heritageInfo.service.HeritageService;
import semi.heritage.heritageInfo.vo.HeritageImage;
import semi.heritage.heritageInfo.vo.Heritage;
import semi.heritage.heritageInfo.vo.HeritageVideo;
import semi.heritage.heritageInfo.vo.HertiageReview;

@WebServlet("/heritageDetail.do")
public class HeritageDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HeritageService service = new HeritageService();
	private HeritageReviewService rservice = new HeritageReviewService();
	private FavoriteService fservice = new FavoriteService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int hertiageNo = Integer.parseInt(req.getParameter("hertiageNo"));
		System.out.println("@@@@@@@@@@@@@@@@@@" + hertiageNo);
		System.out.println("!!!!");
//		int hertiageNo = 1;

		Heritage heritage = service.findHertiageByNo(hertiageNo);
		List<HeritageImage> heritageImage = service.findHeritageImageByNo(hertiageNo);
		String heritageVideo = service.findHeritageVideoByNo(hertiageNo);
		List<HertiageReview> list = rservice.getHertiageReview_ByNo(hertiageNo);
		int HertiageReview_Count = rservice.getHertiageReview_Count(hertiageNo);
		int CountFavoriteByNo = fservice.CountFavoriteByNo(hertiageNo);

		
		req.setAttribute("hertiage", heritage);
		req.setAttribute("heritageImage", heritageImage);
		req.setAttribute("heritageVideo", heritageVideo);
		req.setAttribute("list", list);
		req.setAttribute("hertiageNo", hertiageNo);
		req.setAttribute("HertiageReview_Count", HertiageReview_Count);
		req.setAttribute("CountFavoriteByNo", CountFavoriteByNo);
		req.getRequestDispatcher("/views/heritage/heritageDetail.jsp").forward(req, resp);

	}

}
