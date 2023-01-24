package semi.heritage.event.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.batch.Main;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.common.util.PageInfo;
import semi.heritage.event.service.FestivalService;
import semi.heritage.event.vo.Festival;

@WebServlet("/event/main.do")
public class FestivalServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	private FestivalService service = new FestivalService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		String eventMonth = req.getParameter("eventMonth");
		if(eventMonth == null || eventMonth.length() < 1) {
			eventMonth = "202205";
		}
		
		try {
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {	}
		
		int maxCount = service.getBoardCount(eventMonth);
		System.out.println(maxCount);
		
		PageInfo pageInfo = new PageInfo(page, 10, maxCount, 10);
		List<Festival> list = service.findAll(pageInfo, eventMonth);
		System.out.println(list);
		
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		req.getRequestDispatcher("/views/event/eventSchedule.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	@Override
	public String getServletName() {
		return "FestivalServlet";
	}

}

