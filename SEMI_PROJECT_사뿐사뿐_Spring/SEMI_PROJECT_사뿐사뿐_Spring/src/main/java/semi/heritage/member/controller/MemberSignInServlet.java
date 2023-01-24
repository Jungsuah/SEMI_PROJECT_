package semi.heritage.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.heritage.member.service.MemberService;
import semi.heritage.member.vo.Member;

@WebServlet(name="login", urlPatterns = "/login")
public class MemberSignInServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	private MemberService service = new MemberService();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		String userPwd = req.getParameter("userPwd");
		System.out.println(userId + ", " + userPwd);
		
		Member loginMember = service.login(userId, userPwd);
		
		if(loginMember != null) { 
			HttpSession session = req.getSession();
			session.setAttribute("loginMember", loginMember);
			resp.sendRedirect(req.getContextPath() + "/index.do");
		}else{ 
			
			req.setAttribute("msg", "사용자 아이디나 비밀번호가 맞지 않습니다!!");
			req.setAttribute("location", "/views/member/signIn.jsp");
			
			req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/");
	}
}
