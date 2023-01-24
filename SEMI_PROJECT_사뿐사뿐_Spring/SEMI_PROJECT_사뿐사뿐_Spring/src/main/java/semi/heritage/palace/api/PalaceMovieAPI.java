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

import semi.heritage.palace.vo.PalaceMovie;


public class PalaceMovieAPI {
	public static String palace_Jongmyo_Sangse_Movie_XML_URL = "";

	public static void main(String[] args) {
		PalaceMovieAPI.callPalaceJongmyoSangseListByXML();

	}

	public static List<PalaceMovie> callPalaceJongmyoSangseListByXML() {

		List<PalaceMovie> list = new ArrayList<>();

		for (int seq = 0; seq < 127; seq++) {
			palace_Jongmyo_Sangse_Movie_XML_URL = PalaceURLAPI.callPalaceJongmyoListByXML().get(seq)
					.getLink();

			try {
				StringBuffer urlBuffer = new StringBuffer();
				urlBuffer.append(palace_Jongmyo_Sangse_Movie_XML_URL);

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

						int serial_number = Integer
								.parseInt(eElement.getElementsByTagName("serial_number").item(0).getTextContent());
						int gung_number = Integer
								.parseInt(eElement.getElementsByTagName("gung_number").item(0).getTextContent());
						int detail_code = Integer
								.parseInt(eElement.getElementsByTagName("detail_code").item(0).getTextContent());

						// movieList 밑에 movieInfo밑에
						NodeList nList2 = doc.getElementsByTagName("movieInfo");
						for (int j = 0; j < nList2.getLength(); j++) {
							Node node2 = nList2.item(j);

							if (node2.getNodeType() == Node.ELEMENT_NODE) {
								Element eElement2 = (Element) node2;

								String movieIndex = eElement2.getElementsByTagName("movieIndex").item(0)
										.getTextContent();
								String movieContentsKor = eElement2.getElementsByTagName("movieContentsKor").item(0)
										.getTextContent();
								String movieContentsEng = eElement2.getElementsByTagName("movieContentsEng").item(0)
										.getTextContent();
								String movieContentsChi = eElement2.getElementsByTagName("movieContentsChi").item(0)
										.getTextContent();
								String movieContentsJpa = eElement2.getElementsByTagName("movieContentsJpa").item(0)
										.getTextContent();
								String movieUrlKor = eElement2.getElementsByTagName("movieUrlKor").item(0)
										.getTextContent();
								String movieUrlEng = eElement2.getElementsByTagName("movieUrlEng").item(0)
										.getTextContent();
								String movieUrlChi = eElement2.getElementsByTagName("movieUrlChi").item(0)
										.getTextContent();
								String movieUrlJpa = eElement2.getElementsByTagName("movieUrlJpa").item(0)
										.getTextContent();

								PalaceMovie pjsm = new PalaceMovie(serial_number,
										gung_number, detail_code, movieIndex, movieContentsKor, movieContentsEng,
										movieContentsChi, movieContentsJpa, movieUrlKor, movieUrlEng, movieUrlChi,
										movieUrlJpa);
								list.add(pjsm);

								System.out.println(pjsm.toString()); // 파싱 확인

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
