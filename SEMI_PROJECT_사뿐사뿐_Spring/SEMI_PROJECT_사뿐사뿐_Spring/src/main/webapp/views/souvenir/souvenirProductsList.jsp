<%@page import="semi.heritage.souvenir.vo.SouvenirProduct"%>
<%@page import="semi.heritage.souvenir.vo.SouvenirCategory"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/views/common/headerDark.jsp"%>

<%
DecimalFormat df = new DecimalFormat("###,###");

List<SouvenirProduct> productList = (List<SouvenirProduct>) request.getAttribute("productList");
List<SouvenirProduct> productListAll = (List<SouvenirProduct>) request.getAttribute("listIngi");
List<SouvenirCategory> listCat = (List<SouvenirCategory>) request.getAttribute("listCat");
SouvenirProduct cart = (SouvenirProduct)request.getAttribute("SouvenirCartInsertServlet");
%>

<script>
function chageCate(categories){
	location.href=categories;
}
</script>
<div class="container mt-5 mb-md-4 py-5">
	<div class="row py-md-1">

		<!-- Catalog grid view-->
		<!-- Page title-->
		<div
			class="d-flex align-items-center justify-content-between pb-3 mb-2 mt-5 pt-5"
			style="padding: 19%;">
			<h1 class="text-light me-3 mt-1 mb-0">상품 목록</h1>
		</div>

		<div class="col-lg-9" style="padding-left: 20%;">
			<!-- Breadcrumb-->
			<nav class="mb-3 pt-md-2 pt-lg-1" aria-label="Breadcrumb">
				<ol class="breadcrumb breadcrumb-light">
					<li class="breadcrumb-item"><a
						href="<%=path%>/souvenirMain.do">사뿐몰</a></li>
					<li class="breadcrumb-item active" aria-current="page">상품 목록</li>
				</ol>
			</nav>
			<!-- Sorting + View-->
			<div
				class="d-sm-flex align-items-center justify-content-between pb-4 mb-2">
				<div class="d-flex align-items-center me-sm-4">
					<label class="fs-sm text-light me-2 pe-1 mt-1 text-nowrap"
						for="sorting1">
						카테고리 선택
					</label>

					<div class="d-none d-md-block border-end border-light m-lg-4"
						style="height: 1.25rem;"></div>

					<font name="move" method="post">
					<select name="categories" onchange="chageCate(this.value);"
						class="form-select form-select-light form-select-sm me-sm-4">
						
						<option value="">---선택하세요---</option>
						<option value="<%=path+"/souvenirProductsList.do"%>">전체</option>
						<option value="<%=path+"/souvenirProductsList.do?category=생활/데코"%>">생활/데코</option>
						<option value="<%=path+"/souvenirProductsList.do?category=패션/잡화"%>">패션/잡화</option>
						<option value="<%=path+"/souvenirProductsList.do?category=사무/문구"%>">사무/문구</option>
						<option value="<%=path+"/souvenirProductsList.do?category=유아/DIY"%>">유아/DIY</option>
						<option value="<%=path+"/souvenirProductsList.do?category=뷰티/미용"%>">뷰티/미용</option>
						<option value="<%=path+"/souvenirProductsList.do?category=전자/IT"%>">전자/IT</option>
						
					</select>
					</font>
				</div>

			</div>
			<div class="row">

				<!-- Item-->
				<%
				for (int i = 0; i < productList.size(); i++) {
				%>
				<div class="col-sm-6 mb-4">
					<div class="card card-light card-hover h-100">
						<div class="tns-carousel-wrapper card-img-top card-img-hover">
							<a class="img-overlay" href="<%=path+"/souvenirProductsDetail.do?productNo=" + productList.get(i).getSouv_pro_no()%>"></a>
							<div class="position-absolute start-0 top-0 pt-3 ps-3">
							</div>

							<div class="tns-carousel-inner">
								<img src="<%=productList.get(i).getSouv_pro_url()%>" alt="Image" style="height: 353px; width: 353px">
							</div>
						</div>

						<!-- 상품 박스 설명 시작 -->
						<div class="card-body">
							<div
								class="d-flex align-items-center justify-content-between pb-1">
								<span class="fs-sm text-light me-3"><%=productList.get(i).getSouv_pro_category()%></span>
								<div class="form-check form-check-light"></div>
							</div>
							<h3 class="h6 mb-1">
								<a class="nav-link-light"
									href="<%=path%>/souvenirProductsDetail.do?productNo=<%=productList.get(i).getSouv_pro_no()%>"
									style="color: #A08DB4;"><%=productList.get(i).getSouv_pro_name()%></a>
							</h3>
							<div class="text-primary fw-bold mb-1 ms-1"><%=df.format(productList.get(i).getSouv_pro_price())%>원
							</div>
							<div class="fs-sm text-light opacity-70"></div>
						</div>
						<!-- 상품 박스 설명 끝 -->

						<!-- 상품 박스 하단 버튼 시작 -->
						<div class="card-footer border-0 pt-0">
							<div class="border-top border-light pt-3">
								<div class="row g-2">
									<div class="col me-sm-1">
										<div class="bg-dark rounded text-center w-100 h-100 p-2">
											<i class="fi-cart d-block h4 text-light mb-0 mx-center"></i>
											<form action="<%=path%>/souvenirInsert.do" method="post">
												<input type="hidden" name="productNo" value="<%=productList.get(i).getSouv_pro_no()%>">
												<span class="fs-xs text-light"><button type="submit" class="nav-link-light bg-dark" style="border : none;">장바구니</button></span>
											</form></div>
									</div>
									<div class="col me-sm-1">
										<div class="bg-dark rounded text-center w-100 h-100 p-2">
											<i class="fi-eye-on d-block h4 text-light mb-0 mx-center"></i>
											<span class="fs-xs text-light"><a
												href="<%=path%>/souvenirProductsDetail.do?productNo=<%=productList.get(i).getSouv_pro_no()%>"
												class="nav-link-light">상세보기</a></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 상품 박스 하단 버튼 끝 -->
					</div>
				</div>
				<%
				}
				%>
				<!-- item 끝 -->
			</div>
		</div>
	</div>
</div>
</main>
<!-- Footer-->
<%@include file="/views/common/footer.jsp"%>


