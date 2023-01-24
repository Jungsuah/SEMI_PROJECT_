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

import semi.heritage.palace.vo.PalaceURL;


public class PalaceURLAPI {
	public static String palace_Jongmyo_XML_URL = "http://www.heritage.go.kr/heri/gungDetail/gogungListOpenApi.do";

	public static void main(String[] args) {
		PalaceURLAPI.callPalaceJongmyoListByXML();
	}

	public static List<PalaceURL> callPalaceJongmyoListByXML() {
		List<PalaceURL> list = new ArrayList<>();

		try {
			StringBuffer urlBuffer = new StringBuffer();
			urlBuffer.append(palace_Jongmyo_XML_URL);

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

			NodeList nList = doc.getElementsByTagName("list");
			for (int i = 0; i < nList.getLength(); i++) {
				Node node = nList.item(i);

				if (node.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) node;

					String link = eElement.getElementsByTagName("link").item(0).getTextContent();

					PalaceURL pj = new PalaceURL(link);
					list.add(pj);

//					System.out.println(pj.toString()); // 확인

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}
}
