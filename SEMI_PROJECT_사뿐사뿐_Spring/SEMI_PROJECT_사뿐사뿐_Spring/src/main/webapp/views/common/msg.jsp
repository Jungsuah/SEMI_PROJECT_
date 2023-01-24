 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String msg = (String) request.getAttribute("msg");
	String script = (String) request.getAttribute("script");
	String location = (String) request.getAttribute("location");
%>

<script type="text/javascript">
	// 알림 메세지
	alert('<%=msg%>');
	
	// 실행 시킬 스크립트
	if(<%= script != null %>){
		<%=script%>
	}
	
	// 페이지 이동
	location.replace('<%= request.getContextPath() + location %>');

</script>