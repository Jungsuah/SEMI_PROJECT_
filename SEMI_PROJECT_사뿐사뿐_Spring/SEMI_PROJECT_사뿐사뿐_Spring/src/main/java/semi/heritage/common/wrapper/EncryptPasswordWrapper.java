package semi.heritage.common.wrapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import semi.heritage.common.util.EncryptUtil;


// Filter vs Wrapper
// Filter大  : 서블릿 이름이나 URL 패턴을 통해 사용자의 요청와 응답에 대한 전처리를 진행할수 있는 부
//             필터링 = 욕설 필터링. 무슨무슨 자식 = XXXX XX
// Wrapper小 : 국소적으로 특정 파라메터나 인자를 전처리 해주는 부분
//             암호 처리, 주민번호 처리

public class EncryptPasswordWrapper extends HttpServletRequestWrapper{

	public EncryptPasswordWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		String value = super.getParameter(name);
		
		if(name.equals("userPwd")) {
			value = EncryptUtil.oneWayEnc(value, "SHA-256");
		}
		return value;
	}
}
