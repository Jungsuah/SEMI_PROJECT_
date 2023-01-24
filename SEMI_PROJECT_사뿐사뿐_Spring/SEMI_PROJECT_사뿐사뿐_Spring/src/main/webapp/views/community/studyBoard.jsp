<%@page import="semi.heritage.common.util.PageInfo"%>
<%@page import="semi.heritage.community.vo.CommunityBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Header -->
<%@ include file="/views/common/headerLight.jsp" %>

<%
	List<CommunityBoard> list = (List<CommunityBoard>)request.getAttribute("list");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	String type = (String)request.getAttribute("type");
	String searchType = "title";
	String searchValue = "";
	String searchParamValue = request.getParameter("searchValue");
	if(searchParamValue != null && searchParamValue.length() > 0) {
		searchType = request.getParameter("searchType");
		searchValue = request.getParameter("searchValue");
	}
%>

<!-- 커뮤니티 검색바 -->
<%@ include file="/views/community/communityBar.jsp" %>

<section class="container pt-1 mt-1">
    <!-- Breadcrumb-->
    <nav class="mb-2 pt-md-2" aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<%=path%>/index.do"><i class="fi-home"></i> Home</a></li>
            <li class="breadcrumb-item"><a href="<%=path%>/community/main">커뮤니티</a></li>
            <li class="breadcrumb-item active" aria-current="page">역사연구소</li>
        </ol>
    </nav>
    <br>
    <!-- Light table head -->
    <div class="d-sm-flex align-items-center justify-content-between ">
        <h1 class="h2 mb-2"> <i class="fi-search"></i> 역사연구소</h1>
    </div>
    </h1>
    <div class="table-responsive">
        <table class="table" cellspacing="0" style="text-align:center">
            <thead class="thead-light">
                <tr>
                    <th>번호</th>
                    <th>글제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회</th>
                </tr>
            </thead>
            <tbody>
            	<%if(list == null || list.isEmpty()) {%>
           			<%-- 게시글이 없는 상황 --%>
           			<tr>
           				<td colspan="6">조회된 게시글이 없습니다.</td>
           			</tr> 
           		<%} else {%>
           			<%-- 게시글 리스트 시작 --%>
           			<%for(CommunityBoard b : list) {%>
           				<tr>
           					<td><%=b.getNo() %></td>
           					<td>
           						<a style="text-decoration: none; color: black;" href="<%=path+"/community/view?type=H&boardNo="+b.getNo()%>"><%=b.getTitle() %></a>
           					</td>
           					<td><%=b.getuName() %></td>
           					<td><%=b.getCreate_date() %></td>
           					<td><%=b.getReadCount() %></td>
           				</tr>
           			<%} %>
           			<%-- 게시글 리스트 끝 --%>
           		<%} %>
            </tbody>
        </table>
    </div>
    <div>
        <!--게시글 하단-->
        <div class="d-flex right-box">
            <!-- 게시글등록 버튼 Action buttons -->
            <a class="btn btn-primary btn-lg d-block right" href="<%=path%>/community/write">
                게시글등록</a>
        </div>
        <!-- 페이지 번호 Pagination-->
        <div class="d-flex left-box">
            <nav class="mt-2 mb-4" aria-label="Reviews pagination">
                <ul class="pagination">
                    <li class="page-item d-sm-none"><span class="page-link page-link-static">1 / 5</span></li>
                    
                    <%-- 처음으로 가기 --%>
                	<li class="page-item">
                		<a class="page-link" href="<%=path%>/community/list?type=H&page=<%=pageInfo.getStartPage()%>" aria-label="Next"><i
                            class="fi-chevrons-left"></i></a>
                	</li>
                
                	<%-- 이전으로 가기 --%>
                	<li class="page-item">
                		<a class="page-link" href="<%=path%>/community/list?type=H&page=<%=pageInfo.getPrvePage()%>" aria-label="Next"><i
                            class="fi-chevron-left"></i></a>
                	</li>
                    
                   	<%-- 10개 목록 출력하기 --%>
	               	<% for(int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++) {%>
						<%if(i == pageInfo.getCurrentPage()) {%>		
		                	<li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link"><%=i %><span class="visually-hidden">(current)</span></span>
		                	</li>
						<%} else {%>		
							<li class="page-item d-none d-sm-block"><a class="page-link" href="<%=path%>/community/list?type=H&page=<%=i%>"><%=i %></a></li>
						<%} %>		
					<%} %>
					
					<%-- 다음으로 가기 --%>
				<li class="page-item"><a class="page-link" href="<%=path%>/community/list?type=H&page=<%=pageInfo.getNextPage()%>" aria-label="Next"><i
                            class="fi-chevron-right"></i></a>
                </li>
                
				<%-- 마지막으로 가기 --%>
				<li class="page-item"><a class="page-link" href="<%=path%>/community/list?type=H&page=<%=pageInfo.getEndPage()%>" aria-label="Next"><i
                            class="fi-chevrons-right"></i></a>
                </li>
                    
                </ul>
            </nav>
        </div>
    </div>
</section>
<selection> <br><br><br><br><br><br><br><br><br></selection>

<!-- Footer-->
<%@include file="/views/common/footer.jsp"%>