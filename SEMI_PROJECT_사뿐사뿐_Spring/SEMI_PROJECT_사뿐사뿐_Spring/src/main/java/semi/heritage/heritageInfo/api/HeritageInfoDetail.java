package semi.heritage.heritageInfo.api;

import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import semi.heritage.heritageInfo.vo.Heritage;

public class HeritageInfoDetail {
	public static String CURRENT_HERITAGE_INFO_URL = "http://www.cha.go.kr/cha/SearchKindOpenapiList.do";
	public static String CURRENT_HERITAGE_INFO_DETAIL_URL = "http://www.cha.go.kr/cha/SearchKindOpenapiDt.do";
	public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

	public static void main(String[] args) {
//		practice4.heritageInfo_Url("1", "2", "3");
		HeritageInfoDetail.callCurrentHeritageListByXML();
	}
	
	public static List<Heritage> callCurrentHeritageListByXML() {
		List<Heritage> list = new ArrayList<>();
		
		for (int j = 1; j < 167; j++) {

			try {
				StringBuilder urlBuilder = new StringBuilder();
				urlBuilder.append(CURRENT_HERITAGE_INFO_URL);
				urlBuilder.append("?" + "pageUnit=" + 100); // 첫 번째만 물음표로 설정
				urlBuilder.append("&" + "pageIndex=" + j);

				URL url = new URL(urlBuilder.toString());
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestProperty("Content-type", "application/json");
				conn.setRequestProperty("Accept", "application/xml");

				int code = conn.getResponseCode(); // 실제 호출하는 부
//				System.out.println("ResponseCode : " + code);
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

						int sn = getIntData(eElement, "sn");
						int no = getIntData(eElement, "no");
						String ccmaName = getStrData(eElement, "ccmaName");
						int crltsnoNm = getIntData(eElement, "crltsnoNm");
						String ccbaMnm1 = getStrData(eElement, "ccbaMnm1");
						String ccbaMnm2 = getStrData(eElement, "ccbaMnm2");
						String ccbaCtcdNm = getStrData(eElement, "ccbaCtcdNm");
						String ccsiName = getStrData(eElement, "ccsiName");
						String ccbaAdmin = getStrData(eElement, "ccbaAdmin");
						String ccbaKdcd = getStrData(eElement, "ccbaKdcd");
						String ccbaCtcd = getStrData(eElement, "ccbaCtcd");
						String ccbaAsno = getStrData(eElement, "ccbaAsno");
						String ccbaCncl = getStrData(eElement, "ccbaCncl");
						String ccbaCpno = getStrData(eElement, "ccbaCpno");
						String longitude = getStrData(eElement, "longitude");
						String latitude = getStrData(eElement, "latitude");

						//-------------------------------------------------info 시작
						
						URL url2 = new URL(HeritageInfoDetail.heritageInfo_Url(ccbaKdcd, ccbaAsno, ccbaCtcd).toString());
						
//						System.out.println("url : " + url2);
						
						HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
//						conn2.setRequestProperty("Content-type", "application/json");
						conn2.setRequestProperty("Accept", "application/xml");

						int code2 = conn2.getResponseCode(); // 실제 호출하는 부
//						System.out.println("ResponseCode2 : " + code2);
						if (code2 < 200 || code2 >= 300) {
							System.out.println("페이지가 잘못되었습니다.");
							return null;
						}
						
						DocumentBuilderFactory dbf2 = DocumentBuilderFactory.newInstance();
						DocumentBuilder db2 = dbf2.newDocumentBuilder();
						Document doc2 = db2.parse(conn2.getInputStream()); //
						doc2.normalizeDocument();

						NodeList nList2 = doc2.getElementsByTagName("item");
						Node node2 = nList2.item(0);
						
//						System.out.println("\nCurrent Element2 : " + node.getNodeName());
						if (node2.getNodeType() == Node.ELEMENT_NODE) {
							Element eElement2 = (Element) node2;
							
							String gcodeName = getStrData(eElement2, "gcodeName");
							String bcodeName = getStrData(eElement2, "bcodeName");
							String mcodeName = getStrData(eElement2, "mcodeName");
							String scodeName = getStrData(eElement2, "scodeName");
							String ccbaQuan = getStrData(eElement2, "ccbaQuan");
							String ccbaAsdt = getStrData(eElement2, "ccbaAsdt");
							String ccbaLcad = getStrData(eElement2, "ccbaLcad").trim();
							String ccceName = getStrData(eElement2, "ccceName");
							String ccbaPoss = getStrData(eElement2, "ccbaPoss").trim();
							String imageUrl = getStrData(eElement2, "imageUrl");
							String content = getStrData(eElement2, "content");
							Heritage heritage = new Heritage(sn, no, ccmaName, crltsnoNm, ccbaMnm1, ccbaMnm2, 
									ccbaCtcdNm, ccsiName, ccbaAdmin, ccbaKdcd, ccbaCtcd, ccbaAsno, ccbaCncl, ccbaCpno, 
									longitude, latitude, gcodeName, bcodeName, mcodeName, scodeName, ccbaQuan, ccbaAsdt, 
									ccbaLcad, ccceName, ccbaPoss, imageUrl, content);
							list.add(heritage);
							System.out.println(list.toString());
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
	public static StringBuffer heritageInfo_Url(String ccbaKdcd, String ccbaAsno, String ccbaCtcd) {
		StringBuffer infoUrl = new StringBuffer();
		infoUrl.append(CURRENT_HERITAGE_INFO_DETAIL_URL);
		infoUrl.append("?" + "ccbaKdcd=" + ccbaKdcd);
		infoUrl.append("&" + "ccbaAsno=" + ccbaAsno);
		infoUrl.append("&" + "ccbaCtcd=" + ccbaCtcd);
//			System.out.println(infoUrl);
		
		
		return infoUrl;
		
	}
	
	
	
	
	
}
