package semi.heritage.community.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.heritage.common.util.PageInfo;
import semi.heritage.community.service.CommunityBoardService;
import semi.heritage.community.vo.CommunityBoard;

@WebServlet("/community/list")
public class CommunityBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommunityBoardService service = new CommunityBoardService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		int boardCount = 0;
		PageInfo pageInfo = null;
		List<CommunityBoard> list = null;
		String type = "";
		Map<String, String> searchMap = new HashMap<>();
		
		try {
			type = req.getParameter("type");
			System.out.println("type : " + type);
			String searchValue = req.getParameter("searchValue");
			System.out.println("searchValue : " + searchValue);
			if(searchValue != null && searchValue.length() > 0) {
				String searchType = req.getParameter("searchType");
				System.out.println("searchType : " + searchType);
				
				searchMap.put(searchType, searchValue);
			}
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {
			
		}
		
		boardCount = service.getBoardCount(searchMap, type);
		pageInfo = new PageInfo(page, 10, boardCount, 10);
		
		
		list = service.getBoardList(pageInfo, searchMap, type);
		
		
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		req.setAttribute("type", type);
		
		if(type.equals("T")) {
			req.getRequestDispatcher("/views/community/togetherBoard.jsp").forward(req, resp);
		}
		if(type.equals("F")) {
			req.getRequestDispatcher("/views/community/freeBoard.jsp").forward(req, resp);
		}
		if(type.equals("H")) {
			req.getRequestDispatcher("/views/community/studyBoard.jsp").forward(req, resp);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
