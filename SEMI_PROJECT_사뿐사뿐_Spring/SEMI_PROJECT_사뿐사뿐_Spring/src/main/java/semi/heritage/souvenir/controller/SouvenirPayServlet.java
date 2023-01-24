package semi.heritage.souvenir.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.member.vo.Member;
import semi.heritage.souvenir.service.SouvenirService;
import semi.heritage.souvenir.vo.SouvenirPay;

@WebServlet("/souvenirPay.do")
public class SouvenirPayServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	
	private SouvenirService service = new SouvenirService();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<SouvenirPay> payList = null;
		int uNo = 0;
		
			Member loginMember = (Member)getSessionMember(req);
			
			if(loginMember == null) {
				sendCommonPage("로그인후 이용해주세요.", "/views/member/signIn.jsp", req, resp);
				return;
			}
			
			uNo = loginMember.getUno();
		
		payList = service.getPayList(uNo);
		
		req.setAttribute("payList", payList);
		req.getRequestDispatcher("/views/souvenir/souvenirCheckout.jsp").forward(req, resp);
		
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	public String getServletName() {
		return "SouvenirPayServlet";
	}

}
