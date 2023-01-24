<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/headerLight.jsp"%>
<script src="js/jquery-3.6.0.min.js"></script>
<!-- <script type="text/javascript"> -->



<script type="text/javascript">
	function chk_form() {
		document.getElementById('frm1').submit();
	}


	/* function stampClick(){
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
			
	} */
	
	/* ---- */
	document.querySelector('#stampUp').addEventListener('click', function(){
		currClassId.setAttribute("src", "<%=path%>/resources/img/semi-img/20.redStamp.png");
	});
	/* ---- */
	
</script>

<style>
#stamp {
	/* display: none; */

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
								class="nav-link px-3 fs-6 menuList" href="<%=path %>/views/course/spCourse2.jsp" onclick="">관동풍류의
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
								class="nav-link active active px-3 fs-6 menuList" href="<%=path %>/views/course/spCourse9.jsp">천년정신의 길</a></li>
						</ul></b>
				</div>
			</div>
		</aside>

		<!-- Content-->

		<div class="col-lg-9 offset-xl-1 col-lg-8 align-content-center">
			<h4 class="h2 fw-bolder mt-2 ms-5 ps-4" style="letter-spacing: -3px;">
				천년정신의 길</h4>
			<h6 class="h6 fw-bold mt-1 ms-5 ps-4"
				style="color: rgb(143, 143, 143); letter-spacing: -2px;">경주, 안동 - 대한민국 정신을 걷다</h6>

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
										src="<%=path%>/resources/img/semi-img/20.chunnyunJungsin09.JPG"
										alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</a>

			<p class="col-lg-9 offset-xl-1 col-lg-8 fw-bold mt-3"
				style="color: rgb(143, 143, 143);">우리는 거대한 유적에 압도되고, 오래된 건물에 감동하며, 정교한 유물에 감탄한다. 
				흥겨운 가락에 들썩이는가 하면, 신나는 놀이에 흥분하기도 한다. 길어야 백년 정도 살 수 있는 인간은 자신보다 오래 살아남는 것들을 
				만들어냈고, 일부는 지금도 우리와 함께 호흡하고 있다. 아득한 세월을 이겨냈다는 점만으로도 오래된 것들은 특별하다. 그러나 문화유산 
				앞에서 감정의 스펙트럼이 확장되는 건 그 속에 담겨 있는 ‘정신’과 무관하지 않다. 모든 문화는 인간의 정신 활동과 관련되어 있다. 
				보이지 않는 정신은 유형의 유산뿐만 아니라 무형의 유산에도 반영된다. 그렇기에 유무형의 유산들이 산재해 있는 장소를 둘러보는 것은 
				과거로부터 이어져온 정신을 더듬어본다는 뜻이기도 하다. 이 신비로운 여정의 시작과 끝 사이에는 각기 다른 매력을 가진 두 도시가 있다. 
				천년고도 경주와 한국 정신문화의 수도 안동이다.</p>

 			<a href="#showStamp"
				class="col-lg-9 offset-xl-1 col-lg-8 btn mt-3 justify-content-end"
				style="background-color: #d5a59e; color: #fff;"
				data-bs-toggle="collapse" role="button" aria-expanded="false"
				aria-controls="collapseExample"> 스탬프 구경하기 </a> 
				
				
			 <div class="collapse col-lg-9 offset-xl-1 col-lg-8 " id="showStamp">
					<div class="mt-4 mb-4 card card-body">
					<%-- <form id="frm1" action="<%=path %>/course/main" method="POST"> --%>
						<div class="steps fw-bold mb-2 mt-2">
							<div class="step">
								<div class="step-progress test1">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span>

									<span class="step-number">1</span>
								</div>

								<div class="step-label div1" id="div1">
										경주 계림
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">2</span>
								</div>
								<div class="step-label">
									경주<br>대릉원 일원
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">3</span>
								</div>
								<div class="step-label">
									경주 불국사
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">4</span>
								</div>
								<div class="step-label">
									경주 석굴암
								</div>
							</div>
						</div>
					<!-- </form> -->


					<div class="steps fw-bold mt-4 mb-2">
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">5</span>
								</div>
								<div class="step-label">
									경주 월성
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">6</span>
								</div>
								<div class="step-label">
									안동<br>도산서원
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">7</span>
								</div>
								<div class="step-label">
									안동 봉정사
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">8</span>
								</div>
								<div class="step-label">
									안동<br>하회마을
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