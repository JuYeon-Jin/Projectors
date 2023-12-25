# Projectors_real

[접속 방법]
http://localhost:8090/FinalProject001/projectorsmain.action

[프로젝트 요약]
-설명
● 웹 개발자들이 모여 장, 단기 프로젝트에서 팀 모집 및 참여가 서비스 제공
● 프로젝트가 형성된 이후 ‘팀 스페이스’라는 작업 공간 서비스 제공
● 구성원 (4 명)

[개발 환경]
-Java ( Version : 1.8.0 이상)
-Eclipse ( Version : 4.15.0)
-Oracle & Oracle SQL Developer ( Version : 20.4.1)
-Apache Tomcat ( Version : 8.5.8)
-SpringFramework ( Version : 3.0.2 RELEASE)
-Jstl ( Version : 1.1.2)
-GitHub (공동 작업 위함)

[파일별 설명]
WebContent\

*_ajax.jsp ==> 아이디 중복확 검사 및 비밀번호 확인 검사 등 ajax 처리에 필요한 result 값을 가지고 있는 파일 (WebContent)
.action ==> WEB-INF/view 에서 jsp 파일에 직접 접근할 수 없기 때문에 필용한 파일들 (WebContent)
*.jsp ==> 어플리케이션에 필요한 모든 페이지 구성 파일들 (WebContent\WEB-INF\view)
dto.java ==> 각 기능에 따라 필요한 변수들을 담을 파일, 변수에 직접 접근하지 않고 getter / setter 를 통해 접근한다. (src\com.projectors.mvc.)
dao.java ==> 각 기능에 따라 필요한 메소드를 인터페이스 형식으로 작성한 파일, 의존성 주입을 위함 (src\com.projectors.mvc.)
Controller.java ==> 각 .action 호출에 따라 어떤 메소드를 수행시킬지, 다음 페이지로 어떤 것을 불러오는지를 결정하는 컨트롤러 (src\com.projectors.mvc.)
*dao.xml ==> *.action - Controller - *dao.java 관계에서 인터페이스에 있는 추상메소드를 Oracle 쿼리문을 통해 정의하는 mapper (src\com.projectors.mvc.mapper_)
ajax.js ==> ajax 호출을 위해 생성한 파일 (js)
*.css ==> 뷰 디자인 파일 (css)
02.요구 분석_웹커뮤니티서비스(PROJECTORS).pdf - 요구분석서 (Documnet)
05.DB모델링_테이블명세서_웹 프로젝트 관리 시스템(PROJECTORS).pdf - DB 테이블 명세서 (Documnet)
06_2.순서도(PROJECTORS).pdf - 작업 순서도 (Documnet)
12.프로젝트_일정_계획및수행(PROJECTORS).xlsx - 일정 기록 (Documnet)
sample.css
sample.html
SamplePageOne.jsp
SamplePageTwo.jsp ==> (14) ~ (17) 어플리케이션 제작에 사용된 샘플 파일
