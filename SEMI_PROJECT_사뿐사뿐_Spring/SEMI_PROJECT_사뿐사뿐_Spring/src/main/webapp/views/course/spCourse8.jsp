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
								class="nav-link active px-3 fs-6 menuList" href="<%=path %>/views/course/spCourse8.jsp">왕가의 길</a></li>
							<li class="nav-item px-0"><a
								class="nav-link px-3 fs-6 menuList" href="<%=path %>/views/course/spCourse9.jsp">천년정신의 길</a></li>
						</ul></b>
				</div>
			</div>
		</aside>

		<!-- Content-->

		<div class="col-lg-9 offset-xl-1 col-lg-8 align-content-center">
			<h4 class="h2 fw-bolder mt-2 ms-5 ps-4" style="letter-spacing: -3px;">
				왕가의 길</h4>
			<h6 class="h6 fw-bold mt-1 ms-5 ps-4"
				style="color: rgb(143, 143, 143); letter-spacing: -2px;">강화, 광주, 김포, 서울, 
				수원, 화성 - 서울과 수도권에서 만나는 대한민국 역사 여행</h6>

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
										src="<%=path%>/resources/img/semi-img/20.king08.JPG"
										alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</a>

			<p class="col-lg-9 offset-xl-1 col-lg-8 fw-bold mt-3"
				style="color: rgb(143, 143, 143);">선사시대부터 사람이 살기 시작한 서울은 백제의 수도였을 땐 위례성 또는 한성이라 
				불렸고 조선의 수도였을 땐 한양이라 불렸다. 조선 시대 이후로 현재까지 수도로 존재해 온 이곳은 우리나라의 역사가 압축된 곳으로, 
				특히 조선 역사의 중심이라 할 수 있다.궁궐이 다섯 개나 있다 보니 왕실과 관련된 이야기들이 많이 남아 있는데, 유적과 유물로 남아 
				있는 풍성한 이야기들은 수원과 화성, 김포와 강화로 확장된다. 서울에서 수도권으로 이어지는 길은 도성 안과 밖을 연결하는 길로, 
				켜켜이 쌓여온 시간으로 만들어진 길 위에는 왕실의 위엄과 화려한 문화, 번영과 위기의 순간들이 중첩되어 있다.</p>

 			<a href="#showStamp"
				class="col-lg-9 offset-xl-1 col-lg-8 btn mt-3 justify-content-end"
				style="background-color: #d5a59e; color: #fff;"
				data-bs-toggle="collapse" role="button" aria-expanded="false"
				aria-controls="collapseExample"> 스탬프 구경하기 </a> 
				
				
			 <div class="collapse col-lg-9 offset-xl-1 col-lg-8 " id="showStamp">
					<div class="mt-4 mb-4 card card-body">
			 			<h5 style="text-align:center; color: rgb(143, 143, 143);">1코스</h5>
						<div class="steps fw-bold mb-2 mt-2">
							<div class="step">
								<div class="step-progress test1">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span>

									<span class="step-number">1</span>
								</div>

								<div class="step-label div1" id="div1">
										남한산성
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">2</span>
								</div>
								<div class="step-label">
									수원 화성
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">3</span>
								</div>
								<div class="step-label">
									종묘
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">4</span>
								</div>
								<div class="step-label">
									창덕궁
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">5</span>
								</div>
								<div class="step-label">
									화성<br>융릉과 건릉
								</div>
							</div>
						</div>
					</div>
					
					<!--  -->
					
					<div class="mt-4 mb-4 card card-body">
						<h5 style="text-align:center; color: rgb(143, 143, 143);">2코스</h5>
						<div class="steps fw-bold mb-2 mt-2">
							<div class="step">
								<div class="step-progress test1">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span>

									<span class="step-number">1</span>
								</div>

								<div class="step-label div1" id="div1">
										강화<br>고인돌 유적
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">2</span>
								</div>
								<div class="step-label">
									강화<br>전등사
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">3</span>
								</div>
								<div class="step-label">
									경복궁
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">4</span>
								</div>
								<div class="step-label">
									김포 장릉
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">5</span>
								</div>
								<div class="step-label">
									종묘
								</div>
							</div>
						</div>
					</div>
					
					<!--  -->
					
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