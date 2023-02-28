
# :footprints:[사뿐사뿐] - 문화재 정보 사이트:footprints:
<p>
<p>




### :bulb: 다양한 문화유산 및 문화 일정에 관한 정보를 한눈에!
![SEMI_PROJECT_사뿐사뿐 pdf_1](https://user-images.githubusercontent.com/110010716/221620228-998682fa-87b6-4325-ace4-9254d18121b0.png)


## :running_woman: 사뿐사뿐 | About Us
👉각 지역별 특색있는 문화유산이 대중의 관심에서 멀어진 시대!<br>
👉전국에 산재하고 있는 <b>문화재 및 문화일정에 대한 정보를 종합적으로 열람</b>할 수 있게하고<br>
👉<b>사용자 간 커뮤니티를 활성화</b>하여 문화유산을 쉽게 배우고 즐길수 있는 여건을 조성하고자 합니다.<br>
<br>
<br>
![image](https://user-images.githubusercontent.com/110010716/221626536-82c4d5d7-6f03-493d-89b7-cbf0b36d034b.png)

### :movie_camera:구현 동영상 및 PPT | Google Drive [바로가기](https://drive.google.com/drive/folders/1RdLfbwmSQiJUSqqcsab5JzN1wkyX2W7k?usp=sharing)

<br>

## 🔭목차 | Contents
1. [개발기간 | Project Period](#-개발기간--project-period)
2. [아키텍쳐 | Architecture](#-아키텍쳐--architecture)
3. [UI 흐름도 | UI Flow](#-ui-흐름도)
4. [주요 기능 | Main Function](#-주요-기능--Main-Function)
5. [개발환경 | Development Enviornment](#-개발환경--development-environment)
6. [ERD](#-erd)
7. [기능 구현](#-기능-구현)


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
![image](https://user-images.githubusercontent.com/110010716/221781853-31f0b14e-098e-4aa7-a3a5-07dcd33af443.png)
  <br>
  <br>
  
## 🛠 UI 흐름도 | UI Flow
![image](https://user-images.githubusercontent.com/110010716/221782464-b26250aa-c060-4891-bf9b-a7e3a72ff75f.png)
  <br>
  <br>

## ⚔ 주요 기능 | Main Function
### 
- 문화재 검색 (키워드, 지역, 지정연도, 시대, 문화재 유형분류별 필터링 기능)<br>
- 문화재 상세 조회 (요약 정보, 사진, 동영상 조회 / 찜하기 및 리뷰 작성)<br>
- 인기 문화재 추천 (찜 갯수 높은 순으로 추천 기능)<br>
- 문화재 지도 좌표 조회 (카카오 지도 API 사용)<br>
- 월별 문화일정 검색 (월별 상세 검색 기능 / 상세 URL 제공 및 연결)<br>
- 기념품 샵 (카테고리별 기념품 조회, 장바구니 담기 및 구매 기능)<br>
- 커뮤니티 (게시판에서 게시글 작성, 수정, 삭제 / 사진 및 파일 업로드 기능)<br>
- 로그인 (로그인, 회원가입)<br>
- 마이페이지 (회원 정보 수정 및 탈퇴 / 찜, 리뷰, 장바구니, 구매이력 조회)<br>
  <br>
  <br>

## ⛏ 개발환경 | Development Environment 
- 운영체제 : Window OS<br>
- 개발 툴 : Eclipse, Apache Tomcat 8.5, Oracle SQL Developer, Visual Studio code<br>
- 개발 언어 : Java , HTML5, CSS3, JavaScript, jQuery, SQL, JSP, Servlet, Ajax, Json, Gson<br>
- 소스 제어 관리 : GitHub<br>
- 협업 툴 : Slack, Discode, Zira<br>
- 프로토타이핑 툴 : ERD Cloud<br>
- Open API : Kakao API, 문화재청 API<br>
  <br>
  <br>
![image](https://user-images.githubusercontent.com/110010716/221635450-09d8d5d0-2c44-4e70-a215-85c744c7cdfc.png)
  <br>
  <br>


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






