package semi.heritage.favorite.vo;

public class FavoritePalace {

	private int rowNum;
	private int countNum;
	private int favNum;
	private int uNo;
	private int seq_pj_ss;
	
	public FavoritePalace() {
		super();
	}

	public FavoritePalace(int favNum, int uNo, int seq_pj_ss) {
		super();
		this.favNum = favNum;
		this.uNo = uNo;
		this.seq_pj_ss = seq_pj_ss;
	}
	
	public FavoritePalace(int countNum, int favNum, int uNo, int seq_pj_ss) {
		super();
		this.countNum = countNum;
		this.favNum = favNum;
		this.uNo = uNo;
		this.seq_pj_ss = seq_pj_ss;
	}
	
	public FavoritePalace(int rowNum, int seq_pj_ss) {
		super();
		this.rowNum = rowNum;
		this.seq_pj_ss = seq_pj_ss;
	}
	
	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	
	public int getCountNum() {
		return countNum;
	}

	public void setCountNum(int countNum) {
		this.countNum = countNum;
	}

	public int getFavNum() {
		return favNum;
	}

	public void setFavNum(int favNum) {
		this.favNum = favNum;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	public int getSeq_pj_ss() {
		return seq_pj_ss;
	}

	public void setSeq_pj_ss(int seq_pj_ss) {
		this.seq_pj_ss = seq_pj_ss;
	}

	
	public String toString1() {
		return "favoritePalaceVO [favNum=" + favNum + ", uNo=" + uNo + ", seq_pj_ss=" + seq_pj_ss + "]";
	}
	
	@Override
	public String toString() {
		return "favoriteVO [rowNum=" + rowNum + ", seq_pj_ss=" + seq_pj_ss + "]";
	}
	
}
