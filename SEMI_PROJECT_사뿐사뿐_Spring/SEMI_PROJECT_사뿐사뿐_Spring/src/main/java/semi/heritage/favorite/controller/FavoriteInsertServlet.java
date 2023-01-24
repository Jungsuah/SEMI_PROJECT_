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

@WebServlet("/favoriteInsert.do")
public class FavoriteInsertServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public String getServletName() {
		return "favoriteInsert";
	}

	private FavoriteService fservice = new FavoriteService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int	no = Integer.parseInt(req.getParameter("hertiageNo"));
		System.out.println("문화재 번호  : " + no);
		
			HttpSession session = req.getSession();
			Member member = (Member) session.getAttribute("loginMember");

			
			if (member == null) {
				sendCommonPage("로그인후 이용해주세요.", "/views/member/signIn.jsp", req, resp);
				return;
			}
			
			int uNo = member.getUno();
			
			int result = fservice.insert(uNo, no);
			System.out.println("찜 추가 결과  : " + result);

		
			if (result > 0) {
				sendCommonPage("찜 등록되었습니다.", "/myPageLike.do", req, resp);
			} else {
				sendCommonPage("찜 실패하였습니다. (301)", "/heritageDetail.do?hertiageNo=" + no, req, resp); // 문화재 상세 페이지로 보내주기
			}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	
}
