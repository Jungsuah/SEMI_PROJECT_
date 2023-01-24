package semi.heritage.event.api;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import semi.heritage.event.vo.Festival;


public class FestivalOpenApiManager {

	public static String Festival_INFO_URL = "http://www.cha.go.kr/cha/openapi/selectEventListOpenapi.do";

	public static void main(String[] args) {
		FestivalOpenApiManager.callFestivalListByXML();
	}

	public static List<Festival> callFestivalListByXML() throws NullPointerException{
		List<Festival> list = new ArrayList<>();
		try {
			for (int year = 2020; year < 2023; year++) {
				for (int month = 1; month < 13; month++) {
					StringBuilder urlBuilder = new StringBuilder();
					urlBuilder.append(Festival_INFO_URL);
					urlBuilder.append("?" + "searchYear=" + year);
					urlBuilder.append("&" + "amp;");
					urlBuilder.append("&" + "searchMonth=" + month);
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
					Document doc = db.parse(conn.getInputStream());
					doc.normalizeDocument();

					NodeList nList = doc.getElementsByTagName("item");
					for (int i = 0; i < nList.getLength(); i++) {
						Node node = nList.item(i);

						if (node.getNodeType() == Node.ELEMENT_NODE) {

							Element eElement = (Element) node;

							int seqNo = Integer
									.parseInt(eElement.getElementsByTagName("seqNo").item(0).getTextContent());
							String siteCode = eElement.getElementsByTagName("siteCode").item(0).getTextContent();
							String subTitle = eElement.getElementsByTagName("subTitle").item(0).getTextContent();
							String subContent = eElement.getElementsByTagName("subContent").item(0).getTextContent();
							String sDate = eElement.getElementsByTagName("sDate").item(0).getTextContent();
							String eDate = eElement.getElementsByTagName("eDate").item(0).getTextContent();
							String groupName = eElement.getElementsByTagName("groupName").item(0).getTextContent();
							String contact = eElement.getElementsByTagName("contact").item(0).getTextContent();
							String subDesc = eElement.getElementsByTagName("subDesc").item(0).getTextContent();
							String subPath = eElement.getElementsByTagName("subPath").item(0).getTextContent();
							String subDesc_2 = eElement.getElementsByTagName("subDesc_2").item(0).getTextContent();
							String subDesc_3 = eElement.getElementsByTagName("subDesc_3").item(0).getTextContent();
							String mainImageTemp = eElement.getElementsByTagName("mainImageTemp").item(0)
									.getTextContent();
							String sido = eElement.getElementsByTagName("sido").item(0).getTextContent();
							String gugun = eElement.getElementsByTagName("gugun").item(0).getTextContent();
							String subDate = eElement.getElementsByTagName("subDate").item(0).getTextContent();
//							String fileNm = eElement.getElementsByTagName("fileNm").item(0).getTextContent();
//							String filePath = eElement.getElementsByTagName("filePath").item(0).getTextContent();

							Festival festival = new Festival(seqNo, siteCode, subTitle, subContent, sDate, eDate,
									groupName, contact, subDesc, subPath, subDesc_2, subDesc_3, mainImageTemp, sido,
									gugun, subDate);
							list.add(festival);
							System.out.println(festival);

						}

					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

}
