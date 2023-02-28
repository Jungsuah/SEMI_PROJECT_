
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
1. [개발일정](#-개발일정--project-period)
2. [아키텍쳐](#-아키텍쳐--architecture)
3. [UI 흐름도](#-UI-흐름도--UI-Flow)
4. [주요 기능](#-주요-기능--Main-Function)
5. [개발환경](#-개발환경--development-environment)
6. [ERD](#-erd)
7. [기능 구현](#-기능-구현)


<br>


## ⌚ 개발일정 | Project Period
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
- 문화재 <b>검색</b> (키워드, 지역, 지정연도, 시대, 문화재 유형분류별 필터링 기능)<br>
- 문화재 <b>상세 조회</b> (요약 정보, 사진, 동영상 조회 / 찜하기 및 리뷰 작성)<br>
- <b>인기 문화재 추천</b> (찜 갯수 높은 순으로 추천 기능)<br>
- 문화재 <b>지도 좌표 조회</b> (카카오 지도 API 사용)<br>
- 월별 <b>문화일정 검색</b> (월별 상세 검색 기능 / 상세 URL 제공 및 연결)<br>
- <b>기념품 샵</b> (카테고리별 기념품 조회, 장바구니 담기 및 구매 기능)<br>
- <b>커뮤니티</b> (게시판에서 게시글 작성, 수정, 삭제 / 사진 및 파일 업로드 기능)<br>
- <b>로그인 </b> (로그인, 회원가입)<br>
- <b>마이페이지</b> (회원 정보 수정 및 탈퇴 / 찜, 리뷰, 장바구니, 구매이력 조회)<br>
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




## 🔑 ERD | <a href="https://github.com/Jungsuah/SEMI_PROJECT_/commit/87cb735b2fd1da0583f5f9cf440c47543204a569">(photo)</a>

![image](https://user-images.githubusercontent.com/110010716/221628382-92f235c4-8dee-4d9e-932e-9d8dadb979dc.png)


<br>

## :tv: 기능 구현

### <a href="https://github.com/Jungsuah/SEMI_PROJECT_/tree/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo">메인페이지 기능 소개</a>

![main1](https://user-images.githubusercontent.com/101553623/221747056-3553fb73-32e9-46e3-8ce5-d8f81990b923.gif)
<br>
#### 👉 상단 검색바에서 키워드로 검색 가능 
#### 👉 인기 문화 명소는 회원들의 좋아요 갯수를 활용하여 기능 구현 <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/dao/HeritageDao.java">(URL)</a>
#### 👉 클릭 시 해당 문화재의 상세 페이지로 이동 <br><br>
<br>
<br>

![main2](https://user-images.githubusercontent.com/101553623/221747721-bbd3eb28-9226-4251-b0cb-728d30204c19.gif)
<br>

#### 👉 이달의 인기 박물관은 박물관 상세페이지의 조회수를 활용 <a href="https://github.com/kyungseopk1m/project-semi/blob/master/00_K_Heritage/src/main/webapp/views/main/main.jsp">(URL)</a>
#### 👉 박물관 페이지에 접속하면 조회수가 자동으로 오르고,
#### 👉 상위 조회수 2곳의 박물관을 메인 페이지에서 확인 가능 <br><br>
<br>
<br>

### <a href="https://github.com/kyungseopk1m/project-semi/blob/master/00_K_Heritage/src/main/java/cultureController/CultureServlet.java">문화재 검색 기능 소개</a>
<br>

![search1](https://user-images.githubusercontent.com/101553623/221748602-eb4129c8-b825-43e0-89fb-d42d9cac7914.gif)
<br>

![search2](https://user-images.githubusercontent.com/101553623/221749046-b7958642-22fa-42df-aadc-55c7e966b0d2.gif)
<br>

#### 👉 상단 메뉴를 통한 문화재 검색 페이지 이동 시 전체 문화재 조회 
#### 👉 한 페이지 당 12개의 문화재 조회 페이징 처리 (대표이미지, 종목 유형, 문화재명)
#### 👉 조회된 문화재 클릭 시 상세 페이지로 이동
#### 👉 검색 조건 (4중 검색 가능)
- 문화재명 : 캠핑장 이름에 포함된 문자 있으면 조회 (선택)
- 지정 종목 : 4가지 항목 중 하나라도 포함된 문화재면 조회 (미선택 or 단일 선택 가능)
- 시대별 : 9가지 항목 중 해당되는 문화재로 조회 (미선택 or 단일 선택 가능)
- 지역별 : 6가지 항목 중 해당되는 문화재로 조회 (미선택 or 단일 선택 가능)<br><br>
<br>
<br>

### <a href="https://github.com/kyungseopk1m/project-semi/blob/master/00_K_Heritage/src/main/webapp/views/culture/cul_det.jsp">문화재 상세 기능 소개</a>
<br>

![detail1](https://user-images.githubusercontent.com/101553623/221749389-65e90818-a3d1-4034-8c7e-f38ebb470808.gif)
<br>

#### 👉 분류, 시대, 소재지 등 문화재의 자세한 데이터를 확인
#### 👉 하단에서는 원본 크기의 문화재 이미지를 확인
<br>
<br>
<br>
  
![detail2](https://user-images.githubusercontent.com/101553623/221750492-8035884e-2611-455c-b928-ada5cb7a6a25.gif)
<br>
  
#### 👉 우측에서는 지도와 주변 문화재, 주변 박물관 표시 기능 구현
#### 👉 주변 문화재와 주변 박물관은 상세 페이지의 경도와 위도 데이터를 활용 <a href="https://github.com/kyungseopk1m/project-semi/blob/master/00_K_Heritage/src/main/java/culture/CultureDIDao.java">(URL)</a>
#### 👉 클릭 시 해당 문화재/박물관 상세 페이지로 이동 <br><br>
<br>
<br>
<br>

![detail3](https://user-images.githubusercontent.com/101553623/221750839-e0727128-4c87-4dc9-9842-1198e34ca43b.gif)
<br>

#### 👉 지도는 카카오 API를 사용하여 구현하였고, 해당 문화재의 위치를 확인 <br><br>
<br>
<br>




