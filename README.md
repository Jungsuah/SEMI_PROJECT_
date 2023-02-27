
# :footprints:[사뿐사뿐] - 문화재 정보 사이트:footprints:
<p>
<p>




### :bulb: 다양한 문화유산 및 문화 일정에 관한 정보를 한눈에!
![SEMI_PROJECT_사뿐사뿐 pdf_1](https://user-images.githubusercontent.com/110010716/221620228-998682fa-87b6-4325-ace4-9254d18121b0.png)


## :running_woman: 사뿐사뿐 | About Us
👉문화유산에 대한 관심 부족으로 각 지역별 특색있는 문화유산이 대중의 관심에서 멀어진 시대!<br>
👉전국에 산재하고 있는 문화재 및 문화일정에 대한 정보를 종합적으로 열람할 수 있게하고<br>
👉사용자 간 커뮤니티를 활성화하여 문화유산을 쉽게 배우고 즐길수 있는 여건을 조성하고자 합니다.<br>
<p>
<p>
## 
![image](https://user-images.githubusercontent.com/110010716/221626536-82c4d5d7-6f03-493d-89b7-cbf0b36d034b.png)

### :movie_camera:구현 동영상 및 PPT | Google Drive [바로가기](https://drive.google.com/drive/folders/1RdLfbwmSQiJUSqqcsab5JzN1wkyX2W7k?usp=sharing)

<br>

## 🔭목차 | Contents
1. [개발기간 | Project Period](#-개발기간--project-period)
2. [아키텍쳐 | Architecture](#-아키텍쳐--architecture)
3. [주요 기능 | Main Function](#-주요-기능--Main-Function)
4. [개발환경 | Development Enviornment](#-개발환경--development-environment)
5. [라이브러리 | Library](#-라이브러리--library)
6. [ERD](#-erd)
7. [ 팀원 | TEAM](#-팀원--team)

<br>


## ⌚ 개발기간 | Project Period
- 2022.06.17 ~ 2022.06.27 프로젝트 기획<br>
- 2022.06.28 ~ 2022.07.04 UI 설계<br>
- 2022.07.05 ~ 2022.07.11 프론트 구현<br>
- 2022.07.11 ~ 2022.07.18 API 파싱/ DB 설계<br>
- 2022.07.16 ~ 2022.07.20 ERD 설계<br>
- 2022.07.16 ~ 2022.07.29 프로젝트 기능 구현<br>
- 2022.07.28 ~ 2022.08.05 테스트 및 오류수정<br> 
- 2022.08.22 프로젝트 발표<br>

<br>





## 🛠 아키텍쳐 | Architecture



## ⚔ 주요 기능 | Main Function
### FE
- 소셜 로그인 (트위터 / 카카오)
- 실시간 리뷰 확인 (메인 페이지 실시간 리뷰 SECTION)
- 리뷰 후기 (CRUD) / 리뷰 댓글 / 좋아요 기능 / 리뷰 페이지 무한스크롤
- 태그, 필터, 검색어를 통한 검색 기능
- 프로필 수정
- 프로필 내에서 내가 쓴 리뷰 확인
- 극장 정보 인포 MODAL (KAKAO MAP)
- 반응형

### BE
- 간편한 소셜 로그인 트위터, 카카오톡 지원
- 다양한 경우의 검색 요청 일괄 처리 (QueryDSL)
- 자주 조회하는 데이터 캐싱 처리 (Redis, Spring Cache)
- 배포된 서버의 에러 로그를 쉽게 확인 가능 (Slack Webhook, Logback)
- RefreshToken 토큰을 사용하여 로그인 정보 자동 갱신 (JWT)
- S3 스토리지에 저장되는 이미지 리사이징 처리 (Imgscalr)
- CI/CD 자동 배포 (Githib Action, S3, CodeDeploy)
- 무중단 배포 (NGINX)


## ⛏ 개발환경 | Development Environment

<img  src="https://img.shields.io/badge/react-61DAFB?style=for-the-badge&logo=react&logoColor=black"> <img  src="https://img.shields.io/badge/react query-FF4154?style=for-the-badge&logo=reactquery&logoColor=black">
<img  src="https://img.shields.io/badge/Recoil-0088CC?style=for-the-badge&logo=recoil&logoColor=white">
<img  src="https://img.shields.io/badge/React Hook Form-EC5990?style=for-the-badge&logo=react Hook Form&logoColor=white">
<img  src="https://img.shields.io/badge/Axios-5A29E4?style=for-the-badge&logo=axios&logoColor=white">
<img  src="https://img.shields.io/badge/styled-components-DB7093?style=for-the-badge&logo=styled-components&logoColor=white">
<img  src="https://img.shields.io/badge/React Router-CA4245?style=for-the-badge&logo=React Router&logoColor=white">
<img  src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=black">
<img  src="https://img.shields.io/badge/Amazon S3-569A31?style=for-the-badge&logo=Amazon S3&logoColor=white">
<img  src="https://img.shields.io/badge/aws Cloundfront-EF2D5E?style=for-the-badge&logo=&logoColor=white">
<img  src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white">
<img  src="https://img.shields.io/badge/Spring Boot-6DB33F?style=for-the-badge&logo=Spring Boot&logoColor=white">
<img  src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=Docker&logoColor=white">
<img  src="https://img.shields.io/badge/Redis-DC382D?style=for-the-badge&logo=Redis&logoColor=white">
<img  src="https://img.shields.io/badge/Spring Data JPA-6DB33F?style=for-the-badge&logo=S&logoColor=white">
<img  src="https://img.shields.io/badge/Query DSL-4695EB?style=for-the-badge&logo=&logoColor=white">
<img  src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=MySQL&logoColor=white">
<img  src="https://img.shields.io/badge/Amazon RDS-527FFF?style=for-the-badge&logo=Amazon RDS&logoColor=white">
<img  src="https://img.shields.io/badge/Amazon EC2-FF9900?style=for-the-badge&logo=Amazon EC2&logoColor=white">
<img  src="https://img.shields.io/badge/GitHub Actions-2088FF?style=for-the-badge&logo=GitHub Actions&logoColor=white">
<img  src="https://img.shields.io/badge/Slack Webhook-4A154B?style=for-the-badge&logo=&logoColor=white">


## 🎨 라이브러리 | Library

     "@fortawesome/react-fontawesome": "^0.2.0",
     "axios": "^0.27.2",
     "file-loader": "^6.2.0",
     "json-server": "^0.17.0",
     "moment": "^2.29.4",
     "react": "^18.2.0",
     "react-dom": "^18.2.0",
     "react-hook-form": "^7.34.2",
     "react-intersection-observer": "^9.4.0",
     "react-query": "^3.39.2",
     "react-router-dom": "^6.3.0",
     "react-scripts": "5.0.1",
     "react-select": "^5.4.0",
     "react-toastify": "^9.0.8",
     "recoil": "^0.7.5",
     "styled-components": "^5.3.5",
     "sweetalert2": "^11.4.33",
     "sweetalert2-react-content": "^5.0.3",
     "swiper": "^8.3.2",
     

    

<br>

## 🔑 ERD 

![image](https://user-images.githubusercontent.com/110010716/221628382-92f235c4-8dee-4d9e-932e-9d8dadb979dc.png)


<br>






