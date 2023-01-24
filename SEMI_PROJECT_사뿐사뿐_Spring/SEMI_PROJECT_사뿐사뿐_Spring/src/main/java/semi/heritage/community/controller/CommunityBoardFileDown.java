package semi.heritage.community.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/community/fileDown")
public class CommunityBoardFileDown extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String originName = req.getParameter("originName");
		String reName = req.getParameter("reName");
		System.out.println(originName + "," + reName);
		
		String path = getServletContext().getRealPath("/resources/community/boardUpload");
		File downFile = new File(path, reName);
		
		FileInputStream fis = new FileInputStream(downFile);
		BufferedInputStream bis = new BufferedInputStream(fis);
		BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
	
		String header = req.getHeader("user-agent");
    	boolean isMSIE = header.contains("MSIE") || header.contains("Trident");
    	
    	String downName = null;
    	if (isMSIE) {
    		downName = URLEncoder.encode(originName, "UTF-8").replaceAll("\\+", "%20");
    	} else {    		
    		downName = new String(originName.getBytes("UTF-8"), "ISO-8859-1");
    	}
    	resp.setContentType("application/octec-stream");
    	resp.setHeader("Content-Disposition", "attachment;filename=" + downName);
    	
    	int read = 0;
    	while((read = bis.read()) != -1 ) {
    		bos.write(read);
    	}
   
    	bos.close();
    	bis.close();
    	fis.close();
    	
	}
}
