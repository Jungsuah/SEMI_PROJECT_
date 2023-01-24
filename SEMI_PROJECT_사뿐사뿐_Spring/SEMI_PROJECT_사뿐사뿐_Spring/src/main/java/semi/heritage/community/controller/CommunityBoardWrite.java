package semi.heritage.community.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.heritage.common.util.MyFileRenamePolicy;
import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.community.service.CommunityBoardService;
import semi.heritage.community.vo.CommunityBoard;
import semi.heritage.member.vo.Member;

@WebServlet("/community/write")
public class CommunityBoardWrite extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	private CommunityBoardService service = new CommunityBoardService();
	
	
	@Override
	public String getServletName() {
		return "CommunityBoardWrite";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Member loginMember = getSessionMember(req);
			
			if(loginMember != null) {
				// 정상흐름
				req.getRequestDispatcher("/views/community/communityWrite.jsp").forward(req, resp);
				return;
			} 
		} catch (Exception e) {}
		sendCommonPage("로그인 이후 사용할 수 있습니다.", "/views/community/communityMain.jsp", req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			System.out.println("write post!");
			
			// 1. 저장 경로 지정
			String path = getServletContext().getRealPath("/resources/community/boardUpload");
			// 2. 파일사이즈 지정
			int maxSize = 104857600;
			// 3. 문자열 인코딩 설정
			String encoding = "UTF-8";
			// 4. 멀티파라메터 처리 객체 생성 - cos.jar 활용
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encoding, new MyFileRenamePolicy());
			// 멀티 파라메터 선언 끝
			
			Member loginMember = getSessionMember(req);

			String type = mr.getParameter("ap-category");
			
			CommunityBoard board = new CommunityBoard();
			board.setuNo(loginMember.getUno());
			board.setTitle(mr.getParameter("ap-title").strip());
			board.setContent(mr.getParameter("ap-description").trim());
			board.setType(type);
			board.setOriginal_file(mr.getOriginalFileName("uploadfile"));
			board.setRenamed_file(mr.getFilesystemName("uploadfile"));
			
			int result = service.save(board, type);
			
			if(result > 0) {
				sendCommonPage("게시글이 정상적으로 등록되었습니다.", "/community/list?type=" + type, req, resp);
				return;
			} else {
				sendCommonPage("게시글 등록에 실패하였습니다.(code=102)", "/community/list?type=" + type, req, resp);			
			}
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("정상적으로 처리할 수 없습니다.(code=103)", "/community/main", req, resp);
		}
		
		
	}
	
}
