<%@page import="semi.heritage.community.vo.CommunityBoard"%>
<%@page import="semi.heritage.community.vo.CommunityReply"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/views/common/headerLight.jsp" %>

<%
	CommunityBoard b = (CommunityBoard)request.getAttribute("board");
	String fileName = b.getOriginal_file();
	String fileReName = b.getRenamed_file();
	
	String type = request.getParameter("type");
	String boardName = "";
	if(type.equals("T")) {
		boardName = "함께해요";
	}
	if(type.equals("H")) {
		boardName = "역사연구소";
	}
	if(type.equals("F")) {
		boardName = "자유게시판";
	}
	
	String replyWriter = "";
	if(loginMember == null) {
		replyWriter = "비회원";
	} else {
		replyWriter = loginMember.getUname();
	}
	
	String replyContent = "";
	if(loginMember == null) {
		replyContent = "로그인 후 이용해주세요.";
	} else {
		replyContent = "댓글을 남겨주세요.";
	}
%>



<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
</svg>

<style>
	@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css');
	.fa {
		font-size: 20px;
	}
	.fileBox {
		/* background-color: #DBD9D9; */
		color: #DBD9D9;
		
	}
	.contentBox {
		width: 100%;
	}
	.replyuNo {
		display:none;
	}
	.replyName {
		display: inline;
	}
	.board-btn {
		display: inline-block;
		text-align: right;
	}
</style>

<!-- Hero-->
<section class="jarallax bg-dark zindex-1 " data-jarallax
	data-speed="0.5">
	<span class="img-overlay bg-transparent opacity-80"
		style="background-image: linear-gradient(0deg, rgba(31, 27, 45, .7), rgba(31, 27, 45, .7));"></span>
	<div class="jarallax-img"
		style="background-image: url(<%=path%>/resources/img/semi-img/community.jpg);"></div>
	<div class="content-overlay container">
		<div class="mt-4 mb-md-1 py-5">
			<div
				class="col-xl-6 col-lg-8 col-md-10 mx-auto mb-sm-5 mb-4 px-0 text-center">
				<h1 class="display-5 text-light mt-sm-5 my-4">
					사뿐사뿐<span class="dropdown d-inline-block ms-2"><a
						class="dropdown-toggle text-decoration-none" href="#"
						role="button" data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">커뮤니티</a><span
						class="dropdown-menu dropdown-menu-end my-1"><a
							class="dropdown-item fs-base fw-bold"
							href="<%=path%>/community/list?type=T">함께해요</a><a
							class="dropdown-item fs-base fw-bold"
							href="<%=path%>/community/list?type=H">역사연구소</a><a
							class="dropdown-item fs-base fw-bold"
							href="<%=path%>/community/list?type=F">자유게시판</a></span></span>
				</h1>
				<p class="fs-lg text-white">
					문화재 관람 및 행사를 함께하고, 우리의 역사를 함께 연구하고 <br>함께 자유로이 소통하는 공간
				</p>
			</div>

		</div>
	</div>
	<div
		class="position-absolute d-none d-xxl-block bottom-0 start-0 w-100 bg-white zindex-1"
		style="border-top-left-radius: 30px; border-top-right-radius: 30px; height: 30px;"></div>
</section>
<div class="container mt-1 mb-md-1 py-1">
	<nav class="mb-1 pt-md-1" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="real-estate-home-v1.html"><i
					class="fi-home"></i> Home</a></li>
			<li class="breadcrumb-item"><a href="<%=path%>/community/main">커뮤니티</a></li>
			<li class="breadcrumb-item"><a
				href="<%=path%>/community/list?type=<%=type%>"><%=boardName %></a></li>
			<li class="breadcrumb-item active" aria-current="page"><%=b.getTitle() %></li>
		</ol>
	</nav>
	<br>
	<div class="row">
		<h1 class="h2 mb-4"><%=b.getTitle() %></h1>
		<div class="mb-xxl-n4 pb-0 ">
			<ul class="list-unstyled flex-wrap mb-0 text-nowrap">
				<!-- 글쓴이 Author-->
				<div class="mb-4 pb-md-3 left-box">
					<a class="d-flex align-items-center text-body text-decoration-none"
						href="#">
						<img class="rounded-circle"
						src="<%=path%>/resources/img/semi-img/01.info.default.photo.png" width="45" alt="프사">
						<div class="ps-3"><h2 class="h6 mb-1"><%=b.getuName() %></h2></div></a>
				</div>
				<div class="d-flex right-box">
					<li class="me-3"></li>
					<li class="me-3"><i
						class="fi-calendar-alt me-2 mt-n1 opacity-60"></i><%=b.getCreate_date() %></li>
					<li class="me-3"><i class="fi-eye-on me-2 mt-n1 opacity-60"></i><%=b.getReadCount() %></li>
				</div>
			</ul>
		</div>
		<hr>
		<br>
		<%
			if(loginMember != null) {
				if(loginMember.getUno() == b.getuNo()) {
		%>
			<div class="board-btn">
				<button class="btn btn-link btn-sm" type="button" 
				onclick="location.href='<%=request.getContextPath()%>/community/update?type=<%=type%>&boardNo=<%=b.getNo()%>'">
					<i class="fa fa-eraser" aria-hidden="true"></i><span class="fw-normal">게시글 수정</span>
				</button>
				<button class="btn btn-link btn-sm" type="button" id="btnDelete" onclick="boardDelete()">
					<i class="fa fa-trash-o" aria-hidden="true"></i><span class="fw-normal">게시글 삭제</span>
				</button>
			</div>
		<%
				}
			}		
		%>
		<div>
			<%-- 이미지 --%>
			<%if(fileName != null && fileName.length() > 0 && (fileName.contains(".jpg") || fileName.contains(".jpeg") || fileName.contains(".png"))) {%>
				<img src="<%=path%>/resources/community/boardUpload/<%=fileReName %>" width="100%" />
			<%} %>
			<%-- 이미지 --%>
			<br>
			<div class="contentBox"><%=b.getContent() %></div>
			<br>
			<br>
			<%if(fileName != null && fileName.length() > 0) {%>
				<div class="fileBox">
					<a href="javascript:fileDownload('<%=fileName%>','<%=fileReName%>');">
						<i class="fa fa-floppy-o" aria-hidden="true"></i>&nbsp;<%=fileName %>
					</a>
				</div>
			<%} %>
		</div>
	</div>
	<br>
	<hr>
	<br>
	<!-- Comments-->
	<div class="mb-4 mb-md-5" id="comments">
		<!-- Comment-->
		<%for(CommunityReply reply: b.getReplies()) { %>
		<div class="border-bottom pb-4 mb-4">
			<div class="d-flex justify-content-between align-items-center">
				<div class="d-flex align-items-center pe-2">
					<img class="rounded-circle me-1" src="<%=path%>/resources/img/semi-img/01.info.default.photo.png"
						width="38" alt="프사">
					<div class="ps-2">
						<h6 class="fs-base mb-0 replyName"><%=reply.getuName() %></h6>&nbsp;
						<span class="text-muted fs-sm"><%=reply.getCreate_date() %></span>
					</div>
				</div>
				
				<%if(loginMember != null && loginMember.getUno() == reply.getuNo()) {%>
					<button class="btn btn-link btn-sm" type="button" onclick="deleteReply(<%=reply.getNo()%>,<%=reply.getBoard_no()%>);">
						<i class="fa fa-trash-o" aria-hidden="true"></i><span class="fw-normal"> 댓글 삭제</span>
					</button>
				<%} %>
			</div>
			<div class="replyBox"><%=reply.getContent() %></div>
		</div>
		<%} %>

		<div class="card py-md-4 py-3 shadow-sm">
			<div class="card-body ">
				<h3 class="mb-4 pb-sm-2">댓글 남기기</h3>
				<form class="needs-validation row gy-md-4 gy-3"
					action="<%=request.getContextPath()%>/community/reply?type=<%=type %>&boardNo=<%=b.getNo() %>"
					method="post">
					<div class="col-sm-2">
                    <input class="form-control form-control-lg" type="text" id="comment-name" name="replyWriter" value="<%=replyWriter%>" placeholder="<%=replyWriter%>" readonly>
                	</div>
					<div class="col-12">

						<textarea class="form-control form-control-lg" id="comment-text"
							rows="4" name="content" placeholder="<%=replyContent %>" required></textarea>
						<div class="invalid-feedback">--</div>
					</div>
					<div class="col-12 py-2 right-box">
						<button class="btn btn-lg btn-primary right-box" type="submit">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function fileDownload(originName, reName) {
		var url = "<%=request.getContextPath()%>/community/fileDown";
		var oName = encodeURIComponent(originName);
		var rName = encodeURIComponent(reName);
		var resquestURL = url + "?originName=" + oName + "&reName=" + rName;
		location.assign(resquestURL);
		alert("파일을 요청하였습니다.");
	}
	
	function deleteReply(replyNo, boardNo){
		var url = '<%=request.getContextPath()%>/community/replydel?type=<%=type%>&replyNo=';
		var requestURL = url + replyNo + '&boardNo=' + boardNo;
		location.replace(requestURL);
	}
	
	function boardDelete() {
		if(confirm("정말로 삭제하시겠습니까?")) {
			location.replace("<%= request.getContextPath() %>/community/deleteboard?type=<%=type%>&boardNo=<%= b.getNo()%>");
		}
	}


</script>


	<!-- Footer-->
	<%@include file="/views/common/footer.jsp"%>