package semi.heritage.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.member.service.MemberService;
import semi.heritage.member.vo.Member;


/**
 * 1. get 요청이 올 경우 -> 회원가입 페이지로 이동
 * 2. post 요청이 올 경우 -> 회원가입 기능 동작
 */
@WebServlet(name="enroll", urlPatterns = "/member/enroll")
public class MemberSignUpServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/views/member/signUp.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = new Member();
		try {
			member.setUemail(req.getParameter("userId").trim());  // strip/trim으로 white space 제거
			member.setUpw(req.getParameter("userPwd"));
			member.setUname(req.getParameter("userName").trim());
			
			System.out.println("회원가입 : " + member);
			
			int result = service.save(member);
			
			if(result > 0) {
				req.setAttribute("msg", "회원가입에 성공하였습니다!");
				req.setAttribute("location", "/index.do");
			}else {
				req.setAttribute("msg", "회원가입 실패!! (code:101=DB이슈)");
				req.setAttribute("location", "/");
			}
			req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "회원가입 실패!! (code:100=입력값 문제)");
			req.setAttribute("location", "/member/signUp");
			req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
		}
	}

	@Override
	public String getServletName() {
		return "enroll";
	}
	
}
