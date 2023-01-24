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
								class="nav-link active px-3 fs-6 menuList" href="<%=path %>/views/course/spCourse1.jsp">가야문명의 길</a></li>
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
								class="nav-link px-3 fs-6 menuList" href="<%=path %>/views/course/spCourse9.jsp">천년정신의 길</a></li>
						</ul></b>
				</div>
			</div>
		</aside>

		<!-- Content-->

		<div class="col-lg-9 offset-xl-1 col-lg-8 align-content-center">
			<h4 class="h2 fw-bolder mt-2 ms-5 ps-4" style="letter-spacing: -3px;">
				가야문명의 길</h4>
			<h6 class="h6 fw-bold mt-1 ms-5 ps-4"
				style="color: rgb(143, 143, 143); letter-spacing: -2px;">고령,
				고성, 김해, 남원, 창녕, 함안, 합천 – 가야, 빛나는 철기 문화유산</h6>

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
										src="<%=path%>/resources/img/semi-img/20.myStamponlyGayaNobg.png"
										alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</a>

			<p class="col-lg-9 offset-xl-1 col-lg-8 fw-bold mt-3"
				style="color: rgb(143, 143, 143);">한반도 남부지역에는 많은 고분군들이 있지만 대부분이
				가야의 고분군들로 역사와 자연, 문화 유산이 많이 남아 있다. 고대사회에서 철 생산과 철제품의 보급은 사회 변화와 발전의
				원동력이었으며, 무덤에서 나오는 수많은 철제품이 이를 증명한다. 가야는 변한의 12개 작은 나라들의 연맹 왕국으로 김해의
				금관 가야, 고령의 대가야 등 여섯 나라가 있었으며, 풍부하게 생산한 철을 매개로 낙랑이나 중국, 일본 및 한반도의 여러
				지역과 교역하여 다양한 육로와 해로가 발달했다. 유네스코 문화유산으로 신청 중인 가야 고분군은 형태와 크기를 통해 전기
				가야부터 후기 가야까지 서기전 1세기 부터 서기 6세기까지 가야의 문화와 역사, 자연환경을 볼 수 있다. 가야 고분군은
				연맹이라는 독특한 정치체계를 유지하면서 주변의 중앙집권적 고대국가와 병존하였던 가야의 문명을 실증하는 독보적인 증거로,
				동아시아 고대 문명의 한 유형을 보여주는 중요한 유적이다.</p>

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
								<!-- <div class="step-label"><a id="stampUp" href="javascript:stampClick();">고령 지산동<br>고분군</a></div> -->
								<!-- onclick="viewStamp()" -->
								<!-- 누나꺼 -->
								<%-- <div class="step-label div1" id="div1">
									<a id="stampUp" href="javascript:stampClick();">고령 지산동<br>고분군
									</a>
									
									<img class="stamp stamp1" id="stamp"
										src="<%=path%>/resources/img/semi-img/20.redStamp.png">
								</div> --%>
								<%-- <%if(${course}.getPlace1().equals("Y")) {%> --%>
								<%-- <c:if test="${requestScope.course.model eq 'Y'}">
									<img class="stamp " id="stamp"
											src="<%=path%>/resources/img/semi-img/20.redStamp.png">
								</c:if> --%>
									

								<div class="step-label div1" id="div1">
									<!-- <a id="stampUp" href="#" onclick="stampClick()">  -->
									<!-- <a id="stampUp" href="#" onclick="return chk_form()">  -->
									<%-- <a id="stampUp" href="<%=path%>/course/main?p1=Y">  --%>
									<%-- <img class="stamp" id="stamp"
										src="<%=path%>/resources/img/semi-img/20.redStamp.png"> --%>
										고령 지산동<br>고분군 
										<!-- <input type="hidden" name="place1" value="Y"> -->
									<!-- </a> -->

								</div>


							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">2</span>
								</div>
								<div class="step-label">
									고성 송학동<br>고분군
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">3</span>
								</div>
								<div class="step-label">
									국립<br>김해박물관
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">4</span>
								</div>
								<div class="step-label">
									김해 대성동<br>고군분
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
								<div class="step-label">김해 수로왕릉</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">6</span>
								</div>
								<div class="step-label">
									남원 유곡리와<br>두락리 고분군
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">7</span>
								</div>
								<div class="step-label">
									창녕 교동과<br>송현동<br>고분군
								</div>
							</div>
							<div class="step">
								<div class="step-progress">
									<span class="step-progress-start"></span> <span
										class="step-progress-end"></span> <span class="step-number">8</span>
								</div>
								<div class="step-label">
									함안 말이산<br>고분군
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