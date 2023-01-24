package semi.heritage.heritageInfo.dao;

import static semi.heritage.common.jdbc.JDBCTemplate.close;
import static semi.heritage.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import semi.heritage.common.util.PageInfo;
import semi.heritage.heritageInfo.vo.HeritageImage;
import semi.heritage.heritageInfo.vo.HeritageMain;
import semi.heritage.heritageInfo.vo.Heritage;

import semi.heritage.heritageInfo.vo.HeritageVideo;

public class HeritageDao {

	public int insert(Connection conn, Heritage heritagevo) {
		try {
			String sql = "INSERT INTO HERITAGE(sn, no, ccmaName, crltsnoNm, ccbaMnm1, ccbaMnm2, ccbaCtcdNm, ccsiName, ccbaAdmin, ccbaKdcd, ccbaCtcd, ccbaAsno, ccbaCncl, ccbaCpno, longitude, latitude, gcodeName, bcodeName, mcodeName, scodeName, ccbaQuan, ccbaAsdt, ccbaLcad, ccceName, ccbaPoss, imageUrl, content) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?, ?, ? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			int cnt = 1;
			pstmt.setInt(cnt++, heritagevo.getSn());
			pstmt.setInt(cnt++, heritagevo.getNo());
			pstmt.setString(cnt++, heritagevo.getCcmaName());
			pstmt.setInt(cnt++, heritagevo.getCrltsnoNm());
			pstmt.setString(cnt++, heritagevo.getCcbaMnm1());
			pstmt.setString(cnt++, heritagevo.getCcbaMnm2());
			pstmt.setString(cnt++, heritagevo.getCcbaCtcdNm());
			pstmt.setString(cnt++, heritagevo.getCcsiName());
			pstmt.setString(cnt++, heritagevo.getCcbaAdmin());
			pstmt.setString(cnt++, heritagevo.getCcbaKdcd());
			pstmt.setString(cnt++, heritagevo.getCcbaCtcd());
			pstmt.setString(cnt++, heritagevo.getCcbaAsno());
			pstmt.setString(cnt++, heritagevo.getCcbaCncl());
			pstmt.setString(cnt++, heritagevo.getCcbaCpno());
			pstmt.setString(cnt++, heritagevo.getLongitude());
			pstmt.setString(cnt++, heritagevo.getLatitude());
			pstmt.setString(cnt++, heritagevo.getGcodeName());
			pstmt.setString(cnt++, heritagevo.getBcodeName());
			pstmt.setString(cnt++, heritagevo.getMcodeName());
			pstmt.setString(cnt++, heritagevo.getScodeName());
			pstmt.setString(cnt++, heritagevo.getCcbaQuan());
			pstmt.setString(cnt++, heritagevo.getCcbaAsdt());
			pstmt.setString(cnt++, heritagevo.getCcbaLcad());
			pstmt.setString(cnt++, heritagevo.getCcceName());
			pstmt.setString(cnt++, heritagevo.getCcbaPoss());
			pstmt.setString(cnt++, heritagevo.getImageUrl());
			pstmt.setString(cnt++, heritagevo.getContent());

			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int insertImage(Connection conn, HeritageImage heritageimage) {
	      try {
	         String sql = "INSERT INTO heritageImage(imageNo, imageUrl, ccimDesc, sn, no, ccbaKdcd, ccbaCtcd, ccbaAsno) VALUES(SEQ_HERITAGE_Image.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";

	         PreparedStatement pstmt = conn.prepareStatement(sql);

	         int cnt = 1;

	         pstmt.setString(cnt++, heritageimage.getImageUrl());
	         pstmt.setString(cnt++, heritageimage.getCcimDesc());
	         pstmt.setInt(cnt++, heritageimage.getSn());
	         pstmt.setInt(cnt++, heritageimage.getNo());
	         pstmt.setString(cnt++, heritageimage.getCcbaKdcd());
	         pstmt.setString(cnt++, heritageimage.getCcbaCtcd());
	         pstmt.setString(cnt++, heritageimage.getCcbaAsno());

	         int result = pstmt.executeUpdate();
	         pstmt.close();
	         return result;
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return -1;
	   }

	   public int insertVideo(Connection conn, HeritageVideo heritagevideo) {
	      try {
	         String sql = "INSERT INTO heritageVideo(videoNo, videoUrl, sn, no, ccbaKdcd, ccbaCtcd, ccbaAsno) VALUES(SEQ_HERITAGE_Image.NEXTVAL, ?, ?, ?, ?, ?, ?)";

	         PreparedStatement pstmt = conn.prepareStatement(sql);

	         int cnt = 1;

	         pstmt.setString(cnt++, heritagevideo.getVideoUrl());
	         pstmt.setInt(cnt++, heritagevideo.getSn());
	         pstmt.setInt(cnt++, heritagevideo.getNo());
	         pstmt.setString(cnt++, heritagevideo.getCcbaKdcd());
	         pstmt.setString(cnt++, heritagevideo.getCcbaCtcd());
	         pstmt.setString(cnt++, heritagevideo.getCcbaAsno());

	         int result = pstmt.executeUpdate();
	         pstmt.close();
	         return result;
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return -1;
	   }

	// 메인 페이지 인기 문화재 명소 출력용 (이미지, 이름, 주소, 찜 개수, 리뷰 개수를 찜 개수가 많은 열개를 순서대로 정렬)
	public List<HeritageMain> mainByFavorite(Connection conn) {
		List<HeritageMain> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT " + "ROWNUM, HFV.*, H.ccbaMnm1, H.ccbaCtcdNm, H.ccsiName, H.content, H.IMAGEURL, HR.* "
					+ "FROM" + "(SELECT no, COUNT(uno) from hFavorite group by no order by COUNT(uno) desc) HFV, "
					+ "HERITAGE H, "
					+ "(SELECT NO, COUNT(revNo) FROM HertiageReview group by no order by COUNT(revNo) desc) HR "
					+ "WHERE " + "H.no = HFV.no AND " + "H.no = HR.no AND " + "ROWNUM BETWEEN 1 AND 10";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int count = 1;
				int rowNum = rs.getInt(count++);
				int no = rs.getInt(count++);
				int countHfavorite = rs.getInt(count++);
				String ccbaMnm1 = rs.getString(count++);
				String ccbaCtcdNm = rs.getString(count++);
				String ccsiName = rs.getString(count++);
				String content = rs.getString(count++);
				String imageUrl = rs.getString(count++);
				int rNo = rs.getInt(count++);
				int countHreview = rs.getInt(count++);

				HeritageMain mainByFv = new HeritageMain(rowNum, no, countHfavorite, ccbaMnm1, ccbaCtcdNm, ccsiName,
						content, imageUrl, rNo, countHreview);
				list.add(mainByFv);
			}
//			System.out.println(list.toString());
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return null;
	}

	// 이름으로 검색한 문화재 전체 갯수를 가져오는 쿼리문
	public int getHeritageMainVOCount(Connection conn, String ccbaMnm) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT count(ROWNUM) FROM(" + "SELECT ROWNUM, H.* "
				+ "FROM (select sn, no, ccbaMnm1, ccbaCtcdNm, ccsiName, content, IMAGEURL from HERITAGE order by sn) H "
				+ "where H.ccbaMnm1 like ? ) SCH ";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + ccbaMnm + "%");
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

	// 메인페이지에서 이름 키워드로 전체검색시 출력용(이미지, 이름, 주소, 찜 개수를 순번대로 정렬)
	public List<HeritageMain> selectByHeritageName(Connection conn, String ccbaMnm, PageInfo pageInfo) {
		List<HeritageMain> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT rn.* from " + "(SELECT ROWNUM AS RNUM, H.* "
					+ "FROM (select sn, no, ccbaMnm1, ccbaCtcdNm, ccsiName, content, IMAGEURL from HERITAGE order by sn) H "
					+ "where H.ccbaMnm1 like  ? ) rn " + "where RNUM between ? and ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + ccbaMnm + "%");
			pstmt.setInt(2, pageInfo.getStartList());
			pstmt.setInt(3, pageInfo.getEndList());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int count = 1;
				int rowNum = rs.getInt(count++);
				int sn = rs.getInt(count++);
				int no = rs.getInt(count++);
				String ccbaMnm1 = rs.getString(count++);
				String ccbaCtcdNm = rs.getString(count++);
				String ccsiName = rs.getString(count++);
				String content = rs.getString(count++);
				String imageUrl = rs.getString(count++);

				HeritageMain info = new HeritageMain(rowNum, sn, no, ccbaMnm1, ccbaCtcdNm, ccsiName, content,
						imageUrl);
				list.add(info);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println(list.toString());
		return list;
	}

	// 문화재 테이블에서 no로 상세조회
	// ccbaMnm1 -문화재명(국문) / ccbaMnm2 -문화재명(한자) / ccbaCtcdNm
	// -시도명/ccsiName-시군구명/content-내용/ ccbaKdcd-종목코드/
	// ccbaQuan-수량/ccbaAsdt-지정(등록일)/ccbaLcad -소재지 상세/
	// ccceName-시대/ccbaPoss-소유자/imageUrl-메인노출이미지URL
	public Heritage findHertiageByNo(Connection conn, int hertiageNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Heritage hv = null;
		String query = "SELECT  sn, no, ccbaMnm1,  ccbaMnm2,  ccbaCtcdNm,  ccsiName,  content,  ccbaKdcd,  ccbaQuan,  ccbaAsdt,  ccbaLcad,  ccceName,  ccbaPoss,  imageUrl, ccmaName, ccbaAdmin, longitude, latitude "
				+ "FROM HERITAGE WHERE no = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, hertiageNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				hv = new Heritage();
				hv.setSn(rs.getInt("sn"));
	            hv.setNo(rs.getInt("no"));
				hv.setCcbaMnm1(rs.getString("ccbaMnm1"));
				hv.setCcbaMnm2(rs.getString("ccbaMnm2"));
				hv.setCcbaCtcdNm(rs.getString("ccbaCtcdNm"));
				hv.setCcsiName(rs.getString("ccsiName"));
				hv.setContent(rs.getString("content"));
				hv.setCcbaKdcd(rs.getString("ccbaKdcd"));
				hv.setCcbaQuan(rs.getString("ccbaQuan"));
				hv.setCcbaAsdt(rs.getString("ccbaAsdt"));
				hv.setCcbaLcad(rs.getString("ccbaLcad"));
				hv.setCcceName(rs.getString("ccceName"));
				hv.setCcbaPoss(rs.getString("ccbaPoss"));
				hv.setImageUrl(rs.getString("imageUrl"));
				hv.setCcmaName(rs.getString("ccmaName"));
				hv.setCcbaAdmin(rs.getString("ccbaAdmin"));
				hv.setLongitude(rs.getString("longitude"));
				hv.setLatitude(rs.getString("latitude"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return hv;
	}
	
	
	

	// 문화재 이미지 테이블에서 no로 이미지 가져오기
	public List<HeritageImage> findHeritageImageByNo(Connection conn, int no) {
		List<HeritageImage> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT no, IMAGEURL FROM HERITAGEIMAGE WHERE no = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int count = 1;
				int hno = rs.getInt(count++);
				String imageUrl = rs.getString(count++);
				HeritageImage imageInfo = new HeritageImage(hno, imageUrl);
				list.add(imageInfo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println(list.toString());
		return list;
	}

	// 문화재 비디오 테이블에서 no로 상세조회
	public String findHeritageVideoByNo(Connection conn, int videoNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String hv = "";
		String query = "SELECT VIDEOURL FROM HERITAGEVIDEO " + "WHERE NO = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, videoNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				hv = rs.getString(1);
			}
//            System.out.println(hv);
			return hv;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return hv;
	}

	// 문화재 검색페이지 리스트를 가져오는 메소드
	public List<Heritage> findAll(Connection conn, PageInfo pageInfo, String ccbaMnm, String[] ccbaCtcdNms,
			String[] gcodeNames, String[] ccmaNames, String[] ccceNames, String startYear, String endYear) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Heritage> findAllList = new ArrayList<>();
		String queryBefore = "SELECT rn.* from " + "(SELECT ROWNUM AS RNUM, H.* "
				+ "FROM (select sn, no, ccbaMnm1, ccbaCtcdNm, ccsiName, content, IMAGEURL, GCODENAME, CCMANAME, ccceName, CCBAASDT from HERITAGE order by sn) H "
				+ "where 1 = 1 ";

		String queryAfter = " )rn WHERE RNUM between ? and ?";

		if (ccbaMnm != null) {
			queryBefore += "AND H.ccbaMnm1 like ? ";
		}
		if (ccbaCtcdNms != null) {
			for (int i = 0; i < ccbaCtcdNms.length; i++) {
				if (i == 0 && ccbaCtcdNms.length == 1) {
					queryBefore += "AND (H.ccbaCtcdNm = ? )";
				} else if (i == 0 && ccbaCtcdNms.length > 1) {
					queryBefore += "AND (H.ccbaCtcdNm = ? ";
				} else if (i > 0 && i < (ccbaCtcdNms.length - 1)) {
					queryBefore += "OR H.ccbaCtcdNm = ? ";
				} else if (i == (ccbaCtcdNms.length - 1)) {
					queryBefore += "OR H.ccbaCtcdNm = ? )";
				}
			}
		}
		if (gcodeNames != null) {
			for (int i = 0; i < gcodeNames.length; i++) {
				if (i == 0 && gcodeNames.length == 1) {
					queryBefore += "AND (H.gcodeName = ? )";
				} else if (i == 0 && gcodeNames.length > 1) {
					queryBefore += "AND (H.gcodeName = ? ";
				} else if (i > 0 && i < (gcodeNames.length - 1)) {
					queryBefore += "OR H.gcodeName = ? ";
				} else if (i == (gcodeNames.length - 1)) {
					queryBefore += "OR H.gcodeName = ? )";
				}
			}
		}
		if (ccmaNames != null) {
			for (int i = 0; i < ccmaNames.length; i++) {
				if (i == 0 && ccmaNames.length == 1) {
					queryBefore += "AND (H.ccmaName = ? )";
				} else if (i == 0 && ccmaNames.length > 1) {
					queryBefore += "AND (H.ccmaName = ? ";
				} else if (i > 0 && i < (ccmaNames.length - 1)) {
					queryBefore += "OR H.ccmaName = ? ";
				} else if (i == (ccmaNames.length - 1)) {
					queryBefore += "OR H.ccmaName = ? )";
				}
			}
		}
		if (ccceNames != null) {
			for (int i = 0; i < ccceNames.length; i++) {
				if (i == 0 && ccceNames.length == 1) {
					queryBefore += "AND (H.ccceName like ? )";
				} else if (i == 0 && ccceNames.length > 1) {
					queryBefore += "AND (H.ccceName like ? ";
				} else if (i > 0 && i < (ccceNames.length - 1)) {
					queryBefore += "OR H.ccceName like ? ";
				} else if (i == (ccceNames.length - 1)) {
					queryBefore += "OR H.ccceName like ? )";
				}
			}
		}
		if (startYear != null) {
			queryBefore += "AND SUBSTR(H.CCBAASDT, 1, 4) >= ? ";
		}
		if (endYear != null) {
			queryBefore += "AND SUBSTR(H.CCBAASDT, 1, 4) <= ? ";
		}

		String query = queryBefore + queryAfter;
//					System.out.println(query);
//					return query;

		try {
			pstmt = conn.prepareStatement(query);
			int count = 1;

			if (ccbaMnm != null) {
				pstmt.setString(count++, "%" + ccbaMnm + "%");
			}
			if (ccbaCtcdNms != null) {
				for (int i = 0; i < ccbaCtcdNms.length; i++) {
					pstmt.setString(count++, ccbaCtcdNms[i]);
				}
			}
			if (gcodeNames != null) {
				for (int i = 0; i < gcodeNames.length; i++) {
					pstmt.setString(count++, gcodeNames[i]);
				}
			}
			if (ccmaNames != null) {
				for (int i = 0; i < ccmaNames.length; i++) {
					pstmt.setString(count++, ccmaNames[i]);
				}
			}
			if (ccceNames != null) {
				for (int i = 0; i < ccceNames.length; i++) {
					pstmt.setString(count++, "%" + ccceNames[i] + "%");
				}
			}
			if (startYear != null) {
				pstmt.setString(count++, startYear);
			}
			if (endYear != null) {
				pstmt.setString(count++, endYear);
			}
			pstmt.setInt(count++, pageInfo.getStartList());
			pstmt.setInt(count++, pageInfo.getEndList());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Heritage heritageSearchAll = new Heritage();
				int cnt = 1;
				heritageSearchAll.setRowNum(rs.getInt(cnt++));
				heritageSearchAll.setSn(rs.getInt(cnt++));
				heritageSearchAll.setNo(rs.getInt(cnt++));
				heritageSearchAll.setCcbaMnm1(rs.getString(cnt++));
				heritageSearchAll.setCcbaCtcdNm(rs.getString(cnt++));
				heritageSearchAll.setCcsiName(rs.getString(cnt++));
				heritageSearchAll.setContent(rs.getString(cnt++));
				heritageSearchAll.setImageUrl(rs.getString(cnt++));
				heritageSearchAll.setGcodeName(rs.getString(cnt++));
				heritageSearchAll.setCcmaName(rs.getString(cnt++));
				heritageSearchAll.setCcceName(rs.getString(cnt++));
				heritageSearchAll.setCcbaAsdt(rs.getString(cnt++));

				findAllList.add(heritageSearchAll);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("체크포인트4 에러!!");
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println(query);
		System.out.println(findAllList.toString());
		return findAllList;
	}

	// 문화개 검색페이지 개수 구하기
	public int getFindAllCount(Connection conn, String ccbaMnm, String[] ccbaCtcdNms, String[] gcodeNames,
			String[] ccmaNames, String[] ccceNames, String startYear, String endYear) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM HERITAGE where 1 = 1 ";

		if (ccbaMnm != null) {
			query += "AND ccbaMnm1 like ? ";
		}
		if (ccbaCtcdNms != null) {
			for (int i = 0; i < ccbaCtcdNms.length; i++) {
				if (i == 0 && ccbaCtcdNms.length == 1) {
					query += "AND (ccbaCtcdNm = ? )";
				} else if (i== 0 && ccbaCtcdNms.length > 1) {
					query += "AND (ccbaCtcdNm = ? ";
				} else if (i > 0 && i < (ccbaCtcdNms.length - 1)) {
					query += "OR ccbaCtcdNm = ? ";
				} else if (i == (ccbaCtcdNms.length - 1)) {
					query += "OR ccbaCtcdNm = ? )";
				}
			}
		}
		if (gcodeNames != null) {
			for (int i = 0; i < gcodeNames.length; i++) {
				if (i == 0 && gcodeNames.length == 1) {
					query += "AND (gcodeName = ? )";
				} else if (i== 0 && gcodeNames.length > 1) {
					query += "AND (gcodeName = ? ";
				} else if (i > 0 && i < (gcodeNames.length - 1)) {
					query += "OR gcodeName = ? ";
				} else if (i == (gcodeNames.length - 1)) {
					query += "OR gcodeName = ? )";
				}
			}
		}
		if (ccmaNames != null) {
			for (int i = 0; i < ccmaNames.length; i++) {
				if (i == 0 && ccmaNames.length == 1) {
					query += "AND (ccmaName = ? )";
				} else if (i== 0 && ccmaNames.length > 1) {
					query += "AND (ccmaName = ? ";
				} else if (i > 0 && i < (ccmaNames.length - 1)) {
					query += "OR ccmaName = ? ";
				} else if (i == (ccmaNames.length - 1)) {
					query += "OR ccmaName = ? )";
				}
			}
		}
		if (ccceNames != null) {
			for (int i = 0; i < ccceNames.length; i++) {
				if (i == 0 && ccceNames.length == 1) {
					query += "AND (ccceName like ? )";
				} else if (i== 0 && ccceNames.length > 1) {
					query += "AND (ccceName like ? ";
				} else if (i > 0 && i < (ccceNames.length - 1)) {
					query += "OR ccceName like ? ";
				} else if (i == (ccceNames.length - 1)) {
					query += "OR ccceName like ? )";
				}
			}
		}
		if (startYear != null) {
			query += "AND SUBSTR(CCBAASDT, 1, 4) >= ? ";
		}
		if (endYear != null) {
			query += "AND SUBSTR(CCBAASDT, 1, 4) <= ? ";
		}
		int countResult = 0;

		try {
			pstmt = conn.prepareStatement(query);
			int count = 1;
			if (ccbaMnm != null) {
				pstmt.setString(count++, "%" + ccbaMnm + "%");
			}
			if (ccbaCtcdNms != null) {
				for (int i = 0; i < ccbaCtcdNms.length; i++) {
					pstmt.setString(count++, ccbaCtcdNms[i]);
				}
			}
			if (gcodeNames != null) {
				for (int i = 0; i < gcodeNames.length; i++) {
					pstmt.setString(count++, gcodeNames[i]);
				}
			}
			if (ccmaNames != null) {
				for (int i = 0; i < ccmaNames.length; i++) {
					pstmt.setString(count++, ccmaNames[i]);
				}
			}
			if (ccceNames != null) {
				for (int i = 0; i < ccceNames.length; i++) {
					pstmt.setString(count++, "%" + ccceNames[i] + "%");
				}
			}
			if (startYear != null) {
				pstmt.setString(count++, startYear);
			}
			if (endYear != null) {
				pstmt.setString(count++, endYear);
			}

			rs = pstmt.executeQuery();
			if (rs.next()) {
				countResult = rs.getInt(1);
			}
			close(pstmt);
			close(rs);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		System.out.println(countResult);
		return countResult;
	}

	
	}

