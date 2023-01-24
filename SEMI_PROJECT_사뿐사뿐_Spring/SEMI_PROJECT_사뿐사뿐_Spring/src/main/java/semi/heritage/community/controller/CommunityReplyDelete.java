package semi.heritage.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.community.service.CommunityBoardService;

@WebServlet("/community/replydel")
public class CommunityReplyDelete extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	private CommunityBoardService service = new CommunityBoardService();

	@Override
	public String getServletName() {
		return "CommunityReplyDelete";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int replyNo = Integer.parseInt(req.getParameter("replyNo"));
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			String type = req.getParameter("type");
			
			System.out.println("리플삭제 type: "+ type);
			System.out.println("리플삭제 boardNo: "+ boardNo);
			System.out.println("리플삭제 replyNo: "+ replyNo);
			
			int result = service.deleteReply(replyNo, type);
			
			if(result > 0) {
				sendCommonPage("리플 삭제에 성공하였습니다.", "/community/view?type="+type+"&boardNo="+boardNo, req, resp);
			} else {
				sendCommonPage("리플 삭제에 실패하였습니다.()", "/community/view?type="+type+"&boardNo="+boardNo, req, resp);	
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("리플을 삭제할 수 없습니다.(505)", "/community/main", req, resp);
		}
		
		
	}
	
}
