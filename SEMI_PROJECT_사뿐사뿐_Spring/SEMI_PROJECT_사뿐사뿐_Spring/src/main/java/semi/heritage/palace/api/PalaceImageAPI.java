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

import semi.heritage.palace.vo.PalaceImage;


public class PalaceImageAPI {
	public static String palace_Jongmyo_Sangse_Image_XML_URL = "";

	public static void main(String[] args) {
		PalaceImageAPI.callPalaceJongmyoSangseListByXML();

	}

	public static List<PalaceImage> callPalaceJongmyoSangseListByXML() {

		List<PalaceImage> list = new ArrayList<>();
		for (int seq = 0; seq < 127; seq++) {
			palace_Jongmyo_Sangse_Image_XML_URL = PalaceURLAPI.callPalaceJongmyoListByXML().get(seq)
					.getLink();

			try {
				StringBuffer urlBuffer = new StringBuffer();
				urlBuffer.append(palace_Jongmyo_Sangse_Image_XML_URL);

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

				//
				NodeList nList = doc.getElementsByTagName("result");
				for (int i = 0; i < nList.getLength(); i++) {
					Node node = nList.item(i);

					if (node.getNodeType() == Node.ELEMENT_NODE) {
						Element eElement = (Element) node;

						int serial_number = Integer
								.parseInt(eElement.getElementsByTagName("serial_number").item(0).getTextContent());
						int gung_number = Integer
								.parseInt(eElement.getElementsByTagName("gung_number").item(0).getTextContent());
						int detail_code = Integer
								.parseInt(eElement.getElementsByTagName("detail_code").item(0).getTextContent());
						
						
						// imageList 밑에 imageInfo밑에
						NodeList nList2 = doc.getElementsByTagName("imageInfo");
						for (int j = 0; j < nList2.getLength(); j++) {
							Node node2 = nList2.item(j);

							if (node2.getNodeType() == Node.ELEMENT_NODE) {
								Element eElement2 = (Element) node2;

								String imageIndex = eElement2.getElementsByTagName("imageIndex").item(0)
										.getTextContent();
								String imageContentsKor = eElement2.getElementsByTagName("imageContentsKor").item(0)
										.getTextContent();
								String imageContentsEng = eElement2.getElementsByTagName("imageContentsEng").item(0)
										.getTextContent();
								String imageContentsChi = eElement2.getElementsByTagName("imageContentsChi").item(0)
										.getTextContent();
								String imageContentsJpa = eElement2.getElementsByTagName("imageContentsJpa").item(0)
										.getTextContent();
								String imageExplanationKor = eElement2.getElementsByTagName("imageExplanationKor")
										.item(0).getTextContent();
								String imageExplanationEng = eElement2.getElementsByTagName("imageExplanationEng")
										.item(0).getTextContent();
								String imageExplanationChi = eElement2.getElementsByTagName("imageExplanationChi")
										.item(0).getTextContent();
								String imageExplanationJpa = eElement2.getElementsByTagName("imageExplanationJpa")
										.item(0).getTextContent();
								String imageUrl = eElement2.getElementsByTagName("imageUrl").item(0).getTextContent();

								PalaceImage pjsi = new PalaceImage(
										serial_number, gung_number,detail_code, imageIndex, imageContentsKor, imageContentsEng,
										imageContentsChi, imageContentsJpa, imageExplanationKor, imageExplanationEng,
										imageExplanationChi, imageExplanationJpa, imageUrl.trim());
								list.add(pjsi);

								System.out.println(pjsi.toString()); // 파싱 확인

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
