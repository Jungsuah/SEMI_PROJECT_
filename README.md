# :footprints:[사뿐사뿐]
<b>프로젝트 '사뿐사뿐 - 문화재 통합정보포털'</b>
<hr>

### :bulb:  다양한 문화유산 및 문화 일정에 관한 정보를 한곳에서 확인하세요!
![SEMI_PROJECT_사뿐사뿐 pdf_1](https://user-images.githubusercontent.com/110010716/221620228-998682fa-87b6-4325-ace4-9254d18121b0.png)



## :running_woman: 사뿐사뿐 | About Us
👉각 지역별 특색있는 문화유산이 대중의 관심에서 멀어진 시대!<br>
👉전국에 산재하고 있는 <b>문화재 및 문화일정에 대한 정보를 종합적으로 열람</b>할 수 있게하고<br>
👉<b>사용자 간 커뮤니티를 활성화</b>하여 <b>문화유산을 쉽게 배우고 즐길수 있는 여건을 조성</b>합니다.<br>
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
6. [ERD](#-erd--ERD)
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




## 🔑 ERD | <a href="https://github.com/Jungsuah/SEMI_PROJECT_/commit/87cb735b2fd1da0583f5f9cf440c47543204a569">(ERD)</a>

![image](https://user-images.githubusercontent.com/110010716/221628382-92f235c4-8dee-4d9e-932e-9d8dadb979dc.png)

<br>


## :tv:기능 구현

### <a href="https://github.com/Jungsuah/SEMI_PROJECT_/tree/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/controller">메인페이지 기능 소개</a>

![main1](https://user-images.githubusercontent.com/110010716/222136100-1e0ba414-90a9-41fd-a1b1-3fb6ff1df59b.gif)
<br>
#### 👉 상단 검색바에서 키워드로 검색 가능 
#### 👉 행사일정 정보 조회, 커뮤니티 글 최신순 조회, 사뿐코스, 사뿐몰 인기 상품 조회 가능

![main2](https://user-images.githubusercontent.com/110010716/222136261-1566824f-edcc-4850-849b-e135b8ef5db3.gif)
<br>
#### 👉 더보기 클릭 시 해당 기능 페이지로 이동 <br><br>
<br>
<br>



![main3](https://user-images.githubusercontent.com/110010716/222139939-59f83898-ae07-4f0f-8c4f-972563992b5e.gif)
<br>
#### 👉 인기 문화 명소는 회원들의 좋아요 갯수를 활용하여 기능 구현 <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/dao/HeritageDao.java">(URL)</a>
#### 👉 로그인한 사용자가 좋아요를 누르면, 좋아요 개수가 자동으로 오르고,
#### 👉 상위 조회수 10곳의 문화재를 메인 페이지에서 확인 가능 <br><br>
<br>
<br>

### <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/dao/HeritageDao.java">문화재 검색 기능 소개</a>
<br>

![search1]
<br>

![search2]
<br>

#### 👉 상단 메뉴를 통한 문화재 검색 페이지 이동 시 전체 문화재 조회 
#### 👉 한 페이지 당 9개의 문화재 조회 페이징 처리 
#### 👉 검색된 항목 (대표이미지, 위치, 문화재명, 요약설명, 찜 개수) 확인 가능
#### 👉 조회된 문화재 클릭 시 상세 페이지로 이동
#### 👉 키워드와 체크박스를 활용한 5중 조건 검색 (키워드, 지역, 지정연도, 시대, 유형 분류)  <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/dao/HeritageDao.java"> | 검색 SQL문 </a>
- 키워드 : 문화재 이름에 포함된 문자 있으면 조회 (선택)
- 지역 : 16가지 항목 중 하나라도 포함된 문화재면 조회 (미선택 or 중복 선택 가능)
- 지정연도 : 스크롤로 지정한 연도 범위에 포함된 문화재면 조회 (미선택 or 단일 선택 가능)
- 시대 : 17가지 항목 중 해당되는 문화재로 조회 (미선택 or 중복 선택 가능)
- 유형 분류 : 7가지 항목 중 해당되는 문화재로 조회 (미선택 or 중복 선택 가능)
- 전체 체크시 이전 선택 항목 사라지고 전체 선택으로 변경
<br>
<br>

### <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/controller/HeritageDetailServlet.java">문화재 상세 기능 소개</a>
<br>

![detail1](https://user-images.githubusercontent.com/101553623/221749389-65e90818-a3d1-4034-8c7e-f38ebb470808.gif)
<br>

#### 👉 분류, 시대, 소재지 등 문화재의 자세한 데이터를 확인
#### 👉 상단 갤러리에서 원본 크기의 문화재 이미지를 확인
<br>
<br>
<br>
  
![detail2](https://user-images.githubusercontent.com/101553623/221750492-8035884e-2611-455c-b928-ada5cb7a6a25.gif)
<br>
  
#### 👉 우측에서는 지도에 문화재 위치를 좌표로 구현 (경도와 위도 데이터 사용)
#### 👉 지도는 카카오 API를 사용하여 구현, 해당 문화재의 위치를 확인 <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/dao/HeritageDao.java">(URL)</a>
#### 👉 클릭 시 해당 문화재/박물관 상세 페이지로 이동 <br><br>
<br>
<br>
<br>

![detail3](https://user-images.githubusercontent.com/101553623/221750839-e0727128-4c87-4dc9-9842-1198e34ca43b.gif)
<br>

#### 👉 하단에서 리뷰 작성 기능<a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/heritageInfo/controller/HertiageReviewWriteServlet.java"> (URL)</a>
#### 👉 최근 4개의 리뷰 확인, 더보기 버튼으로 모든 리뷰를 확인 가능<br><br>
<br>
<br>
<br>

### <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/event/controller/FestivalServlet.java">월별 행사일정 페이지 기능 소개</a>

![detail1](https://user-images.githubusercontent.com/101553623/221749389-65e90818-a3d1-4034-8c7e-f38ebb470808.gif)
<br>

#### 👉 월별 버튼을 눌러 문화 일정 확인 <a href="https://github.com/Jungsuah/SEMI_PROJECT_/blob/main/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/SEMI_PROJECT_%EC%82%AC%EB%BF%90%EC%82%AC%EB%BF%90_Spring/src/main/java/semi/heritage/event/dao/FestivalDao.java">(URL)</a>
#### 👉 한 페이지 당 10개의 문화재 조회 페이징 처리 
#### 👉 url이 표기된 경우 클릭시 관련 행사 사이트로 이동
<br>
<br>
<br>


