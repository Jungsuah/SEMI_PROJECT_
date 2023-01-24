package semi.heritage.souvenir.vo;

public class SouvenirProduct {
	private int souv_pro_no;
	private String souv_pro_name;
	private int souv_pro_price;
	private String souv_pro_category;
	private String souv_pro_url;

	public SouvenirProduct() {
		super();
	}

	public SouvenirProduct(int souv_pro_no, String souv_pro_name, int souv_pro_price, String souv_pro_category,
			String souv_pro_url) {
		super();
		this.souv_pro_no = souv_pro_no;
		this.souv_pro_name = souv_pro_name;
		this.souv_pro_price = souv_pro_price;
		this.souv_pro_category = souv_pro_category;
		this.souv_pro_url = souv_pro_url;
	}

	@Override
	public String toString() {
		return "SouvenirProductVO [souv_pro_no=" + souv_pro_no + ", souv_pro_name=" + souv_pro_name
				+ ", souv_pro_price=" + souv_pro_price + ", souv_pro_category=" + souv_pro_category + ", souv_pro_url="
				+ souv_pro_url + "]";
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

	public String getSouv_pro_url() {
		return souv_pro_url;
	}

	public void setSouv_pro_url(String souv_pro_url) {
		this.souv_pro_url = souv_pro_url;
	}

}
