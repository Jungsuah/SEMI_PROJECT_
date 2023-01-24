package semi.heritage.community.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import semi.heritage.community.vo.CommunityBoard;
import semi.heritage.common.util.PageInfo;
import semi.heritage.community.dao.CommunityBoardDAO;
import semi.heritage.community.vo.CommunityBoard;
import semi.heritage.community.vo.CommunityReply;

import static semi.heritage.common.jdbc.JDBCTemplate.*;

public class CommunityBoardService {
	
	private CommunityBoardDAO dao = new CommunityBoardDAO();
	
	public int getBoardCount(Map<String, String> searchMap, String type) {  
		Connection conn = getConnection();
		String boardType = "";
		if(type.equals("F")) {
			boardType = "FREE_BOARD";
		}
		if(type.equals("T")) {
			boardType = "TO_BOARD";
		}
		if(type.equals("H")) {
			boardType = "HIS_BOARD";
		}
		int result = dao.getBoardCount(conn, searchMap, boardType);
		close(conn);
		return result;
	}
	
	public List<CommunityBoard> getBoardList(PageInfo pageinfo, Map<String, String> searchMap, String type) {
		Connection conn = getConnection();
		String boardType = "";
		if(type.equals("F")) {
			boardType = "FREE_BOARD";
		}
		if(type.equals("T")) {
			boardType = "TO_BOARD";
		}
		if(type.equals("H")) {
			boardType = "HIS_BOARD";
		}
		
		List<CommunityBoard> list = dao.findAll(conn, pageinfo, searchMap, boardType);
		close(conn);
		return list;
	}
	

	public int save(CommunityBoard board, String type) {
		Connection conn = getConnection();
		String boardType = "";
		String boardSeqType = "";
		
		if(type.equals("F")) {
			boardType = "FREE_BOARD";
			boardSeqType = "FREE";
		}
		if(type.equals("T")) {
			boardType = "TO_BOARD";
			boardSeqType = "TO";
		}
		if(type.equals("H")) {
			boardType = "HIS_BOARD";
			boardSeqType = "HIS";
		}
		
		int result = 0;
		System.out.println("service boardNo : " + board.getNo());
		if(board.getNo() != 0 ) {
			result = dao.updateBoard(conn, board, boardType);
			System.out.println("service : update로 이동" );
		} else {
			result = dao.insertBoard(conn, board, boardType, boardSeqType);
			System.out.println("service : insert로 이동" );
		}
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public CommunityBoard findBoardByNo(int no, boolean hasRead, String type) {
		Connection conn = getConnection();
		String boardType = "";
		String replyType = "";
		
		if(type.equals("F")) {
			boardType = "FREE_BOARD";
			replyType = "FREE_REPLY";
		}
		if(type.equals("T")) {
			boardType = "TO_BOARD";
			replyType = "TO_REPLY";
		}
		if(type.equals("H")) {
			boardType = "HIS_BOARD";
			replyType = "HIS_REPLY";
		}
		
		CommunityBoard board = dao.findBoardByNo(conn, no, boardType, replyType);
		
		if(hasRead == true && board != null) {
			int result = dao.updateReadCount(conn, board, boardType);
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		}
		close(conn);
		return board;
	}
	
	public int delete(int no, String type) {
		Connection conn = getConnection();
		
		String boardType = "";
		if(type.equals("F")) {
			boardType = "FREE_BOARD";
		}
		if(type.equals("T")) {
			boardType = "TO_BOARD";
		}
		if(type.equals("H")) {
			boardType = "HIS_BOARD";
		}
		
		int result = dao.updateStatus(conn, no, "N", boardType);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int saveReply(CommunityReply reply, String type, int boardNo) {
		Connection conn = getConnection();
		String boardType = "";
		String replyType = "";
		String boardSeqType = "";
		
		if(type.equals("F")) {
			boardType = "FREE_BOARD";
			replyType = "FREE_REPLY";
			boardSeqType = "FREE";
		}
		if(type.equals("T")) {
			boardType = "TO_BOARD";
			replyType = "TO_REPLY";
			boardSeqType = "TO";
		}
		if(type.equals("H")) {
			boardType = "HIS_BOARD";
			replyType = "HIS_REPLY";
			boardSeqType = "HIS";
		}
		
		int result = dao.insertReply(conn, reply, replyType, boardSeqType);
		if(result > 0) {
				commit(conn);
		} else {
			rollback(conn);
		}
		
		
		close(conn);
		return result;
	}

	public int deleteReply(int replyNo, String type) {
		Connection conn = getConnection();
		
		String boardType = "";
		if(type.equals("F")) {
			boardType = "FREE_REPLY";
		}
		if(type.equals("T")) {
			boardType = "TO_REPLY";
		}
		if(type.equals("H")) {
			boardType = "HIS_REPLY";
		}
		
		int result = dao.deleteReply(conn, replyNo, boardType);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	public List<CommunityBoard> findToMain() {
		Connection conn = getConnection();
		List<CommunityBoard> list = dao.findToMain(conn);
		close(conn);
		return list;
	}
	
	public static void main(String[] args) {
		CommunityBoardService s = new CommunityBoardService();
		
		s.findToMain();
	}

}
