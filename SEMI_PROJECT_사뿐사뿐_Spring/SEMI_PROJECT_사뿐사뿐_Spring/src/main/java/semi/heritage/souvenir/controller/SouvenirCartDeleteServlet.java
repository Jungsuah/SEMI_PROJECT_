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

@WebServlet("/cartDelete.do")
public class SouvenirCartDeleteServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	
	private SouvenirService service = new SouvenirService();
	
	@Override
	public String getServletName() {
		return "CartDelete";
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int seqNo = Integer.parseInt(req.getParameter("seqNo"));
			SouvenirCart deleteCart = service.findCartByNo(seqNo);
			Member loginMember = getSessionMember(req);
			
			
			int result = service.deleteCart(seqNo);
			
			if(result <= 0 ) {
				sendCommonPage("장바구니 삭제에 실패하였습니다. (301)", "/myPageCart.do", req, resp);
				return;
			}
			
			req.setAttribute("deleteCart", deleteCart);
			
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("장바구니 삭제에 실패하였습니다. (302)", "/myPageCart.do", req, resp);
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
