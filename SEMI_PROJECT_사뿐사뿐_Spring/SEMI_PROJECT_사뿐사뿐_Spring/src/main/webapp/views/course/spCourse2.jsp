<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/views/common/headerLight.jsp"%>
<script src="js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	function chk_form() {
		document.getElementById('frm1').submit();
	}

	function stampClick(){
		alert('클릭 테스트!');
		
		var currClassName = document.getElementById('stamp');
		alert(currClassName.className);
		/* console.log(currClassName); */
		currClassName.setAttribute("class", "stamp1");
		/* console.log(currClassName); */
		alert(currClassName.className);
		/* div1.classList.remove('stamp'); */
		var currClassId = document.querySelector("#stamp");
		alert(currClassId.className)
		
		
		
		
	}
	
	/* ---- */
	document.querySelector('#stampUp').addEventListener('click', function(){
		currClassId.setAttribute("src", "<%=path%>/resources/img/semi-img/20.redStamp.png");
	});
	/* ---- */
	
</script>

<style>
#stamp {
	display: none;

	width: auto;
	height: auto;
	max-width: 90px;
	max-height: 90px;
	position: relative;
	top: -35px;
	left: -3px;
	z-index: 1; 
}

.stamp1 {
	width: auto;
	height: auto;
	max-width: 90px;
	max-height: 90px;
	position: relative;
	top: -35px;
	left: -3px;
	z-index: 1;
}

#stampUp {
	display: block;
	cursor: pointer;
}
</style>



<!-- Page content-->
<!-- Breadcrumb-->
<div class="container mt-5 mb-md-4 pt-5">
	<nav class="mb-3 pt-md-3" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="real-estate-home-v1.html">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">스탬프</li>
		</ol>
	</nav>
</div>
<!-- Page header-->
<section class="jarallax bg-dark zindex-1 py-xxl-4 pt-5" data-jarallax
	data-speed="0.5">
	<span class="img-overlay bg-transparent opacity-100"></span>
	<div class="jarallax-img opacity-50"
		style="background-image: url(<%=path%>/resources/img/semi-img/20.stamp.temp.main.PNG);">
	</div>
	<div class="content-overlay container py-md-5">
		<h1 class="mx-auto text-center" style="max-width: 856px; color: #fff;">
			스탬프 투어<br>
			<p style="font-size: 18px; color: #cccccc; margin-top: 1%;">사뿐사뿐과
				더 재미있게 역사 알아가기</p>
		</h1>
	</div>
</section>
<!-- Page content-->
<section class="container mb-md-5 mb-4 pb-lg-5" style="margin-top: 5%;">
	<div class="row">
		<!-- Sidebar offcanvas-->
		<aside class="col-xl-2 col-lg-3">
			<div class="offcanvas offcanvas-start offcanvas-collapse"
				id="help-sidebar">
				<div class="offcanvas-header shadow-sm mb-2">
					<h2 class="h5 mb-0">FAQ</h2>
					<button class="btn-close" type="button" data-bs-dismiss="offcanvas"></button>
				</div>
				<div class="offcanvas-body">
					<b><ul
							class=" nav nav-tabs navbar-nav flex-column m-0 text-lg-center">
							<li class="nav-item px-0"><a
								class="nav-link px-3 fs-6 menuList" href="<%=path %>/views/course/spCourse1.jsp">가야문명의 길</a></li>
							<li class="nav-item px-0"><a
								class="nav-link active px-3 fs-6 menuList" href="<%=path %>/views/course/spCourse2.jsp" >관동풍류의
									길</a></li>
							<li class="nav-item px-0"><a
								class="nav-link px-3 fs-6 menuList" href="<%=path %>/views/course/spCourse3.jsp">백제고도의 길</a></li>
							<li class="nav-item px-0"><a
								class="nav-link px-3 fs-6 menuList" href="<%=path %>/views/course/spCourse4.jsp">산사의 길</a></li>
							<li class="nav-item px-0"><a
								class="nav-link px-3 fs-6 menuList" href="<%=path %>/views/course/spCourse5.jsp">서원의 길</a></li>
							<li class="nav-item px-0"><a
								class="nav-link px-3 fs-6 menuList" href="<%=path %>/views/course/spCourse6.jsp">선사지질의 길</a></li>
							<li class="nav-item px-0"><a
								class="nav-link px-3 fs-6 menuList" href="<%=path %>/views/course/spCourse7.jsp">설화와 자연의 길</a></li>
							<li class="nav-item px-0"><a
								class="nav-link px-3 fs-6 menuList" href="<%=path %>/views/course/spCourse8.jsp">왕가의 길</a></li>
							<li class="nav-item px-0"><a
								class="nav-link px-3 fs-6 menuList" href="<%=path %>/views/course/spCourse9.jsp">천년정신의 길</a></li>
						</ul></b>
				</div>
			</div>
		</aside>

		<!-- Content-->

		<div class="col-lg-9 offset-xl-1 col-lg-8 align-content-center">
			<h4 class="h2 fw-bolder mt-2 ms-5 ps-4" style="letter-spacing: -3px;">
				관동 풍류의 길</h4>
			<h6 class="h6 fw-bold mt-1 ms-5 ps-4"
				style="color: rgb(143, 143, 143); letter-spacing: -2px;">강릉, 속초, 양양, 평창 - 한국 진경문화의 꽃</h6>

			<!-- Content overlay on hover -->
			<a href="#"
				class="col-lg-9 offset-xl-1 col-lg-8 align-content-center card shadow-sm card-hover border-0">

				<div class="card-img-top card-img-hover">
					<span class="img-overlay opacity-65"></span>

					<!-- 지도이미지 -->
					<img src="<%=path%>/resources/img/semi-img/20.myStampEntireMap.png"
						alt="">
					<div
						class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center 
                    w-100 h-100 p-3">

						<div class="w-80 p-1">
							<div class="mb-2">
								<div class="d-flex align-items-center">
									<img
										src="<%=path%>/resources/img/semi-img/20.gwandong02.JPG"
										alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</a>

			<p class="col-lg-9 offset-xl-1 col-lg-8 fw-bold mt-3"
				style="color: rgb(143, 143, 143);">관동팔경의 강원도는 백두대간과 동해가 빚어내는 빼어난 경치로 한국 고유 산천의 아름다움을 진경(眞景) 문화로 꽃피우게 했던 발원지다. 
				예로부터 많은 시인 묵객의 발길이 끊이지 않았으며 당대의 문인들은 산수, 풍경, 고사, 풍속 등을 노래와 시조로 표현하며 풍류를 즐겼다.
				유네스코 인류문화유산인 대목장의 기술로 지어진 전통 건축물과 조선 시대 가사 문학의 대가였던 송강 정철이 지은 관동별곡의 배경이기도 한 
				관동팔경을 중심으로 하는 풍류의 길에서 강원도 지역 문화유산을 느낄 수 있다.</p>

			<a href="#showStamp"
				class="col-lg-9 offset-xl-1 col-lg-8 btn mt-3 justify-content-end"
				style="background-color: #d5a59e; color: #fff;"
				data-bs-toggle="collapse" role="button" aria-expanded="false"
				aria-controls="collapseExample"> 스탬프 구경하기 </a>
			<div class="collapse col-lg-9 offset-xl-1 col-lg-8 " id="showStamp">
					<div class="mt-4 mb-4 card card-body">
					<form id="frm1" action="<%=path %>/course/main" method="POST">
						<div class="steps fw-bold mb-2 mt-2">
							<div class="step">
								<div class="step-progress test1">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span>
									<span class="step-number">1</span>
								</div>
								

								<div class="step-label div1" id="div1">
									<img class="stamp33" id="stamp"
										src="<%=path%>/resources/img/semi-img/20.redStamp.png">
										강릉<br>경포대
								</div>


							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">2</span>
								</div>
								<div class="step-label">
									강릉<br>선교장
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">3</span>
								</div>
								<div class="step-label">
									강릉<br>오죽헌
								</div>
							</div>
						</div>
					

						<!-- 두번째단 -->
						<div class="steps fw-bold mb-2 mt-2">
							<div class="step">
								<div class="step-progress test1">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span>
									<span class="step-number">4</span>
								</div>
								

								<div class="step-label div1" id="div1">
										속초<br>신흥사
								</div>


							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">5</span>
								</div>
								<div class="step-label">
									양양<br>낙산사
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">6</span>
								</div>
								<div class="step-label">
									평창<br>월정사
								</div>
							</div>
						</div>
					</div>	
				</div>


			
		</div>
	</div>
</section>





<!-- Filters sidebar toggle button (mobile)-->
<button
	class="btn btn-primary btn-sm w-100 rounded-0 fixed-bottom d-lg-none "
	type="button " data-bs-toggle="offcanvas "
	data-bs-target="#help-sidebar ">
	<i class="fi-sidebar-right me-2 "></i>FAQ Links
</button>
<!-- Back to top button-->
<a class="btn-scroll-top " href="#top " data-scroll><span
	class="btn-scroll-top-tooltip text-muted fs-sm me-2 ">Top</span><i
	class="btn-scroll-top-icon fi-chevron-up "> </i></a>
<!-- Vendor scrits: js libraries and plugins-->
<script src="vendor/bootstrap/dist/js/bootstrap.bundle.min.js "></script>
<script src="vendor/simplebar/dist/simplebar.min.js "></script>



<script src="vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js "></script>
<!-- Main theme script-->
<script src="js/theme.min.js "></script>



<!-- 푸터 -->
<%@ include file="/views/common/footer.jsp"%>