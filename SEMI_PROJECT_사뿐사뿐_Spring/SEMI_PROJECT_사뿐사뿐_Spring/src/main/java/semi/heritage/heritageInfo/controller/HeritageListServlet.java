package semi.heritage.heritageInfo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.heritage.common.util.MyHttpServlet;
import semi.heritage.common.util.PageInfo;
import semi.heritage.favorite.service.FavoriteService;
import semi.heritage.heritageInfo.service.HeritageService;
import semi.heritage.heritageInfo.vo.HeritageMain;
import semi.heritage.heritageInfo.vo.Heritage;

@WebServlet("/heritageSearch.do")
public class HeritageListServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public String getServletName() {
		return "HeritageListServlet";
	}

	private HeritageService service = new HeritageService();
	private FavoriteService fservice = new FavoriteService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
//		int boardCount = 0;
		int getFindAllCount = 0;
		
		PageInfo pageInfo = null;
//		List<HeritageMainVO> list = null;
		List<Heritage> findAllList = null;
		
		
		String ccbaMnm = req.getParameter("searchValue");
		
		String ccbaCtcdNms[] = req.getParameterValues("region"); // 지역코드
		if (ccbaCtcdNms == null) {
			System.out.println("선택한 값이 없습니다.");
		} else {
			Map<String, String> region = new HashMap<>();
			for (String ccbaCtcdNm : ccbaCtcdNms) {
				if (ccbaCtcdNm == null) {
					ccbaCtcdNm = null;
				}
				System.out.print(ccbaCtcdNm + " ");
			}
			System.out.println("\n");
		}
		
		String gcodeNames[] = req.getParameterValues("type"); // 문화재 분류
		if (gcodeNames == null) {
			System.out.println("선택한 값이 없습니다.");
		} else {
			Map<String, String> type = new HashMap<>();
			for (String gcodeName : gcodeNames) {
				if (gcodeName == null) {
					gcodeName = null;
				}
				System.out.print(gcodeName + " ");
			}
			System.out.println("\n");
		}
		
		String ccmaNames[] = req.getParameterValues("designated");// 지정종목
		if (ccmaNames == null) {
			System.out.println("선택한 값이 없습니다.");
		} else {
			Map<String, String> designated = new HashMap<>();
			for (String ccmaName : ccmaNames) {
				if (ccmaName == null) {
					ccmaName = null;
				}
				System.out.print(ccmaName + " ");
			}
			System.out.println("\n");
		}
		
		String ccceNames[] = req.getParameterValues("age");// 시대
		if (ccceNames == null) {
			System.out.println("선택한 값이 없습니다.");
		} else {
			Map<String, String> age = new HashMap<>();
			for (String ccceName : ccceNames) {
				if (ccceName == null) {
					ccceName = null;
				}
				System.out.print(ccceName + " ");
			}
			System.out.println("\n");
		}
	
		String startYear = req.getParameter("startYear");
		String endYear = req.getParameter("endYear");
		
	

		try {
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {
		}
		
//		boardCount = service.getHeritageMainVOCount(ccbaMnm); // 메인에서 이름입력해서 게시글 갯수 몇개인지 가져옴
		getFindAllCount = service.getFindAllCount(ccbaMnm, ccbaCtcdNms, gcodeNames, ccmaNames, ccceNames, startYear, endYear); // 검색 리스트 개수
		pageInfo = new PageInfo(page, 8, getFindAllCount, 9); // 하단버튼 8개 , 게시글 9개 보임
//		list = service.selectByHeritageName(ccbaMnm, pageInfo);
		findAllList = service.findAll(pageInfo, ccbaMnm, ccbaCtcdNms, gcodeNames, ccmaNames, ccceNames, startYear, endYear);

		
		
//		int favoriteNum = 0; // 찜개수
		int allFavoriteNum= 0;
		int no = 0; // 문화재 고유번호
		int uNo = 0;
		
//		List<Integer> favlist = new ArrayList<Integer>();
//		for (int j = 0; j < list.size(); j++) {
//			favoriteNum = fservice.CountFavoriteByNo(list.get(j).getNo());
//			favlist.add(favoriteNum);
//		}
		
		List<Integer> allFavlist = new ArrayList<Integer>();
		for (int j = 0; j < findAllList.size(); j++) {
			allFavoriteNum = fservice.CountFavoriteByNo(findAllList.get(j).getNo());
			allFavlist.add(allFavoriteNum);
		}
//		System.out.println(favoriteNum);// 찜갯수 리스트
		
//		 List<Integer> hnolist = new ArrayList<Integer>();
//		 for(int i = 0; i < list.size(); i++){
//			 hnolist.add(list.get(i).getNo());
//			};
//		System.out.println(hnolist);//문화재 고유번호 리스트

//		uNo = fservice.insert(uNo, no);
//		uNo = fservice.delete(uNo, no);
//
//			if (list == null) {
//				sendCommonPage("검색 결과가 없습니다", "/index.do", req, resp);
//			}

//			System.out.println(list);
//			req.setAttribute("list", list);
			req.setAttribute("findAllList", findAllList);
			req.setAttribute("pageInfo", pageInfo);
//			req.setAttribute("boardCount", boardCount);
			req.setAttribute("getFindAllCount", getFindAllCount);
//			req.setAttribute("favoriteNum", favoriteNum);
			req.setAttribute("allFavoriteNum", allFavoriteNum);
//			req.setAttribute("favlist", favlist);
			req.setAttribute("allFavlist", allFavlist);
//		req.setAttribute("hnolist", hnolist);
			req.setAttribute("no", no);
//		req.setAttribute("uNo", uNo);
			req.getRequestDispatcher("/views/heritage/heritageSearch.jsp").forward(req, resp); // 문화재 리스트 보여주는 페이지주소
																								// 넣어야함

		}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
