package semi.heritage.community.dao;

import static semi.heritage.common.jdbc.JDBCTemplate.close;
import static semi.heritage.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import semi.heritage.common.util.PageInfo;
import semi.heritage.community.vo.CommunityBoard;
import semi.heritage.community.vo.CommunityReply;

public class CommunityBoardDAO {
	
	// 게시물의 갯수를 가져오는 쿼리문
	public int getBoardCount(Connection conn, String type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM " + type + " WHERE STATUS='Y'";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}

	// 게시물의 리스트를 가져오는 메소드(게시물 목록)
	public List<CommunityBoard> findAll(Connection conn, PageInfo pageInfo, String type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CommunityBoard> list = new ArrayList<CommunityBoard>();
		String query = "SELECT RNUM, NO, TITLE, uName, CREATE_DATE, ORIGINAL_FILE, READCOUNT, STATUS "
				+ "FROM ( "
				+ "    SELECT ROWNUM AS RNUM, NO, TITLE, uName, CREATE_DATE, ORIGINAL_FILE, READCOUNT, STATUS "
				+ "    FROM ( "
				+ "        SELECT B.NO, B.TITLE, U.uName, B.CREATE_DATE, B.ORIGINAL_FILE, B.READCOUNT, B.STATUS "
				+ "        FROM " + type + " B JOIN UserInfo U ON(B.UNO = U.uNo) "
				+ "        WHERE B.STATUS = 'Y' ORDER BY B.NO DESC " + "    )" + ") "
				+ "WHERE RNUM BETWEEN ? and ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommunityBoard board = new CommunityBoard();
				board.setRowNum(rs.getInt("RNUM"));
				board.setNo(rs.getInt("NO"));
				board.setTitle(rs.getString("TITLE"));
				board.setuName(rs.getString("UNAME"));
				board.setCreate_date((rs.getDate("CREATE_DATE")));
				board.setOriginal_file((rs.getString("ORIGINAL_FILE")));
				board.setReadCount(rs.getInt("READCOUNT"));
				board.setStatus(rs.getString("STATUS"));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	// 게시물의 갯수를 가져오는 쿼리문
	// searchMap : key=탐색할 컨텐츠, value=키워드
	// 탐색 가능 컨텐츠 : title&writer, title, writer, content
	public int getBoardCount(Connection conn, Map<String, String> searchMap, String type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) "
				+ "FROM " + type + " B "
				+ "JOIN USERINFO U ON(B.UNO = U.UNO) "
				+ "WHERE 1=1 AND B.STATUS = 'Y' ";

		if (searchMap.containsKey("titleAndwriter")) { 
			query += "AND (B.TITLE LIKE ? OR U.UNAME LIKE ?) ";
		}
		if (searchMap.containsKey("title")) { 
			query += "AND B.TITLE LIKE ? ";
		}
		if (searchMap.containsKey("writer")) {
			query += "AND U.UNAME LIKE ? ";
		}
		if(searchMap.containsKey("content")) {
			query += "AND B.CONTENT LIKE ? ";
		}

		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			int count = 1;

			if (searchMap.containsKey("titleAndwriter")) {
				pstmt.setString(count++, "%" + searchMap.get("titleAndwriter") + "%");
				pstmt.setString(count++, "%" + searchMap.get("titleAndwriter") + "%");
			}
			if (searchMap.containsKey("title")) {
				pstmt.setString(count++, "%" + searchMap.get("title") + "%");
			}
			if (searchMap.containsKey("writer")) {
				pstmt.setString(count++, "%" + searchMap.get("writer") + "%");
			}
			if (searchMap.containsKey("content")) {
				pstmt.setString(count++, "%" + searchMap.get("content") + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}

	// 게시물의 리스트를 가져오는 메소드
	public List<CommunityBoard> findAll(Connection conn, PageInfo pageInfo, Map<String, String> searchMap, String type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CommunityBoard> list = new ArrayList<CommunityBoard>();
		String queryBefore = "SELECT RNUM, NO, TITLE, UNAME, CREATE_DATE, ORIGINAL_FILE, READCOUNT, STATUS "
				+ "FROM ( "
				+ "    SELECT ROWNUM AS RNUM, NO, TITLE, UNAME, CREATE_DATE, ORIGINAL_FILE, READCOUNT, STATUS "
				+ "    FROM ( "
				+ "      SELECT  B.NO, B.TITLE, U.UNAME, B.CREATE_DATE, B.ORIGINAL_FILE, B.READCOUNT, B.STATUS "
				+ "        FROM " + type + " B JOIN USERINFO U ON(B.UNO = U.UNO) "
				+ "        WHERE 1 = 1 "
				+ "        AND B.STATUS = 'Y'";

		String queryAfter = "  ORDER BY B.NO DESC " + "    ) " + ") " + " WHERE RNUM BETWEEN ? and ? ";

		if (searchMap.containsKey("titleAndwriter")) {
			queryBefore += "AND (B.TITLE LIKE ? OR U.UNAME LIKE ?)";
		}
		if (searchMap.containsKey("title")) {
			queryBefore += "AND B.TITLE LIKE ? ";
		}
		if (searchMap.containsKey("writer")) {
			queryBefore += "AND U.UNAME LIKE ? ";
		}
		if(searchMap.containsKey("content")) {
			queryBefore += "AND B.CONTENT LIKE ? ";
		}

		String query = queryBefore + queryAfter;

		try {
			pstmt = conn.prepareStatement(query);

			int count = 1;
			if (searchMap.containsKey("titleAndwriter")) {
				pstmt.setString(count++, "%" + searchMap.get("titleAndwriter") + "%");
				pstmt.setString(count++, "%" + searchMap.get("titleAndwriter") + "%");
			}
			if (searchMap.containsKey("title")) {
				pstmt.setString(count++, "%" + searchMap.get("title") + "%");
			}
			if (searchMap.containsKey("writer")) {
				pstmt.setString(count++, "%" + searchMap.get("writer") + "%");
			}
			if (searchMap.containsKey("content")) {
				pstmt.setString(count++, "%" + searchMap.get("content") + "%");
			}

			pstmt.setInt(count++, pageInfo.getStartList());
			pstmt.setInt(count++, pageInfo.getEndList());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommunityBoard board = new CommunityBoard();
				board.setRowNum(rs.getInt("RNUM"));
				board.setNo(rs.getInt("NO"));
				board.setTitle(rs.getString("TITLE"));
				board.setuName(rs.getString("UNAME"));
				board.setCreate_date(rs.getDate("CREATE_DATE"));
				board.setOriginal_file(rs.getString("ORIGINAL_FILE"));
				board.setReadCount(rs.getInt("READCOUNT"));
				board.setStatus(rs.getString("STATUS"));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	// 글쓰기 기능
	public int insertBoard(Connection conn, CommunityBoard board, String type, String noType) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO " + type + " VALUES(SEQ_" + noType + "_NO.NEXTVAL,?,?,?,?,?,?,DEFAULT,DEFAULT,SYSDATE,SYSDATE,DEFAULT)";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, board.getuNo());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getType()); // 게시글 타입
			pstmt.setString(5, board.getOriginal_file());
			pstmt.setString(6, board.getRenamed_file());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// - 상세 게시글을 조회 
	public CommunityBoard findBoardByNo(Connection conn, int boardNo, String type, String replyType) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommunityBoard board = null;
		String query = "SELECT B.NO, B.TITLE, U.UNO, U.UNAME, B.READCOUNT, B.ORIGINAL_FILE, B.RENAMED_FILE, "
				+ "B.CONTENT, B.STATUS, B.CREATE_DATE, B.MODIFY_DATE, B.REPLY_COUNT "
				+ "FROM " + type + " B "
				+ "JOIN USERINFO U ON(B.UNO = U.UNO) "
				+ "WHERE B.STATUS = 'Y' AND B.NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, boardNo);
			System.out.println(query);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new CommunityBoard();
				board.setNo(rs.getInt("NO"));
				board.setuNo(rs.getInt("UNO"));
				board.setTitle(rs.getString("TITLE"));
				board.setuName(rs.getString("UNAME"));
				board.setStatus(rs.getString("STATUS"));
				board.setReadCount(rs.getInt("READCOUNT"));
				board.setOriginal_file(rs.getString("ORIGINAL_FILE"));
				board.setRenamed_file(rs.getString("RENAMED_FILE"));
				board.setContent(rs.getString("CONTENT"));
				board.setCreate_date(rs.getDate("CREATE_DATE"));
				board.setModify_date(rs.getDate("MODIFY_DATE"));
				board.setReply_count(getReplyCount(conn, boardNo));
				board.setReplies(getRepliesByNo(conn, replyType, boardNo)); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return board;
	}

	// 게시글 조회수 올려주는 쿼리
	public int updateReadCount(Connection conn, CommunityBoard board, String type) {
		PreparedStatement pstmt = null;
		String query = "UPDATE " + type + " SET READCOUNT=? WHERE NO=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, board.getReadCount() + 1);
			pstmt.setInt(2, board.getNo());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 게시글 삭제(실제로는 안보여주기 기능) 를 위한 쿼리
	public int updateStatus(Connection conn, int boardNo, String status, String type) {
		PreparedStatement pstmt = null;
		String query = "UPDATE " + type + " SET STATUS=? WHERE NO=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, status);
			pstmt.setInt(2, boardNo);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

	// - 게시글 수정
	public int updateBoard(Connection conn, CommunityBoard board, String type) {
		PreparedStatement pstmt = null;
		String query = "UPDATE " + type + "  SET TITLE=?,CONTENT=?,ORIGINAL_FILE=?,RENAMED_FILE=?,MODIFY_DATE=SYSDATE WHERE NO=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getOriginal_file());
			pstmt.setString(4, board.getRenamed_file());
			pstmt.setInt(5, board.getNo());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 리플을 가져오는 메소드
	public List<CommunityReply> getRepliesByNo(Connection conn, String replyType, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CommunityReply> list = new ArrayList<CommunityReply>();
		String query = "SELECT R.NO, R.BOARD_NO, R.UNO, R.CONTENT, U.UNAME, R.CREATE_DATE, R.MODIFY_DATE "
				+ "FROM " + replyType + " R "
				+ "JOIN USERINFO U ON(R.UNO = U.UNO) "
				+ "WHERE R.STATUS='Y' AND BOARD_NO= ? "
				+ "ORDER BY R.NO DESC";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CommunityReply reply = new CommunityReply();
				reply.setNo(rs.getInt("NO"));
				reply.setBoard_no(rs.getInt("BOARD_NO"));
				reply.setuNo(rs.getInt("UNO"));
				reply.setuName(rs.getString("UNAME"));
				reply.setContent(rs.getString("CONTENT"));
				reply.setCreate_date(rs.getDate("CREATE_DATE"));
				reply.setModify_date(rs.getDate("MODIFY_DATE"));
				list.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;

	}

	// 리플 쓰기 기능
	public int insertReply(Connection conn, CommunityReply reply, String type, String seqType) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO " + type + " VALUES(SEQ_" + seqType + "_RNO.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reply.getBoard_no());
			pstmt.setInt(2, reply.getuNo());
			pstmt.setString(3, reply.getContent());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// - 리플 삭제 기능
	public int deleteReply(Connection conn, int replyNo, String type) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "DELETE " + type + " WHERE NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, replyNo);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 리플 개수 올려주는 쿼리
	public int replyCount(Connection conn, String boardType, String replyType, int boardNo) {
		PreparedStatement pstmt = null;
		String query1 = "UPDATE " + boardType + " B"
				+ "SET B.REPLY_COUNT = (SELECT COUNT(NO) FROM " + replyType + " WHERE BOARD_NO = " + boardNo + ") "
				+ "WHERE B.NO = " + boardNo;
		
		String query = "UPDATE " + boardType + " SET REPLY_COUNT= "
				+ "(SELECT COUNT(NO) FROM " + replyType + " WHERE " + replyType + ".BOARD_NO = " + boardType + ".NO)";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			System.out.println("DAO replyCount" + query);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 리플의 갯수를 가져오는 쿼리문
	public int getReplyCount(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT REPLY_COUNT FROM FREE_BOARD WHERE NO = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				CommunityBoard board = new CommunityBoard();
				board.setReply_count(rs.getInt("REPLY_COUNT"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 메인페이지에 표시해주는 DAO
	public List<CommunityBoard> findToMain(Connection conn) {
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      List<CommunityBoard> list = new ArrayList<CommunityBoard>();
	      String query = "SELECT HB.NO, UI.UNAME, HB.TITLE FROM USERINFO UI, HIS_BOARD HB WHERE UI.UNO = HB.UNO ORDER BY HB.NO DESC";

	      try {
	         pstmt = conn.prepareStatement(query);
	         rs = pstmt.executeQuery();
	      
	         while (rs.next()) {
	            int count = 1;
	            int no = rs.getInt(count++);
	            String UNAME = rs.getString(count++);
	            String title = rs.getString(count++);

	            CommunityBoard mainBoard = new CommunityBoard(no, UNAME, title);
	            list.add(mainBoard);
	         }
	         System.out.println(list);
	         return list;
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	         close(rs);
	      }
	      return null;
	   }

	public static void main(String[] args) {
		Connection conn = getConnection();
		CommunityBoardDAO dao = new CommunityBoardDAO();
		CommunityBoard board = new CommunityBoard();
		
//		dao.findToMain(conn);
//		findBoardByNo(Connection conn, int boardNo, String type)
//
//
//		// 게시물 갯수
//		int count = dao.getBoardCount(conn);
//		System.out.println("게시물 갯수 : " + count);
//		System.out.println("--------------------------------------------");
//
//		// 일반 게시판 리스트
//		PageInfo info = new PageInfo(1, 10, count, 10);
//		List<communityBoard> list = dao.findAll(conn, info);
//		for (communityBoard b : list) {
//			System.out.println(b.toString());
//		}
//		System.out.println("--------------------------------------------\n");
//
//		// 게시물 갯수- 탐색
//		Map<String, String> searchMap = new HashMap<String, String>();
//		searchMap.put("title&writer", "백길동");
//		searchMap.put("writer", "자유");
//		int count = dao.getBoardCount(conn, searchMap);
//		System.out.println("게시물 갯수 : " + count);
//		System.out.println("--------------------------------------------");
//
//		// 일반 게시판 리스트 - 탐색
//		info = new PageInfo(1, 10, count, 10);
//		list = dao.findAll(conn, info, searchMap);
//		for (communityBoard b : list) {
//			System.out.println(b.toString());
//		}
//		System.out.println("--------------------------------------------\n");
//		
//		// 일반 게시판 글쓰기
//		communityBoard board = new communityBoard();
//		board.setuNo(1);
//		board.setTitle("자바에서 작성한 글 입니다.");
//		board.setContent("자바에서 올린 글 내용입니다.");
//		board.setOriginal_file("");
//		board.setRenamed_file("");
//		int result = dao.insertFreeBoard(conn, board); 
//		System.out.println("글올리기 결과 : " + result);
//		System.out.println("--------------------------------------------\n");
//		
//		
//		// 게시물 갯수
//		count = dao.getBoardCount(conn);
//		System.out.println("게시물 갯수 : " + count);
//		System.out.println("--------------------------------------------");
//		
//		// 일반 게시판 리스트
//		info = new PageInfo(1, 10, count, 10);
//		list = dao.findAll(conn, info);
//		for (communityBoard b : list) {
//			System.out.println(b.toString());
//		}
//		System.out.println("--------------------------------------------\n");
	}
}
