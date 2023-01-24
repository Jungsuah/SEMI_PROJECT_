<%@page import="semi.heritage.souvenir.vo.SouvenirProduct"%>
<%@page import="semi.heritage.souvenir.vo.SouvenirCart"%>
<%@page import= "java.text.DecimalFormat" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/headerLight.jsp" %>
<%@ include file="/views/common/sidebar.jsp"%>

<!-- SouvenirProductVO productDetail = (SouvenirProductVO)request.getAttribute("productDetail");  -->
<%
DecimalFormat df = new DecimalFormat("###,###");
List<SouvenirCart> cartList = (List<SouvenirCart>)request.getAttribute("cartList");
SouvenirCart deleteCart = (SouvenirCart)request.getAttribute("deleteCart");
// int productNo = (Integer)request.getAttribute("productNo");
%>

<!-- <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2"> -->
<!--             Breadcrumb -->
<!--             <nav class="mb-4 pt-md-3" aria-label="Breadcrumb"> -->
<!--                 <ol class="breadcrumb"> -->
<%--                     <li class="breadcrumb-item"><a href="<%=path%>/index.do">Home</a></li> --%>
<%--                     <li class="breadcrumb-item"><a href="<%=path%>/myPageInfo.do">Account</a></li> --%>
<!--                     <li class="breadcrumb-item active" aria-current="page">My Properties</li> -->
<!--                 </ol> -->
<!--             </nav> -->
<!--             Page content -->
<!--             <div class="row"> -->
<!--                 Sidebar -->
<!--                 <aside class="col-lg-4 col-md-5 pe-xl-4 mb-5"> -->
<!--                     프로필 & 카테고리 시작 -->
<!--                     <div class="card card-body border-0 shadow-sm pb-1 me-lg-1"> -->
<%--                         <div class="d-flex d-md-block d-lg-flex align-items-start pt-lg-2 mb-4"><img class="rounded-circle" src="<%=path+"/resources/upload/photo/"+loginMember.getRenamedPhoto()%>" width="48" onerror="this.src='<%=path%>/resources/img/semi-img/01.info.default.photo.png'"> --%>
<!--                             <div class="pt-md-2 pt-lg-0 ps-3 ps-md-0 ps-lg-3"> -->
<%--                                 <h2 class="fs-lg mb-0"><%=loginMember.getUname()%>님</h2> --%>
<!--                                 <ul class="list-unstyled fs-sm mt-3 mb-0"> -->
<%--                                     <li><a class="nav-link fw-normal p-0" href="tel:3025550107"><i class="fi-phone opacity-60 me-2"></i><%if(loginMember.getUpn() != null){%><%=loginMember.getUpn() %><%} else {} %></a></li> --%>
<%--                                     <li><a class="nav-link fw-normal p-0" href="mailto:annette_black@email.com"><i class="fi-mail opacity-60 me-2"></i><%=loginMember.getUemail() %></a></li> --%>
<!--                                 </ul> -->
<!--                             </div> -->
<!--                         </div><a class="btn btn-lg w-100 mb-3" href="real-estate-add-property.html" style="background-color: #8957BD; color: #fff;"><i class="fi-plus me-2"></i>게시글 작성하기</a> -->
<!--                         <a class="btn btn-outline-secondary d-block d-md-none w-100 mb-3" href="#account-nav" data-bs-toggle="collapse"><i class="fi-align-justify me-2"></i>Menu</a> -->

<!--                         <div class="collapse d-md-block mt-3 a:hover" id="account-nav"> -->
<%--                             <div class="card-nav"><a class="card-nav-link" href="<%=path%>/myPageInfo.do"><i class="fi-user opacity-60 me-2"></i>회원정보 수정</a> --%>
<%--                                 <a class="card-nav-link" href="<%=path%>/myPageCart.do" ><i class="fi-home opacity-60 me-2"></i>장바구니</a> --%>
<%--                                 <a class="card-nav-link" href="<%=path%>/myPageLike.do"><i class="fi-heart opacity-60 me-2"></i>찜 목록</a> --%>
<%--                                 <a class="card-nav-link" href="<%=path%>/myPageReview.do"><i class="fi-star opacity-60 me-2"></i>리뷰</a> --%>
<%--                                 <a class="card-nav-link" href="<%=path%>/myPageOrder.do"><i class="fi-star opacity-60 me-2"></i>구매이력</a> --%>
<!--                                 <a class="card-nav-link" href="real-estate-account-notifications.html"><i class="fi-bell opacity-60 me-2"></i>Notifications</a> -->
<%--                                 <a class="card-nav-link" href="<%=path%>/views/member/myPageStamp.jsp"><i class="fi-help opacity-60 me-2"></i>스탬프</a> --%>
<%--                                 <a class="card-nav-link" onclick="location.href='<%=path%>/logout';"><i class="fi-logout opacity-60 me-2"></i>로그아웃</a></div> --%>
<!--                         </div> -->
<!--                     </div> -->
<!--                 </aside> -->
                <div class="col-lg-8 col-md-7 mb-5">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <h1 class="h2 mb-0">장바구니</h1>
                        <a class="fw-bold text-decoration-none" onclick="location.href='<%=path%>/cartAllDelete.do'"  style="color: #8957BD;">
                        <i class="fi-trash mt-n1 me-2"></i>전체 비우기</a>
<!--                         <input type="hidden" name="uNo"> -->
                    </div>
                    <p class="pt-1 mb-4">사뿐몰에서 담은 상품들을 확인 해보세요</p>
                    <%for(int i = 0; i < cartList.size(); i++){ %>
                   	<%int deleteSeqNo = cartList.get(i).getSeqNo(); %>
                    
                    <!-- Item-->
                    <div class="card card-hover card-horizontal border-0 shadow-sm mb-4">
                        <a class="card-img-top" href="<%=path%>/souvenirProductsDetail.do?productNo=<%=cartList.get(i).getSouv_cart_no()%>" style="background-image: url(<%=cartList.get(i).getSouv_pro_url()%>);">
                        </a>
                        <div class="card-body position-relative pb-3">
                            <div class="dropdown position-absolute zindex-5 top-0 end-0 mt-3 me-3">

                            </div>
                            <h4 class="mb-1 fs-xs fw-normal text-uppercase" style="color: #C389FF;"><b>판매중</b></h4>
                            <h3 class="h6 mb-2 fs-base"><a class="nav-link" href="<%=path+"/souvenirProductsDetail.do?productNo=" + cartList.get(i).getSouv_pro_no()%>">
                            <%=cartList.get(i).getSouv_pro_name()%></a></h3>
                            <p class="mb-2 fs-sm text-muted"><%=cartList.get(i).getSouv_pro_category()%></p>
                            <div class="fw-bold"><i class="fi-cash mt-n1 me-2 lead align-middle opacity-70"></i><%=df.format(cartList.get(i).getSouv_pro_price())%>원</div>
                            <div class="text-muted d-flex align-items-center justify-content-center justify-content-sm-start border-top pt-3 pb-2 mt-3 text-nowrap">
                                 
                			<!---------------- 메인페이지 링크복사기능 임시 시작 ---------------->
								 <script>
								    function fn_final() {
									var url = document.getElementById('text');
									url.style.display='block';	// 숨겨둔 input 태그 block처리
									url.select();	// 복사할 text 블럭
									document.execCommand('copy');	// 드레그된 text 클립보드에 복사
									url.style.display='none';	// 다시 숨기기
									alert("링크 복사되었습니다");
								    }
								</script>
                                <input type="text" id="text" value="<%=path%>/souvenirMain.do" style="display: none;"/>
 							
 							<!---------------- 메인페이지 링크복사기능 임시 끝 ---------------->

                                 <i class="fi-share text-muted" style="padding-right: 2%;"></i>
 									<span class="text-muted d-inline-block me-3 fs-sm">
 									<input class="copy d-inline-block fs-sm" type="button" onclick="fn_final()" style="border : none; background-color: #fff; cursor: pointer;" value="공유하기"></></span>
                                
                                 <form action="<%=path%>/souvenirProductsDetail.do" method="get">
                                 <i class="fi-eye-on text-muted" style="padding-right: 2%;"></i>
 									<input type="hidden" name="productNo" value="<%=cartList.get(i).getSouv_pro_no()%>">
 									<span class="text-muted d-inline-block me-3 fs-sm">
									<button class="d-inline-block fs-sm" type="submit" style="border : none; background-color: #fff; cursor: pointer;">상세보기</button></span>
 								</form>
                                
                                 <form action="<%=path%>/cartDelete.do" method="post">
                                 <i id="deleteCart" class="fi-trash text-muted" style="padding-right: 2%;"></i>
                                 	<input type="hidden" name="seqNo" value="<%=cartList.get(i).getSeqNo()%>">
                                 	<span class="text-muted d-inline-block me-3 fs-sm">
                                 	<button class="d-inline-block fs-sm" type="submit"  style="border : none; background-color: #fff; cursor: pointer;">장바구니 해제</button></span>
                                 </form>
                                
                                
                            </div>
                        </div>
                    </div>
                    <%} %>
					<form action="<%=path%>/souvenirPay.do" method="get" >
                	
                    <button type="submit" class="btn mt-4 justify-content-end" style="background-color: #8957BD; color: #fff;">전 제품 결제하기</button>
                </div>
                </form>
            </div>
        </div>
    </main>
    
   
        <!-- Footer-->
    <%@include file="/views/common/footer.jsp"%>