<%@page import="semi.heritage.community.vo.CommunityBoard"%>
<%@page import="semi.heritage.common.util.PageInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/headerLight.jsp" %>
<!-- 헤더 -->

<%
	List<CommunityBoard> list1 = (List<CommunityBoard>)request.getAttribute("list1");
	List<CommunityBoard> list2 = (List<CommunityBoard>)request.getAttribute("list2");
	List<CommunityBoard> list3 = (List<CommunityBoard>)request.getAttribute("list3");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	String type = (String)request.getAttribute("type");
	/* String searchType = "title"; */
	String searchType = "";
	String searchValue = "";
	String searchParamValue = request.getParameter("searchValue");
	if(searchParamValue != null && searchParamValue.length() > 0) {
		searchType = request.getParameter("searchType");
		searchValue = request.getParameter("searchValue");
	}
%>

<style>
	.etc1 {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		width: 500px;
	}
		
	.searchOption {
		width: 130px
		
	}
</style>
<!-- Hero-->
<section class="jarallax bg-dark zindex-1 py-xxl-5" data-jarallax data-speed="0.5"><span class="img-overlay bg-transparent opacity-80" style="background-image: linear-gradient(0deg, rgba(31, 27, 45, .7), rgba(31, 27, 45, .7));"></span>
    <div class="jarallax-img" style="background-image: url(<%=path%>/resources/img/semi-img/community.jpg);"></div>
    <div class="content-overlay container py-md-5">
        <div class="mt-5 mb-md-5 py-5">
            <div class="col-xl-6 col-lg-8 col-md-10 mx-auto mb-sm-5 mb-4 px-0 text-center">
                <h1 class="display-5 text-light mt-sm-5 my-4">사뿐사뿐<span class="dropdown d-inline-block ms-2"><a
          class="dropdown-toggle text-decoration-none" href="#" role="button" data-bs-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false" >커뮤니티</a><span
          class="dropdown-menu dropdown-menu-end my-1"><a
          class="dropdown-item fs-base fw-bold" href="<%=path%>/community/list?type=T">함께해요</a><a
          class="dropdown-item fs-base fw-bold" href="<%=path%>/community/list?type=H">역사연구소</a><a
          class="dropdown-item fs-base fw-bold" href="<%=path%>/community/list?type=F">자유게시판</a></span></span>
                </h1>
                <p class="fs-lg text-white">문화재 관람 및 행사를 함께하고, 우리의 역사를 함께 연구하고, 함께 자유로이 소통하는 공간</p>
            </div>
            <div class="col-xl-8 col-lg-9 col-md-10 mx-auto px-0">
            <!-- 검색창 Search form-->
             <form class="form-group d-block d-md-flex position-relative rounded-md-pill mb-2 mb-sm-4 mb-lg-5" action="<%=path%>/community/list" method="get">
                 <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3"><i class="fi-search"></i></span>
                     <input class="form-control" type="text" name="searchValue" value="<%=searchValue%>" placeholder="관심있는 내용을 검색해보세요!">
                 </div>
                 <hr class="d-md-none my-2">
                 <div class="d-sm-flex">
                     <div class="dropdown w-100 mb-sm-0 mb-3" data-bs-toggle="select">
                     <div class="col-12 searchOption">
                     	<select class="form-select" id="inline-form-select" name="searchType">
						    <option selected>검색옵션</option>
						    <option value="titleAndwriter">제목+글쓴이</option>
						    <option value="title">제목</option>
						    <option value="writer">글쓴이</option>
						    <option value="content">내용</option>
					    </select>
                     </div>
                     
                      </div>
                      <button class="btn btn-primary btn-lg rounded-pill w-100 w-md-auto ms-sm-3" type="button">Search</button>
                  </div>
              </form>
          </div>
      </div>
   </div>
   <div class="position-absolute d-none d-xxl-block bottom-0 start-0 w-100 bg-white zindex-1" style="border-top-left-radius: 30px; border-top-right-radius: 30px; height: 30px;"></div>
</section>
<section class="container pt-1 mt-1">
    <nav class="mb-2 pt-md-2" aria-label="breadcrumb">
        <section class="d-sm-flex justify-content-between pt-2">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="real-estate-home-v1.html"><i class="fi-home"></i> Home</a></li>
                <li class="breadcrumb-item"><a href="<%=path%>/community/main">커뮤니티</a></li>
                <li class="breadcrumb-item active" aria-current="page">전체 검색 결과</li>
            </ol>
        </section>
    </nav>
    <br>
    <div class="d-sm-flex align-items-center justify-content-between ">
        <h1 class="h2 mb-2"> <i class="fi-friends"></i> 함께해요</h1><a class="btn btn-link fw-normal p-0" href="<%=path%>/community/list?type=T&searchValue=<%=searchValue%>&searchType=<%=searchType%>">더보기<i class="fi-arrow-long-right ms-2"></i></a>
    </div>
    <hr>
    <div class="table-responsive">
        <table class="table" id="to_board" cellspacing="0">
            <tbody>
            	<%if(list1 == null || list1.isEmpty()) {%>
            		<%-- 게시글이 없는 상황 --%>
            		<tr>
            			<td colspan="4">
            				조회된 게시글이 없습니다.
            			</td>
            		</tr>
            	<%} else {%>
            		<%-- 게시글 리스트 시작 --%>
            		<%for(CommunityBoard b1 : list1) {%>
            			<tr>
            				<td>
            					<div class="etc1"><a style="text-decoration: none; color: black;" href="<%=path+"/community/view?type=T&boardNo="+b1.getNo()%>"><%=b1.getTitle() %></a></div>
            				</td>
            				<td><%=b1.getuName() %></td>
            				<%-- 게시판 추천은 없는 것이라서 임의로 작성일 넣음 --%>
            				<td><%=b1.getCreate_date() %></td>
            				<td><%=b1.getReply_count() %></td>
            			</tr>
            		<%} %>
            	<%} %>
            </tbody>
        </table>
    </div>
    <br>
    
    <div class="d-sm-flex align-items-center justify-content-between ">
        <h1 class="h2 mb-2"> <i class="fi-friends"></i>역사연구소</h1><a class="btn btn-link fw-normal p-0" href="<%=path%>/community/list?type=H&searchValue=<%=searchValue%>&searchType=<%=searchType%>">더보기<i class="fi-arrow-long-right ms-2"></i></a>
    </div>
    <hr>
    <div class="table-responsive">
        <table class="table" id="to_board" cellspacing="0">
            <tbody>
            	<%if(list2 == null || list2.isEmpty()) {%>
            		<%-- 게시글이 없는 상황 --%>
            		<tr>
            			<td colspan="4">
            				조회된 게시글이 없습니다.
            			</td>
            		</tr>
            	<%} else {%>
            		<%-- 게시글 리스트 시작 --%>
            		<%for(CommunityBoard b2 : list2) {%>
            			<tr>
            				<td>
            					<div class="etc1"><a style="text-decoration: none; color: black;" href="<%=path+"/community/view?type=H&boardNo="+b2.getNo()%>"><%=b2.getTitle() %></a></div>
            				</td>
            				<td><%=b2.getuName() %></td>
            				<%-- 게시판 추천은 없는 것이라서 임의로 작성일 넣음 --%>
            				<td><%=b2.getCreate_date() %></td>
            				<td><%=b2.getReply_count() %></td>
            			</tr>
            		<%} %>
            	<%} %>
            </tbody>
        </table>
    </div>
    
    <br>
    <div class="right table-responsive">
        <div class="d-sm-flex align-items-center justify-content-between ">
            <h1 class="h2 mb-2"><i class="fi-chat-right"></i> 자유게시판</h1><a class="btn btn-link fw-normal p-0" href="<%=path%>/community/list?type=F&searchValue=<%=searchValue%>&searchType=<%=searchType%>">더보기<i class="fi-arrow-long-right ms-2"></i></a>
        </div>
        <hr>
        <table class="table">
            <thead class="thead-light">
            </thead>
            <tbody>
                <%if(list3 == null || list3.isEmpty()) {%>
            		<%-- 게시글이 없는 상황 --%>
            		<tr>
            			<td colspan="4">
            				조회된 게시글이 없습니다.
            			</td>
            		</tr>
            	<%} else {%>
            		<%-- 게시글 리스트 시작 --%>
            		<%for(CommunityBoard b3 : list3) {%>
            			<tr>
            				<td>
            					<div class="etc1"><a style="text-decoration: none; color: black;" href="<%=path+"/community/view?type=F&boardNo="+b3.getNo()%>"><%=b3.getTitle() %></a></div>
            				</td>
            				<td><%=b3.getuName() %></td>
            				<%-- 게시판 추천은 없는 것이라서 임의로 작성일 넣음 --%>
            				<td><%=b3.getCreate_date() %></td>
            				<td><%=b3.getReply_count() %></td>
            			</tr>
            		<%} %>
            	<%} %>
            </tbody>
        </table>
    </div>
</section>

</main>
<br><br><br><br> 


<!-- 푸터 -->
<%@ include file="/views/common/footer.jsp" %>