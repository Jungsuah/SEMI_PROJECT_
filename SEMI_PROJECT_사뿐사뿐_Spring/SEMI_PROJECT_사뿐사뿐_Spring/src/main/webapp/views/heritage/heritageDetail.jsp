<%@page import="semi.heritage.heritageInfo.vo.HertiageReview"%>
<%@page import="java.util.List"%>
<%@page import="semi.heritage.heritageInfo.vo.HeritageVideo"%>
<%@page import="semi.heritage.heritageInfo.vo.HeritageImage"%>
<%@page import="semi.heritage.heritageInfo.vo.Heritage"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/views/common/headerLight.jsp"%>

<%
Heritage h = (Heritage)request.getAttribute("hertiage");
List<HeritageImage> hi = (List<HeritageImage>)request.getAttribute("heritageImage");
String hv = (String)request.getAttribute("heritageVideo");
List<HertiageReview> list =	(List<HertiageReview>)request.getAttribute("list");
int HertiageReview_Count = (Integer)request.getAttribute("HertiageReview_Count");
int CountFavoriteByNo = (Integer)request.getAttribute("CountFavoriteByNo");
%>
        <!-- Page content-->
        <!-- 리뷰남기기 Review modal-->
        <div class="modal fade" id="modal-review" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
                        <h3 class="modal-title mt-4 text-center">리뷰남기기</h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body px-sm-5 px-4">
                            <div class="mb-3">
        					<form action="<%=path%>/hertiageReviewWrite.do" method="post">
                            	<input type="hidden" name="hNo" value="<%=h.getNo()%>">
                                <label class="form-label" for="review-name">Name <span
                                        class='text-danger'>*</span></label>
                                <input class="form-control" type="text"  id="review-name" value="<%if(loginMember != null){ %><%=loginMember.getUname()%><%} %>" placeholder="<%if(loginMember != null){ %><%=loginMember.getUemail()%><%} %>" disabled>
                                <div class="invalid-feedback">Please let us know your name.</div>
                            </div>
                            <div class="mb-3">
                                 <label class="form-label" for="review-email">Email <span
                                        class='text-danger'>*</span></label>
                                <input class="form-control" type="email" id="review-email" value="<%if(loginMember != null){ %><%=loginMember.getUemail()%><%} %>" placeholder="<%if(loginMember != null){ %><%=loginMember.getUemail()%><%} %>" disabled>
                                <div class="invalid-feedback">Please provide a valid email address.</div>
                            </div>
                            <div class="mb-3">
                                <div class="invalid-feedback">Please rate the property.</div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="review-text">Review <span
                                        class='text-danger'>*</span></label>
                                <textarea class="form-control" name="RevContents" id="review-text" rows="5" placeholder="Your review message" required></textarea>
                                <div class="invalid-feedback">Please write your review.</div>
                            </div>
                            <button class="btn btn-primary d-block w-100 mb-4" type="submit">제출하기</button>
        					</form>
                    </div>
                </div>
            </div>
        </div>
		<!--리뷰 더보기 팝업 -->
		<div class="modal fade" id="modal-review-more" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
                        <h3 class="modal-title mt-4 text-center">리뷰(<%=HertiageReview_Count%>개)
                        </h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body px-sm-5 px-4" style="overflow: auto; height: 800px">
                        <% for(int i= 0; i< list.size(); i++){
                	   %>
                    <div class="mb-4 pb-4 border-bottom">
                        <div class="d-flex justify-content-between mb-3">
                            <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="<%=path%>/resources/img/semi-img/01.info.default.photo.png" width="48" alt="Avatar">
                                <div class="ps-2">
                                    <h6 class="fs-base mb-0"><%=list.get(i).getRev_userEmail() %></h6>
                                </div>
                            </div><span class="text-muted fs-sm"><%=list.get(i).getRevDate()%></span>
                        </div>
                        <p><%=list.get(i).getRevContents()%></p>
                        <div class="d-flex align-items-center">
                            <button class="btn-like" type="button"><i class="fi-like"></i><span>(5)</span></button>
                            <div class="border-end me-1">&nbsp;</div>
                            <button class="btn-dislike" type="button"><i
                                    class="fi-dislike"></i><span>(1)</span></button>
                        </div>
                    </div>
                    <%} %>
                    </div>
                </div>
            </div>
        </div>
        
        <section class="container pt-5 mt-5">
            <nav class="mb-3 pt-md-3" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%=path%>/index.do">Home</a></li>
                    <li class="breadcrumb-item"><a href="<%=path%>/heritageSearch.do">문화재검색</a></li>
                    <li class="breadcrumb-item active" aria-current="page"><%= h.getCcbaMnm1() + " (" + h.getCcbaMnm2() + ")" %></li>
                </ol>
            </nav>
            <h1 class="h2 mb-2"><%= h.getCcbaMnm1() + " (" + h.getCcbaMnm2() + ")" %></h1>
            <p class="mb-2 pb-1 fs-lg fi-map-pin"><%= h.getCcbaLcad() %></p>
            <!-- 시작 :좋아요 likes + 리뷰 reviews 아이콘 / 숫자 넣기-->
            <div class="d-flex justify-content-between align-items-center">
                <ul class="d-flex mb-4 list-unstyled">

                </ul>
                <div class="text-nowrap">
                	<form action="<%=path%>/favoriteInsert.do" method="post">
                    <input type="hidden" name="hertiageNo" value="<%=h.getNo()%>">
                    <button type="submit" class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle ms-2 mb-2" type="submit" data-bs-toggle="tooltip" title="Add to Wishlist"><i class="fi-heart"></i></button>
                    </form>
                    <div class="dropdown d-inline-block" data-bs-toggle="tooltip" title="Share">
                        <button class="btn btn-icon btn-light-primary btn-xs shadow-sm rounded-circle ms-2 mb-2" type="button" data-bs-toggle="dropdown"><i class="fi-share"></i></button>
                        <div class="dropdown-menu dropdown-menu-end my-1">
                            <button class="dropdown-item" type="button"onclick="alert( 'URL이 복사 되었습니다.' );" ><i
                                    class="fi-facebook fs-base opacity-75 me-2"></i>Facebook</button>
                            <button class="dropdown-item" type="button"onclick="alert( 'URL이 복사 되었습니다.' );" ><i
                                    class="fi-twitter fs-base opacity-75 me-2"></i>Twitter</button>
                            <button class="dropdown-item" type="button"onclick="alert( 'URL이 복사 되었습니다.' );" ><i
                                    class="fi-instagram fs-base opacity-75 me-2"></i>Instagram</button>
                        </div>
                    </div>
                </div>
            </div>																
            <!-- 끝 : 좋아요 likes + 리뷰 reviews 아이콘 / 숫자 넣기-->
        </section>
        <!-- Gallery-->
        <section class="container overflow-auto mb-4 pb-3" data-simplebar>
            <div class="row g-2 g-md-3 gallery" data-thumbnails="true" style="min-width: 30rem;">
                <div class="col-8" >
                   <a class="gallery-item rounded rounded-md-3" href="<%if(hi.size() < 1){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(0).getImageUrl()%><%} %>" data-sub-html="&lt;h6 class=&quot;fs-sm text-light&quot;&gt;&lt;/h6&gt;"><img src="<%if(hi.size() < 1){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(0).getImageUrl()%><%} %>" alt="Gallery thumbnail" img class="img-contain3"></a> 
                </div>
                <div class="col-4" >
                    <a class="gallery-item rounded rounded-md-3 mb-2 mb-md-3" href="<%if(hi.size() < 2){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(1).getImageUrl()%><%} %>" data-sub-html="&lt;h6 class=&quot;fs-sm text-light&quot;&gt;&lt;/h6&gt;"><img src="<%if(hi.size() < 2){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(1).getImageUrl()%><%} %>" alt="Gallery thumbnail" img class="img-contain2"></a>
                    <a class="gallery-item rounded rounded-md-3" href="<%if(hi.size() < 3){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(2).getImageUrl()%><%} %>" data-sub-html="&lt;h6 class=&quot;fs-sm text-light&quot;&gt; &lt;/h6&gt;"><img src="<%if(hi.size() < 3){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(2).getImageUrl()%><%} %>" alt="Gallery thumbnail" img class="img-contain2"></a>
                </div>
                <div class="col-12">
                    <div class="row g-2 g-md-3">
                    	
                        <div class="col">
                            <a class="gallery-item rounded-1 rounded-md-2" href="<%if(hi.size() < 4){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(3).getImageUrl()%><%} %>" data-sub-html="&lt;h6 class=&quot;fs-sm text-light&quot;&gt; &lt;/h6&gt;"><img src="<%if(hi.size() < 4){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(3).getImageUrl()%><%} %>" img class="img-contain"></a>
                        </div>
                        <div class="col">
                            <a class="gallery-item rounded-1 rounded-md-2" href="<%if(hi.size() < 5){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(4).getImageUrl()%><%} %>" data-sub-html="&lt;h6 class=&quot;fs-sm text-light&quot;&gt; &lt;/h6&gt;"><img src="<%if(hi.size() < 5){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(4).getImageUrl()%><%} %>" img class="img-contain"></a>
                        </div>
                        <div class="col">
                            <a class="gallery-item rounded-1 rounded-md-2" href="<%if(hi.size() < 6){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(5).getImageUrl()%><%} %>" data-sub-html="&lt;h6 class=&quot;fs-sm text-light&quot;&gt; &lt;/h6&gt;"><img src="<%if(hi.size() < 6){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(5).getImageUrl()%><%} %>" img class="img-contain"></a>
                        </div>
                        <div class="col">
                            <a class="gallery-item rounded-1 rounded-md-2" style="object-fit: contain" href="<%if(hi.size() < 7){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(6).getImageUrl()%><%} %>" data-sub-html="&lt;h6 class=&quot;fs-sm text-light&quot;&gt; &lt;/h6&gt;"><img src="<%if(hi.size() < 7){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(6).getImageUrl()%><%} %>" img class="img-contain"></a>
                        </div>
                        <div class="col">
                            <a class="gallery-item more-item rounded-1 rounded-md-2" href="<%if(hi.size() < 8){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(7).getImageUrl()%><%} %>" data-sub-html="&lt;h6 class=&quot;fs-sm text-light&quot;&gt;&lt;/h6&gt;"><img src="<%if(hi.size() < 8){ %><%=path%>/resources/img/semi-img/noimage_spsp.png<%}else{%><%=hi.get(7).getImageUrl()%><%} %>" class="img-contain">
                            <span class="gallery-item-caption fs-base"><span class='d-none d-md-inline'>+ more
                                        photos</span></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Post content-->
        <section class="container mb-5 pb-1">
            <div class="row">
                <div class="col-md-7 mb-md-0 mb-4">
                    <!-- 문화재설명-->
                    <div class="mb-4 pb-md-3">
                        <span>
                            <p class="subtitle text-sm text-primary" style="font-weight:bold">A B O U T</p>
                            <h3 class="h3">문화재설명</h3>

                        </span>
                        <p class="mb-1"><%= h.getContent() %>
                        </p>
                    </div>
                    <!--스크롤 </div> -->
                    <!-- Post meta-->
                    <div class="mb-lg-5 mb-md-4 pb-lg-2 py-4 border-top">
                    </div>
                    <!-- 시작 : 리뷰 Reviews-->
                    <div class="mb-4 pb-4 border-bottom">
                        <p class="subtitle text-sm text-primary" style="font-weight:bold">R E V I E W S</p>
                        <h3 class="h3 pb-3">리뷰(<%=HertiageReview_Count%>개)
                        </h3>
                        <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch justify-content-between">
                            
                            <%if(loginMember != null){ %>
                            <a class="btn btn-outline-primary mb-sm-0 mb-3" id="review" href="#modal-review" data-bs-toggle="modal"><i class="fi-edit me-1"></i>Add review</a>
                            <% }else{ %>
                            <a class="btn btn-outline-primary mb-sm-0 mb-3" id="review" onclick="alert( '로그인하여야 리뷰작성이 가능합니다.' );" data-bs-toggle="modal"><i class="fi-edit me-1"></i>Add review</a>
                            <%} %>
                            <div class="d-flex align-items-center ms-sm-4">
                                <label class="me-2 pe-1 text-nowrap" for="reviews-sorting"><i
                                        class="fi-arrows-sort text-muted mt-n1 me-2"></i>Sort by:</label>
                                <select class="form-select" id="reviews-sorting">
                                    <option>Newest</option>
                                    <option>Oldest</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                  
                    <!-- Review-->
                    <div style="overflow: hidden; height: 750px">
                   <%if(list != null && list.size() < 4){ for(int i= 0; i< list.size(); i++){
                	   %>
                    <div class="mb-4 pb-4 border-bottom">
                        <div class="d-flex justify-content-between mb-3">
                            <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="<%=path%>/resources/img/semi-img/01.info.default.photo.png" width="48" alt="Avatar">
                                <div class="ps-2">
                                    <h6 class="fs-base mb-0"><%=list.get(i).getRev_userEmail() %></h6>
                                </div>
                            </div><span class="text-muted fs-sm"><%=list.get(i).getRevDate()%></span>
                        </div>
                        <p><%=list.get(i).getRevContents()%></p>
                        <div class="d-flex align-items-center">
                            <button class="btn-like" type="button"><i class="fi-like"></i><span>(5)</span></button>
                            <div class="border-end me-1">&nbsp;</div>
                            <button class="btn-dislike" type="button"><i
                                    class="fi-dislike"></i><span>(1)</span></button>
                        </div>
                    </div>
                    <%}}else if(list != null && list.size() > 3){for(int i= 0; i< 4; i++){%>
                    	<div class="mb-4 pb-4 border-bottom">
                        <div class="d-flex justify-content-between mb-3">
                            <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="<%=path%>/resources/img/semi-img/01.info.default.photo.png" width="48" alt="Avatar">
                                <div class="ps-2">
                                    <h6 class="fs-base mb-0"><%=list.get(i).getRev_userEmail() %></h6>
                                </div>
                            </div><span class="text-muted fs-sm"><%=list.get(i).getRevDate()%></span>
                        </div>
                        <p><%=list.get(i).getRevContents()%></p>
                        <div class="d-flex align-items-center">
                            <button class="btn-like" type="button"><i class="fi-like"></i><span>(5)</span></button>
                            <div class="border-end me-1">&nbsp;</div>
                            <button class="btn-dislike" type="button"><i
                                    class="fi-dislike"></i><span>(1)</span></button>
                        </div>
                    </div>
                    	<%}} %>
                    </div>
                    <div class="mb-4 pb-4 border-bottom">
                        <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch justify-content-between">
                            <a class="btn btn-outline-primary mb-sm-0 mb-3" id="review" href="#modal-review-more" data-bs-toggle="modal"><i class="fi-plus me-1"></i>리뷰 더보기</a>
                        </div>
                    </div>
                </div>
                <!-- Sidebar-->
                <aside class="col-lg-4 col-md-5 ms-lg-auto pb-1">
                    <!-- 문화재정보 INFORMATION-->
                    <div class="card border-0 shadow mb-5">
                        <div class="card-header py-4 border-0" style="background-color:rgb(245, 245, 245)">
                            <div class="d-flex align-items-center justify-content-between">
                                <div>
                                    <table>
                                        <tr>
                                            <th>
                                                <p class="subtitle text-sm text-primary">I N F O R M A T I O N</p>
                                                <h3>문화재정보</h3>
                                            </th>
                                            <th>
                                                <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fi-info-circle"></i></h1>
                                            </th>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <table class="table text-sm mb-0">
                                <tr>
                                    <th class="ps-0" style="width: 100px">분 류</th>
                                    <td class="pe-0"><%=h.getCcmaName()%>
                                    </td>
                                </tr>
                                <tr>
                                    <th class="ps-0">수량/면적</th>
                                    <td class="pe-0 "><%=h.getCcbaQuan()%></td>
                                </tr>
                                <tr>
                                    <th class="ps-0">지정일</th>
                                    <td class="pe-0"><%=h.getCcbaAsdt()%></td>
                                </tr>
                                <tr>
                                    <th class="ps-0">소 재 지</th>
                                    <td class="pe-0"><%=h.getCcbaLcad()%></td>
                                </tr>
                                <tr>
                                    <th class="ps-0">시 대</th>
                                    <td class="pe-0"><%=h.getCcceName()%></td>
                                </tr>
                                <tr>
                                    <th class="ps-0">소유자</th>
                                    <td class="pe-md-0"><%=h.getCcbaPoss()%></td>
                                </tr>
                                <tr>
                                    <th class="ps-0">관리자</th>
                                    <td class="pe-0"><%=h.getCcbaAdmin()%></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <!-- 위치 LOCATION (Map)-->
                     <p class="subtitle text-sm text-primary" style="font-weight:bold"> &nbsp;&nbsp;L O C A T I O N
                        </p>
                    <div id="map" style="width:100%;height:350px;"></div>
                     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fe923d0403373a46493e39c5c706eea9"></script>
                    <br>

                    <!-- 동영상 video-->
                    <div class="pt-2">
                        <p class="subtitle text-sm text-primary" style="font-weight:bold"> &nbsp;&nbsp;V I D E O</p>
                        <h3 class="h4 pb-3"><i class="mt-n1 me-2 lead align-middle text-warning" style="font-weight:bold"></i>동영상
                        </h3>
                        <br><br><br><br><br><br>
                        <div class="position-relative mb-2">
                            <div class="d-flex w-100 h-100 align-items-center justify-content-center position-absolute top-0 start-0">
                                <video src="<%=hv%>" controls width="400" height="350">
                                    <a class="btn btn-primary stretched-link"
                                        href="http://uci.k-heritage.tv/resolver/I801:1605002-014-V00006@N2R:1"
                                        data-iframe="true" data-bs-toggle="lightbox"><i class="fi-route me-2"></i>Get
                                        directions</a>
                                </video>
                                <!-- <div class="position-relative mb-2"><img class="rounded-3" src="img/real-estate/single/map.jpg" alt="Map">
                              <div class="d-flex w-100 h-100 align-items-center justify-content-center position-absolute top-0 start-0"> -->
                            </div>
                        </div>
                        <br><br><br><br> <br><br><br><br>
                        <div class="text-center">
                            <p>
                                <a style="color:rgb(220, 58, 85)" href="<%=path%>/favoriteInsert.do?hertiageNo=<%=h.getNo()%>">
                                    <i class="fi-heart-filled" style="color:rgb(220, 58, 85)"></i> Like this place</a>
                            </p><span><%=CountFavoriteByNo%>명의 사람들이 이 장소를 찜하였습니다.</span>
                        </div>
                </aside>
                </div>
        </section>
        </div>
    </main>
   
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(<%=h.getLatitude()%>,<%=h.getLongitude()%>), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(<%=h.getLatitude()%>, <%=h.getLongitude()%>); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>
<%@include file="/views/common/footer.jsp"%>
 