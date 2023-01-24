package semi.heritage.palace.vo;

public class PalaceJongmyoDetailMovie {

	private int serial_number; // 순번
	private int gung_number; // 궁 번호
	private int detail_code; // 세부코드

	// movieList 밑에 movieInfo밑에
	private String movieIndex;
	private String movieContentsKor;
	private String movieContentsEng;
	private String movieContentsChi;
	private String movieContentsJpa;

	private String movieUrlKor;
	private String movieUrlEng;
	private String movieUrlChi;
	private String movieUrlJpa;

	public PalaceJongmyoDetailMovie() {
		super();
	}

	public PalaceJongmyoDetailMovie(int serial_number, int gung_number, int detail_code, String movieIndex,
			String movieContentsKor, String movieContentsEng, String movieContentsChi, String movieContentsJpa,
			String movieUrlKor, String movieUrlEng, String movieUrlChi, String movieUrlJpa) {
		super();
		this.serial_number = serial_number;
		this.gung_number = gung_number;
		this.detail_code = detail_code;
		this.movieIndex = movieIndex;
		this.movieContentsKor = movieContentsKor;
		this.movieContentsEng = movieContentsEng;
		this.movieContentsChi = movieContentsChi;
		this.movieContentsJpa = movieContentsJpa;
		this.movieUrlKor = movieUrlKor;
		this.movieUrlEng = movieUrlEng;
		this.movieUrlChi = movieUrlChi;
		this.movieUrlJpa = movieUrlJpa;
	}

	@Override
	public String toString() {
		return "Palace_Jongmyo_Sangse_movie [serial_number=" + serial_number + ", gung_number=" + gung_number
				+ ", detail_code=" + detail_code + ", movieIndex=" + movieIndex + ", movieContentsKor="
				+ movieContentsKor + ", movieContentsEng=" + movieContentsEng + ", movieContentsChi=" + movieContentsChi
				+ ", movieContentsJpa=" + movieContentsJpa + ", movieUrlKor=" + movieUrlKor + ", movieUrlEng="
				+ movieUrlEng + ", movieUrlChi=" + movieUrlChi + ", movieUrlJpa=" + movieUrlJpa + "]";
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

	public String getMovieIndex() {
		return movieIndex;
	}

	public void setMovieIndex(String movieIndex) {
		this.movieIndex = movieIndex;
	}

	public String getMovieContentsKor() {
		return movieContentsKor;
	}

	public void setMovieContentsKor(String movieContentsKor) {
		this.movieContentsKor = movieContentsKor;
	}

	public String getMovieContentsEng() {
		return movieContentsEng;
	}

	public void setMovieContentsEng(String movieContentsEng) {
		this.movieContentsEng = movieContentsEng;
	}

	public String getMovieContentsChi() {
		return movieContentsChi;
	}

	public void setMovieContentsChi(String movieContentsChi) {
		this.movieContentsChi = movieContentsChi;
	}

	public String getMovieContentsJpa() {
		return movieContentsJpa;
	}

	public void setMovieContentsJpa(String movieContentsJpa) {
		this.movieContentsJpa = movieContentsJpa;
	}

	public String getMovieUrlKor() {
		return movieUrlKor;
	}

	public void setMovieUrlKor(String movieUrlKor) {
		this.movieUrlKor = movieUrlKor;
	}

	public String getMovieUrlEng() {
		return movieUrlEng;
	}

	public void setMovieUrlEng(String movieUrlEng) {
		this.movieUrlEng = movieUrlEng;
	}

	public String getMovieUrlChi() {
		return movieUrlChi;
	}

	public void setMovieUrlChi(String movieUrlChi) {
		this.movieUrlChi = movieUrlChi;
	}

	public String getMovieUrlJpa() {
		return movieUrlJpa;
	}

	public void setMovieUrlJpa(String movieUrlJpa) {
		this.movieUrlJpa = movieUrlJpa;
	}

}
