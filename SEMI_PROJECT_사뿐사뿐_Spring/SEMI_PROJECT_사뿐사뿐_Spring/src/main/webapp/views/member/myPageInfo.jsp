<%@page import= "java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/headerLight.jsp"%>
<%@ include file="/views/common/sidebar.jsp"%>

<%
	Member member = (Member)request.getAttribute("member");
	String phoneNum = loginMember.getUpn();
%>


<style>
.whyrano {
    margin-bottom: 0;
    border: 1px dashed #d5d2dc;
    border-radius: 0.75rem;
    font-family: "Noto Sans", sans-serif;
    cursor: pointer;
}

@media (min-width: 500px) {
    .whyrano-grid .filepond--item {
        width: calc(50% - 0.5em);
    }
}

</style>

<!-- Content-->
<div class="col-lg-8 col-md-7 mb-5">
	<form name="memberInfoFrm"
		action="<%=request.getContextPath()%>/update.do" method="POST"  enctype="multipart/form-data">

		<h1 class="h2">마이페이지</h1>
		<div class="mb-2 pt-1">회원정보를 수정 해주세요</div>
		<div class="progress mb-4" style="height: .25rem;">
			<div class="progress-bar bg-warning" role="progressbar"
				style="width: 50%" aria-valuenow="50" aria-valuemin="0"
				aria-valuemax="100"></div>
		</div>
		<label class="form-label pt-2" for="account-bio" style="color: #8957BD;"><b>All About You</b></label>
		<div class="row pb-2">
			<div class="col-lg-9 col-sm-8 mb-4">
			
				<textarea class="form-control" id="introduce" name="introduce" rows="6" placeholder="사뿐사뿐에 멋진 소개를 남겨주세요">	
					<%=loginMember.getIntroduce().replaceAll(" ", "") %>
				</textarea>
			</div>
			
			
			<!-- 프로필사진  -->
			<div class="col-lg-3 col-sm-4 mb-4 whyrano bg-secondary">
				<input type="file" name="photo" 
					accept="image/png, image/jpeg, image/jpg" 
					data-label-idle="&lt;i class=&quot;d-inline-block fi-camera-plus fs-2 text-muted mb-2&quot;&gt;&lt;/i&gt;&lt;br&gt;&lt;span class=&quot;fw-bold&quot;&gt;Change picture&lt;/span&gt;"
					data-style-panel-layout="compact" data-image-preview-height="160"
					data-image-crop-aspect-ratio="1:1"
					data-image-resize-target-width="200"
					data-image-resize-target-height="200">
			</div>
			
			
		</div>
		<div class="border rounded-3 p-3 mb-4" id="personal-info">


			<!-- Name-->
			<div class="border-bottom pb-3 mb-3">
				<div class="d-flex align-items-center justify-content-between">
					<div class="pe-2">
						<label class="form-label fw-bold" style="color: #8957BD;">이름</label>
						<div >
							<%=loginMember.getUname()%>
						</div>
					</div>
				</div>
			</div>

			<!-- Email-->
			<div class="border-bottom pb-3 mb-3">
				<div class="d-flex align-items-center justify-content-between">
					<div class="pe-2">
						<label class="form-label fw-bold" style="color: #8957BD;">Email</label>
						<div id="userId" name="userId">
							<%if (loginMember != null) {%><%=loginMember.getUemail()%><%}%>
						</div>
					</div>
				</div>
			</div>

			<!-- Phone number-->
			<div class="border-bottom pb-3 mb-3">
				<div class="d-flex align-items-center justify-content-between">
					<div class="pe-2">
						<label class="form-label fw-bold" style="color: #8957BD;">연락처</label>
						<div id="phone-value">
						<%=loginMember.getUpn() %>
						
						</div>
					</div>
					<div class="me-n3" data-bs-toggle="tooltip" title="Edit">
						<a class="nav-link py-0" href="#phone-collapse"
							data-bs-toggle="collapse"><i class="fi-edit"></i></a>
					</div>
				</div>
				<div class="collapse" id="phone-collapse"
					data-bs-parent="#personal-info">
					<input class="form-control mt-3" type="text"
						data-bs-binded-element="#phone-value"
						data-bs-unset-value="Not specified" placeholder="Enter phone number" value="<%if (loginMember != null) {%><%=loginMember.getUpn()%><%}%>" id="phone" name="phone">
				</div>
			</div>

			<!-- Address-->
			<div class="border-bottom pb-3 mb-3">
				<div class="d-flex align-items-center justify-content-between">
					<div class="pe-2">
						<label class="form-label fw-bold" style="color: #8957BD;">주소</label>
						<div id="address-value">
						<%=loginMember.getUadr()%>
						</div>
					</div>
					<div class="me-n3" data-bs-toggle="tooltip" title="Edit">
						<a class="nav-link py-0" href="#address-collapse"
							data-bs-toggle="collapse"><i class="fi-edit"></i></a>
					</div>
				</div>
				<div class="collapse" id="address-collapse"
					data-bs-parent="#personal-info">
					<input class="form-control mt-3" type="text"
						data-bs-binded-element="#address-value"
						data-bs-unset-value="Not specified" placeholder="Enter address" value="<%if (loginMember != null) {%><%=loginMember.getUadr()%><%}%>" id="address" name="address">
				</div>
			</div>

		<!-- Socials-->
		<div class="pt-2">
			<label class="form-label fw-bold mb-3" style="color: #8957BD;">Socials</label>
		</div>
		<div class="d-flex align-items-center mb-3">
			<div
				class="btn btn-icon btn-light btn-xs shadow-sm rounded-circle pe-none flex-shrink-0 me-3">
				<i class="fi-facebook text-body"></i>
			</div>
			<input class="form-control" type="text" id="facebook" name="facebook" 
				placeholder="Your Facebook account"
				value="<%if (loginMember != null) {%><%=loginMember.getFacebook()%><%}%>">
		</div>
		<div class="d-flex align-items-center mb-3">
			<div
				class="btn btn-icon btn-light btn-xs shadow-sm rounded-circle pe-none flex-shrink-0 me-3">
				<i class="fi-twitter text-body"></i>
			</div>
			<input class="form-control" type="text" id="twt" name="twt" 
				placeholder="Your Twitter account"
				value="<%if (loginMember != null) {%><%=loginMember.getTwt()%><%}%>">

		</div>
		<div class="collapse" id="showMoreSocials">
			<div class="d-flex align-items-center mb-3">
				<div
					class="btn btn-icon btn-light btn-xs shadow-sm rounded-circle pe-none flex-shrink-0 me-3">
					<i class="fi-instagram text-body"></i>
				</div>
				<input class="form-control" type="text" id="insta" name="insta" 
					placeholder="Your Instagram account"
					value="<%if (loginMember != null) {%><%=loginMember.getInsta()%><%}%>">
			</div>

		</div>
		<a
			class="collapse-label collapsed d-inline-block fs-sm fw-bold text-decoration-none pt-2 pb-3"
			href="#showMoreSocials" style="color: #8957BD;"
			data-bs-toggle="collapse" data-bs-label-collapsed="Show more"
			data-bs-label-expanded="Show less" role="button"
			aria-expanded="false" aria-controls="showMoreSocials"><i
			class="fi-arrow-down me-2" style="color: #8957BD;"></i></a>
		<div class="d-flex align-items-center justify-content-between border-top mt-4 pt-4 pb-1">
			<button class="btn px-3 px-sm-4" type="submit" 
				style="background-color: #8957BD; color: #fff;">변경사항 저장하기</button>
			<button class="btn btn-link btn-sm px-0" type="button" onclick="changeForm(1)" 
				id="deleteMember()">
				<i class="fi-trash me-2"></i>회원탈퇴

			</button>
		</div>
	</form>
</div>
</div>
</div>
</main>

<script  type="text/javascript">
	            
function changeForm(val) {
		if (val == "1") {
			location.href = "<%= request.getContextPath() %>/member/delete";
		} else if (val == "0") {
			location.href = "<%= request.getContextPath() %>/update.do";
		} 
	}
</script>



<!-- Footer-->
<%@include file="/views/common/footer.jsp"%>