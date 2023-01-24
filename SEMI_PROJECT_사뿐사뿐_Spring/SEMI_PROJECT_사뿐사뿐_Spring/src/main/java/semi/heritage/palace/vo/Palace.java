package semi.heritage.palace.vo;

public class Palace {


	private int seq_pj_ss; // 순번(키값)

	// result 밑에.
	private int serial_number; // 순번
	private int gung_number; // 궁 번호
	private int detail_code; // 세부코드
	private String contents_kor; // 문화재 한글명
	private String contents_eng; // 문화재 영문명
	private String contents_jpa; // 문화재 일문명
	private String contents_chi; // 문화재 중문명
	private String explanation_kor; // 문화재 한글설명
	private String explanation_eng; // 문화재 영문설명
	private String explanation_jpa; // 문화재 일문설명
	private String explanation_chi; // 문화재 중문설명

	private String imgUrl; // 이미지 url

	public Palace() {
		super();
	}

	public Palace(int seq_pj_ss, int serial_number, int gung_number, int detail_code,
			String contents_kor, String contents_eng, String contents_jpa, String contents_chi, String explanation_kor,
			String explanation_eng, String explanation_jpa, String explanation_chi, String imgUrl) {
		super();
		this.seq_pj_ss = seq_pj_ss;
		this.serial_number = serial_number;
		this.gung_number = gung_number;
		this.detail_code = detail_code;
		this.contents_kor = contents_kor;
		this.contents_eng = contents_eng;
		this.contents_jpa = contents_jpa;
		this.contents_chi = contents_chi;
		this.explanation_kor = explanation_kor;
		this.explanation_eng = explanation_eng;
		this.explanation_jpa = explanation_jpa;
		this.explanation_chi = explanation_chi;
		this.imgUrl = imgUrl;
	}

	@Override
	public String toString() {
		return "Palace_Jongmyo_Sangse [seq_pj_ss=" + seq_pj_ss + ", serial_number=" + serial_number + ", gung_number="
				+ gung_number + ", detail_code=" + detail_code + ", contents_kor=" + contents_kor + ", contents_eng="
				+ contents_eng + ", contents_jpa=" + contents_jpa + ", contents_chi=" + contents_chi
				+ ", explanation_kor=" + explanation_kor + ", explanation_eng=" + explanation_eng + ", explanation_jpa="
				+ explanation_jpa + ", explanation_chi=" + explanation_chi + ", imgUrl=" + imgUrl + "]";
	}

	public int getSeq_pj_ss() {
		return seq_pj_ss;
	}

	public void setSeq_pj_ss(int seq_pj_ss) {
		this.seq_pj_ss = seq_pj_ss;
	}

	public int getSerial_number() {
		return serial_number;
	}

	public void setSerial_number(int serial_number) {
		this.serial_number = serial_number;
	}

	public int getGung_number() {
		return gung_number;
	}

	public void setGung_number(int gung_number) {
		this.gung_number = gung_number;
	}

	public int getDetail_code() {
		return detail_code;
	}

	public void setDetail_code(int detail_code) {
		this.detail_code = detail_code;
	}

	public String getContents_kor() {
		return contents_kor;
	}

	public void setContents_kor(String contents_kor) {
		this.contents_kor = contents_kor;
	}

	public String getContents_eng() {
		return contents_eng;
	}

	public void setContents_eng(String contents_eng) {
		this.contents_eng = contents_eng;
	}

	public String getContents_jpa() {
		return contents_jpa;
	}

	public void setContents_jpa(String contents_jpa) {
		this.contents_jpa = contents_jpa;
	}

	public String getContents_chi() {
		return contents_chi;
	}

	public void setContents_chi(String contents_chi) {
		this.contents_chi = contents_chi;
	}

	public String getExplanation_kor() {
		return explanation_kor;
	}

	public void setExplanation_kor(String explanation_kor) {
		this.explanation_kor = explanation_kor;
	}

	public String getExplanation_eng() {
		return explanation_eng;
	}

	public void setExplanation_eng(String explanation_eng) {
		this.explanation_eng = explanation_eng;
	}

	public String getExplanation_jpa() {
		return explanation_jpa;
	}

	public void setExplanation_jpa(String explanation_jpa) {
		this.explanation_jpa = explanation_jpa;
	}

	public String getExplanation_chi() {
		return explanation_chi;
	}

	public void setExplanation_chi(String explanation_chi) {
		this.explanation_chi = explanation_chi;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

}
