<%@page import="semi.heritage.souvenir.vo.SouvenirPay"%>
<%@page import= "java.text.DecimalFormat" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="/views/common/headerDark.jsp"%>

<%
Member member = (Member) request.getAttribute("member");
DecimalFormat df = new DecimalFormat("###,###");
List<SouvenirPay> payList = (List<SouvenirPay>) request.getAttribute("payList");
%>

<body class="bg-dark">
    <main class="page-wrapper">
        <!-- Navbar-->
       
        <div class="container mt-5 mb-md-4 py-5">
            <div class="row">
                <!-- Page content-->
                <div class="col-lg-7">
                    <!-- Breadcrumb-->
                    <nav class="mb-3 pt-md-3" aria-label="Breadcrumb">
                        <ol class="breadcrumb breadcrumb-light">
                            <li class="breadcrumb-item"><a href="<%=path%>/souvenirMain.do">사뿐몰</a></li>
                            <li class="breadcrumb-item active" aria-current="page">결제 및 주문하기</li>
                        </ol>
                    </nav>
                    <!-- Title-->
                    <div class="mb-4">
                        <h1 class="h2 text-light mb-0">결제 및 주문하기</h1>
                        <div class="progress progress-light d-lg-none mb-4" style="height: .25rem;">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <!-- 기본정보 및 배송지 입력 시작-->
                    <section class="card card-light card-body border-0 shadow-sm p-4 mb-4" id="basic-info">
                        <h4 class="mb-4 mt-2" style="color: #C389FF;">기본정보 및 배송지</h4>
                        <!-- 이름 -->
                        <div class="row">
                            <div class="col-sm-6 mb-3">
                                <label class="form-label text-light mb-2 mt-2 ms-1" for="sc-fn">이름 (받는 사람) <span class="text-danger ms-1"> * </span></label>
                                <input class="form-control form-control-light" type="text" id="sc-fn" value="<%=loginMember.getUname() %>" placeholder="이름" required>
                            </div>
                            <!-- 주소 -->
                            <div class="row">
                                <div class="col-sm-6 mb-1">
                                    <label class="form-label text-light mb-2 mt-2 ms-1" for="sc-fn"> 주소 </label>
                                    <span class="text-danger ms-1"> * </span>
                                    <div class="d-flex align-items-center mb-1">
                                        <input class="form-control form-control-light me-2 mb-2" style="width: 40%;" type="text" id="sc-zip" value="" placeholder="우편번호">

                                    </div>
                                </div>
                                <div class="mb-3">
                                    <input class="form-control form-control-light" type="text" id="sc-address1" placeholder="기본 주소" value="<%=loginMember.getUadr() %>" required>
                                </div>
                                <div class="mb-3">
                                    <input class="form-control form-control-light" type="text" id="sc-address1" placeholder="상세 주소" value="" required>
                                </div>
                            </div>
                        </div>
                        <!-- 연락처 -->
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light mb-2 mt-2 ms-1" for="sc-phone"> 연락처 <span class="text-danger">&nbsp * </span></label>
                            <input class="form-control form-control-light" type="tel" id="sc-phone" data-format="custom" data-delimiter="-" data-blocks="3 4 4" value="<%=loginMember.getUpn() %>" placeholder="000-0000-0000">
                        </div>
                        <!-- 이메일 -->
                        <div class="col-sm-6 mb-3">
                            <label class="form-label text-light mb-2 mt-2 ms-1" for="sc-email"> Email <span class="text-danger">&nbsp * </span></label>
                            <input class="form-control form-control-light" type="text" id="sc-email" value="<%=loginMember.getUemail() %>" placeholder="이메일">
                        </div>

                    </section>
                    <!-- 기본정보 및 배송지 입력 끝-->
                    <!-- 카드정보입력 시작-->
                    <section class="card card-light card-body border-0 shadow-sm p-4 mb-4" id="card">
                        <h2 class="h4 mb-4 mt-2" style="color: #C389FF;">결제카드 정보</h2>
                        <label class="form-label text-light mb-2 ms-1" for="sc-card">카드 정보<span class="text-danger">&nbsp *</span></label>
                        <div class="d-sm-flex mb-2">
                            <select class="form-select form-select-light w-50 me-2 mb-2">
                          <option value="VISA">VISA</option>
                          <option value="MASTER">MASTER</option>
                          <option value="UNION-PAY">UNION-PAY</option>
                        </select>
                            <input class="form-control form-control-light w-100 me-2 mb-2" type="tel" id="sc-card" data-delimiter="-" data-blocks="4 4 4 4" data-format="custom" value="" placeholder="0000-0000-0000-0000" required>
                        </div>

                        <!-- 유효기간 & CVV 시작-->
                        <div class="row">
                            <div class="col-sm-4 mb-3">
                                <label class="form-label text-light mb-2 mt-1 ms-1" for="sc-card">유효기간<span class="text-danger">&nbsp *</span></label>
                                <input class="form-control form-control-light mb-2" style="width: 120%;" type="month" &gt data-delimiter="/" data-blocks="2 2" id="sc-expire" placeholder="MM/YY" required>

                                <label class="form-label text-light mb-2 mt-1 ms-1" for="sc-card">CVV<span class="text-danger">&nbsp *</span></label>
                                <input class="form-control form-control-light mb-3" style="width: 120%;" type="text" maxlength="3" id="sc-cvv" value="" placeholder="3자리" pattern="[0-9]{1}[0-9]{1}[0-9]{1}" required>
                            </div>
                            <!-- 유효기간 & CVV 끝-->
                            <!-- 결제 동의 시작 -->
                            <div class="border-light border-bottom-md"></div>
                            <div class="form-label text-light fw-bold pt-4 pb-2">위의 구매정보 및 당사의 결제정책에 대해 동의하십니까?</div>
                            <div class="form-check form-check-light ms-3">
                                <input class="form-check-input" type="radio" id="sc-dealer" name="sc-seller-type" checked>
                                <label class="form-check-label" for="sc-dealer">동의합니다</label>
                            </div>
                            <div class="form-check form-check-light ms-3 me-3 mb-5">
                                <input class="form-check-input" type="radio" id="sc-individual" name="sc-seller-type">
                                <label class="form-check-label" for="sc-individual">동의하지 않습니다</label>
                            </div>
                            <!-- 결제 동의 끝 -->
                            <div class="d-sm-flex justify-content-end pt-3 pb-1">
                                <a class="btn btn-outline-light btn-lg d-block mb-3 mb-sm-2 me-4" onclick="history.go(-1); return false;" data-bs-toggle="modal">
                                    돌아가기</a>
                                <a class="btn btn-lg d-block mb-2" href="<%=path%>/myPageBuyING.do" style="background-color: #C389FF; color: #fff;">결제하기</a></div>
                        </div>
                    </section>
                </div>
                <!-- Progress of completion-->
                <aside class="col-lg-4 offset-lg-0 d-none d-lg-block pt-4 mt-3 mb-3">
                    <div class="sticky-top pt-5 ms-5">
                        <h5 class="text-light pt-5 mb-2">주문 내역</h5>

                        <ul class="list-unstyled mt-3">

							<%for(int i = 0; i<payList.size(); i++){ %>
                            <li class="d-flex align-items-start mt-4">
                                <img class="img-souvnir-co" src="<%=payList.get(i).getSouv_pro_url() %>" style="width: 132px; height: 83px">
                                <p class="col-lg-8 nav-link-light ps-1 ms-2" data-scroll data-scroll-offset="20">
                                    <%=payList.get(i).getSouv_pro_name() %></a><br>
                                    <a class="nav-link-light opacity-65 fs-sm" data-scroll data-scroll-offset="20"> 가격 : <%=df.format(payList.get(0).getSouv_pro_price())%>원</a>
                            </li>
							<%} %>
                            


                            <!-- 금액 시작 -->
                            <li class="d-flex justify-content-end mt-5 pt-3">
                                <a class="me-2" style="text-decoration: none; color: #898989;">배송비</a>
                                <a class="nav-link-light ps-1 justify-content-end" data-scroll data-scroll-offset="20">3,000원</a>
                            </li>
                            <li class="d-flex justify-content-end">
                                <a class="me-2" style="text-decoration: none; color: #898989;">구매액</a>
                                <a class="nav-link-light ps-1 justify-content-end" data-scroll data-scroll-offset="20"><%=df.format(payList.get(0).getTotal_price()) %>원</a>
                            </li>
                            <div class="border-bottom border-secondary mt-4 mb-4" style="height: .25rem;"></div>
                            <li class="d-flex justify-content-end">
                                <a class="me-2 text-light" style="text-decoration: none;">총 구매액</a>
                                <a class="nav-link-light ps-1 justify-content-end text-light" data-scroll data-scroll-offset="20"><%=df.format(payList.get(0).getBsb_total_price()) %>원</a>
                            </li>
                        </ul>
                    </div>
                </aside>
            </div>
        </div>
    </main>
    <!-- Footer-->
<%@include file="/views/common/footer.jsp"%>

