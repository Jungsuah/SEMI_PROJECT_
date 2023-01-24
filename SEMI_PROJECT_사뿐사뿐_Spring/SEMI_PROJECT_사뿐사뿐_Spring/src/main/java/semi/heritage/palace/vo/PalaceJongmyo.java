package semi.heritage.palace.vo;

public class PalaceJongmyo {

	private String link;

	public PalaceJongmyo() {
		super();
	}

	public PalaceJongmyo(String link) {
		super();
		this.link = link;
	}

	@Override
	public String toString() {
		return "Palace_Jongmyo_link [link=" + link + "]";
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

}
