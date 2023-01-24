package semi.heritage.event.vo;

public class Festival {
	private int seqNo;
	private String siteCode;
	private String subTitle;
	private String subContent;
	private String sDate;
	private String eDate;
	private String groupName;
	private String contact;
	private String subDesc;
	private String subPath;
	private String subDesc_2;
	private String subDesc_3;
	private String mainImageT;
	private String sido;
	private String gugun;
	private String subDate;
	private String eventName;

	public Festival() {
		super();
	}

	public Festival(int seqNo, String siteCode, String subTitle, String subContent, String sDate, String eDate,
			String groupName, String contact, String subDesc, String subPath, String subDesc_2, String subDesc_3,
			String mainImageT, String sido, String gugun, String subDate) {
		super();
		this.seqNo = seqNo;
		this.siteCode = siteCode;
		this.subTitle = subTitle;
		this.subContent = subContent;
		this.sDate = sDate;
		this.eDate = eDate;
		this.groupName = groupName;
		this.contact = contact;
		this.subDesc = subDesc;
		this.subPath = subPath;
		this.subDesc_2 = subDesc_2;
		this.subDesc_3 = subDesc_3;
		this.mainImageT = mainImageT;
		this.sido = sido;
		this.gugun = gugun;
		this.subDate = subDate;
	}



	public Festival(int seqNo, String siteCode, String subTitle, String subContent, String sDate, String eDate,
			String groupName, String contact, String subDesc, String subPath, String subDesc_2, String subDesc_3,
			String mainImageT, String sido, String gugun, String subDate, String eventName) {
		super();
		this.seqNo = seqNo;
		this.siteCode = siteCode;
		this.subTitle = subTitle;
		this.subContent = subContent;
		this.sDate = sDate;
		this.eDate = eDate;
		this.groupName = groupName;
		this.contact = contact;
		this.subDesc = subDesc;
		this.subPath = subPath;
		this.subDesc_2 = subDesc_2;
		this.subDesc_3 = subDesc_3;
		this.mainImageT = mainImageT;
		this.sido = sido;
		this.gugun = gugun;
		this.subDate = subDate;
		this.eventName = eventName;
	}

	public Festival(String eventName, String subTitle, String sido, String gugun, String subDesc, String sDate,
			String EDate, String subPath) {
		super();
		this.eventName = eventName;
		this.subTitle = subTitle;
		this.sido = sido;
		this.gugun = gugun;
		this.subDesc = subDesc;
		this.sDate = sDate;
		this.eDate = EDate;
		this.subPath = subPath;
	}

	public int getSeqNo() {
		return seqNo;
	}

	public void setSeqNo(int seqNo) {
		this.seqNo = seqNo;
	}

	public String getSiteCode() {
		return siteCode;
	}

	public void setSiteCode(String siteCode) {
		this.siteCode = siteCode;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public String getSubContent() {
		return subContent;
	}

	public void setSubContent(String subContent) {
		this.subContent = subContent;
	}

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public String geteDate() {
		return eDate;
	}

	public void seteDate(String eDate) {
		this.eDate = eDate;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getSubDesc() {
		return subDesc;
	}

	public void setSubDesc(String subDesc) {
		this.subDesc = subDesc;
	}

	public String getSubPath() {
		return subPath;
	}

	public void setSubPath(String subPath) {
		this.subPath = subPath;
	}

	public String getSubDesc_2() {
		return subDesc_2;
	}

	public void setSubDesc_2(String subDesc_2) {
		this.subDesc_2 = subDesc_2;
	}

	public String getSubDesc_3() {
		return subDesc_3;
	}

	public void setSubDesc_3(String subDesc_3) {
		this.subDesc_3 = subDesc_3;
	}

	public String getMainImageT() {
		return mainImageT;
	}

	public void setMainImageT(String mainImageT) {
		this.mainImageT = mainImageT;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getSubDate() {
		return subDate;
	}

	public void setSubDate(String subDate) {
		this.subDate = subDate;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	@Override
	public String toString() {
		return "Festival [seqNo=" + seqNo + ", siteCode=" + siteCode + ", subTitle=" + subTitle + ", subContent="
				+ subContent + ", sDate=" + sDate + ", eDate=" + eDate + ", groupName=" + groupName + ", contact="
				+ contact + ", subDesc=" + subDesc + ", subPath=" + subPath + ", subDesc_2=" + subDesc_2
				+ ", subDesc_3=" + subDesc_3 + ", mainImageT=" + mainImageT + ", sido=" + sido + ", gugun=" + gugun
				+ ", subDate=" + subDate + ", eventName=" + eventName + "]";
	}

	
}
