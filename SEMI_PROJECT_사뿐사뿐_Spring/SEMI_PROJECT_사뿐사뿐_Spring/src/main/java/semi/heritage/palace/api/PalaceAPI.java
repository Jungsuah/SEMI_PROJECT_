package semi.heritage.palace.api;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import semi.heritage.palace.vo.Palace;

public class PalaceAPI {
	public static String palace_Jongmyo_Sangse_XML_URL = "";
	// ?serial_number=0&detail_code=0&gung_number=3

	public static void main(String[] args) {
		PalaceAPI.callPalaceJongmyoSangseListByXML();

	}

	public static List<Palace> callPalaceJongmyoSangseListByXML() {
		List<Palace> list = new ArrayList<>();

		for (int seq = 0; seq < 127; seq++) {
			palace_Jongmyo_Sangse_XML_URL = PalaceURLAPI.callPalaceJongmyoListByXML().get(seq).getLink();

			try {
				StringBuffer urlBuffer = new StringBuffer();
				urlBuffer.append(palace_Jongmyo_Sangse_XML_URL);

				URL url = new URL(urlBuffer.toString());
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestProperty("Accept", "application/xml");

				int code = conn.getResponseCode();

				if (code < 200 || code >= 300) {
					System.out.println("페이지가 잘못되었습니다.");
					return null;
				}

				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();

				Document doc = db.parse(conn.getInputStream());

				doc.getDocumentElement().normalize();

				NodeList nList = doc.getElementsByTagName("result");
				for (int i = 0; i < nList.getLength(); i++) {
					Node node = nList.item(i);

					if (node.getNodeType() == Node.ELEMENT_NODE) {
						Element eElement = (Element) node;

						int seq_pj_ss = seq + 1;
						int serial_number = Integer
								.parseInt(eElement.getElementsByTagName("serial_number").item(0).getTextContent());
						int gung_number = Integer
								.parseInt(eElement.getElementsByTagName("gung_number").item(0).getTextContent());
						int detail_code = Integer
								.parseInt(eElement.getElementsByTagName("detail_code").item(0).getTextContent());
						String contents_kor = eElement.getElementsByTagName("contents_kor").item(0).getTextContent();
						String contents_eng = eElement.getElementsByTagName("contents_eng").item(0).getTextContent();
						String contents_jpa = eElement.getElementsByTagName("contents_jpa").item(0).getTextContent();
						String contents_chi = eElement.getElementsByTagName("contents_chi").item(0).getTextContent();
						String explanation_kor = eElement.getElementsByTagName("explanation_kor").item(0)
								.getTextContent();
						String explanation_eng = eElement.getElementsByTagName("explanation_eng").item(0)
								.getTextContent();
						String explanation_jpa = eElement.getElementsByTagName("explanation_jpa").item(0)
								.getTextContent();
						String explanation_chi = eElement.getElementsByTagName("explanation_chi").item(0)
								.getTextContent();

						// imgUrl
						NodeList nList2 = doc.getElementsByTagName("mainImage");
						for (int j = 0; j < nList2.getLength(); j++) {
							Node node2 = nList2.item(j);

							if (node2.getNodeType() == Node.ELEMENT_NODE) {
								Element eElement2 = (Element) node2;

								String imgUrl = eElement.getElementsByTagName("imgUrl").item(0)
										.getTextContent();

								Palace pjs = new Palace(seq_pj_ss, serial_number,
										gung_number, detail_code, contents_kor, contents_eng, contents_jpa,
										contents_chi, explanation_kor, explanation_eng, explanation_jpa,
										explanation_chi, imgUrl.trim());
								list.add(pjs);

								System.out.println(pjs.toString()); // 파싱 확인

							}
						}
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

}
