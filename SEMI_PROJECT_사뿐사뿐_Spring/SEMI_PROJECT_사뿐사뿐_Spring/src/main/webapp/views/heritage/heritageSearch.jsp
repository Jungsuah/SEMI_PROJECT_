<%@page import="java.util.Arrays"%>
<%@page import="semi.heritage.heritageInfo.vo.Heritage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="semi.heritage.common.util.PageInfo"%>
<%@page import="semi.heritage.heritageInfo.vo.HeritageMain"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/views/common/headerLight.jsp"%>

<style>
	/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3);}
	
	.input_text{width: calc( 60% - 14px); margin: 6px 7px; height: 30px; text-align:center;
           		  border: 0; font-weight: bold; font-size: 16px; outline: none;}
    .sch_smit{width: 54px; height: 40px; margin: 0; border: 0; 
        		background: #007dd1; color: white; font-weight: bold; border-radius: 1px; cursor: pointer;}
    .sch_smit:hover{background: #007daa;}
</style>
  <!-- 문화재 리스트 출력페이지 -->
<%
       List<Heritage> findAllList = (List<Heritage>)request.getAttribute("findAllList");
       List<Integer> allFavlist = (List<Integer>)request.getAttribute("allFavlist"); // 문화재 리스트에서 문화재 찜개수만 가지는 list

       PageInfo pageInfo  = (PageInfo)request.getAttribute("pageInfo");

       String searchValue = "";
       String ccbaCtcdNms[] = null;
       String gcodeNames[] = null;
       String ccmaNames[] = null;
       String ccceNames[] = null;
       String startYear = "";
       String endYear = "";
       List<String> region = new ArrayList<String>();
       List<String> type = new ArrayList<String>();
       List<String> designated = new ArrayList<String>();
       List<String> age = new ArrayList<String>();


       searchValue = request.getParameter("searchValue");
       if(searchValue == null){
       	searchValue = "";
       }

       ccbaCtcdNms  = request.getParameterValues("region");
       if(ccbaCtcdNms != null){
       	region = new ArrayList<>(Arrays.asList(ccbaCtcdNms));
       }else{
       	region = new ArrayList<>();
       }

       gcodeNames  = request.getParameterValues("type");
       if(gcodeNames != null){
       	type = new ArrayList<>(Arrays.asList(gcodeNames));
       }else{
       	type = new ArrayList<>();
       }

       ccmaNames  = request.getParameterValues("designated");
       if(ccmaNames != null){
       	designated = new ArrayList<>(Arrays.asList(ccmaNames));
       }else{
       	designated = new ArrayList<>();
       }

       ccceNames  = request.getParameterValues("age");
       if(ccceNames != null){
       	age = new ArrayList<>(Arrays.asList(ccceNames));
       }else{
       	age = new ArrayList<>();
       }


       	startYear = request.getParameter("startYear");
       	if(startYear == null){
       		startYear = "";
       	}
       	endYear = request.getParameter("endYear");
       	if(endYear == null){
       		endYear = "";
       	}

       int getFindAllCount = (Integer)request.getAttribute("getFindAllCount");
       int allFavoriteNum = (Integer)request.getAttribute("allFavoriteNum");
       int uNo = (Integer)request.getAttribute("uNo");
       %>

 		<form action="<%=path%>/heritageSearch.do" method="get">
                       
        <section class="jarallax bg-dark zindex-1 py-xxl-5" data-jarallax data-speed="0.5"><span class="img-overlay bg-transparent opacity-5 image-bg-cover"></span>
            <div class="jarallax-img container-fluid image-bg-cover" style="background-image: url(<%=path%>/resources/img/semi-img/mainPic2.jpg);"></div>
            <div class="content-overlay container ">
                <div class="mt-3 mb-md-3 py-3 ">
                    <div class="mb-sm-5 mb-4 px-0 text-left pt-1 p02">
                        <br><br><br><br><br><br><br><br><br><br><br><br><br>
                        <b>
                        <h1 class="display-1 text-white text-left "><span class="p01">문화재 검색</span></h1>
                        </b>
                    </div>
                    <div class="mx-auto px-0" style="margin-bottom: -3%">
                        <!-- Search form-->
                        <div class="form-group d-block d-md-flex position-relative rounded-md-pill mb-2 mb-sm-4 mb-lg-5 p01">
                            <div class="input-group input-group-lg"><span class="input-group-text text-muted rounded-pill ps-3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fi-search" style="font-size: 21px;"></i></span>
                                <input class="form-control p03" type="text" id="searchValue" name="searchValue" value = "<%=searchValue%>" style="font-size: 25px;" placeholder="&nbsp;&nbsp;우리의 문화유산, 어디까지 가봤니 ?">
                            </div>
                            <hr class="d-md-none my-2"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="submit" class="btn btn-primary btn-lg rounded-pill w-100 w-md-auto ms-sm-10" style="background-color: #D97793; font-size: 22px;" type="button">&nbsp;&nbsp;검&nbsp;&nbsp;색&nbsp;&nbsp;</button>&nbsp;
                 		</div>
                    </div>
                    <br><br><br><br>
        </section>
        <div class="container mt-auto">
            <div class="position-relative overflow-hidden pb-5 pt-4 px-3">
                <!-- Breadcrumb-->
                <br><br><br>
                <div class="bg-light shadow-lg rounded-3 p-4 mt-n5 mb-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="dropdown me-2"><a class="btn btn-outline-secondary dropdown-toggle" href="#shop-filters" data-bs-toggle="collapse"><i class="ci-filter me-2"></i>Filters</a></div>
                        <div class=" me-2"><a class="btn btn-outline-secondary" onClick="window.location.reload()">초기화</a></div>
                    </div>
                    <!-- 필터링기능 시작-->
                    <div class="collapse" id="shop-filters">
                        <div class="row pt-4">
                            <div class="col-lg-4 col-sm-6">
                                <!-- Categories-->
                                <div class="card mb-grid-gutter">
                                    <div class="card-body px-4">
                                        <div class="widget widget-categories">
                                            <!-- <h3 class="widget-title">Categories</h3> -->
                                            <div class="accordion mt-n1" id="shop-categories">
                                                <!-- 지역 -->
                                                <div class="accordion-item">
                                                    <h3 class="accordion-header"><a class="accordion-button collapsed" href="#shoes" role="button" data-bs-toggle="collapse" aria-expanded="false" aria-controls="shoes">지역</a></h3>
                                                    <div class="accordion-collapse collapse" id="shoes" data-bs-parent="#shop-categories">
                                                        <div class="accordion-body">
                                                            <div class="widget widget-links widget-filter">
                                                                <ul class="widget-list widget-filter-list list-unstyled pt-1" style="max-height: 11.5rem;" data-simplebar data-simplebar-auto-hide="false">
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="regionAll" name="regionAll" value="regionAll" onclick="regionAll(this)" checked>
                                                                            <label class="form-check-label widget-filter-item-text" for="regionAll">전체</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="1" name="region" value="서울" onclick='regionCheckSelectAll()' <%=region.contains( "서울") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="1">서울</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="2" name="region" value="부산" onclick='regionCheckSelectAll()' <%=region.contains( "부산") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="2">부산</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="3" name="region" value="대구" onclick='regionCheckSelectAll()' <%=region.contains( "대구") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="3">대구</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="4" name="region" value="인천" onclick='regionCheckSelectAll()' <%=region.contains( "인천") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="4">인천</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="5" name="region" value="광주" onclick='regionCheckSelectAll()' <%=region.contains( "광주") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="5">광주</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="6" name="region" value="대전" onclick='regionCheckSelectAll()' <%=region.contains( "대전") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="6">대전</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="7" name="region" value="울산" onclick='regionCheckSelectAll()' <%=region.contains( "울산") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="7">울산</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="8" name="region" value="세종" onclick='regionCheckSelectAll()' <%=region.contains( "세종") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="8">세종</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="9" name="region" value="경기" onclick='regionCheckSelectAll()' <%=region.contains( "경기") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="9">경기</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="10" name="region" value="강원" onclick='regionCheckSelectAll()' <%=region.contains( "강원") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="10">강원</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="11" name="region" value="충북" onclick='regionCheckSelectAll()' <%=region.contains( "충북") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="11">충북</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="12" name="region" value="충남" onclick='regionCheckSelectAll()' <%=region.contains( "충남") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="12">충남</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="13" name="region" value="전북" onclick='regionCheckSelectAll()' <%=region.contains( "전북") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="13">전북</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="14" name="region" value="전남" onclick='regionCheckSelectAll()' <%=region.contains( "전남") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="14">전남</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="15" name="region" value="경북" onclick='regionCheckSelectAll()' <%=region.contains( "경북") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="15">경북</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="16" name="region" value="경남" onclick='regionCheckSelectAll()' <%=region.contains( "경남") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="16">경남</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="17" name="region" value="제주" onclick='regionCheckSelectAll()' <%=region.contains( "제주") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="17">제주</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="18" name="region" value="전국일원" onclick='regionCheckSelectAll()' <%=region.contains( "전국일원") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="18">전국일원</label>
                                                                        </div>
                                                                    </li>

                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- 지정종목 -->
                                                <div class="accordion-item">
                                                    <h3 class="accordion-header"><a class="accordion-button" href="#clothing" role="button" data-bs-toggle="collapse" aria-expanded="true" aria-controls="clothing">지정종목</a></h3>
                                                    <div class="accordion-collapse collapse show" id="clothing" data-bs-parent="#shop-categories">
                                                        <div class="accordion-body">
                                                            <div class="widget widget-links widget-filter">
                                                                <ul class="widget-list widget-filter-list list-unstyled pt-1" style="max-height: 11.5rem;" data-simplebar data-simplebar-auto-hide="false">
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="designatedAll" name="designatedAll" value="전체" onclick="designatedAll(this)" <%=designated.contains( "전체") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="designatedAll">전체</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="19" name="designated" value="국보" onclick='designatedCheckSelectAll()' <%=designated.contains( "국보") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="19">국보</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="20" name="designated" value="보물" onclick='designatedCheckSelectAll()' <%=designated.contains( "보물") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="20">보물</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="21" name="designated" value="사적" onclick='designatedCheckSelectAll()' <%=designated.contains( "사적") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="21">사적</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="22" name="designated" value="사적및명승" onclick='designatedCheckSelectAll()' <%=designated.contains( "사적및명승") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="22">사적및명승</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="23" name="designated" value="명승" onclick='designatedCheckSelectAll()' <%=designated.contains( "명승") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="23">명승</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="24" name="designated" value="천연기념물" onclick='designatedCheckSelectAll()' <%=designated.contains( "천연기념물") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="24">천연기념물</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="25" name="designated" value="국가무형문화재" onclick='designatedCheckSelectAll()' <%=designated.contains( "국가무형문화재") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="25">국가무형문화재</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="26" name="designated" value="국가민속문화재" onclick='designatedCheckSelectAll()' <%=designated.contains( "국가민속문화재") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="26">국가민속문화재</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="27" name="designated" value="시도유형문화재" onclick='designatedCheckSelectAll()' <%=designated.contains( "시도유형문화재") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="27">시도유형문화재</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="28" name="designated" value="시도기념물" onclick='designatedCheckSelectAll()' <%=designated.contains( "시도기념물") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="28">시도기념물</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="29" name="designated" value="시도민속문화재" onclick='designatedCheckSelectAll()' <%=designated.contains( "시도민속문화재") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="29">시도민속문화재</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="30" name="designated" value="시도등록문화재" onclick='designatedCheckSelectAll()' <%=designated.contains( "시도등록문화재") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="30">시도등록문화재</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="30" name="designated" value="문화재자료" onclick='designatedCheckSelectAll()' <%=designated.contains( "문화재자료") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="30">문화재자료</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="30" name="designated" value="국가등록문화재" onclick='designatedCheckSelectAll()' <%=designated.contains( "국가등록문화재") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="30">국가등록문화재</label>
                                                                        </div>
                                                                    </li>
                                                                    <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                                        <div class="form-check">
                                                                            <input class="form-check-input" type="checkbox" id="31" name="designated" value="이북5도 무형문화재" onclick='designatedCheckSelectAll()' <%=designated.contains( "이북5도 무형문화재") ? "checked" : "" %>>
                                                                            <label class="form-check-label widget-filter-item-text" for="31">이북5도 무형문화재</label>
                                                                        </div>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <!-- 지정연도 -->
                                <div class="card mb-grid-gutter">
                                    <div class="card-body px-4">
                                        <div class="widget">
                                            <h3 class="widget-title">지정연도</h3>
                                            <div class="range-slider" data-start-min="0" data-start-max="2022" data-min="0" data-max="2022" data-step="1">
                                                <div class="range-slider-ui"></div>
                                                <div class="d-flex pb-1">
                                                    <div class="w-50 pe-2 me-2">
                                                        <div class="input-group input-group-sm">
                                                            <input class="form-control range-slider-value-min" type="text" id="startYear" name="startYear" value="<%=startYear%>"><span class="input-group-text">년</span>
                                                        </div>
                                                    </div>
                                                    <div class="w-50 ps-2">
                                                        <div class="input-group input-group-sm">
                                                            <input class="form-control range-slider-value-max" type="text" id="endYear"  name="endYear" value="<%=endYear%>"><span class="input-group-text">년</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 시대-->
                                <div class="card mb-grid-gutter">
                                    <div class="card-body px-4">
                                        <div class="widget widget-filter">
                                            <h3 class="widget-title">시대</h3>
                                            <ul class="widget-list widget-filter-list list-unstyled pt-1" style="max-height: 11rem;" data-simplebar data-simplebar-auto-hide="false">
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="ageAll" name="ageAll" value="전체" onclick='ageAll(this)' <%=age.contains( "전체") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="ageAll">전체</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="32" name="age" value="선사" onclick='ageCheckSelectAll()' <%=age.contains( "선사") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="32">선사시대</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="33" name="age" value="석기" onclick='ageCheckSelectAll()' <%=age.contains( "석기") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="33">석기시대</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="34" name="age" value="청동기" onclick='ageCheckSelectAll()' <%=age.contains( "청동기") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="34">청동기시대</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="35" name="age" value="철기" onclick='ageCheckSelectAll()' <%=age.contains( "철기") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="35">철기시대</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="36" name="age" value="삼한" onclick='ageCheckSelectAll()' <%=age.contains( "삼한") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="36">삼한시대</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="37" name="age" value="삼국" onclick='ageCheckSelectAll()' <%=age.contains( "삼국") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="37">삼국시대</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="38" name="age" value="고구려" onclick='ageCheckSelectAll()' <%=age.contains( "고구려") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="38">삼국:고구려</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="39" name="age" value="백제" onclick='ageCheckSelectAll()' <%=age.contains( "백제") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="39">삼국:백제</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="40" name="age" value="신라" onclick='ageCheckSelectAll()' <%=age.contains( "신라") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="40">삼국:신라</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="41" name="age" value="발해" onclick='ageCheckSelectAll()' <%=age.contains( "발해") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="41">발해</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="42" name="age" value="통일신라" onclick='ageCheckSelectAll()' <%=age.contains( "통일신라") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="42">통일신라</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="43" name="age" value="고려" onclick='ageCheckSelectAll()' <%=age.contains( "고려") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="43">고려시대</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="44" name="age" value="조선" onclick='ageCheckSelectAll()' <%=age.contains( "조선") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="44">조선시대</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="45" name="age" value="대한제국" onclick='ageCheckSelectAll()' <%=age.contains( "대한제국") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="45">대한제국시대</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="46" name="age" value="일제강점" onclick='ageCheckSelectAll()' <%=age.contains( "일제강점") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="46">일제강점기</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="47" name="age" value="시대미상" onclick='ageCheckSelectAll()' <%=age.contains( "시대미상") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="47">시대미상</label>
                                                    </div>
                                                </li>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <!-- 유형분류 -->
                                <div class="card mb-grid-gutter">
                                    <div class="card-body px-4">
                                        <div class="widget widget-filter">
                                            <h3 class="widget-title">유형분류</h3>
                                            <ul class="widget-list widget-filter-list list-unstyled pt-1" style="max-height: 11.5rem;" data-simplebar data-simplebar-auto-hide="false">
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="48" name="typeAll" onclick='typeAll(this)' <%=type.contains( "전체") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="48">전체</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="49" name="type" value="유적건조물" onclick='typeCheckSelectAll()' <%=type.contains( "유적건조물") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="49">유적건조물</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="50" name="type" value="기록유산" onclick='typeCheckSelectAll()' <%=type.contains( "기록유산") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="50">기록유산</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="51" name="type" value="유물" onclick='typeCheckSelectAll()' <%=type.contains( "유물") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="51">유물</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="52" name="type" value="무형문화재" onclick='typeCheckSelectAll()' <%=type.contains( "무형문화재") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="52">무형문화재</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="53" name="type" value="자연유산" onclick='typeCheckSelectAll()' <%=type.contains( "자연유산") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="53">자연유산</label>
                                                    </div>
                                                </li>
                                                <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" id="54" name="type" value="등록문화재" onclick='typeCheckSelectAll()' <%=type.contains( "등록문화재") ? "checked" : "" %>>
                                                        <label class="form-check-label widget-filter-item-text" for="55">등록문화재</label>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
				<form>
                    <!-- 필터링기능 끝-->
                </div>
                    <!-- 필터링기능 끝-->
                </div>
                <!-- Sorting-->
                <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch my-2">
                    <div class="d-flex align-items-center flex-shrink-0">
                        <label class="fs-sm me-2 pe-1 text-nowrap" for="sortby"><i class="fi-arrows-sort text-muted mt-n1 me-2"></i>Sort by:</label>
                        <select class="form-select form-select-sm" id="sortby">
                  <option>최신순</option>
                  <option>오래된순</option>
                  <option>좋아요순</option>
                </select>
                    </div>
                    <hr class="d-none d-sm-block w-100 mx-4">
                    <div class="d-none d-sm-flex align-items-center flex-shrink-0 text-muted"><i class="fi-list me-2"></i><span class="fs-sm mt-n1">총 <%=getFindAllCount%> 건의 자료가 검색되었습니다.(부속 문화재 포함)</span></div>
                </div>
                <!-- Catalog grid-->
                <div class="row g-4 py-4">
                    <!-- Item-->
                    <%for(int i = 0; i < findAllList.size(); i++) {%>
                    <div class="col-sm-6 col-xl-4">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="tns-carousel-wrapper card-img-top card-img-hover">
                                <a class="img-overlay" href="<%=path%>/heritageDetail.do?hertiageNo=<%=findAllList.get(i).getNo()%>"></a>
                                <div class="tns-carousel-inner" ><img src="<%=findAllList.get(i).getImageUrl()%>"  alt="Image" style="height: 300px; width: 405px;">
                                  </div>
                            </div>
                            <div class="card-body position-relative pb-3" >
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" ><%=findAllList.get(i).getCcbaMnm1()%></a>
                                    <div class="fw-bold"><i class="fi-map-pin mt-n1 me-2 lead align-middle opacity-70"></i><%=findAllList.get(i).getCcbaCtcdNm() + " " + findAllList.get(i).getCcsiName()%></div>
                                </h3>
                                <h2 class="mb-1 fs-xs fw-normal" style="width:350px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; display:inline-block;"><%=findAllList.get(i).getContent()%></h2>
                            </div>
                            <div class="card-footer d-flex align-items-center justify-content-center mx-3 pt-3 text-nowrap">
                                <span class="d-inline-block mx-1 px-2 fs-sm">
                                <i class="fi-heart-filled ms-1 mt-n1 fs-lg text-muted"></i></span>
                                <a><%=allFavlist.get(i)%></a>
                            </div>
                        </div>
                    </div>
                     <% }%>
					  <!-- Pagination-->
					                <nav class="border-top pb-md-4 pt-4 mt-2" aria-label="Pagination">
					                    <ul class="pagination mb-1">
					                    <% for(int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++){ %>
					                     <%if(i == pageInfo.getCurrentPage()){ %>
					                        <li class="page-item d-sm-none"><span class="page-link page-link-static">1 / 5</span></li>
					                        <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link"><%=i%><span class="visually-hidden">(current)</span></span>
					                        </li>
					                           <%} else {%>
					                        <li class="page-item d-none d-sm-block"><a class="page-link" onclick="movePage('<%=path%>/heritageSearch.do?page=<%=i%>');"><%=i%></a></li>
					                            <%} %>
					                        <%} %>
					                        <li class="page-item"><a class="page-link" onclick="movePage('<%=path%>/heritageSearch.do?page=<%=pageInfo.getNextPage()%>');" aria-label="Next"><i class="fi-chevron-right"></i></a></li>
					                    </ul>
					                </nav>
					            </div>
					            <!-- </div> -->
										
									<script type="text/javascript">
											function movePage(pageUrl){
												var searchValue = document.getElementById("searchValue"); // 문화재 이름
												if(searchValue.value.length > 0){
	
													pageUrl = pageUrl +  '&searchValue=' + searchValue.value; 
												}

												var regions = document.getElementsByName("region");  // 지역
										          if (regions.length != 0) {
													for (var i = 0; i < regions.length; i++) {
										                  if (regions[i].checked == true) {
										                	  region = regions[i].value;
										                      pageUrl += '&region=' + region;
										                  }
										              }
												  }
										          
												var types = document.getElementsByName("type"); // 유형분류
											      if (types.length != 0) {
													for (var i = 0; i < types.length; i++) {
											              if (types[i].checked == true) {
											            	  type = types[i].value;
											                  pageUrl += '&type=' + type;
											              }
											          }
												}
												
												var designateds = document.getElementsByName("designated"); // 지정종목
											      if (designateds.length != 0) {
													for (var i = 0; i < designateds.length; i++) {
											              if (designateds[i].checked == true) {
											            	  designated = designateds[i].value;
											                      pageUrl += '&designated=' + designated;
											                  }
											              }
													  }
												
														var ages = document.getElementsByName("age");  //시대 
												          if (ages.length != 0) {
															for (var i = 0; i < ages.length; i++) {
												                  if (ages[i].checked == true) {
												                	  age = ages[i].value;
												                      pageUrl += '&age=' + age;
												                  }
												              }
														  }
														
												          var startYear = document.getElementById("startYear"); // 문화재 이름
															if(startYear.value.length > 0){
																pageUrl +=  '&startYear=' + startYear.value; 
															}
												          
												         
															var endYear = document.getElementById("endYear"); // 문화재 이름
															if(endYear.value.length > 0){
																pageUrl +=  '&endYear=' + endYear.value; 
															}

												
												
												location.href = encodeURI(pageUrl);	
											}
											
											// 지역 체크박스 스크립트
						                    function regionCheckSelectAll() {
						                        // 전체 체크박스
						                        const checkboxes = document.querySelectorAll('input[name="region"]');
						                        // 선택된 체크박스
						                        const checked = document.querySelectorAll('input[name="region"]:checked');
						                        // select all 체크박스
						                        const selectAll = document.querySelector('input[name="regionAll"]');

						                        if (checkboxes.length === checked.length) {
						                            selectAll.checked = true;
						                        } else {
						                            selectAll.checked = false;
						                        }

						                    };

						                    function regionAll(selectAll) {
						                        const region = document.getElementsByName('region');

						                        region.forEach((checkbox) => {
						                            checkbox.checked = selectAll.checked;
						                        });
						                    }


						                    // 지정종목 체크박스 스크립트 
						                    function designatedCheckSelectAll() {
						                        // 전체 체크박스
						                        const checkboxes = document.querySelectorAll('input[name="designated"]');
						                        // 선택된 체크박스
						                        const checked = document.querySelectorAll('input[name="designated"]:checked');
						                        // select all 체크박스
						                        const selectAll = document.querySelector('input[name="designatedAll"]');

						                        if (checkboxes.length === checked.length) {
						                            selectAll.checked = true;
						                        } else {
						                            selectAll.checked = false;
						                        }

						                    }

						                    function designatedAll(selectAll) {
						                        const designated = document.getElementsByName('designated');

						                        designated.forEach((checkbox) => {
						                            checkbox.checked = selectAll.checked;
						                        });
						                    }


						                    // 시대 체크박스 스크립트

						                    function ageCheckSelectAll() {
						                        // 전체 체크박스
						                        const checkboxes = document.querySelectorAll('input[name="age"]');
						                        // 선택된 체크박스
						                        const checked = document.querySelectorAll('input[name="age"]:checked');
						                        // select all 체크박스
						                        const selectAll = document.querySelector('input[name="ageAll"]');

						                        if (checkboxes.length === checked.length) {
						                            selectAll.checked = true;
						                        } else {
						                            selectAll.checked = false;
						                        }

						                    }

						                    function ageAll(selectAll) {
						                        const age = document.getElementsByName('age');

						                        age.forEach((checkbox) => {
						                            checkbox.checked = selectAll.checked;
						                        });
						                    }

						                    // 유형분류 체크박스 스크립트

						                    function typeCheckSelectAll() {
						                        // 전체 체크박스
						                        const checkboxes = document.querySelectorAll('input[name="type"]');
						                        // 선택된 체크박스
						                        const checked = document.querySelectorAll('input[name="type"]:checked');
						                        // select all 체크박스
						                        const selectAll = document.querySelector('input[name="typeAll"]');

						                        if (checkboxes.length === checked.length) {
						                            selectAll.checked = true;
						                        } else {
						                            selectAll.checked = false;
						                        }

						                    }

						                    function typeAll(selectAll) {
						                        const type = document.getElementsByName('type');

						                        type.forEach((checkbox) => {
						                            checkbox.checked = selectAll.checked;
						                        });
						                    }
									</script>			
					        </div>
					    </main>
    
   
<%@include file="/views/common/footer.jsp"%>
 