<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>    
 
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>로그인</title>
    <!-- SEO Meta Tags-->
    <meta name="description" content="Finder - Directory &amp; Listings Bootstrap Template">
    <meta name="keywords" content="bootstrap, business, directory, listings, e-commerce, car dealer, city guide, real estate, job board, user account, multipurpose, ui kit, html5, css3, javascript, gallery, slider, touch">
    <meta name="author" content="Createx Studio">
    <!-- Viewport-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon and Touch Icons-->
    <link rel="apple-touch-icon" sizes="180x180" href="<%=path %>/resources/icon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="<%=path %>/resources/icon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="<%=path %>/resources/icon/favicon-16x16.png">
    <link rel="manifest" href="site.webmanifest">
    <link rel="mask-icon" color="#5bbad5" href="safari-pinned-tab.svg">
    <meta name="msapplication-TileColor" content="#766df4">
    <meta name="theme-color" content="#ffffff">
    <!-- Page loading styles-->
    <style>
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
    </style>
    <!-- Page loading scripts-->
    <script>
        (function() {
            window.onload = function() {
                var preloader = document.querySelector('.page-loading');
                preloader.classList.remove('active');
                setTimeout(function() {
                    preloader.remove();
                }, 2000);
            };
        })();
    </script>
    <!-- Vendor Styles-->
    <link rel="stylesheet" media="screen" href="<%=path %>/resources/vendor/simplebar/dist/simplebar.min.css" />
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" media="screen" href="<%=path %>/resources/css/theme.min.css">
</head>
<!-- Body-->

<body class="bg-secondary">
    <!-- Page loading spinner-->
    <div class="page-loading active">
        <div class="page-loading-inner">
            <div class="page-spinner"></div><span>Loading...</span>
        </div>
    </div>
    <main class="page-wrapper">
        <!-- Page content-->
        <div class="container-fluid d-flex h-100 align-items-center justify-content-center py-4 py-sm-5">
            <div class="card card-body" style="max-width: 940px"><a class="position-absolute top-0 end-0 nav-link fs-sm py-1 px-2 mt-3 me-3" href="#" onclick="window.history.go(-1); return false;"><i class="fi-arrow-long-left fs-base me-2"></i>Go back</a>
                <div class="row mx-0 align-items-center">
                    <div class="col-md-6 border-end-md p-2 p-sm-5">
                        <h2 class="h3 mb-4 mb-sm-5">로그인<br>
                            <p style="color: grey; font-size: 20px; margin-top: 3%;">다시 만나 반가워요 :)</p>
                        </h2>

                        <img class="d-block mx-auto" src="<%=path %>/resources/img/semi-img/00.signin.main.png" width="344" alt="Illustartion">
                        <div class="mt-4 mt-sm-5">계정이 없으신가요? <a href="<%=path %>/views/member/signUp.jsp" style="color: #8957BD;"><b>회원가입</b></a></div>
                    </div>
                    <div class="col-md-6 px-2 pt-2 pb-4 px-sm-5 pb-sm-5 pt-md-5"><a class="btn btn-outline-info w-100 mb-3" href="https://accounts.google.com/"><i class="fi-google fs-lg me-1"></i>Sign in with Google</a><a class="btn btn-outline-info w-100 mb-3" href="https://ko-kr.facebook.com/login"><i class="fi-facebook fs-lg me-1"></i>Sign in with Facebook</a>
                        <div class="d-flex align-items-center py-3 mb-3">
                            <hr class="w-100">
                            <div class="px-3">Or</div>
                            <hr class="w-100">
                        </div>
                        <form class="needs-validation" novalidate id="loginFrm" action="<%=path%>/login" method="post">
                            <div class="mb-4">
                                <label class="form-label mb-2" for="signin-email">이메일</label>
                                <input class="form-control" type="email" id="signin-email" name="userId" placeholder="이메일" required>
                            </div>
                            <div class="mb-4">
                                <div class="d-flex align-items-center justify-content-between mb-2">
                                    <label class="form-label mb-0" for="signin-password">비밀번호</label><a class="fs-sm" href="#" style="color: #8957BD;">비밀번호를 잊으셨나요?</a>
                                </div>
                                <div class="password-toggle">
                                    <input class="form-control" type="password" id="signin-password" name="userPwd" placeholder="비밀번호 입력" required>
                                    <label class="password-toggle-btn" aria-label="Show/hide password">
                      <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                    </label>
                                </div>
                            </div>
                            <button class="btn btn-lg w-100" type="submit" style="background-color: #8957BD; color: #fff;">로그인</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- Back to top button--><a class="btn-scroll-top" href="#top" data-scroll><span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span><i class="btn-scroll-top-icon fi-chevron-up">   </i></a>
    <!-- Vendor scrits: js libraries and plugins-->
    <script src="<%=path %>/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<%=path %>/resources/vendor/simplebar/dist/simplebar.min.js"></script>
    <script src="<%=path %>/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
    <!-- Main theme script-->
    <script src="<%=path %>/resources/js/theme.min.js"></script>
</body>

</html>