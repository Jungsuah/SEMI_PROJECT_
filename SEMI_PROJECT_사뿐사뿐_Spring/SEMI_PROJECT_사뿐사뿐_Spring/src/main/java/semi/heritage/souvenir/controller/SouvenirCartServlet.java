
package semi.heritage.souvenir.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.member.vo.Member;
import semi.heritage.souvenir.service.SouvenirService;
import semi.heritage.souvenir.vo.SouvenirCart;

@WebServlet("/myPageCart.do")
public class SouvenirCartServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	private SouvenirService service = new SouvenirService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int uNo = 0;
		List<SouvenirCart> cartList = null;

		try {
			Member loginMember = (Member) getSessionMember(req);
			uNo = loginMember.getUno();
		} catch (Exception e) {
			e.printStackTrace();
		}

		cartList = service.getCartList(uNo);

		req.setAttribute("cartList", cartList);
		req.getRequestDispatcher("/views/member/myPageCart.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	@Override
	public String getServletName() {
		// TODO Auto-generated method stub
		return "SouvenirCartServlet";
	}
}
