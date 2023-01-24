<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.searchOption {
		width: 130px
	}
</style>


<section class="jarallax bg-dark zindex-1 " data-jarallax data-speed="0.5"><span class="img-overlay bg-transparent opacity-80" style="background-image: linear-gradient(0deg, rgba(31, 27, 45, .7), rgba(31, 27, 45, .7));"></span>
	<div class="jarallax-img" style="background-image: url(<%=path%>/resources/img/semi-img/community.jpg);"></div>
	<div class="content-overlay container ">
    	<div class="mt-5 mb-md-5 py-1">
        	<div class="col-xl-6 col-lg-8 col-md-10 mx-auto mb-sm-5 mb-4 px-0 text-center">
            	<h1 class="display-5 text-light mt-sm-5 my-4">사뿐사뿐<span class="dropdown d-inline-block ms-2"><a
                        class="dropdown-toggle text-decoration-none" href="#" role="button"
                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="1boardMain.html">커뮤니티</a><span
                        class="dropdown-menu dropdown-menu-end my-1">
                        <a class="dropdown-item fs-base fw-bold" href="<%=path%>/community/list?type=T">함께해요</a>
                        <a class="dropdown-item fs-base fw-bold" href="<%=path%>/community/list?type=H">역사연구소</a>
                        <a class="dropdown-item fs-base fw-bold" href="<%=path%>/community/list?type=F">자유게시판</a></span></span>
        		</h1>
    		</div>
    		<div class="col-xl-8 col-lg-9 col-md-10 mx-auto px-1">
      		<!-- 검색창 Search form-->
                <form class="form-group d-block d-md-flex position-relative rounded-md-pill mb-2 mb-sm-4 mb-lg-5 searchForm" action="<%=path%>/community/list" method="get">
                    <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3"><i class="fi-s"></i></span>
                        <input class="form-control" name="searchValue" type="text" value="<%=searchValue%>" placeholder="관심있는 내용을 검색해보세요!">
                    </div>
                    <input type="hidden" name="type" value="<%=type%>"/>
                    <hr class="d-md-none my-2">
                    <div class="d-sm-flex">
                        <div id="myDropdown" class="dropdown w-100 mb-sm-0 mb-3" data-bs-toggle="select">
                        	<div class="col-12 searchOption">
							    <select class="form-select" id="inline-form-select" name="searchType">
								    <option selected>검색옵션</option>
								    <option value="titleAndwriter">제목+글쓴이</option>
								    <option value="title">제목</option>
								    <option value="writer">글쓴이</option>
								    <option value="content">내용</option>
							    </select>
						  	</div>
                        </div>
                        <button class="btn btn-primary btn-lg rounded-pill w-100 w-md-auto ms-sm-3" type="submit">Search</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="position-absolute d-none d-xxl-block bottom-0 start-0 w-100 bg-white zindex-1" style="border-top-left-radius: 30px; border-top-right-radius: 30px; height: 30px;"></div>
</section>