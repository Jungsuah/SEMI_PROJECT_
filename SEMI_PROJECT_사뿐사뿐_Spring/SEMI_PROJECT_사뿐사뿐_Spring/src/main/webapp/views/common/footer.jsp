<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	 <!-- Footer-->
    <footer class="footer pt-lg-4 pt-4 bg-secondary">
        <div class="container mb-4 py-4 pb-lg-5 ">
            <div class="row gy-4 ">
                <div class="col-md-4">
                    <div class="mb-4">
                        <a class="d-inline-block " href="<%=path%>/index.do"><img src="<%=path%>/resources/img/semi-img/logo_spsp_1.png" width="116 " alt="Logo "></a>
                    </div>
                    <ul class="nav nav-light flex-column ">
                        <li class="nav-item mb-2 ">
                            <a class="d-inline-block "><img src="<%=path%>/resources/img/semi-img/whoWeAre_orig.png" width="180px;" alt="Logo "></a>
                        </li>
                        <li><a class="nav-link-light text-dark p06">사뿐사뿐은 문화재와 문화유산에 대한 정보를 토대로 </a></li>
                        <li><a class="nav-link-light text-dark p06">다양한 이벤트 및 활동을 제공함으로써</a></li>
                        <li><a class="nav-link-light text-dark p06">현대인들이 보다 쉽게 역사에 다가갈 수 있도록 합니다.</a></li>
                    </ul>
                </div>
                <!-- Links-->
                <div class="col-lg-1 text-dark ">
                    <h3 class="h6 mb-2 pb-1 fs-base text-dark p05">소개</h3>
                    <ul class="list-unstyled fs-sm ">
                        <li><a class="nav-link-light text-dark " href="# ">About us</a></li>
                        <li><a class="nav-link-light text-dark " href="# ">News</a></li>
                        <li><a class="nav-link-light text-dark " href="# ">Contacts</a></li>
                    </ul>
                </div>
                <!-- Links-->
                <div class="col-1  text-dark ">
                    <h3 class="h6 mb-2 pb-1 fs-base text-dark p05">채용</h3>
                    <ul class="list-unstyled fs-sm ">
                        <li><a class="nav-link-light text-dark " href="# ">홍보/마케팅</a></li>
                        <li><a class="nav-link-light text-dark " href="# ">개발/관리</a></li>
                        <li><a class="nav-link-light text-dark " href="# ">디자인</a></li>
                    </ul>
                </div>
                <div class="col-lg   text-dark ">
                    <h3 class="h6 mb-2 pb-1 fs-base text-dark p05">제공</h3>
                    <ul class="list-unstyled fs-sm">
                        <li><a class="nav-link p-0 fw-normal" href="https://www.cha.go.kr/main.html">문화재청</a></li>
                        <li><a class="nav-link p-0 fw-normal" href="https://www.heritage.go.kr/main/?v=1660359887324">국가문화유산</a></li>
                        <li><a class="nav-link p-0 fw-normal" href="https://www.heritage.go.kr/heri/cul/linkSelectNrichList.do">문화유산연구지식</a></li>
                        <li><a class="nav-link p-0 fw-normal" href="https://www.iei.or.kr/main/main.kh?null">KH정보교육원</a></li>
                    </ul>
                </div>
                <!-- Subscription form-->
                <div class="col-md-4  text-dark p06">
                    <h3 class="h4 text-dark">사뿐사뿐의 소식을 구독해보세요!</h3>
                    <p class="fs-sm mb-4 opacity-60 p06">매일 새로 업데이트되는 문화재 소식을 놓치지 마세요!</p>
                    <form class="form-group form-group-dark rounded-pill " style="max-width: 500px; ">
                        <div class="input-group input-group-sm "><span class="input-group-text text-muted "><i class="fi-mail "></i></span>
                            <input class="form-control " type="email " placeholder="Your email ">
                        <button class="btn btn-primary btn-sm rounded-pill " style="background-color: #707CB1; font-size: 15px;" type="button ">구독하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="py-4 border-top border-dark ">
            <div class="container d-flex flex-column flex-lg-row align-items-center justify-content-between py-2 ">
                <!-- Copyright-->
                <p class="order-lg-1 order-2 fs-sm mb-2 mb-lg-0 "><span class="text-dark opacity-60 ">&copy; All rights reserved. Made by </span><a class="nav-link-light text-dark  fw-bold " href="<%=path%>/index.do" target="_blank " rel="noopener ">사뿐사뿐</a></p>
                <div class="d-flex flex-lg-row flex-column align-items-center order-lg-2 order-1 ms-lg-4 mb-lg-0 mb-4 ">
                    <!-- Links-->
                    <div class="d-flex flex-wrap fs-sm mb-lg-0 mb-4 pe-lg-4 "><a class="nav-link-light px-2 mx-1 " href="# ">About</a><a class="nav-link-light px-2 mx-1 " href="# ">Blog</a><a class="nav-link-light px-2 mx-1 " href="#
                                ">Support</a><a class="nav-link-light px-2 mx-1 " href="# ">Contacts</a></div>
                    <div class="d-flex align-items-center ">
                        <!-- Language switcher-->
                        <div class="dropdown "><a class="nav-link nav-link-light dropdown-toggle fs-sm align-items-center p-0 fw-normal " href="# " id="langSwitcher " data-bs-toggle="dropdown " role="button " aria-expanded="false "><i class="fi-globe
                                mt-n1 me-2 align-middle "></i>Eng</a>
                            <ul class="dropdown-menu dropdown-menu-dark my-1 " aria-labelledby="langSwitcher ">
                                <li>
                                    <a class="dropdown-item text-nowrap py-1 " href="# "><img class="me-2 " src="img/flags/de.png " width="20 " alt="Deutsch ">Deutsch</a>
                                </li>
                                <li>
                                    <a class="dropdown-item text-nowrap py-1 " href="# "><img class="me-2 " src="img/flags/fr.png " width="20 " alt="Français ">Français</a>
                                </li>
                                <li>
                                    <a class="dropdown-item text-nowrap py-1 " href="# "><img class="me-2 " src="img/flags/es.png " width="20 " alt="Español ">Español</a>
                                </li>
                            </ul>
                        </div>
                        <!-- Socials-->
                        <div class="ms-4 ps-lg-2 text-nowrap">
                            <a class="btn btn-icon btn-translucent-dark btn-xs rounded-circle me-2" href="#">
                                <i class="fi-facebook"></i></a>
                            <a class="btn btn-icon btn-translucent-dark btn-xs rounded-circle me-2" href="#">
                                <i class="fi-twitter"></i></a>
                            <a class="btn btn-icon btn-translucent-dark btn-xs rounded-circle me-2" href="#"><i class="fi-messenger"></i></a><a class="btn btn-icon btn-translucent-dark btn-xs rounded-circle me-2" href="#"><i class="fi-telegram"></i></a>
                            <a class="btn btn-icon btn-translucent-dark btn-xs rounded-circle" href="#"><i class="fi-whatsapp"></i></a>

                        </div>
                    </div>
                </div>
            </div>
    </footer>
    <!-- Back to top button--><a class="btn-scroll-top " href="#top " data-scroll><span class="btn-scroll-top-tooltip text-muted fs-sm me-2 ">Top</span><i class="btn-scroll-top-icon fi-chevron-up ">   </i></a>
    <!-- Vendor scrits: js libraries and plugins-->
    <script src="<%=path%>/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%=path%>/resources/vendor/simplebar/dist/simplebar.min.js "></script>
    <script src="<%=path%>/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <script src="<%=path%>/resources/vendor/tiny-slider/dist/min/tiny-slider.js "></script>
    <script src="<%=path%>/resources/vendor/flatpickr/dist/flatpickr.min.js "></script>
    <script src="<%=path%>/resources/vendor/jarallax/dist/jarallax.min.js "></script>
    <script src="<%=path%>/resources/vendor/nouislider/dist/nouislider.min.js"></script>
    <script src="<%=path%>/resources/vendor/leaflet/dist/leaflet.js"></script>
    <script src="<%=path%>/resources/vendor/lightgallery/lightgallery.min.js"></script>
    <script src="<%=path%>/resources/vendor/lightgallery/plugins/fullscreen/lg-fullscreen.min.js"></script>
    <script src="<%=path%>/resources/vendor/lightgallery/plugins/zoom/lg-zoom.min.js"></script>
    <script src="<%=path%>/resources/vendor/lightgallery/plugins/thumbnail/lg-thumbnail.min.js"></script>
    <script src="<%=path%>/resources/vendor/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.min.js"></script>
	<script src="<%=path%>/resources/vendor/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.js"></script>
	<script src="<%=path%>/resources/vendor/filepond-plugin-image-crop/dist/filepond-plugin-image-crop.min.js"></script>
	<script src="<%=path%>/resources/vendor/filepond-plugin-image-resize/dist/filepond-plugin-image-resize.min.js"></script>
	<script src="<%=path%>/resources/vendor/filepond-plugin-image-transform/dist/filepond-plugin-image-transform.min.js"></script>
	<script src="<%=path%>/resources/vendor/filepond/dist/filepond.min.js"></script>
    <!-- Main theme script-->
    <script src="<%=path%>/resources/js/jquery-3.6.0.min.js"></script>
    <script src="<%=path%>/resources/js/theme.min.js"></script>
</body>

</html>