package semi.heritage.heritageInfo.api;

import static semi.heritage.common.jdbc.JDBCTemplate.*;

import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import semi.heritage.heritageInfo.dao.HeritageDao;
import semi.heritage.heritageInfo.vo.HeritageVideo;

public class HeritageVideoApi {

	public static String CURRENT_HERITAGE_INFO_URL = "http://www.cha.go.kr/cha/SearchKindOpenapiList.do";
	public static String CURRENT_HERITAGE_VIDEO = "http://www.cha.go.kr/cha/SearchVideoOpenapi.do";
	public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

	public static void main(String[] args) {
		HeritageVideoApi.callCurrentHeritageVideoByXML();
	}

	public static List<HeritageVideo> callCurrentHeritageVideoByXML() {

		List<HeritageVideo> list = new ArrayList<>();

		for (int j = 1; j < 167; j++) {

			try {
				StringBuilder urlBuilder = new StringBuilder();
				urlBuilder.append(CURRENT_HERITAGE_INFO_URL);
				urlBuilder.append("?" + "pageUnit=" + 100); // 첫 번째만 물음표로 설정
				urlBuilder.append("&" + "pageIndex=" + j);
				System.out.println(urlBuilder);

				URL url = new URL(urlBuilder.toString());
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestProperty("Content-type", "application/json");
				conn.setRequestProperty("Accept", "application/xml");

				int code = conn.getResponseCode(); // 실제 호출하는 부
				System.out.println("ResponseCode : " + code);
				if (code < 200 || code >= 300) {
					System.out.println("페이지가 잘못되었습니다.");
					return null;
				}

				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();
				Document doc = db.parse(conn.getInputStream()); //
				doc.normalizeDocument();

				NodeList nList = doc.getElementsByTagName("item");
				for (int i = 0; i < nList.getLength(); i++) {
					Node node = nList.item(i);

//					System.out.println("\nCurrent Element : " + node.getNodeName());
					if (node.getNodeType() == Node.ELEMENT_NODE) {

						Element eElement = (Element) node;
						
						int no = getIntData(eElement, "no");
						String ccbaKdcd = getStrData(eElement, "ccbaKdcd");
						String ccbaCtcd = getStrData(eElement, "ccbaCtcd");
						String ccbaAsno = getStrData(eElement, "ccbaAsno");
//--------------------------------------------------------------------------------------------------------

						URL url2 = new URL(HeritageVideoApi.heritageVideo_Url(ccbaKdcd, ccbaAsno, ccbaCtcd).toString());

						HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
						conn2.setRequestMethod("GET");
						conn2.setRequestProperty("Accept", "application/xml");
						int code2 = conn.getResponseCode(); // 실제 호출하는 부
						System.out.println("ResponseCode : " + code2);
						System.out.println(url2.toString());
						if (code2 < 200 || code2 > 300) {
							System.out.println("페이지가 잘못되었습니다.");
							return null;
						}

						DocumentBuilderFactory dbf2 = DocumentBuilderFactory.newInstance();
						DocumentBuilder db2 = dbf2.newDocumentBuilder();
						Document doc2 = db2.parse(conn2.getInputStream()); //
						doc2.normalizeDocument();

						NodeList items = doc2.getElementsByTagName("item");
						Element item = (Element) items.item(0);

						NodeList snList = item.getElementsByTagName("sn");
						NodeList videoUrlList = item.getElementsByTagName("videoUrl");

						for (int k = 0; k < snList.getLength(); k++) {
							int sn = k + 1;
							String videoUrl = ((Element) videoUrlList.item(k)).getTextContent();

							HeritageVideo heritagevideo = new HeritageVideo(0, videoUrl, sn, no, ccbaKdcd, ccbaCtcd,
									ccbaAsno);
							list.add(heritagevideo);
							System.out.println(heritagevideo.toString());
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;

	}

	private static String getStrData(Element eElement, String tagName) {
		try {
			return eElement.getElementsByTagName(tagName).item(0).getTextContent();
		} catch (Exception e) {
			return "-";
		}
	}

	private static int getIntData(Element eElement, String tagName) {
		try {
			return Integer.parseInt(eElement.getElementsByTagName(tagName).item(0).getTextContent());
		} catch (Exception e) {
			return 0;
		}
	}

	// 정보페이지 url만들어서 넘김
	public static StringBuffer heritageVideo_Url(String ccbaKdcd, String ccbaAsno, String ccbaCtcd) {
		StringBuffer infoUrl = new StringBuffer();
		infoUrl.append(CURRENT_HERITAGE_VIDEO);
		infoUrl.append("?" + "ccbaKdcd=" + ccbaKdcd);
		infoUrl.append("&" + "ccbaAsno=" + ccbaAsno);
		infoUrl.append("&" + "ccbaCtcd=" + ccbaCtcd);
//					System.out.println(infoUrl);

		return infoUrl;
	}
}
