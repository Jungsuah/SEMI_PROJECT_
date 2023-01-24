package semi.heritage.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.heritage.member.service.MemberService;
import semi.heritage.member.vo.Member;

@WebServlet("/myPageInfo.do")
public class MemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService service = new MemberService();

	@Override
	public String getServletName() {
		return "MemberUpdateServlet";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			Member member = (Member) session.getAttribute("loginMember");
			String userId = member.getUemail();

			Member memberInfo = service.findMemberById(userId);
			System.out.println("마이페이지로 넘어가려는 회원님은 " + memberInfo);
			if (memberInfo != null) {
				req.setAttribute("member", memberInfo);
				req.getRequestDispatcher("/views/member/myPageInfo.jsp").forward(req, resp);
				return;
			}
		} catch (Exception e) {
		}
	}
}
