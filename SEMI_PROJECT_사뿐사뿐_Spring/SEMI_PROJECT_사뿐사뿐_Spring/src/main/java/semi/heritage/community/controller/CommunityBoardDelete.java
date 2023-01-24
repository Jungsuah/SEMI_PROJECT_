package semi.heritage.community.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.community.service.CommunityBoardService;
import semi.heritage.community.vo.CommunityBoard;
import semi.heritage.member.vo.Member;

@WebServlet("/community/deleteboard")
public class CommunityBoardDelete extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	private CommunityBoardService service = new CommunityBoardService();
	
	@Override
	public String getServletName() {
		return "CommunityBoardDelete";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			String type = req.getParameter("type");
			CommunityBoard board = service.findBoardByNo(boardNo, false, type);
			
			int result = service.delete(boardNo, type);
			
			if(result <= 0) {
				sendCommonPage("게시글 삭제에 실패하였습니다.(301)", "/community/list?type=" + type, req, resp);
			}
			
			// 파일삭제
			deleteFile(board.getRenamed_file());
			sendCommonPage("게시글 삭제에 성공하였습니다.", "/community/list?type=" + type, req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("게시물 삭제에 실패하였습니다.(302)", "/community/main", req, resp);
		}

	}
	
	
}
