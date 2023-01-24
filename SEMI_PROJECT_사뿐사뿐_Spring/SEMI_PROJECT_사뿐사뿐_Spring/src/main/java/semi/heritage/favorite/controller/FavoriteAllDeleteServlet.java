package semi.heritage.favorite.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.favorite.service.FavoriteService;
import semi.heritage.favorite.vo.Favorite;
import semi.heritage.member.vo.Member;

@WebServlet("/favoriteAllDelete.do")
public class FavoriteAllDeleteServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	private FavoriteService fservice = new FavoriteService();

	@Override
	public String getServletName() {
		return "favoriteAllDeleteServlet";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			HttpSession session = req.getSession();
			System.out.println(session.getAttribute("loginMember"));
			Member member = (Member) session.getAttribute("loginMember");


			int uNo = member.getUno();

			int result = fservice.Alldelete(uNo);

			if (result <= 0) {
				sendCommonPage("찜 전체삭제에 실패하였습니다. (301)", "/myPageLike.do", req, resp);
			} else {
				sendCommonPage("찜 전체삭제에 성공하였습니다.", "/myPageLike.do", req, resp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
