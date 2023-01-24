package semi.heritage.community.vo;

import java.util.Date;
import java.util.List;

public class CommunityBoard {
	private int No;                  // 게시글 번호
	private int rowNum;     
	private int uNo;                 // 회원 번호
	private String uName;            // 회원 이름
	private String title;            // 게시글 제목
	private String content;          // 게시글 내용 
	private String type;             // 게시글 타입
	private String original_file;    // 첨부파일 원래 이름
	private String renamed_file;     // 첨부파일 변경 이름
	private int readCount;           // 조회수
	private String status;           // 상태값(Y/N)
	private Date create_date;        // 게시글 올린 날짜
	private Date modify_date;        // 게시글 수정 날짜
	private int reply_count;         // 게시물에 달린 리플 개수 
	private List<CommunityReply> replies;
	
	
	public CommunityBoard() {
		super();
	}

	public CommunityBoard(int no, int rowNum, int uNo, String uName, String title, String content, String type,
			String original_file, String renamed_file, int readCount, String status, Date create_date, Date modify_date,
			int reply_count, List<CommunityReply> replies) {
		super();
		No = no;
		this.rowNum = rowNum;
		this.uNo = uNo;
		this.uName = uName;
		this.title = title;
		this.content = content;
		this.type = type;
		this.original_file = original_file;
		this.renamed_file = renamed_file;
		this.readCount = readCount;
		this.status = status;
		this.create_date = create_date;
		this.modify_date = modify_date;
		this.reply_count = reply_count;
		this.replies = replies;
	}
	
	public CommunityBoard(int no, String uName, String title) {
		super();
		No = no;
		this.uName = uName;
		this.title = title;
	}
	

	

	public int getNo() {
		return No;
	}

	public void setNo(int no) {
		No = no;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getOriginal_file() {
		return original_file;
	}

	public void setOriginal_file(String original_file) {
		this.original_file = original_file;
	}

	public String getRenamed_file() {
		return renamed_file;
	}

	public void setRenamed_file(String renamed_file) {
		this.renamed_file = renamed_file;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
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

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	public List<CommunityReply> getReplies() {
		return replies;
	}

	public void setReplies(List<CommunityReply> replies) {
		this.replies = replies;
	}
	
	@Override
	public String toString() {
		return "communityBoard [No=" + No + ", rowNum=" + rowNum + ", uNo=" + uNo + ", uName=" + uName + ", title="
				+ title + ", content=" + content + ", type=" + type + ", original_file=" + original_file
				+ ", renamed_file=" + renamed_file + ", readCount=" + readCount + ", status=" + status
				+ ", create_date=" + create_date + ", modify_date=" + modify_date + ", reply_count=" + reply_count
				+ ", replies=" + replies + "]";
	}
	
}
