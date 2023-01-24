<%@page import="oracle.net.aso.i"%>
<%@page import="semi.heritage.favorite.vo.FavoriteMyPage"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/headerLight.jsp" %>
<%@ include file="/views/common/sidebar.jsp"%>



<%
List<FavoriteMyPage> fmlist = (List<FavoriteMyPage>)request.getAttribute("fmlist");
%>
 
 <style>
 .mhj-content {
            text-overflow: ellipsis;
            overflow: hidden;
            display: -webkit-box;
          -webkit-line-clamp: 4;
          -webkit-box-orient: vertical;
          word-wrap:break-word; 
          line-height: 20px;
            width: 450px;
        }
</style>
                <div class="col-lg-8 col-md-7 mb-5">
                    <div class="d-flex align-items-center justify-content-between mb-4 pb-2">
                        <h1 class="h2 mb-0">찜 목록</h1>
                        <a class="fw-bold text-decoration-none" onclick="location.href='<%=path%>/favoriteAllDelete.do'" style="color: #8957BD;"><i class=" fi-x fs-xs mt-n1 me-2 " style="color: #8957BD; "></i>전체 비우기</a>
                    </div>
                    <%for(int i = 0; i < fmlist.size(); i++ ) { %>
                    <div class="card card-hover card-horizontal border-0 shadow-sm mb-4 ">
                        <div class="card-img-top position-relative " style="background-image: url(<%=fmlist.get(i).getImageUrl()%>);">
                            <a class="stretched-link" href="<%=path%>/heritageDetail.do?hertiageNo=<%=fmlist.get(i).gethNo()%>"></a>
                            <div class="position-absolute end-0 top-0 pt-3 pe-3 zindex-5 ">
                                <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle shadow-sm " type="button" data-bs-toggle="tooltip " data-bs-placement="left " title="Remove from Wishlist ">
                                  <i class="fi-heart-filled " style="color: #C389FF;"></i></button>
                            </div>
                        </div>
                        <div class="card-body position-relative pb-3 ">
                            <h4 class="mb-1 fs-xs fw-normal text-uppercase" style="color: #B0C729;"><b><%=fmlist.get(i).getCcmaName()%></b></h4>
                            <h3 class="h6 mb-2 fs-base"><a class="nav-link"  href="<%=path%>/heritageDetail.do?hertiageNo=<%=fmlist.get(i).gethNo()%>" "><b><%=fmlist.get(i).getCcbaMnm1()%></b></a>
                                <br>
                                <p style="color: #A08DB4; margin-top: -4%; margin-bottom: 1%; font-size: 15px; "><%=fmlist.get(i).getCcbaLcad()%></p>
                            </h3>
							<label><p class="mb-2 fs-sm text-muted "
								style="text-overflow: ellipsis; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 4; -webkit-box-orient: vertical; word-wrap: break-word; line-height: 20px; width: 450px;"><%=fmlist.get(i).getContent()%></p></label>
								<div class="d-flex align-items-center justify-content-center justify-content-sm-start border-top pt-3 pb-2 mt-3 text-nowrap">
                                <i class="fi-share text-muted" style="padding-right: 2%;"></i><a style="text-decoration-line:none; cursor: pointer;" onclick="alert( 'URL이 복사 되었습니다.' );" ><span class="d-inline-block me-4 fs-sm">공유하기</a></span>
                                <i class="fi-eye-on text-muted" style="padding-right: 2%;"></i><a style="text-decoration-line:none; cursor: pointer;" onclick="location.href='<%=path%>/heritageDetail.do?hertiageNo=<%=fmlist.get(i).gethNo()%>'"><span class="d-inline-block me-4 fs-sm"   id="heritageDetail()">상세보기</a></span>
                                <form action="<%=path%>/favoriteDelete.do" method="post"> 
                                <input type="hidden" name="no" value="<%=fmlist.get(i).gethNo()%>">
                                <i class="fi-trash text-muted" style="padding-right: 2%;"></i><button class="text-muted" style="background: transparent; border: none;" type="submit"><a  style="text-decoration-line:none; cursor: pointer;"><span class="d-inline-block fs-sm">찜 해제</a></button></span>
                           		</form>
                            </div>
                        </div>
                    </div>
					<% } %>
                </div>
            </div>
        </div>
    </main>
    
  
    <script  type="text/javascript">
    
	            
function changeForm(val) {
		if (val == "0") {
			function shareTwitter() {
			    var sendText = <%="문화재"%>; // 전달할 텍스트
			    window.open("https://twitter.com/intent/tweet?text=" + sendText);
			}
		} else if (val == "1") {
			location.href = "<%= request.getContextPath() %>/heritageDetail.do";
		} else if (val == "2") {
			location.href = "<%= request.getContextPath() %>/favoriteDelete.do";
		} 
	}
</script>
        <!-- Footer-->
    <%@include file="/views/common/footer.jsp"%>