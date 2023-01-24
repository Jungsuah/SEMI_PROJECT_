package semi.heritage.souvenir.service;

import static semi.heritage.common.jdbc.JDBCTemplate.close;
import static semi.heritage.common.jdbc.JDBCTemplate.commit;
import static semi.heritage.common.jdbc.JDBCTemplate.getConnection;
import static semi.heritage.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import semi.heritage.member.vo.Member;
import semi.heritage.souvenir.dao.SouvenirDao;
import semi.heritage.souvenir.vo.SouvenirBuy;
import semi.heritage.souvenir.vo.SouvenirCart;
import semi.heritage.souvenir.vo.SouvenirPay;
import semi.heritage.souvenir.vo.SouvenirProduct;

public class SouvenirService {
	SouvenirDao dao = new SouvenirDao();

	// product
	public List<SouvenirProduct> getProductList() {
		Connection conn = getConnection();
		List<SouvenirProduct> list = dao.selectProductAll(conn);
		close(conn);
		return list;
	}

	public List<SouvenirProduct> getProductListByCategory(String souv_pro_category) {
		Connection conn = getConnection();
		List<SouvenirProduct> list = dao.selectByCategory(conn, souv_pro_category);
		close(conn);
		return list;
	}

	public SouvenirProduct findProductByNo(int productNo) {
		Connection conn = getConnection();
		SouvenirProduct sp = dao.findProductByNo(conn, productNo);
		return sp;
	}

	public SouvenirCart findCartByNo(int seqNo) {
		Connection conn = getConnection();
		SouvenirCart sc = dao.findCartBySeqNo(conn, seqNo);
		return sc;
	}

	// cart
	public List<SouvenirCart> getCartList(int uNo) {
		Connection conn = getConnection();
		List<SouvenirCart> list = dao.selectCartByUNO(conn, uNo);
		close(conn);
		return list;
	}

	public int insertCart(SouvenirProduct cart, int userno) {
		Connection conn = getConnection();
		int result = dao.insertCart(conn, cart, userno);

		if (result > 0) {

			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public int deleteCart(int seqNo) {
		Connection conn = getConnection();
		int result = dao.deleteCart(conn, seqNo, "Y");

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	public int AlldeleteCart(int uNo) {
		Connection conn = getConnection();
		int result = dao.AlldeleteCart(conn, uNo, "Y");

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	// 링크 복사 기능
	public SouvenirProduct copyLinkCart(int productNo) {
		Connection conn = getConnection();
		SouvenirProduct link = dao.findProductByNo(conn, productNo);

		return link;
	}

	// pay
	public List<SouvenirPay> getPayList(int uNo) {
		Connection conn = getConnection();
		List<SouvenirPay> list = dao.selectPayByUNO(conn, uNo);
		close(conn);
		return list;
	}

	// buy
	public List<SouvenirBuy> getBuyList(int uNo) {
		Connection conn = getConnection();
		List<SouvenirBuy> list = dao.selectBuyByUNO(conn, uNo);
		close(conn);

		System.out.println("구매목록" + list);
		return list;
	}

	public int updateBuyING(int uNo) {
		int result = 0;
		Connection conn = getConnection();

		result = dao.updateBuyING(conn, uNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

}
