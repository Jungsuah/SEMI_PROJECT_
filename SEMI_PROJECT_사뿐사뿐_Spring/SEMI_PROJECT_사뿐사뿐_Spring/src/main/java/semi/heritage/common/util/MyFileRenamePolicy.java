package semi.heritage.common.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import com.oreilly.servlet.multipart.FileRenamePolicy;

/**
 * 파일 이름을 변경하기 위한 규칙 재정의
 *  -> 한글처리로 인해서 파일 이름이 한글 아닌 파일로 변경해야한다. 
 */
public class MyFileRenamePolicy implements FileRenamePolicy{

	private static int sequenceNumber = 0;
	@Override
	public File rename(File originalPhoto) {
		// 파일 이름을 삭제, 일자와 시간, 고유번호로 이름을 재생성
		// 오래된 파일의 경우 주기적 삭제 또는 경로 변경이 필요
		
		String dateStr = new SimpleDateFormat("yyyyMMdd_hhmmss").format(new Date());
		String sequenceStr = "" + (sequenceNumber++);
		String randomStr = "" + new Random().nextInt(1000);
		String extensionStr = ""; // 확장자 .exe .pdf .ppt

		try {
			String oldName = originalPhoto.getName(); // test.pdf a.out
			int extensionIndex = oldName.lastIndexOf(".");
			extensionStr = oldName.substring(extensionIndex, oldName.length());
		} catch (Exception e) {}

		
		String renamedPhoto = dateStr + "_" +sequenceStr + "_" + randomStr + extensionStr;
		File newPhoto = new File(originalPhoto.getParent(), renamedPhoto);
		
		return newPhoto;
	}

}
