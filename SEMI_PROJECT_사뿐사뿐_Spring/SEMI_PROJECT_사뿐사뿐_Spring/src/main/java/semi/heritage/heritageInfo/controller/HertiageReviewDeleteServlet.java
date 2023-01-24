package semi.heritage.heritageInfo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.heritageInfo.service.HeritageReviewService;
import semi.heritage.heritageInfo.vo.HertiageReview;

@WebServlet("/HertiageReviewDelete.do")
public class HertiageReviewDeleteServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	private HeritageReviewService service = new HeritageReviewService();

	@Override
	public String getServletName() {
		return " HertiageReview_Delete";
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int revNo = Integer.parseInt(req.getParameter("revNo")); //리뷰 글번호 
			
			int result = service.delete(revNo);

			if (result > 0) {
				sendCommonPage("리플 삭제에 성공하였습니다. ", "/myPageReview.do", req, resp);
			} else {
				sendCommonPage("리플 삭제를 실패하였습니다. (301)", "/myPageReview.do", req, resp);
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
