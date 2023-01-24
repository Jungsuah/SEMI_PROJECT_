<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- <%@include file="/views/common/headerDark.jsp"%> --%>

<style>
.rounded-circle2 {
	width: 80px;
	height: 80px;
    border-radius: 100% !important;
}
</style>

<div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
            <!-- Breadcrumb-->
            <nav class="mb-4 pt-md-3" aria-label="Breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%=path%>/index.do">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">마이페이지</li>
                </ol>
            </nav>
            <!-- Page content-->
            <div class="row">
                <!-- Sidebar-->
                <aside class="col-lg-4 col-md-5 pe-xl-4 mb-5">
                    <!-- 프로필 & 카테고리 시작 -->
                    <div class="card card-body border-0 shadow-sm pb-1 me-lg-1">
                        <div class="d-flex d-md-block d-lg-flex align-items-start pt-lg-2 mb-4"><img class="rounded-circle2" src="<%=path+"/resources/upload/photo/"+loginMember.getRenamedPhoto()%>" width="48" onerror="this.src='<%=path%>/resources/img/semi-img/01.info.default.photo.png'">
                            <div class="pt-md-2 pt-lg-0 ps-3 ps-md-0 ps-lg-3">
                                <h2 class="fs-lg mb-0"><%=loginMember.getUname()%>님</h2>
                                <ul class="list-unstyled fs-sm mt-3 mb-0">
                                    <li><a class="nav-link fw-normal p-0" href="tel:3025550107"><i class="fi-phone opacity-60 me-2"></i><%if(loginMember.getUpn() != null){%><%=loginMember.getUpn() %><%} else {} %></a></li>
                                    <li><a class="nav-link fw-normal p-0" href="mailto:annette_black@email.com"><i class="fi-mail opacity-60 me-2"></i><%=loginMember.getUemail() %></a></li>
                                </ul>
                            </div>
                        </div><a class="btn btn-lg w-100 mb-3" href="<%=path%>/community/write" style="background-color: #8957BD; color: #fff;"><i class="fi-plus me-2"></i>게시글 작성하기</a>
                        <a class="btn btn-outline-secondary d-block d-md-none w-100 mb-3" href="#account-nav" data-bs-toggle="collapse"><i class="fi-align-justify me-2"></i>Menu</a>

                        <div class="collapse d-md-block mt-3 a:hover" id="account-nav">
                            <div class="card-nav"><a class="card-nav-link" href="<%=path%>/myPageInfo.do"><i class="fi-user opacity-60 me-2"></i>회원정보 수정</a>
                                <a class="card-nav-link" href="<%=path%>/myPageCart.do" ><i class="fi-home opacity-60 me-2"></i>장바구니</a>
                                <a class="card-nav-link" href="<%=path%>/myPageLike.do"><i class="fi-heart opacity-60 me-2"></i>찜 목록</a>
                                <a class="card-nav-link" href="<%=path%>/myPageReview.do"><i class="fi-star opacity-60 me-2"></i>리뷰</a>
                                <a class="card-nav-link" href="<%=path%>/myPageOrder.do"><i class="fi-star opacity-60 me-2"></i>구매이력</a>
                                <!-- <a class="card-nav-link" href="real-estate-account-notifications.html"><i class="fi-bell opacity-60 me-2"></i>Notifications</a> -->
                                <a class="card-nav-link" href="<%=path%>/course/main"><i class="fi-help opacity-60 me-2"></i>스탬프</a>
                                <a class="card-nav-link" onclick="location.href='<%=path%>/logout';"><i class="fi-logout opacity-60 me-2"></i>로그아웃</a></div>
                        </div>
                    </div>
                </aside>
                
                					