package semi.heritage.favorite.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.favorite.service.FavoriteService;
import semi.heritage.favorite.vo.FavoriteMyPage;
import semi.heritage.heritageInfo.service.HeritageService;
import semi.heritage.member.vo.Member;

@WebServlet("/myPageLike.do") // 마이페이지 찜목록 전체 출력해주는 서블릿
public class FavoriteMyPageServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public String getServletName() {
		return "favoriteMyPage";
	}

	private FavoriteService service = new FavoriteService();
	

	@Override
	   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      List<FavoriteMyPage> fmlist = null;
	      try {
	         HttpSession session = req.getSession();
	         Member member = (Member)session.getAttribute("loginMember");

	         int uNo = member.getUno();

	         fmlist = service.selectAll(uNo);
	         System.out.println("찜한 목록 : " + fmlist);

	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      req.setAttribute("fmlist", fmlist);
	      req.getRequestDispatcher("/views/member/myPageLike.jsp").forward(req, resp);
	   }

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
