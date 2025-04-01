# Naver Search & Bookmark

Naver 검색 API를 활용하여 블로그 검색 결과를 조회하고, 원하는 결과를 북마크(데이터베이스에 저장)하는 간단한 웹 애플리케이션입니다.

## 주요 기능

* **키워드 검색:** Naver 블로그 API를 사용하여 특정 키워드로 블로그 게시물을 검색합니다.
* **결과 조회:** 검색된 결과를 웹 페이지에 목록 형태로 보여줍니다.
* **북마크:** 관심 있는 검색 결과를 선택하여 데이터베이스에 저장(북마크)합니다.

## 기술 스택

* **Backend:** Java, Spring Framework (MVC)
* **Database:** (사용자가 설정한 DB), MyBatis
* **API:** Naver Search API (Blog)
* **Frontend:** JSP, HTML, CSS (기본)
* **Configuration:** Dotenv (환경 변수 관리)
* **Server:** Servlet Container (e.g., Tomcat)
* **Build Tool:** (프로젝트에 설정된 빌드 도구 - e.g., Maven, Gradle)

## 설정 방법

1.  **데이터베이스 설정:**
    * `src/main/resources/mappers/BookmarkMapper.xml`의 `INSERT` 구문에 맞는 `search_result_bookmark` 테이블을 데이터베이스에 생성합니다. (컬럼: `title`, `link`, `description`, `date`, 그리고 필요시 `uuid`, `createdAt` 등 자동 생성 컬럼)
2.  **환경 변수 설정:**
    * 프로젝트 루트 디렉토리에 `.env` 파일을 생성하고 아래 내용을 포함하여 Naver API 키 및 데이터베이스 접속 정보를 입력합니다.
      ```dotenv
      NAVER_CLIENT_ID=YOUR_NAVER_CLIENT_ID
      NAVER_CLIENT_SECRET=YOUR_NAVER_CLIENT_SECRET
      DB_DRIVER=YOUR_DB_DRIVER # 예: com.mysql.cj.jdbc.Driver 또는 org.mariadb.jdbc.Driver
      DB_URL=YOUR_DB_URL # 예: jdbc:mysql://localhost:3306/your_database_name
      DB_USERNAME=YOUR_DB_USERNAME
      DB_PASSWORD=YOUR_DB_PASSWORD
      ```
3.  **빌드 및 배포:**
    * 사용하는 빌드 도구(Maven 또는 Gradle)를 사용하여 프로젝트를 빌드합니다. (`mvn clean package` 또는 `gradle build`)
    * 생성된 WAR 파일을 Servlet Container(예: Tomcat)에 배포합니다.

## 사용 방법

1.  웹 브라우저에서 배포된 애플리케이션의 URL로 접속합니다. (예: `http://localhost:8080/your_app_context/`)
2.  상단의 검색창에 원하는 키워드를 입력하고 검색 버튼을 누르거나 Enter 키를 입력합니다.
3.  검색 결과 목록이 나타납니다.
4.  저장하고 싶은 결과 항목 옆의 '북마크' (또는 유사한 기능의 버튼/링크)를 클릭하여 데이터베이스에 저장합니다. (현재 구현에서는 북마크 목록 조회 기능은 없습니다.)

## 향후 개선 방향 (Ideas)

* **다양한 검색 소스 추가:** Naver 뉴스, 웹문서, 지식iN 등 다른 API 연동
* **북마크 관리:** 저장된 북마크 목록 조회, 삭제, 태그 기능 추가
* **AI 연동:**
    * 검색 결과 또는 북마크 요약 (Gemini, Together AI 등 활용)
    * 관련 콘텐츠 추천
    * 자동 태깅 또는 분류
* **사용자 인증:** 사용자별 북마크 관리 기능