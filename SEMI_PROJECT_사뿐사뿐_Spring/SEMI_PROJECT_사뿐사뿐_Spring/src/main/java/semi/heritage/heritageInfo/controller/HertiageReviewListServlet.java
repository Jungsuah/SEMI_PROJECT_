package semi.heritage.heritageInfo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.heritageInfo.service.HeritageReviewService;
import semi.heritage.heritageInfo.vo.HertiageReview;
import semi.heritage.member.vo.Member;

@WebServlet("/myPageReview.do") // 마이페이지에서 리뷰리스트 보여주는 서블릿
public class HertiageReviewListServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public String getServletName() {
		return "HertiageReviewList";
	}

	private HeritageReviewService hrservice = new HeritageReviewService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int hreviewCount = 0;
		List<HertiageReview> hlist = null;

		try {
			HttpSession session = req.getSession();
			Member member = (Member) session.getAttribute("loginMember");

			int uNo = member.getUno(); // 로그인 되어있는 멤버객체에서 회원번호 uno를 가져옴

			hlist = hrservice.getHertiageReviewByUno(uNo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		req.setAttribute("hlist", hlist);
		req.setAttribute("hreviewCount", hreviewCount);
		req.getRequestDispatcher("/views/member/myPageReview.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
