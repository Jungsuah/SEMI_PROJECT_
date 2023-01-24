<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="semi.heritage.event.vo.Festival"%>
<%@page import="semi.heritage.common.util.PageInfo"%>
<%@page import="semi.heritage.community.vo.CommunityBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Header -->
<%@ include file="/views/common/headerLight.jsp" %>


<%
   List<Festival> list = (List<Festival>)request.getAttribute("list"); 

   PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
   
%>   

<!-- <style> -->
/* button:active{ */
/*   background-color:green; */
/* } */
<!-- </style> -->


        <!-- Page content-->
        <!-- 상단배경 Hero-->
        <section class="jarallax bg-dark zindex-1 py-xxl-5" data-jarallax data-speed="0.5"><span class="img-overlay bg-transparent opacity-30" style="background-image: linear-gradient(0deg, rgba(31, 27, 45, .7), rgba(31, 27, 45, .7));"></span>
            <div class="jarallax-img" style="background-image: url(img/spsp/bg-eventSchedule3.jpg);"></div>
            <div class="content-overlay container ">
                <div class="mt-5 mb-md-5 py-5">
                    <div class="col-xl-6 col-lg-8 col-md-10 mx-auto mb-sm-5 mb-4 px-0 text-center">
                        <h1 class="display-5 text-light mt-sm-5 my-4">행사일정</h1>
                    </div>
                </div>
            </div>
            <div class="position-absolute d-none d-xxl-block bottom-0 start-0 w-100 bg-white zindex-1" style="border-top-left-radius: 30px; border-top-right-radius: 30px; height: 30px;"></div>
        </section>
        <!-- Page header-->
        <section class="container pt-1 mt-1">
            <!-- Breadcrumb-->
            <nav class="mb-2 pt-md-2" aria-label="breadcrumb">
                <section class="d-sm-flex justify-content-between pt-2">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<%=path%>/index.do"><i class="fi-home"></i> Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">행사일정</li>
                    </ol>
                </section>
                </div>
            </nav>
            <br>
            <!-- Light table head -->
            <div class=" mx-auto mb-sm-4 text-center">
                <h1 class="h2 mb-2"> <i class="fi-calendar text-center"></i> &nbsp;2022년 월별행사</h1>
            </div>
            <!-- 페이지 번호 Pagination-->
            <div class=" col-md-8 mx-auto mb-sm-5 px-0 text-center">
                <div class="btn-toolbar" role="toolbar" aria-label="Pagination">
                    <div class="btn-group me-2 mb-2" role="group" aria-label="First group">
                    <% for(int i = 1; i< 13; i++) { %>
                        <button type="button" id="change" class="btn btn-translucent-dark" onclick="<%if(i<10){ %> movePage('<%=path%>/event/main.do?eventMonth=<%=20220%><%=i%>');" <%}else{%> movePage('<%=path%>/event/main.do?<%=2022%><%=i%>');" <% } %>><%=i%>월</button>
                    <% } %>
                    </div>
                </div>
            </div>
            
            <div class="table-responsive">
                <table class="table" cellspacing="0" style="text-align:center">
                    <thead class="thead-light">
                        <tr>
                            <th>행사구분</th>
                            <th>프로그램명</th>
                            <th>장소</th>
                            <th>기간</th>
                            <th>상세정보 URL</th>
                            <!-- URL 주소 있을시에 방문 가능-->
                        </tr>
                    </thead>
                    <tbody>
               <%if(list == null || list.isEmpty()){ %>
                        <div style="text-align:center;">조회된 행사가 없습니다.</div>
                 <%} else { %>
             <% for(Festival f :list){%>
                <input type= "hidden" id = "eventMonth" value ="<%=f.getsDate()%>">
                        <tr>
                            <td> <%= f.getEventName() %></td>
                            <td style="text-align:left"> <%= f.getSubTitle() %></td>
                            <td><%= f.getSido() +" " %> <%= f.getGugun() %></td>
                            <td><%= f.getsDate() %> - <%= f.geteDate() %></td>
                            <%if( f.getSubPath()  == null) {%>
                               <td>-</td>
                            <%} else { %>
                               <td><a style="text-decoration: none; color: black;" href="<%= f.getSubPath() %>" target="_blank"><%= f.getSubPath() %></a></td>
                            <%} %>
                        </tr>
             <% }%>
                <% }%>
                    </tbody>
                </table>
            </div>
            
             <div>
        <!-- 페이지 번호 Pagination-->
        <nav class="mt-2 mb-4" aria-label="Reviews pagination">
            <ul class="pagination">
                <li class="page-item d-sm-none"><span class="page-link page-link-static">1 / 5</span></li>
                
<!--                 처음으로 가기 -->
                <li class="page-item"><a class="page-link" onclick="movePage1('<%=path%>/event/main.do?page=<%=pageInfo.getStartPage()%>');" aria-label="Next"><i
                            class="fi-chevrons-left"></i></a>
                </li>
                
<!--                 이전으로 가기 -->
                <li class="page-item"><a class="page-link" onclick="movePage1('<%=path%>/event/main.do?page=<%=pageInfo.getPrvePage()%>');" aria-label="Next"><i
                            class="fi-chevron-left"></i></a>
                </li>
                
                <%-- 10개 목록 출력하기 --%>
                <% for(int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++) {%>
                
               <%if(i == pageInfo.getCurrentPage()) {%>
                      <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link"><%=i%><span class="visually-hidden">(current)</span></span>
                      </li>
               <%} else {%>      
                  <li class="page-item d-none d-sm-block"><a class="page-link" onclick="movePage1('<%=path%>/event/main.do?page=<%=i%>');"><%=i%></a></li>
               <%} %>      
            <%} %>   
            <%-- 다음으로 가기 --%>
            <li class="page-item"><a class="page-link" onclick="movePage1('<%=path%>/event/main.do?page=<%=pageInfo.getNextPage()%>');" aria-label="Next"><i
                            class="fi-chevron-right"></i></a>
                </li>
                
            <%-- 마지막으로 가기 --%>
            <li class="page-item"><a class="page-link"  onclick="movePage1('<%=path%>/event/main.do?page=<%=pageInfo.getEndPage()%>');" aria-label="Next"><i
                            class="fi-chevrons-right"></i></a>
                </li>
                   
                <!-- <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link">1<span class="visually-hidden">(current)</span></span>
                </li>
                <li class="page-item d-none d-sm-block"><a class="page-link" href="#">2</a></li>
                <li class="page-item d-none d-sm-block"><a class="page-link" href="#">3</a></li>
                <li class="page-item d-none d-sm-block">...</li>
                <li class="page-item d-none d-sm-block"><a class="page-link" href="#">8</a></li>
                <li class="page-item"><a class="page-link" href="#" aria-label="Next"><i
                            class="fi-chevron-right"></i></a>
                </li> -->
            </ul>
        </nav>
    </div>
            <script type="text/javascript">
                              function movePage(pageUrl){ 
                                 var eventMonth = document.getElementById("eventMonth"); // 문화재 이름 -->
                                 if(eventMonth.value.length > 0){ 
                                    pageUrl = pageUrl;
                                 } 
                              //   alert(pageUrl); 
                                 location.href = encodeURI(pageUrl);   
                              } 
                           </script>
                                    
            <script type="text/javascript">
                                 function movePage1(pageUrl){
                                    var eventMonth = document.getElementById("eventMonth"); // 문화재 이름
                                    var pageUrl = pageUrl;
                                    if(eventMonth.value.length > 0){
                                       pageUrl =  pageUrl + '&eventMonth=' + eventMonth.value.substring(0, 6); 
                                    }
                           //         alert(pageUrl);
                                    location.href = encodeURI(pageUrl);   
                                 }
                           </script>         


<script>

// function button.onclick() {
//    $('change').css('background-color','red')
// }
//     document.getElementById('change').onclick = changeColor;   

//     function changeColor() {
//         document.button.style.color = "purple";
//         return false;
//     }   

</script>

</section>
        <selection> <br><br><br><br> </selection>
    </main>
    <br><br><br><br>


<!-- Footer-->
<%@include file="/views/common/footer.jsp"%>