<%@page import="semi.heritage.souvenir.vo.SouvenirCategory"%>
<%@page import="semi.heritage.souvenir.vo.SouvenirProduct"%>
<%@page import= "java.text.DecimalFormat" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@include file="/views/common/headerDark.jsp"%>

   <script type="text/javascript">
	function fnCart(souvenirName, souvenirCategory, souvenirPrice) {
		if (confirm('장바구니에 담으시겠습니까?')) {
		
		} alert("장바구니에 담겼습니다");	
			}

	</script>


   <%
   DecimalFormat df = new DecimalFormat("###,###");
          SouvenirProduct productDetail = (SouvenirProduct)request.getAttribute("productDetail");
          SouvenirProduct cart = (SouvenirProduct)request.getAttribute("SouvenirCartInsertServlet");
          List<SouvenirCategory> cList = (List<SouvenirCategory>)request.getAttribute("cList");
         	List<SouvenirProduct> pList = (List<SouvenirProduct>)request.getAttribute("pList");
         	
         	String keyword = null;
   %>
   

<!-- Body-->

<body class="bg-dark">
        <div class="container mt-5 mb-md-4 py-5 ps-5">
            <nav class="mb-3 pt-md-3" aria-label="Breadcrumb">
                <ol class="breadcrumb breadcrumb-light">
            		
                    <li class="breadcrumb-item"><a href="<%=path%>/souvenirMain.do">사뿐몰</a></li>
                    <li class="breadcrumb-item">
                    <a href="<%=path+"/souvenirProductsDetail.do?category=" + productDetail.getSouv_pro_category()%>">
                    <%=productDetail.getSouv_pro_category()%></a></li>
                    <li class="breadcrumb-item active" aria-current="page"><%=productDetail.getSouv_pro_name()%></li>
                </ol>
            </nav>
            <!-- Title + Sharing-->
            <div class="d-sm-flex align-items-end align-items-md-center justify-content-between position-relative mb-4" style="z-index: 1025;">
                <div class="me-3">
                    <h1 class="h2 text-light mb-md-0" style="color: #C389FF;"><%=productDetail.getSouv_pro_name()%></h1>
                    <div class="d-md-none">
                        <div class="d-flex align-items-center mb-3">
                            <div class="h3 mb-0 text-light"><%=df.format(productDetail.getSouv_pro_price())%>원</div>
                            <div class="text-nowrap ps-3">
                            </div>
                        </div>
                        <div class="d-flex flex-wrap align-items-center text-light mb-2">
                            <div class="text-nowrap border-end border-light pe-3 me-3">
                                <i class="fi-list fs-lg opacity-70 me-2"></i>
                                <span class="align-middle"><%=productDetail.getSouv_pro_category()%></span>
                            </div>
                            <div class="text-nowrap">
                                <i class="fi-list fs-lg opacity-70 me-2"></i>
                                      <%for (int i = 0; i < cList.size(); i++){%>
                                    	  <%if(productDetail.getSouv_pro_category().equals(cList.get(i).getcName())){ %>
                                    		  <%=cList.get(i).getcKeyword()%>
                                    		  <%}%>
                                    		 <%}%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-nowrap pt-3 pt-sm-0">
                    <div class="dropdown d-inline-block" data-bs-toggle="tooltip" title="Share">
                        <div class="dropdown-menu dropdown-menu-dark dropdown-menu-end my-1">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-7">
                    <!-- Gallery-->
                    <div class="tns-carousel-wrapper">
                        <div class="tns-slides-count text-light">
                            <i class="fi-image fs-lg me-2"></i>
                            <div class="ps-1"><span class="tns-current-slide fs-5 fw-lighter"></span>
                                <span class="fs-5 fw-lighter">/</span>
                                <span class="tns-total-slides fs-5 fw-lighter"></span>
                            </div>
                        </div>
                        <div class="tns-carousel-inner" data-carousel-options="{&quot;navAsThumbnails&quot;: true, &quot;navContainer&quot;: &quot;#thumbnails&quot;, &quot;gutter&quot;: 12, &quot;responsive&quot;: {&quot;0&quot;:{&quot;controls&quot;: false},&quot;500&quot;:{&quot;controls&quot;: true}}}">
                            <div><img class="rounded-3 img-souvnir-db" src="<%=productDetail.getSouv_pro_url()%>" alt="Image"></div>
                            

                        </div>
                    </div>
                    <ul class="tns-thumbnails" id="thumbnails">
                        <li class="tns-thumbnail"><img class="img-souvnir-ds" src="<%=productDetail.getSouv_pro_url()%>" alt="Thumbnail"></li>
                        

                    </ul>


                    <!-- 배송 및 교환환불 시작-->
                    <div class="pb-4 mb-3">
                        <h2 class="h4 text-light pt-4 mt-3">배송 정보</h2>
                        <p class="text-light opacity-70 mb-1">
                            <div class="col-11">
                                <ul>
                                    <li>배송 방법 : 로젠택배 (타택배사 발송 불가)</li>
                                    <li>배송 지역 : 전국지역</li>
                                    <li>배송 비용 : 3,000원</li>
                                    <li>배송 기간 : 3일 ~ 7일</li>
                                    <li>무형문화재 작품의 경우 주문 후 제작되므로 7~20일 정도 소요될 수 있습니다.</li>
                                    <li>주문하신 상품에 따라서 상품의 배송이 다소 지연될 수 있습니다.</li>
                                </ul>
                            </div>
                        </p>
                        <div class="collapse" id="seeMoreDescription">
                            <h2 class="h4 text-light pt-4 mt-3">교환 및 반품정보</h2>
                            <p class="text-light opacity-70 mb-1">
                                <div class="col-11">
                                    <ul>
                                        <li><b>교환 및 반품이 불가능한 경우</b>
                                            <p class="mb-2 mt-2"> - 계약내용에 관한 서면을 받은 날부터 7일. 단, 그 서면을 받은 때보다 재화등의 공급이 늦게 이루어진 경우에는 재화등을 공급받거나 재화등의 공급이 시작된 날부터 7일 이내</p>
                                            <p class="mb-2"> - 공급받으신 상품 및 용역의 내용이 표시.광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날 부터 3월이내, 그사실을 알게 된 날 또는 알 수 있었던 날부터 30일이내</p>
                                        </li>
                                        <p></p>
                                        <li><b>교환 및 반품이 불가능한 경우</b>
                                            <p class="mb-2 mt-2"> - 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우</p>
                                            <p class="mb-2"> - 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우</p>
                                            <p class="mb-2"> - 개별 주문 생산되는 재화 등 청약철회시 판매자에게 회복할 수 없는 피해가 예상되어 소비자의 사전 동의를 얻은 경우</p>
                                        </li>
                                    </ul>
                                </div>
                            </p>
                        </div>
                        <a class="collapse-label collapsed" href="#seeMoreDescription" data-bs-toggle="collapse" data-bs-label-collapsed="Show more" data-bs-label-expanded="Show less" role="button" aria-expanded="false" aria-controls="seeMoreDescription"></a>
                    </div>
                    <!-- 배송 및 교환환불 끝-->
                    <!-- Post meta-->
                    <div class="d-flex flex-wrap border-top border-light fs-sm text-light pt-4 pb-5 pb-md-2">
                        <div class="border-end border-light pe-3 me-3">
                            <span class="opacity-70">Published: <strong>May 9, 2021</strong></span>
                        </div>
                        <div class="border-end border-light pe-3 me-3">
                            <span class="opacity-70">Product number: <strong><%=productDetail.getSouv_pro_no()%></strong></span>
                        </div>
                    </div>
                </div>
                <!-- Sidebar -->
                <div class="col-md-4 pt-5 pt-md-0" style="margin-top: -6rem;">
                    <div class="sticky-top pt-5">
                        <div class="d-none d-md-block pt-5 ms-4">
                            <div class="h3 text-light" style="padding-top: 1%;"><%=productDetail.getSouv_pro_name()%></div>
                            <div class="h5 text-danger"><%=df.format(productDetail.getSouv_pro_price())%>원</div>
                            <div class="d-flex align-items-center text-light pb-4 mb-2">
                                <div class="text-nowrap border-end border-light pe-3 me-3">
                                    <i class="fi-list fs-lg opacity-70 me-2"></i>
                                    <span class="align-middle"><%=productDetail.getSouv_pro_category()%></span>
                                </div>
                                <div class="text-nowrap">
                                      <%for (int i = 0; i < cList.size(); i++){%>
                                    	  <%if(productDetail.getSouv_pro_category().equals(cList.get(i).getcName())){ %>
                                    		  <%=cList.get(i).getcKeyword()%>
                                    		  <%}%> 
                                    		 <%}%>
                                </div>
                            </div>
                        </div>
                        <div style="align-content: center;">

                            <div class="mt-2" style="text-align: center;">
                           <form action="<%=path%>/souvenirInsert.do" method="post">
								<input name="productNo" type="hidden" value="<%=productDetail.getSouv_pro_no()%>">
                                <button class="btn btn-outline-light btn-lg mb-4 me-5" type="submit" style="padding-left: 25%; padding-right : 25%">
                                  <i id="SouvenirCartInsertServlet" class="fi-cart me-2 fw-bold">&nbsp 장바구니</i></button>
                                  </form>
                                
                                <form action="<%=path%>/souvenirPay.do" method="get" >
                                    <button type="submit" class="btn btn-outline-light btn-lg mb-4 me-5" 
                                    style="text-align: center; color: #fff; padding-left: 25%; height:50px; width:310px;
                                    padding-right : 25%; background-color: #C389FF; border:none;"><i class=" fi-credit-card me-2"></i>&nbsp 구매하기</button>
                                    </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 이런상품들은 어때요 시작-->
            <!-- 제 1호 상품 시작-->
            <h2 class="h3 text-light pt-5 pb-1 mt-md-4">You may be interested in</h2>
            <h5 class="h5 text-light pb-3">이런 상품들은 어때요?</h2>
                <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-carousel-light">
                    <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 3, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1, &quot;gutter&quot;: 16},&quot;500&quot;:{&quot;items&quot;:2, &quot;gutter&quot;: 18},&quot;900&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 20}, &quot;1100&quot;:{&quot;gutter&quot;: 24}}}">
						<!-- 제 i호 상품 시작-->
						<% for (int i = 1; i < pList.size(); i++){ %>
                        <div>
                            <div class="card card-light card-hover h-100">
                                <div class="card-img-top card-img-hover">
                                    <a class="img-overlay" href="<%=path+"/souvenirProductsDetail.do?productNo=" + pList.get(i).getSouv_pro_no()%>"></a>
                                    <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                       
                                    </div><img class="img-souvnir-dl" src="<%=pList.get(i).getSouv_pro_url()%>" alt="Image">
                                </div>
                                <div class="card-body">
                                    <div class="d-flex align-items-center justify-content-between pb-1">
                                        <span class="fs-sm text-light me-3">사뿐몰 제 <%=i %>호 상품</span>
                                        <div class="form-check form-check-light">

                                        </div>
                                    </div>
                                    <h3 class="h6 mb-1">
                                        <a class="nav-link-light" href="<%=path+"/souvenirProductsDetail.do?productNo=" + pList.get(i).getSouv_pro_no()%>" style="color: #A08DB4;"><%=pList.get(i).getSouv_pro_name()%></a>
                                    </h3>
                                    <div class="text-primary fw-bold mb-1 ms-1"><%=df.format(pList.get(i).getSouv_pro_price()) %>원</div>
                                </div>

                                <!-- 상품 박스 하단 버튼 시작 -->
                                <div class="card-footer border-0 pt-0">
                                    <div class="border-top border-light pt-3">
                                        <div class="row g-2">
                                            <div class="col me-sm-1">
                                                <div class="bg-dark rounded text-center w-100 h-100 p-2">
                                                    <i class="fi-cart d-block h4 text-light mb-0 mx-center"></i>
                                                    <form action="<%=path%>/souvenirInsert.do" method="post">
												<input name="productNo" type="hidden" value="<%=pList.get(i).getSouv_pro_no()%>">
												<button type="submit" class="nav-link-light bg-dark" style="border : none; font-size: 13px;">장바구니</button></span>
												</form>
                                                </div>
                                            </div>
                                            <div class="col me-sm-1">
                                                <div class="bg-dark rounded text-center w-100 h-100 p-2">
                                                    <i class="fi-eye-on d-block h4 text-light mb-0 mx-center"></i>
                                                    <span class="fs-xs text-light"><a href="<%=path+"/souvenirProductsDetail.do?productNo=" + pList.get(i).getSouv_pro_no()%>" class="nav-link-light">상세보기</a></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 상품 박스 하단 버튼 끝 -->
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
        </div>
    </main>
    <!-- Footer-->
	
</script>
    
<%@include file="/views/common/footer.jsp"%>
