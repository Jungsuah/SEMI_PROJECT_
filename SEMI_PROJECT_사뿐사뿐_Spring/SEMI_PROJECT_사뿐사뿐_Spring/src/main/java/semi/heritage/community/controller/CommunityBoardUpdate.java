package semi.heritage.community.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import semi.heritage.common.util.MyFileRenamePolicy;
import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.community.service.CommunityBoardService;
import semi.heritage.community.vo.CommunityBoard;
import semi.heritage.member.vo.Member;

@WebServlet("/community/update")
public class CommunityBoardUpdate extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	private CommunityBoardService service = new CommunityBoardService();

	@Override
	public String getServletName() {
		return "CommunityBoardUpdate";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		String type = req.getParameter("type");
		
		CommunityBoard board = service.findBoardByNo(boardNo, false, type);
		req.setAttribute("board", board);
		req.setAttribute("type", type);
		req.getRequestDispatcher("/views/community/communityUpdate.jsp").forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String path = getServletContext().getRealPath("/resources/community/boardUpload");
			int maxSize = 104857600;
			String encoding = "UTF-8";
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encoding, new MyFileRenamePolicy());
			
			Member loginMember = getSessionMember(req);
			
			
			int boardNo = Integer.parseInt(mr.getParameter("boardNo"));
			String type = mr.getParameter("ap-category");
			CommunityBoard board = new CommunityBoard();
			
			System.out.println("update 작성자 번호 : " + board.getuNo());
			System.out.println("로그인 회원번호 : " + loginMember.getUno());
			
			
			board.setNo(boardNo);
			board.setuNo(loginMember.getUno());
			board.setTitle(mr.getParameter("ap-title"));
			board.setContent(mr.getParameter("ap-description").trim());
			board.setType(type);
			
			System.out.println("update : " + board.toString());

			// 기존 파일이름
			String original_file = mr.getParameter("original_file");
			String rename_file = mr.getParameter("rename_file");

			System.out.println("update test1 : " + original_file);
			System.out.println("update test2 : " + rename_file);
			// 재업로드
			String originalReloadFile = mr.getParameter("uploadfile");
			String renameReloadFile = mr.getParameter("uploadfile");
			
			System.out.println("update test3 : " + originalReloadFile);
			System.out.println("update test4 : " + renameReloadFile);
			
			if(originalReloadFile != null && originalReloadFile.length() > 0) {
				// 파일 수정이 있을 때
				try {
					File deleteFile = new File(path, rename_file);
					deleteFile.delete();
				} catch (Exception e) {
				}
				board.setOriginal_file(originalReloadFile);
				board.setRenamed_file(renameReloadFile);
			} else {
				// 기존꺼 쓸 때
				if(original_file == null) {
					board.setOriginal_file("");
					board.setRenamed_file("");
					
				} else {
					board.setOriginal_file(original_file);
					board.setRenamed_file(rename_file);
				}
			}
			
			int result = service.save(board, type); // DB에 update
			
			if(result > 0) {
				sendCommonPage("게시글이 정상적으로 업데이트되었습니다.", "/community/list?type=" + type, req, resp);
			} else {
				sendCommonPage("게시글을 업데이트할 수 없습니다.(202)", "/community/list?type=" + type, req, resp);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
