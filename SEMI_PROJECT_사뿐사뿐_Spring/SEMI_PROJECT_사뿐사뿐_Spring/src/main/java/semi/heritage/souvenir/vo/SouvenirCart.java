package semi.heritage.souvenir.vo;

public class SouvenirCart {

	private int seqNo;
	private String souv_cart_no;
	private int uno;
	private int souv_pro_no;
	private String souv_pro_name;
	private int souv_pro_price;
	private String souv_pro_category;
	private String buy_status; // Y : 결제완료 / N : 결제안함
	private String delete_status; // Y : 장바구니 담김 / N : 삭제
	private String souv_pro_url;

	public SouvenirCart() {
		super();
	}

	public SouvenirCart(String souv_pro_url) {
		super();
		this.souv_pro_url = souv_pro_url;
	}

	public SouvenirCart(int uno) {
		super();
		this.uno = uno;
	}

	// 회원별 장바구니 (주문번호, 회원번호 제품명, 가격, 카테고리, 이미지주소)
	public SouvenirCart(int seqNo, String souv_cart_no, int souv_pro_no, String souv_pro_name, int souv_pro_price, String souv_pro_category,
			String souv_pro_url) {
		super();
		this.seqNo = seqNo;
		this.souv_cart_no = souv_cart_no;
		this.souv_pro_no = souv_pro_no;
		this.souv_pro_name = souv_pro_name;
		this.souv_pro_price = souv_pro_price;
		this.souv_pro_category = souv_pro_category;
		this.souv_pro_url = souv_pro_url;
	}

	// 전체
	public SouvenirCart(String souv_cart_no, int uno, int souv_pro_no, String souv_pro_name, int souv_pro_price,
			String souv_pro_category, String buy_status, String delete_status, String souv_pro_url) {
		super();
		this.souv_cart_no = souv_cart_no;
		this.uno = uno;
		this.souv_pro_no = souv_pro_no;
		this.souv_pro_name = souv_pro_name;
		this.souv_pro_price = souv_pro_price;
		this.souv_pro_category = souv_pro_category;
		this.buy_status = buy_status;
		this.delete_status = delete_status;
		this.souv_pro_url = souv_pro_url;
	}
	

	
	@Override
	public String toString() {
		return "SouvenirCartVO [seqNo=" + seqNo + ", souv_cart_no=" + souv_cart_no + ", uno=" + uno + ", souv_pro_no="
				+ souv_pro_no + ", souv_pro_name=" + souv_pro_name + ", souv_pro_price=" + souv_pro_price
				+ ", souv_pro_category=" + souv_pro_category + ", buy_status=" + buy_status + ", delete_status="
				+ delete_status + ", souv_pro_url=" + souv_pro_url + "]";
	}

	public int getSeqNo() {
		return seqNo;
	}

	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}

	public String getSouv_cart_no() {
		return souv_cart_no;
	}

	public void setSouv_cart_no(String souv_cart_no) {
		this.souv_cart_no = souv_cart_no;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public int getSouv_pro_no() {
		return souv_pro_no;
	}

	public void setSouv_pro_no(int souv_pro_no) {
		this.souv_pro_no = souv_pro_no;
	}

	public String getSouv_pro_name() {
		return souv_pro_name;
	}

	public void setSouv_pro_name(String souv_pro_name) {
		this.souv_pro_name = souv_pro_name;
	}

	public int getSouv_pro_price() {
		return souv_pro_price;
	}

	public void setSouv_pro_price(int souv_pro_price) {
		this.souv_pro_price = souv_pro_price;
	}

	public String getSouv_pro_category() {
		return souv_pro_category;
	}

	public void setSouv_pro_category(String souv_pro_category) {
		this.souv_pro_category = souv_pro_category;
	}

	public String getBuy_status() {
		return buy_status;
	}

	public void setBuy_status(String buy_status) {
		this.buy_status = buy_status;
	}

	public String getDelete_status() {
		return delete_status;
	}

	public void setDelete_status(String delete_status) {
		this.delete_status = delete_status;
	}

	public String getSouv_pro_url() {
		return souv_pro_url;
	}

	public void setSouv_pro_url(String souv_pro_url) {
		this.souv_pro_url = souv_pro_url;
	}

}
