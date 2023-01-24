<%@page import="semi.heritage.common.util.PageInfo"%>
<%@page import="semi.heritage.community.vo.CommunityBoard"%>
<%@page import="semi.heritage.community.vo.CommunityReply"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<CommunityBoard> list1 = (List<CommunityBoard>)request.getAttribute("list1");
	List<CommunityBoard> list2 = (List<CommunityBoard>)request.getAttribute("list2");
	List<CommunityBoard> list3 = (List<CommunityBoard>)request.getAttribute("list3");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	String type = (String)request.getAttribute("type");
	/* String searchType = "title"; */
	String searchType = "";
	String searchValue = "";
	String searchParamValue = request.getParameter("searchValue");
	if(searchParamValue != null && searchParamValue.length() > 0) {
		searchType = request.getParameter("searchType");
		searchValue = request.getParameter("searchValue");
	}
%>
    
<style>
    div.left {
        width: 48%;
        float: left;
        position: relative;
    }
    
    div.right {
        width: 48%;
        float: right;
        position: relative;
    }
    
    #out {
        width: 100%;
        text-align: center;
    }
    
    #in {
        display: inline-block;
    }
    
    .align-center {
        text-align: center;
    }
    
    div.mar {
        margin-top: -25px;
        margin-right: 200px;
        margin-bottom: 30px;
        margin-left: 200px;
    }
    
    div.mar2 {
        margin-top: 20px;
        margin-right: 550px;
        margin-bottom: 10px;
        margin-left: 550px; 
    }
    
    .page-loading {
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 100%;
        -webkit-transition: all .4s .2s ease-in-out;
        transition: all .4s .2s ease-in-out;
        background-color: #fff;
        opacity: 0;
        visibility: hidden;
        z-index: 9999;
    }
    
    .page-loading.active {
        opacity: 1;
        visibility: visible;
    }
    
    .page-loading-inner {
        position: absolute;
        top: 50%;
        left: 0;
        width: 100%;
        text-align: center;
        -webkit-transform: translateY(-50%);
        transform: translateY(-50%);
        -webkit-transition: opacity .2s ease-in-out;
        transition: opacity .2s ease-in-out;
        opacity: 0;
    }
    
    .page-loading.active>.page-loading-inner {
        opacity: 1;
    }
    
    .page-loading-inner>span {
        display: block;
        font-size: 1rem;
        font-weight: normal;
        color: #666276;
        ;
    }
    
    .page-spinner {
        display: inline-block;
        width: 2.75rem;
        height: 2.75rem;
        margin-bottom: .75rem;
        vertical-align: text-bottom;
        border: .15em solid #bbb7c5;
        border-right-color: transparent;
        border-radius: 50%;
        -webkit-animation: spinner .75s linear infinite;
        animation: spinner .75s linear infinite;
    }
    
    @-webkit-keyframes spinner {
        100% {
            -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
        }
    }
    
    @keyframes spinner {
        100% {
            -webkit-transform: rotate(360deg);
            transform: rotate(360deg);
        }
    }
    .btnBlock {
    	margin-top: 25px;
    	display: flex;
    	justify-content: center;
    }
    .myBtn {
    	text-align: center;
    	width:120px;
    }
    .searchOption {
		width: 150px
		
	}
</style>

<script type="text/javascript">
	function post_form() {
		document.getElementById('write').submit();
	}
</script>
    
        
    
    
<!-- Header -->
<%@ include file="/views/common/headerLight.jsp" %>


<!-- Hero-->
<section class="jarallax bg-dark zindex-1 " data-jarallax data-speed="0.5"><span class="img-overlay bg-transparent opacity-80" style="background-image: linear-gradient(0deg, rgba(31, 27, 45, .7), rgba(31, 27, 45, .7));"></span>
<div class="jarallax-img" style="background-image: url(<%=path%>/resources/img/semi-img/community.jpg);"></div>
<div class="content-overlay container ">
    <div class="mt-5 mb-md-5 py-1">
        <div class="col-xl-6 col-lg-8 col-md-10 mx-auto mb-sm-5 mb-4 px-0 text-center">
            <h1 class="display-5 text-light mt-sm-5 my-4">사뿐사뿐<span class="dropdown d-inline-block ms-2"><a
                        class="dropdown-toggle text-decoration-none" href="#" role="button"
                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="<%=path %>/community/main">커뮤니티</a><span
                        class="dropdown-menu dropdown-menu-end my-1"><a
                            class="dropdown-item fs-base fw-bold" href="<%=path%>/community/list?type=T">함께해요</a><a
                            class="dropdown-item fs-base fw-bold" href="<%=path%>/community/list?type=H">역사연구소</a><a
                            class="dropdown-item fs-base fw-bold" href="<%=path%>/community/list?type=F">자유게시판</a></span></span>
            </h1>
        </div>
        <div class="col-xl-8 col-lg-9 col-md-10 mx-auto px-1">
           <!-- Search form-->
           <form class="form-group d-block d-md-flex position-relative rounded-md-pill mb-2 mb-sm-4 mb-lg-5"
				action="<%=path%>/community/search" method="get">
				<div class="input-group input-group-lg border-end-md">
					<span class="input-group-text text-muted rounded-pill ps-3"><i
						class="fi-search"></i></span> <input class="form-control" type="text"
						name="searchValue" value="<%=searchValue%>"
						placeholder="관심있는 내용을 검색해보세요!">
				</div>
				<hr class="d-md-none my-2">
				<div class="d-sm-flex">
					<div class="dropdown w-100 mb-sm-0 mb-3" data-bs-toggle="select">
						<div class="col-13 searchOption">
							<select class="form-select" id="inline-form-select"
								name="searchType">
								<option selected>검색옵션</option>
								<option value="titleAndwriter">제목+글쓴이</option>
								<option value="title">제목</option>
								<option value="writer">글쓴이</option>
								<option value="content">내용</option>
							</select>
						</div>

					</div>
					<button
						class="btn btn-primary btn-lg rounded-pill w-100 w-md-auto ms-sm-3"
						type="submit">Search</button>
				</div>
			</form>
        </div>
    </div>
</div>
<div class="position-absolute d-none d-xxl-block bottom-0 start-0 w-100 bg-white zindex-1" style="border-top-left-radius: 30px; border-top-right-radius: 30px; height: 30px;"></div>
</section>
</section>

<!-- 글쓰기 -->
<!-- Title-->
<div class="mar">
	<nav class="mb-2 pt-md-2" aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="<%=path%>/index.do"><i class="fi-home"></i> Home</a>
        </li>
        <li class="breadcrumb-item"><a href="<%=path%>/community/main"> 커뮤니티</a></li>
        <li class="breadcrumb-item active" aria-current="page">글쓰기</li>
    </ol>
	</nav>
	<br>
    <div class="mb-4 text-center center-block">
        <h1 class="h2 mb-0">글쓰기</h1>
    </div>
    <!-- Basic info-->
    <section class="card card-body border-0 shadow-sm p-4 mb-4" id="basic-info">
    <form id="write" action="<%=path%>/community/write" method="POST" enctype="multipart/form-data">
        <div>
            <h2 class="h4 mb-4"><i class="fi-pencil text-primary fs-5 mt-n1 me-2"></i>Write</h2>
            <label class="form-label" for="ap-title">제목<span class="text-danger">*</span></label>
            <input class="form-control" type="text" id="ap-title" placeholder="제목을 입력하세요" name="ap-title" value="" required>
        </div>
        <br>
        <div>
            <label class="form-label" for="ap-category">게시판선택 <span class="text-danger">*</span></label>
            <select class="form-select" id="ap-category" name="ap-category" required>
                <option value="T">함께해요</option>
                <option value="H">역사연구소</option>
                <option value="F">자유게시판</option>
            </select>
        </div>
        <br>
        <div>
            <label class="form-label" for="ap-category">내용<span class="text-danger">*</span></label>
            <textarea class="form-control" id="ap-description" name="ap-description" rows="12" placeholder="내용을 입력하세요"></textarea>
        </div>
        <br>
        <!-- 파일첨부 Photos / video-->
        <h2 class="h4 mb-4 fileText"><i class="fi-image text-primary fs-5 mt-n1 me-2"></i>File</h2>
        <input class="mb-3 fileBtn" id="file-input" type="file" name="uploadfile">
        <!-- Action buttons -->
        <div class="btnBlock">
            <section class="mar d-sm-flex justify-content-between pt-4 writebtn">
                <a class="btn btn-primary btn-lg d-block mb-1 writeBtn myBtn" onclick="post_form()">글쓰기</a>
            </section>
        </div>
    </form>
    </section>
</div>




<!-- Footer-->
<%@include file="/views/common/footer.jsp"%>