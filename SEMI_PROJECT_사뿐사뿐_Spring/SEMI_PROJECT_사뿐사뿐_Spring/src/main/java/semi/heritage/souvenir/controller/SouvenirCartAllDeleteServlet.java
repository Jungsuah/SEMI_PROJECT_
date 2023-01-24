package semi.heritage.souvenir.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.member.vo.Member;
import semi.heritage.souvenir.service.SouvenirService;
import semi.heritage.souvenir.vo.SouvenirCart;

@WebServlet("/cartAllDelete.do")
public class SouvenirCartAllDeleteServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	
	private SouvenirService service = new SouvenirService();
	
	@Override
	public String getServletName() {
		return "CartDelete";
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Member loginMember = getSessionMember(req);
			int uNo = loginMember.getUno();
			System.out.println("찜삭제하려는 회원의 번호 : " + uNo);
			
			int result = service.AlldeleteCart(uNo);
			
			if(result > 0 ) {
				sendCommonPage("장바구니 전체삭제에 성공하였습니다.", "/myPageCart.do", req, resp);
				return;
			}
			if(result <= 0 ) {
				sendCommonPage("장바구니 전체삭제에 실패하였습니다. (301)", "/myPageCart.do", req, resp);
				return;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("장바구니 전체삭제에 실패하였습니다. (302)", "/myPageCart.do", req, resp);
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
