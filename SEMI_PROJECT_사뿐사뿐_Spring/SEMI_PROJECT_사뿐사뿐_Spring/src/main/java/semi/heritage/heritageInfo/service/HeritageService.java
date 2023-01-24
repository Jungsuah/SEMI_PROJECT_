package semi.heritage.heritageInfo.service;

import static semi.heritage.common.jdbc.JDBCTemplate.close;
import static semi.heritage.common.jdbc.JDBCTemplate.commit;
import static semi.heritage.common.jdbc.JDBCTemplate.getConnection;
import static semi.heritage.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import semi.heritage.common.util.PageInfo;
import semi.heritage.heritageInfo.dao.HeritageDao;
import semi.heritage.heritageInfo.vo.HeritageImage;
import semi.heritage.heritageInfo.vo.HeritageMain;
import semi.heritage.heritageInfo.vo.Heritage;
import semi.heritage.heritageInfo.vo.HeritageVideo;

public class HeritageService {

	private HeritageDao dao = new HeritageDao();
	private Connection conn = null;

	public HeritageService() {
		conn = getConnection();
	}

	public int insert(Heritage heritageVO) {
		Connection conn = getConnection();
		int result = dao.insert(conn, heritageVO);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		try {
			Thread.sleep(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		close(conn);
		return result;
	}

	public int insertImage(HeritageImage heritageimage) {
		Connection conn = getConnection();
		int result = dao.insertImage(conn, heritageimage);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		try {
			Thread.sleep(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		close(conn);
		return result;
	}

	public int insertVideo(HeritageVideo heritagevideo) {
		Connection conn = getConnection();
		int result = dao.insertVideo(conn, heritagevideo);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		try {
			Thread.sleep(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		close(conn);
		return result;
	}

	// 이름으로 검색한 문화재 갯수
	public int getHeritageMainVOCount(String ccbaMnm) {
		Connection conn = getConnection();
		int result = dao.getHeritageMainVOCount(conn, ccbaMnm);
		close(conn);
		return result;
	}

	// 메인 인기문화명소
	public List<HeritageMain> mainByFavorite() {
		Connection conn = getConnection();
		List<HeritageMain> list = dao.mainByFavorite(conn);
		close(conn);
		return list;
	}

	// 메인 이름 검색
	public List<HeritageMain> selectByHeritageName(String ccbaMnm, PageInfo pageInfo) {
		Connection conn = getConnection();
		List<HeritageMain> list = dao.selectByHeritageName(conn, ccbaMnm, pageInfo);
		close(conn);
		return list;
	}

	// 문화재에서 no로 상세조회
	public Heritage findHertiageByNo(int hertiageNo) {
		Connection conn = getConnection();
		Heritage hv = dao.findHertiageByNo(conn, hertiageNo);
		return hv;
	}

	// 문화재 이미지에서 no로 상세조회
	public List<HeritageImage> findHeritageImageByNo(int imageNo) {
		Connection conn = getConnection();
		List<HeritageImage> hi = dao.findHeritageImageByNo(conn, imageNo);
		return hi;
	}

	// 문화재 비디오에서 no로 상세조회
    public String findHeritageVideoByNo(int videoNo) {
        Connection conn = getConnection();
        String hv = dao.findHeritageVideoByNo(conn, videoNo);
            return hv;
    }
    
	// 문화재 검색페이지 리스트를 가져오는 메소드
	public List<Heritage> findAll(PageInfo pageInfo, String ccbaMnm, String[] ccbaCtcdNm, String[] gcodeName,
			String[] ccmaName, String[] ccceName, String startYear, String endYear) {
		Connection conn = getConnection();
		List<Heritage> findAllList = dao.findAll(conn, pageInfo, ccbaMnm, ccbaCtcdNm, gcodeName, ccmaName, ccceName,
				startYear, endYear);
		close(conn);
		return findAllList;
	}

	// 문화재 검색페이지 리스트 갯수
	public int getFindAllCount(String ccbaMnm, String[] ccbaCtcdNm, String[] gcodeName, String[] ccmaName,
			String[] ccceName, String startYear, String endYear) {
		Connection conn = getConnection();
		int countResult = dao.getFindAllCount(conn, ccbaMnm, ccbaCtcdNm, gcodeName, ccmaName, ccceName, startYear,
				endYear);
		close(conn);
		return countResult;
	}

}
