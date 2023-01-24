package semi.heritage.palace.vo;

public class PalaceImage {

	
	private int serial_number; // 순번
	private int gung_number; // 궁 번호
	private int detail_code; // 세부코드

	// imageList 밑에 imageInfo밑에
	private String imageIndex;
	private String imageContentsKor;
	private String imageContentsEng;
	private String imageContentsChi;
	private String imageContentsJpa;

	private String imageExplanationKor;
	private String imageExplanationEng;
	private String imageExplanationChi;
	private String imageExplanationJpa;

	private String imageUrl;

	public PalaceImage() {
		super();
	}

	public PalaceImage(int serial_number, int gung_number, int detail_code, String imageIndex,
			String imageContentsKor, String imageContentsEng, String imageContentsChi, String imageContentsJpa,
			String imageExplanationKor, String imageExplanationEng, String imageExplanationChi,
			String imageExplanationJpa, String imageUrl) {
		super();
		this.serial_number = serial_number;
		this.gung_number = gung_number;
		this.detail_code = detail_code;
		this.imageIndex = imageIndex;
		this.imageContentsKor = imageContentsKor;
		this.imageContentsEng = imageContentsEng;
		this.imageContentsChi = imageContentsChi;
		this.imageContentsJpa = imageContentsJpa;
		this.imageExplanationKor = imageExplanationKor;
		this.imageExplanationEng = imageExplanationEng;
		this.imageExplanationChi = imageExplanationChi;
		this.imageExplanationJpa = imageExplanationJpa;
		this.imageUrl = imageUrl;
	}

	@Override
	public String toString() {
		return "Palace_Jongmyo_Sangse_image [serial_number=" + serial_number + ", gung_number=" + gung_number
				+ ", detail_code=" + detail_code + ", imageIndex=" + imageIndex + ", imageContentsKor="
				+ imageContentsKor + ", imageContentsEng=" + imageContentsEng + ", imageContentsChi=" + imageContentsChi
				+ ", imageContentsJpa=" + imageContentsJpa + ", imageExplanationKor=" + imageExplanationKor
				+ ", imageExplanationEng=" + imageExplanationEng + ", imageExplanationChi=" + imageExplanationChi
				+ ", imageExplanationJpa=" + imageExplanationJpa + ", imageUrl=" + imageUrl + "]";
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

	public String getImageIndex() {
		return imageIndex;
	}

	public void setImageIndex(String imageIndex) {
		this.imageIndex = imageIndex;
	}

	public String getImageContentsKor() {
		return imageContentsKor;
	}

	public void setImageContentsKor(String imageContentsKor) {
		this.imageContentsKor = imageContentsKor;
	}

	public String getImageContentsEng() {
		return imageContentsEng;
	}

	public void setImageContentsEng(String imageContentsEng) {
		this.imageContentsEng = imageContentsEng;
	}

	public String getImageContentsChi() {
		return imageContentsChi;
	}

	public void setImageContentsChi(String imageContentsChi) {
		this.imageContentsChi = imageContentsChi;
	}

	public String getImageContentsJpa() {
		return imageContentsJpa;
	}

	public void setImageContentsJpa(String imageContentsJpa) {
		this.imageContentsJpa = imageContentsJpa;
	}

	public String getImageExplanationKor() {
		return imageExplanationKor;
	}

	public void setImageExplanationKor(String imageExplanationKor) {
		this.imageExplanationKor = imageExplanationKor;
	}

	public String getImageExplanationEng() {
		return imageExplanationEng;
	}

	public void setImageExplanationEng(String imageExplanationEng) {
		this.imageExplanationEng = imageExplanationEng;
	}

	public String getImageExplanationChi() {
		return imageExplanationChi;
	}

	public void setImageExplanationChi(String imageExplanationChi) {
		this.imageExplanationChi = imageExplanationChi;
	}

	public String getImageExplanationJpa() {
		return imageExplanationJpa;
	}

	public void setImageExplanationJpa(String imageExplanationJpa) {
		this.imageExplanationJpa = imageExplanationJpa;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

}
