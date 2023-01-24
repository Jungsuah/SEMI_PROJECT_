<%@page import="semi.heritage.souvenir.vo.SouvenirBuy"%>
<%@page import= "java.text.DecimalFormat" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/headerLight.jsp" %>
<%@ include file="/views/common/sidebar.jsp" %>

<%
DecimalFormat df = new DecimalFormat("###,###");
List<SouvenirBuy> BuyList = (List<SouvenirBuy>)request.getAttribute("BuyList");
%>

<style>
.orderPhoto {
	width: 120px;
	height: 80px;
    border-radius: 30% !important;
}
</style>

<div class="col-lg-8 col-md-7 mb-5">
	<h1 class="h2">구매이력</h1>
	<p class="pt-1 mb-4">사뿐몰에서 구매한 목록을 확인해보세요</p>
	<div class="tab-content pt-2">
		<!-- Reviews about you tab-->
		<div class="tab-pane fade show active" id="reviews-about-you"
			role="tabpanel">
			<div
				class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch justify-content-between pb-4 mb-2 mb-md-3">
				<div class="d-flex align-items-center">
				</div>
			</div>

			<!-- 구매내역 시작-->
			<!-- 주문번호 첫번째 시작 -->
			
			
			<div class="mb-4 pb-4">
					<div class="card card-body">
						<table>
							<thead class="thead-dark">
								<tr class="active" style="font-size: 16px;">
									<th class="fw-bold align-content-center mb-lg-3"
										style="text-align: center;">주문번호</th>
									<th class="fw-bold align-content-center mb-lg-3"
										style="text-align: center;">상품번호</th>
									<th class="fw-bold align-content-center"
										style="text-align: center;">상품명</th>
									<th class="fw-bold align-content-center"
										style="text-align: center;">가격</th>
								</tr>
							</thead>
							<tbody>
					<%for(int i = 0; i<BuyList.size(); i++){ %>
								<tr style="font-size: 15px;">
									<th class="fw-bold align-content-center" 
										style="color: #9E9E9E; text-align: center; border-top: 1px solid #efecf3;"><%=BuyList.get(i).getOrderNum() %></th>
									<td class="fw-bold align-content-center"
										style="color: #9E9E9E; text-align: center; border-top: 1px solid #efecf3;"><%=BuyList.get(i).getSouv_pro_no() %></td>
									<td class="fw-bold align-content-center"
										style="color: #9E9E9E; text-align: center; border-top: 1px solid #efecf3;"><a
										class="card-nav-link" style="text-decoration: none;"
										href="<%=path+"/souvenirProductsDetail.do?productNo=" + BuyList.get(i).getSouv_pro_no()%>"><%=BuyList.get(i).getSouv_pro_name() %></a></td>
									<td class="fw-bold align-content-center"
										style="color: #9E9E9E; text-align: center; border-top: 1px solid #efecf3;"><%=df.format(BuyList.get(i).getSouv_pro_price())%>원</td>
								</tr>
						<%} %>
							</tbody>
						</table>
						<table class="table table-striped">
							<thead>
								<tr>
								<tr></tr>
								<tr></tr>
								<tr></tr>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th class="fw-bold align-content-center"></th>
									<td class="fw-bold align-content-center "></td>
									<td class="fw-bold align-content-center ">배송비(3,000원) 포함 총 가격</td>
									<td class="fw-bold align-content-center "
										style="color: #9E9E9E; column-span: all; text-align: right; padding-right: 7%;"><%=df.format(BuyList.get(0).getBsb_total_price()) %>원</td>
								</tr>
							</tbody>
						</table>
					</div>
				<!-- 주문번호 첫번째 끝 -->
			</div>
		</div>
	</div>
</div>
</main>
<!-- Footer-->
<%@include file="/views/common/footer.jsp"%>