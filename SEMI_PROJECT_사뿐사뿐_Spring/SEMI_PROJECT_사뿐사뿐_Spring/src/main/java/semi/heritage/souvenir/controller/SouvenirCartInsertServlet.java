
package semi.heritage.souvenir.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.member.vo.Member;
import semi.heritage.souvenir.service.SouvenirService;
import semi.heritage.souvenir.vo.SouvenirCart;
import semi.heritage.souvenir.vo.SouvenirProduct;

@WebServlet("/souvenirInsert.do")
public class SouvenirCartInsertServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	
	private SouvenirService service = new SouvenirService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SouvenirProduct SVO = new SouvenirProduct();
			
			HttpSession session = req.getSession(); //HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 세션을 생성합니다
			System.out.println(session.getAttribute("loginMember"));
			Member loginMember = (Member) session.getAttribute("loginMember");
			
			if(loginMember == null) {
				sendCommonPage("로그인후 이용해주세요.", "/views/member/signIn.jsp", req, resp);
				return;
			}
				int productNo = Integer.parseInt(req.getParameter("productNo"));
				SVO = service.findProductByNo(productNo);
				int userno = loginMember.getUno();
				int result = service.insertCart(SVO, userno);
				
				if(result > 0) {
					sendCommonPage("장바구니 등록되었습니다.", "/myPageCart.do", req, resp);
					
				}else {
					sendCommonPage("장바구니 담기 실패하였습니다. (code=101)", "/myPageCart.do", req, resp);
				}
	}
	
	@Override
	public String getServletName() {
		return "SouvenirCartInsertServlet";
	}
	
}

