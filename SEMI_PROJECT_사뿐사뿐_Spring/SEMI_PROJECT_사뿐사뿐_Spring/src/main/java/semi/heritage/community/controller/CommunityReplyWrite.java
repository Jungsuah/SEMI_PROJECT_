package semi.heritage.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.community.service.CommunityBoardService;
import semi.heritage.community.vo.CommunityReply;
import semi.heritage.member.vo.Member;

@WebServlet("/community/reply")
public class CommunityReplyWrite extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	private CommunityBoardService service = new CommunityBoardService();

	@Override
	public String getServletName() {
		return "CommunityReplyWrite";
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Member loginMember = getSessionMember(req);
			
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			String writer = req.getParameter("replyWriter");
			String content = req.getParameter("content");
			String type = req.getParameter("type");
			
			if(writer.equals("비회원")) {
				sendCommonPage("로그인 후 이용해주세요.", "/community/view?type="+type+"&boardNo="+boardNo, req, resp);
			}
									
			CommunityReply reply = new CommunityReply();
			reply.setBoard_no(boardNo);
			reply.setuName(writer);
			reply.setuNo(loginMember.getUno());
			reply.setContent(content);
						
			int result = service.saveReply(reply, type, boardNo);
			
			if(result > 0) {
				sendCommonPage("리플 등록에 성공하였습니다.", "/community/view?type=" + type + "&boardNo="+ boardNo, req, resp);
			}else {
				sendCommonPage("리플 등록에 실패하였습니다. (402)", "/community/view?type=" + type + "&boardNo="+ boardNo, req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("리플을 정상적으로 등록할 수 없습니다.(403)", "/community/main", req, resp);
			
		}
		
		
	}
}
