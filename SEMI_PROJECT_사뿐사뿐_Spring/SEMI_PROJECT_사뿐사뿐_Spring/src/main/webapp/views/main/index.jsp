<%@page import="semi.heritage.community.vo.CommunityBoard"%>
<%@page import="semi.heritage.heritageInfo.vo.HeritageMain"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@include file="/views/common/headerLight.jsp"%>


<%
List<HeritageMain> list = (List<HeritageMain>) request.getAttribute("list");
List<CommunityBoard> blist = (List<CommunityBoard>) request.getAttribute("blist");

String searchValue = request.getParameter("searchValue");
%>


		<section class="jarallax bg-dark zindex-1 py-xxl-5" data-jarallax data-speed="0.5"><span class="img-overlay bg-transparent opacity-5 image-bg-cover"></span>
            <div class="jarallax-img container image-bg-cover" style="background-image: url(<%=path%>/resources/img/semi-img/mainPic2.jpg);"></div>
            <div class="content-overlay container ">
                <div class="mt-3 mb-md-3 py-3 ">
                    <div class="mb-sm-5 mb-4 px-0 text-left pt-1 p02">
                        <br><br><br><br><br><br><br><br><br><br><br><br><br>
                        <b>
                        <h1 class="display-3 text-light mt-sm-5">한 걸음씩  <span style="color: #ffc000;">사뿐사뿐</span> 다가가는
        				</h1>
        				<h1 class="display-1 text-white text-left"><span class="p01" style="color: #ffc000;">역사이야기</span></h1>
        				</b>
                    </div>
                    <div class="mx-auto px-0" style="margin-bottom: -3%">
                        <!-- 검색 Form-->
                        <form class="form-group d-block d-md-flex position-relative rounded-md-pill mb-2 mb-sm-4 mb-lg-5 p01" action="<%=path%>/heritageSearch.do" method="get">
                            <div class="input-group input-group-lg"><span class="input-group-text text-muted rounded-pill ps-3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fi-search" style="font-size: 21px;"></i></span>
                                <input class="form-control p03" type="text" id="searchValue" name="searchValue" style="font-size: 25px;" placeholder="&nbsp;&nbsp;우리의 문화유산, 어디까지 가봤니 ?">
                            </div>
                            <hr class="d-md-none my-2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="btn btn-primary btn-lg rounded-pill w-100 w-md-auto ms-sm-10" style="background-color: #D97793; font-size: 22px;" type="submit">&nbsp;&nbsp;검&nbsp;&nbsp;색&nbsp;&nbsp;</button>&nbsp;
                        </form>
                    </div>
              </div>
           </div>
                    <br><br><br><br>
        </section>
        <!-- Categories-->
        <br><br>
        <!-- 문화재 명소 시작 -->
        <section class="container mb-sm-2 mb-2 pb-lg-2">
            <div class="row mb-0">
                <div class="col-md-11">
                    <p class="subtitle text-primary" style="font-size: 15px; margin-bottom: 1%;"><b>P O P U L A R &nbsp C U L T U R A L &nbsp A S S E T S</b></p>
                    <h1 style="font-size: 45px;"><span class="p01">인기문화명소</span><span class="text-muted p04" style="font-size: 21px;">  &nbsp실시간 인기가 많은 문화명소를 <span style="color: #ec6e9d;">史뿐史뿐</span> 둘러보세요!</span>
                    </h1>
                </div>
                <div class="col-md-1 d-lg-flex align-items-center justify-content-end"><a class="btn btn-link fw-normal ms-sm-3 p-0" href="<%=path%>/heritageSearch.do">
               더보기<i class="fi-arrow-long-right ms-2"></i></a></div>
            </div>
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside">
                <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 5, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4},&quot;992&quot;:{&quot;items&quot;:5}}}">
                    <% for (int i = 0; i < list.size(); i++){ %>
                    <div>
                        <div class="position-relative">
                            <div class="position-relative mb-3">
                                <img class="rounded-3" src="<%=list.get(i).getImageUrl()%>" style="width: 250px; height: 300px;" alt="Image">
                            </div>
                            <h3 class="mb-2 fs-lg"><a class="nav-link stretched-link" href="<%=path%>/heritageDetail.do?hertiageNo=<%=list.get(i).getNo()%>"><%= list.get(i).getCcbaMnm1() %></a></h3>
                            <h3 class="mb-2 fs-lg"><a class="nav-link stretched-link text-muted" href="<%=path%>/heritageDetail.do?hertiageNo=<%=list.get(i).getNo()%>"><%= list.get(i).getCcbaCtcdNm() + " " +list.get(i).getCcsiName() %></a></h3>
                            <ul class="list-inline mb-0">
                                <li class="list-inline-item pe-1"><i class="fi-heart-filled mt-n1 me-1 fs-base text-warning align-middle"></i><b><%= list.get(i).getCountHfavorite() %></b></li>
                                <li class="list-inline-item pe-1"><i class="fi-chat-circle mt-n1 me-1 fs-base text-muted align-middle"></i><%= list.get(i).getCountHreview() %></li>
                            </ul>
                        </div>
                    </div>
                        <%} %>
              </div>
            </div>          
        </section>
        <!-- 문화재 명소 끝 -->
        <!-- 행사일정, 커뮤니티 시작 -->
        <section class="container pb-5 mb-md-2 ">
            <div class="row">
                <div class="col-md-6 mb-3 mb-md-0">
                    <div class="row mb-0">
                        <div class="col-md-8">
                            <p class="subtitle text-primary" style="font-size: 15px; margin-bottom: 1%;"><b>E V E N T &nbsp S C H E D U L E</b></p>
                                <h1 style="font-size: 45px;"><span class="p01">행사일정</span></h1>
                        </div>
                        <div class=" col-md-4 d-lg-flex align-items-center justify-content-end "><a class="btn btn-link fw-normal ms-sm-3 p-0 " href="<%=path%>/event/main.do">
                       더보기<i class="fi-arrow-long-right ms-2 "></i></a></div>
                    </div>
                    <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside ">
                        <div class="tns-carousel-inner " data-carousel-options="{&quot;items&quot;: 3, &quot;gutter&quot;: 24, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1,&quot;nav&quot;:true},&quot;500&quot;:{&quot;items&quot;:2},&quot;850&quot;:{&quot;items&quot;:3},&quot;1400&quot;:{&quot;items&quot;:3,&quot;nav&quot;:false}}} ">
                            <div>
                                <div class="position-relative ">
                                    <div class="position-relative mb-3 ">
                                        <img class="rounded-3 " src="http://www.ggcf.kr/wp-content/uploads/2022/05/2.%EC%88%98%EC%9B%90%EB%AC%B8%ED%99%94%EC%9E%AC%EB%8B%A8_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg " style="width: 400px; height: 300px; " alt="Image ">
                                    </div>
                                    <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="https://www.swcf.or.kr/111CM/ ">2022 경기시민예술학교 수원캠퍼스 수강 안내</a></h3>
                                    <ul class="list-inline mb-0 fs-xs ">
                                        <li class="list-inline-item pe-1 "><i class="fi-calendar mt-n1 me-1 fs-base text-muted align-middle "></i>2022-06-09 ~ 2022-10-11</li>
                                    </ul>
                                </div>
                            </div>
                            <div>
                                <div class="position-relative ">
                                    <div class="position-relative mb-3 ">
                                        <img class="rounded-3 " src="http://gjicp.ggcf.kr/wp-content/uploads/sites/8/2022/06/2022-%ED%8F%AC%EC%8A%A4%ED%84%B0%EC%88%98%EC%A0%95-724x1024.jpg " style="width: 400px; height: 300px; " alt="Image ">
                                    </div>
                                    <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="https://gjicp.ggcf.kr/archives/education/2022-%ea%b2%bd%ea%b8%b0%eb%ac%b8%ed%99%94%ec%9c%a0%ec%82%b0%ed%95%99%ea%b5%90 ">근대문화유산을 통해 본 경기도의 생활과 문화</a></h3>
                                    <ul class="list-inline mb-0 fs-xs ">
                                        <li class="list-inline-item pe-1 "><i class="fi-calendar mt-n1 me-1 fs-base text-muted align-middle "></i>2022-06-15 ~ 2022-07-20</li>
                                    </ul>
                                </div>
                            </div>
                            <div>
                                <div class="position-relative ">
                                    <div class="position-relative mb-3 ">
                                        <img class="rounded-3 " src="http://www.ggcf.kr/wp-content/uploads/2022/05/6.%EA%B5%AC%EB%A6%AC%EB%AC%B8%ED%99%94%EC%9E%AC%EB%8B%A8_%ED%8F%AC%EC%8A%A4%ED%84%B0.png " style="width: 400px; height: 300px; " alt="Image ">
                                    </div>
                                    <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="https://jgpm.ggcf.kr/archives/education/%eb%8f%84%ec%a0%84-%ec%84%a0%ec%82%ac%ed%80%b4%ec%a6%88%ec%99%95 ">도전! 선사퀴즈왕</a></h3>
                                    <ul class="list-inline mb-0 fs-xs ">
                                        <li class="list-inline-item pe-1 "><i class="fi-calendar mt-n1 me-1 fs-base text-muted align-middle "></i>2022-07-08 ~ 2022-08-26</li>
                                    </ul>
                                </div>
                            </div>
                            <div>
                                <div class="position-relative ">
                                    <div class="position-relative mb-3 ">
                                        <img class="rounded-3 " src="http://www.ggcf.kr/wp-content/uploads/2022/07/%EA%B2%BD%EA%B8%B0%EB%AC%B8%ED%99%94%EC%9E%AC%EB%8B%A8-%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80_%EC%95%88%EC%82%B0-%EC%9B%B9%ED%8F%AC%EC%8A%A4%ED%84%B0-001.png
                                " style="width: 400px; height: 300px; " alt="Image ">
                                    </div>
                                    <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="https://docs.google.com/forms/d/1imtzy-BsJxQyArUUQVL4wjFwvXD3A3-nIhiS9icOuA0/viewform?edit_requested=true ">2022 Let’s DMZ - 찾아가는 DMZ_안산</a></h3>
                                    <ul class="list-inline mb-0 fs-xs ">
                                        <li class="list-inline-item pe-1 "><i class="fi-calendar mt-n1 me-1 fs-base text-muted align-middle "></i>2022-08-06 ~ 2022-08-06</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-auto ">
                </div>
                <div class="col-md-auto text-center text-md-start " style="margin-left: 2%; ">
                    <div class="row mb-0 ">
                        <div class="col-md-8 ">
                            <p class="subtitle text-primary " style="font-size: 15px; margin-bottom: 4%; "><b>C O M M U N I T Y</b></p>
                            <h1 style="font-size: 45px;"><span class="p01">커뮤니티</span></h1>
                        </div>
                        <div class="col-md-4 d-lg-flex align-items-center justify-content-end "><a class="btn btn-link fw-normal ms-sm-3 p-0 " href="<%=path%>/community/main">
                       더보기<i class="fi-arrow-long-right ms-2 "></i></a></div>
                    </div>
                    <div class="table-responsive" >
                        <table class="table" style="font-size: 19px;" >
                            <tbody >
                             <% for (int j = 0; j < 7; j++){ %>
                                <tr > 
                                    <td style="width:450px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; display:inline-block;"><a style="text-decoration: none; color: black;" href="<%=path%>/community/view?type=H&boardNo=<%=blist.get(j).getNo()%>"><%=blist.get(j).getTitle()%></a></td>
                                    
                                    <td style="width:100px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; display:inline-block;"><%=blist.get(j).getuName()%></td>
                                </tr>  
                     <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        <!-- 문화일정, 커뮤니티 끝 -->
        <!-- 사뿐코스 시작 -->

        <section class="container pb-lg-4 " style="margin-bottom: -1%; ">
            <div class="row mb-0 ">
                <div class="col-md-10 ">
                    <p class="subtitle text-primary " style="font-size: 15px; margin-bottom: 1%; "><b>L E T  ’ S &nbsp W A L K &nbsp T O G E T H E R</b></p>
                    <h1 style="font-size: 45px;"><span class="p01">사뿐코스</span><span class="text-muted p04" style="font-size: 21px; ">&nbsp 사뿐사뿐에서 추천하는 열개의 길 & 한국의 서원과 산사를 방문하여 스탬프를 흭득해보세요!</span></h1>
                </div>
                <div class="col-md-2 d-lg-flex align-items-center justify-content-end"><a class="btn btn-link fw-normal p-0 " href="<%=path%>/course/main" style="margin-left: -5%; ">
                더보기<i class="fi-arrow-long-right ms-2 "></i></a></div>
            </div>
        </section>
        <section class="pt-lg-0 " style="background-color: #d6a59e; ">
            <div>
                <div class=" position-relative  ">
                    <div class="position-relative mb-3" style="text-align : center; ">
                        <a href="<%=path%>/course/main" >
                            <img src="<%=path%>/resources/img/semi-img/spCourse2.png" alt="Image ">
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <!-- 사뿐코스 끝 -->
        <br><br>
        <!-- 기념품 시작 -->
        <div class="container mb-5 pb-lg-4 ">
            <div class="row " style="margin-right: -1.5%; ">
                <div class="row mb-0 ">
                    <div class="col-md-8 ">
                        <p class="subtitle text-primary " style="font-size: 17px; margin-bottom: 1%; "><b>T H E S E &nbsp A R E &nbsp E X P I R I N G &nbsp S O O N</b></p>
                        <h1 style="font-size: 45px;" class="p04">SP<span style="color: #cc99ff; ">mall</span> <span class="text-muted " style="font-size: 21px; "> 사뿐사뿐이 엄선한 가장 HOT한 전통문화상품</span></h1>
                    </div>
                    <div class="col-md-4 d-lg-flex align-items-center justify-content-end "><a class="btn btn-link fw-normal ms-sm-3 p-0 " href="<%=path%>/souvenirMain.do">
                   더보기<i class="fi-arrow-long-right ms-2 "></i></a></div>
                </div>
                <!-- 기획전 사진 -->
                <div class="col-lg-4 text-center text-lg-start mb-lg-0 mb-5 ">
                    <a class="d-block text-decoration-none bg-faded-accent rounded-3 h-100 " href="<%=path%>/souvenirMain.do">
                        <img src="<%=path%>/resources/img/semi-img/mainSpSpMall.png" style="width: 100%; height: 100%; " alt="Illustration "></a>
                </div>
                <!-- 기념품 소개글-->
                <div class="col-lg-8 p05">
                    <div class="row ">
                        <div class="col-sm-6 ">
                            <!-- 기념품 1-->
                            <div class="d-flex align-items-start position-relative mb-4 "><img class="flex-shrink-0 me-3 rounded-3 " src="http://www.museumshop.or.kr/center/files/upload/20220610/20220610103108_sricunbl.jpg" style="max-width: 25%;
                                height: 106px; " alt="Brand logo ">
                                <div>
                                    <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="<%=path%>/souvenirProductsDetail.do?productNo=4">이조 연화당초 육각 악세사리함</a></h3>
                                    <li><i class="fi-credit-card mt-n1 me-1 fs-base text-muted align-middle "></i>60,000원</li>
                                </div>
                            </div>
                            <!-- 기념품 2-->
                            <div class="d-flex align-items-start position-relative mb-4 "><img class="flex-shrink-0 me-3 rounded-3 " src="https://www.museumshop.or.kr/center/files/good/202202091748300291100.jpg" style="max-width: 25%; height:
                                1%; " alt="Brand logo ">
                                <div>
                                    <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="<%=path%>/souvenirProductsDetail.do?productNo=1">반가사유상
                                    </a></h3>
                                    <li><i class="fi-credit-card mt-n1 me-1 fs-base text-muted align-middle "></i>15,000원</li>
                                </div>
                            </div>
                            <!-- 기념품 3-->
                            <div class="d-flex align-items-start position-relative mb-4 "><img class="flex-shrink-0 me-3 rounded-3 " src="https://www.museumshop.or.kr/center/files/good/202112311557320231100.jpg" style="max-width: 25%; height:
                                1%; " alt="Brand logo ">
                                <div>
                                    <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="<%=path%>/souvenirProductsDetail.do?productNo=3">[조선의 승려 장인]약사불 보호등
                                    </a></h3>
                                    <li><i class="fi-credit-card mt-n1 me-1 fs-base text-muted align-middle "></i>50,000원</li>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 ">
                            <!-- 기념품 4-->
                            <div class="d-flex align-items-start position-relative mb-4 "><img class="flex-shrink-0 me-3 rounded-3 " src="https://khmall.or.kr/web/product/small/shop1_50a82de59064d70b280a59d64c02b837.jpg" style="max-width: 25%; height:
                                1%; " alt="Brand logo ">
                                <div>
                                    <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="<%=path%>/souvenirProductsDetail.do?productNo=7">일월오봉도 부채
                                    </a></h3>
                                    <li><i class="fi-credit-card mt-n1 me-1 fs-base text-muted align-middle "></i>9,500원</li>
                                </div>
                            </div>
                            <!-- 기념품 5-->
                            <div class="d-flex align-items-start position-relative mb-4 "><img class="flex-shrink-0 me-3 rounded-3 " src="https://khmall.or.kr/web/product/small/202102/50d26bfdf88f5d14497bcacd86a3d350.jpg" style="max-width: 25%; height:
                                1%; " alt="Brand logo ">
                                <div>
                                    <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="<%=path%>/souvenirProductsDetail.do?productNo=8">전통그림부채
                                    </a></h3>
                                    <li><i class="fi-credit-card mt-n1 me-1 fs-base text-muted align-middle "></i>2,700원</li>
                                </div>
                            </div>
                            <!-- 기념품 6-->
                            <div class="d-flex align-items-start position-relative "><img class="flex-shrink-0 me-3 rounded-3 " src="https://khmall.or.kr/web/product/extra/small/202109/7f6f066c90afdf0a892e9b291b711bf8.jpg" style="max-width: 25%; height: 1%; " alt="Brand logo ">
                                <div>
                                    <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="<%=path %>/souvenirProductsDetail.do?productNo=5">향기로 만나는 궁 (디퓨저)
                                    </a></h3>
                                    <li><i class="fi-credit-card mt-n1 me-1 fs-base text-muted align-middle "></i>45,000원</li>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 기념품 끝 -->
        </b>
    </main>

<%@include file="/views/common/footer.jsp"%>