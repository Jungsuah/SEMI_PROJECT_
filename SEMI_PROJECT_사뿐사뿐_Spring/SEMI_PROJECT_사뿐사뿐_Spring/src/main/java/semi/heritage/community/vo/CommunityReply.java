package semi.heritage.community.vo;

import java.util.Date;

public class CommunityReply {
	private int No;           // 댓글 번호
	private int board_no;     // 댓글이 작성된 게시글 번호
	private int uNo;          // 댓글 작성자 회원 번호
	private String uName;     // 댓글 작성자 이름
	private String content;   // 댓글 내용
	private String status;    // 상태값(Y/N)
	private Date create_date; // 댓글 작성 날짜
	private Date modify_date; // 댓글 수정 날짜
	
	
	public CommunityReply() {
		super();
	}

	public CommunityReply(int no, int board_no, int uNo, String uName, String content, String status, Date create_date,
			Date modify_date) {
		super();
		No = no;
		this.board_no = board_no;
		this.uNo = uNo;
		this.uName = uName;
		this.content = content;
		this.status = status;
		this.create_date = create_date;
		this.modify_date = modify_date;
	}

	@Override
	public String toString() {
		return "communityReply [No=" + No + ", board_no=" + board_no + ", uNo=" + uNo + ", uName=" + uName
				+ ", content=" + content + ", status=" + status + ", create_date=" + create_date + ", modify_date="
				+ modify_date + "]";
	}

	public int getNo() {
		return No;
	}

	public void setNo(int no) {
		No = no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}
	
}
