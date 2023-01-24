<%@page import="java.util.List"%>
<%@page import="semi.heritage.heritageInfo.vo.HertiageReview"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/headerLight.jsp" %>
<%@ include file="/views/common/sidebar.jsp"%>

<%

List<HertiageReview> hlist = (List<HertiageReview>)request.getAttribute("hlist");
int hreviewCount = (Integer)request.getAttribute("hreviewCount");

%>
                <div class="col-lg-8 col-md-7 mb-5">
                    <h1 class="h2">리뷰</h1>
                    <p class="pt-1 mb-4">사뿐사뿐에 남긴 리뷰를 확인해보세요</p>
                    <div class="tab-content pt-2">
                        <!-- Reviews about you tab-->
                        <div class="tab-pane fade show active" id="reviews-about-you" role="tabpanel">
                            <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch justify-content-between pb-4 mb-2 mb-md-3">
                                <div class="d-flex align-items-center">
                                    <select class="form-se
                                    
                                    	lect form-select-sm" id="review-sorting1">
                      					<option>최신순</option>
                      					<option>오래된순</option>
                    				</select>
                                </div>
                            </div>
                            
                            <!-- Review-->
                            <% for(int i = 0 ; i < hlist.size(); i++) {%>
                            <div class="mb-4 pb-4 border-bottom">
                                <div class="d-flex justify-content-between mb-3">
                                    <div class="d-flex align-items-center pe-2"><img class="rounded-circle me-1" src="<%=path %>/resources/img/semi-img/01.info.default.photo.png" width="48" alt="Avatar">
                                        <div class="ps-2">
                                            <h6 class="fs-base mb-0"><%=loginMember.getUname()%>님</h6>
                                           
                                        </div>
                                        
                                    </div><span class="text-muted fs-sm"><%=hlist.get(i).getRevDate()%></span>
                                </div>
                                <p><%=hlist.get(i).getRevContents()%></p>
                                 <div class="d-flex align-items-center">
                                 	<form action="">
                                    <button class="btn-like" type="button"><i class="fi-rotate-left"></i><span>수정</span></button>
                                    </form>
                                    <div class="border-end me-1">&nbsp;</div>
                                    <form action="<%=path%>/HertiageReviewDelete.do" method="post">
                                    <input type="hidden" name="revNo" value="<%=hlist.get(i).getRevNo()%>">
                                    <button class="btn-dislike" type="submit"><i class="fi-x"></i><span>삭제</span></button>
                                    </form>
                                </div> 
                            </div>
                            <% } %>

                            <!-- Pagination-->
                            <nav class="mt-2" aria-label="Reviews pagination">
                                <ul class="pagination">
                                    <li class="page-item d-sm-none"><span class="page-link page-link-static">1 / 5</span></li>

                                    <li class="d-none d-sm-block" aria-current="page"><span class="page-link">1<span class="visually-hidden">(current)</span></span>
                                    </li>
                                    <li class="page-item d-none d-sm-block"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item d-none d-sm-block"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item d-none d-sm-block">...</li>
                                    <li class="page-item d-none d-sm-block"><a class="page-link" href="#">8</a></li>
                                    <li class="page-item"><a class="page-link" href="#" aria-label="Next"><i class="fi-chevron-right"></i></a></li>
                                </ul>
                            </nav>
                        </div>

                        <!-- Reviews by you tab-->
                        <div class="tab-pane fade" id="reviews-by-you" role="tabpanel">
                            <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch justify-content-between pb-4 mb-2 mb-md-3">
                                <h3 class="h4 mb-sm-0"><%=hreviewCount%> reviews</h3>
                                <div class="d-flex align-items-center ms-sm-4">
                                    <label class="fs-sm me-2 pe-1 text-nowrap" for="review-sorting2"><i class="fi-arrows-sort text-muted mt-n1 me-2"></i>Sort by:</label>
                      					<select>
                      					<option>Newest</option>
                      					<option>Oldest</option>
                      					<option>Popular</option>
                      					<option>High rating</option>
                      					<option>Low rating</option>
                    					</select>
                                </div>
                            </div>
                
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- Footer-->

    <%@include file="/views/common/footer.jsp"%>