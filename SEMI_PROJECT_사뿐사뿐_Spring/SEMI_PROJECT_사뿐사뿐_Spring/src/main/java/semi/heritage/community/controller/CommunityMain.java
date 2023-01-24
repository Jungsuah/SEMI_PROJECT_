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

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.common.util.PageInfo;
import semi.heritage.community.service.CommunityBoardService;
import semi.heritage.community.vo.CommunityBoard;

@WebServlet("/community/main")
public class CommunityMain extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	private CommunityBoardService service = new CommunityBoardService();
	
	@Override
	public String getServletName() {
		return "CommunityMain";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		int boardCount = 0;
		PageInfo pageInfo = null;
		List<CommunityBoard> list = null;
		String[] type = {"T", "H", "F"};
		int[] postNum = {10, 5, 5};
		Map<String, String> searchMap = new HashMap<>();
		
		try {
			String searchValue = req.getParameter("searchValue");
			if(searchValue != null && searchValue.length() > 0) {
				String searchType = req.getParameter("searchType");
				searchMap.put(searchType, searchValue);
			}
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {
			
		}
		
		int count = 1;
		for(int i = 0; i < type.length; i++) {
			boardCount = service.getBoardCount(searchMap, type[i]);
			pageInfo = new PageInfo(page, 10, boardCount, postNum[i]);
			list = service.getBoardList(pageInfo, searchMap, type[i]);
			
			req.setAttribute("list" + count++, list);
			req.setAttribute("pageInfo", pageInfo);
		}
				
		req.getRequestDispatcher("/views/community/communityMain.jsp").forward(req, resp);
			
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
