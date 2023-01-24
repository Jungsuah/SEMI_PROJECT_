package semi.heritage.heritageInfo.vo;

public class HeritageVideo {

	private int videoNo;
	private String videoUrl;
	private int sn;
	private int no;
	private String ccbaKdcd;
	private String ccbaCtcd;
	private String ccbaAsno;
	
	public HeritageVideo() {
		super();
	}

	public HeritageVideo(int videoNo, String videoUrl, int sn, int no, String ccbaKdcd, String ccbaCtcd, String ccbaAsno) {
		super();
		this.videoNo = videoNo;
		this.videoUrl = videoUrl;
		this.sn = sn;
		this.no = no;
		this.ccbaKdcd = ccbaKdcd;
		this.ccbaCtcd = ccbaCtcd;
		this.ccbaAsno = ccbaAsno;
	}

	
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getVideoNo() {
		return videoNo;
	}

	public void setVideoNo(int videoNo) {
		this.videoNo = videoNo;
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	public int getSn() {
		return sn;
	}

	public void setSn(int sn) {
		this.sn = sn;
	}

	public String getCcbaKdcd() {
		return ccbaKdcd;
	}

	public void setCcbaKdcd(String ccbaKdcd) {
		this.ccbaKdcd = ccbaKdcd;
	}

	public String getCcbaCtcd() {
		return ccbaCtcd;
	}

	public void setCcbaCtcd(String ccbaCtcd) {
		this.ccbaCtcd = ccbaCtcd;
	}

	public String getCcbaAsno() {
		return ccbaAsno;
	}

	public void setCcbaAsno(String ccbaAsno) {
		this.ccbaAsno = ccbaAsno;
	}

	@Override
	public String toString() {
		return "heritageVideo [videoNo=" + videoNo + ", videoUrl=" + videoUrl + ", sn=" + sn + ", no=" + no
				+ ", ccbaKdcd=" + ccbaKdcd + ", ccbaCtcd=" + ccbaCtcd + ", ccbaAsno=" + ccbaAsno + "]";
	}

	
	
}
