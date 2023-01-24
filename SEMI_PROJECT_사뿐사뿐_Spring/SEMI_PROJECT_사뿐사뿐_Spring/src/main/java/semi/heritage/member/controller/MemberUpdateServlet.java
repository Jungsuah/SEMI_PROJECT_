package semi.heritage.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import semi.heritage.common.util.MyFileRenamePolicy;
import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.member.service.MemberService;
import semi.heritage.member.vo.Member;

@WebServlet("/update.do")
public class MemberUpdateServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService service = new MemberService();

	@Override
	public String getServletName() {
		return "MemberUpdateServlet";
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String path = req.getSession().getServletContext().getRealPath("/resources/upload/photo") ;

			int maxSize = 104857600; // 100 MB
			String encoding = "UTF-8";
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encoding, new MyFileRenamePolicy());

			Member loginMember = getSessionMember(req);

			if (loginMember == null) {
				sendCommonPage("잘못된 접근입니다.", "/", req, resp);
				return;
			}

			Member newMember = new Member();
			newMember.setUno(loginMember.getUno());
			newMember.setIntroduce(mr.getParameter("introduce").trim());
			newMember.setUpn(mr.getParameter("phone"));
			newMember.setUemail(loginMember.getUemail());
			newMember.setUadr(mr.getParameter("address"));
			newMember.setOriginalPhoto(mr.getOriginalFileName("photo"));
			newMember.setRenamedPhoto(mr.getFilesystemName("photo"));
			newMember.setTwt(mr.getParameter("twt"));
			newMember.setInsta(mr.getParameter("insta"));
			newMember.setFacebook(mr.getParameter("facebook"));
			System.out.println("업데이트서블릿 : "+newMember);
			
			
			if (loginMember.getUemail().equals(newMember.getUemail()) == false) {
				sendCommonPage("잘못된 아이디 입니다.", "/index.do", req, resp);
				return;
			}

			int result = service.save(newMember);

			if (result > 0) { // 업데이트 성공
				newMember = service.findMemberById(newMember.getUemail());
				setSessionMember(req, newMember);
				sendCommonPage("회원정보 수정하였습니다.", "/myPageInfo.do", req, resp);
			} else {
				sendCommonPage("오류로 회원정보를 수정할수 없습니다.", "/myPageInfo.do", req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("인자가 잘못되었습니다.", "/index.do", req, resp);
		}

	}

}
