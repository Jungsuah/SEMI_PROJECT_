package semi.heritage.heritageInfo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.community.service.CommunityBoardService;
import semi.heritage.community.vo.CommunityBoard;
import semi.heritage.heritageInfo.service.HeritageService;
import semi.heritage.heritageInfo.vo.HeritageMain;

@WebServlet("/index.do")
public class HeritageMainFavoriteServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	private HeritageService service = new HeritageService();
	private CommunityBoardService bservice = new CommunityBoardService();

	@Override
	public String getServletName() {
		return "heritageMainFavoriteServlet";
	}

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doget 호출 ");
		List<HeritageMain> list = null;
		List<CommunityBoard> blist = null;

		list = service.mainByFavorite();
		blist = bservice.findToMain();
		if (list == null) {
			list = new ArrayList<HeritageMain>();
		}
		if (blist == null) {
			blist = new ArrayList<CommunityBoard>();
		}

		req.setAttribute("list", list);
		req.setAttribute("blist", blist);
		req.getRequestDispatcher("/views/main/index.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
