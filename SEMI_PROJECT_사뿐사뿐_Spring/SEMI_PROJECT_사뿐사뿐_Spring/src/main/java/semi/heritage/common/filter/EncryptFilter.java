package semi.heritage.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import semi.heritage.common.wrapper.EncryptPasswordWrapper;

// 서블릿 이름에 따라도 필터링 가능
@WebFilter(filterName = "encryptFilter", servletNames = {"login", "enroll", "updatePwd"}  )
public class EncryptFilter implements Filter {
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		EncryptPasswordWrapper wrapper
						= new EncryptPasswordWrapper((HttpServletRequest)request);

		// 필터가 있으면 다음 필터 호출하거나 없으면 서블릿으로 최종 이동
		chain.doFilter(wrapper, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

}
