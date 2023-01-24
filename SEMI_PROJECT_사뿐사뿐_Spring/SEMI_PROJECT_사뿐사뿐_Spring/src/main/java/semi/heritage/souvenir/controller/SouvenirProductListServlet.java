package semi.heritage.souvenir.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.heritage.souvenir.service.SouvenirService;
import semi.heritage.souvenir.vo.SouvenirProduct;

@WebServlet("/souvenirProductsList.do")
public class SouvenirProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private SouvenirService service = new SouvenirService();

	@Override
	public String getServletName() {
		return "SouvenirProductListServlet";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<SouvenirProduct> list = null;

		try {
			String category = req.getParameter("category");

			if (category == null || category.isBlank() || category.isEmpty()) {
				list = service.getProductList();
			} else {
				list = service.getProductListByCategory(category);
			}

		} catch (Exception e) {
		}

		req.setAttribute("productList", list);
		req.getRequestDispatcher("/views/souvenir/souvenirProductsList.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
