package semi.heritage.heritageInfo.api;

import static semi.heritage.common.jdbc.JDBCTemplate.*;

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

import semi.heritage.heritageInfo.vo.HeritageImage;

public class HeritageImageApi {
	public static String CURRENT_HERITAGE_INFO_URL = "http://www.cha.go.kr/cha/SearchKindOpenapiList.do";
	public static String CURRENT_HERITAGE_IMAGE = "http://www.cha.go.kr/cha/SearchImageOpenapi.do";
	public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

	public static void main(String[] args) {
		HeritageImageApi.callCurrentHeritageImageByXML();
	}
	
	
	public static List<HeritageImage> callCurrentHeritageImageByXML() {

		List<HeritageImage> list = new ArrayList<>();

		for (int j = 1; j < 167; j++) {

			try {
				StringBuilder urlBuilder = new StringBuilder();
				urlBuilder.append(CURRENT_HERITAGE_INFO_URL);
				urlBuilder.append("?" + "pageUnit=" + 100);
				urlBuilder.append("&" + "pageIndex=" + j);
				System.out.println(urlBuilder);

				URL url = new URL(urlBuilder.toString());
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestProperty("Content-type", "application/json");
				conn.setRequestProperty("Accept", "application/xml");

				int code = conn.getResponseCode();
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

					if (node.getNodeType() == Node.ELEMENT_NODE) {

						Element eElement = (Element) node;
						
						int no = getIntData(eElement, "no");
						String ccbaKdcd = getStrData(eElement, "ccbaKdcd");
						String ccbaCtcd = getStrData(eElement, "ccbaCtcd");
						String ccbaAsno = getStrData(eElement, "ccbaAsno");
// ----------------------------------------------------------------------------------------------------------------------------
					
						
						URL url2 = new URL(HeritageImageApi.heritageImage_Url(ccbaKdcd, ccbaAsno, ccbaCtcd).toString());

						HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
						conn2.setRequestMethod("GET");
						conn2.setRequestProperty("Accept", "application/xml");
						int code2 = conn.getResponseCode();
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
						
						NodeList items =  doc2.getElementsByTagName("item");
						Element item = (Element) items.item(0);

						NodeList snList = item.getElementsByTagName("sn");
						NodeList imageUrlList = item.getElementsByTagName("imageUrl");
						NodeList ccimDescList = item.getElementsByTagName("ccimDesc");

						
						for(int k = 0; k <snList.getLength(); k++) {
							int sn = 		k+1;
							String imageUrl = ((Element)imageUrlList.item(k)).getTextContent();
							String ccimDesc = ((Element)ccimDescList.item(k)).getTextContent();
							
							HeritageImage heritageimage = new HeritageImage(0, imageUrl, ccimDesc, sn, no, ccbaKdcd,
									ccbaCtcd, ccbaAsno);
							list.add(heritageimage);
							System.out.println(heritageimage.toString());
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
	public static StringBuffer heritageImage_Url(String ccbaKdcd, String ccbaAsno, String ccbaCtcd) {
		StringBuffer infoUrl = new StringBuffer();
		infoUrl.append(CURRENT_HERITAGE_IMAGE);
		infoUrl.append("?" + "ccbaKdcd=" + ccbaKdcd);
		infoUrl.append("&" + "ccbaAsno=" + ccbaAsno);
		infoUrl.append("&" + "ccbaCtcd=" + ccbaCtcd);
//				System.out.println(infoUrl);

		return infoUrl;
	}
}
