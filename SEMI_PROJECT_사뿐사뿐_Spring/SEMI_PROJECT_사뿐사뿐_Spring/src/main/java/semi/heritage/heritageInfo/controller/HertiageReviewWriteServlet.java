package semi.heritage.heritageInfo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.heritageInfo.service.HeritageReviewService;
import semi.heritage.heritageInfo.vo.HertiageReview;
import semi.heritage.member.vo.Member;

@WebServlet("/hertiageReviewWrite.do")
public class HertiageReviewWriteServlet extends MyHttpServlet{
		private static final long serialVersionUID = 1L;
		private HeritageReviewService service = new HeritageReviewService();

		@Override
		public String getServletName() {
			return "HertiageReviewWriteServlet";
		}
	
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doPost(req, resp);
		}
	
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				Member loginMember = getSessionMember(req);
				
				
				String RevContents = req.getParameter("RevContents");       //리뷰 글내용
				int uNo = loginMember.getUno();
				int hNo = Integer.parseInt(req.getParameter("hNo")) ;
				
				HertiageReview hreview = new HertiageReview();
				hreview.setRevContents(RevContents);
				hreview.setRev_uNo(uNo);
				hreview.setrevHNo(hNo);
				
				int result = service.save(hreview);
				
				if(result > 0) {
					sendCommonPage("리플 등록에 성공하였습니다.", "/index.do", req, resp);
				}else {
					sendCommonPage("리플 등록에 실패하였습니다. (402)", "/index.do", req, resp);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}
	}



