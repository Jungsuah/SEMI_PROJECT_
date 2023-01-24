package semi.heritage.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.member.service.MemberService;
import semi.heritage.member.vo.Member;

@WebServlet("/member/delete")
public class MemberDeleteServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService service = new MemberService();
	
	@Override
	public String getServletName() {
		return "MemberDeleteServlet";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Member loginMember = getSessionMember(req);
			
			if(loginMember == null) {
				sendCommonPage("잘못된 접근입니다.", "/index.do", req, resp);
				return;
			}
			
			int result = service.delete(loginMember.getUno());
			
			if(result > 0) {
				sendCommonPage("회원 탈퇴에 성공하였습니다.", "/logout", req, resp);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		sendCommonPage("회원 탈퇴에 실패하였습니다. 문의 부탁 드립니다.", "/logout", req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
