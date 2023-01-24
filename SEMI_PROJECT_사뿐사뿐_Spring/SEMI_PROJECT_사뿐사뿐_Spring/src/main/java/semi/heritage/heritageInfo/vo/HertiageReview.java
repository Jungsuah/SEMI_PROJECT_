package semi.heritage.heritageInfo.vo;

import java.util.Date;

public class HertiageReview {
	private int revNo; // 리뷰 글번호
	private String revContents; // 리뷰 글내용
	private Date revDate; // 리뷰 작성날짜
	private int rev_uNo; // 리뷰를 단 회원번호
	private String rev_userEmail; // 리뷰를 단 회원이메일
	private String rev_userPW; // 리뷰를 단 회원비밀번호
	private int rev_hno; // 리뷰를 단 문화재의 고유키값

	public HertiageReview() {
		super();
	}

	public HertiageReview(int revNo, String revContents, Date revDate, int rev_uNo, String rev_userEmail, String rev_userPW,
			int revHNo) {
		super();
		this.revNo = revNo;
		this.revContents = revContents;
		this.revDate = revDate;
		this.rev_uNo = rev_uNo;
		this.rev_userEmail = rev_userEmail;
		this.rev_userPW = rev_userPW;
		this.rev_hno = revHNo;
	}
	
	public HertiageReview(int revNo,int revHNo, String rev_userEmail, String revContents, Date revDate) {
		super();
		
		this.revNo = revNo;
		this.rev_hno = revHNo;
		this.rev_userEmail = rev_userEmail;
		this.revContents = revContents;
		this.revDate = revDate;
	
	}
	
	public HertiageReview(int revHNo, String rev_userEmail, String revContents, Date revDate) {
		super();
	
		this.rev_hno = revHNo;
		this.rev_userEmail = rev_userEmail;
		this.revContents = revContents;
		this.revDate = revDate;
	
	}
	
	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}

	public String getRevContents() {
		return revContents;
	}

	public void setRevContents(String revContents) {
		this.revContents = revContents;
	}

	public Date getRevDate() {
		return revDate;
	}

	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}

	public int getRev_uNo() {
		return rev_uNo;
	}

	public void setRev_uNo(int rev_uNo) {
		this.rev_uNo = rev_uNo;
	}

	public String getRev_userEmail() {
		return rev_userEmail;
	}

	public void setRev_userEmail(String string) {
		this.rev_userEmail = string;
	}

	public String getRev_userPW() {
		return rev_userPW;
	}

	public void setRev_userPW(String rev_userPW) {
		this.rev_userPW = rev_userPW;
	}

	public int getrevHNo() {
		return rev_hno;
	}

	public void setrevHNo(int revHNo) {
		this.rev_hno = revHNo;
	}

	@Override
	public String toString() {
		return "HertiageReview [revNo=" + revNo + ", revContents=" + revContents + ", revDate=" + revDate + ", rev_uNo="
				+ rev_uNo + ", rev_userId=" + rev_userEmail + ", rev_userPW=" + rev_userPW + ", revHNo=" + rev_hno + "]";
	}

}
