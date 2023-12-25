# submit
submit_final

# [접속 방법]
http://localhost:8090/FinalProject001/projectorsmain.action

# [프로젝트 요약]
-설명<br/>
● 웹 개발자들이 모여 장, 단기 프로젝트에서 팀 모집 및 참여가 서비스 제공<br/>
● 프로젝트가 형성된 이후 ‘팀 스페이스’라는 작업 공간 서비스 제공<br/>
● 구성원 (4 명)<br/>

# [개발 환경]
-Java ( Version : 1.8.0 이상)</br>
-Eclipse ( Version : 4.15.0)</br>
-Oracle & Oracle SQL Developer ( Version : 20.4.1)</br>
-Apache Tomcat ( Version : 8.5.8)</br>
-SpringFramework ( Version : 3.0.2 RELEASE)</br>
-Jstl ( Version : 1.1.2)</br>
-GitHub (공동 작업 위함)</br>

# [파일 구성]
```
📦 
├─ .classpath
├─ .gitignore
├─ .project
├─ .settings
│  ├─ .jsdtscope
│  ├─ org.eclipse.jdt.core.prefs
│  ├─ org.eclipse.wst.common.component
│  ├─ org.eclipse.wst.common.project.facet.core.xml
│  ├─ org.eclipse.wst.jsdt.ui.superType.container
│  └─ org.eclipse.wst.jsdt.ui.superType.name
├─ README.md
├─ WebContent
│  ├─ Document
│  │  ├─ ▒02.요구 분석_웹커뮤니티서비스(PROJECTORS).pdf
│  │  ├─ ▒05.DB모델링_테이블명세서_웹 프로젝트 관리 시스템(PROJECTORS).pdf
│  │  ├─ ▒06_2.순서도(PROJECTORS).pdf
│  │  └─ ▒12.프로젝트_일정_계획및수행(PROJECTORS).xlsx
│  ├─ META-INF
│  │  └─ MANIFEST.MF
│  ├─ WEB-INF
│  │  ├─ dispatcher-servlet.xml
│  │  ├─ lib
│  │  │  ├─ com.springsource.javax.mail-1.4.0.jar
│  │  │  ├─ com.springsource.javax.mail-sources-1.4.0.jar
│  │  │  ├─ com.springsource.org.apache.commons.logging-1.1.1.jar
│  │  │  ├─ cos.jar
│  │  │  ├─ jstl.jar
│  │  │  ├─ mybatis-3.5.10.jar
│  │  │  ├─ mybatis-spring-1.3.2.jar
│  │  │  ├─ ojdbc6.jar
│  │  │  ├─ org.springframework.aop-3.0.2.RELEASE.jar
│  │  │  ├─ org.springframework.asm-3.0.2.RELEASE.jar
│  │  │  ├─ org.springframework.beans-3.0.2.RELEASE.jar
│  │  │  ├─ org.springframework.context-3.0.2.RELEASE.jar
│  │  │  ├─ org.springframework.context.support-3.0.2.RELEASE.jar
│  │  │  ├─ org.springframework.core-3.0.2.RELEASE.jar
│  │  │  ├─ org.springframework.expression-3.0.2.RELEASE.jar
│  │  │  ├─ org.springframework.jdbc-3.0.2.RELEASE.jar
│  │  │  ├─ org.springframework.transaction-3.0.2.RELEASE.jar
│  │  │  ├─ org.springframework.web-3.0.2.RELEASE.jar
│  │  │  ├─ org.springframework.web.servlet-3.0.2.RELEASE.jar
│  │  │  └─ standard.jar
│  │  ├─ view
│  │  │  ├─ AccountManagement.jsp
│  │  │  ├─ AdminBar.jsp
│  │  │  ├─ AdminMainNoticeArticle.jsp
│  │  │  ├─ AdminMainNoticeLists.jsp
│  │  │  ├─ AdminMainPage.jsp
│  │  │  ├─ AdminUpperBar.jsp
│  │  │  ├─ AfterCreateAccount.jsp
│  │  │  ├─ AfterReport.jsp
│  │  │  ├─ AnswerManagement.jsp
│  │  │  ├─ AnswerManagementArticle.jsp
│  │  │  ├─ ApplyArticle.jsp
│  │  │  ├─ ApplyComplete.jsp
│  │  │  ├─ ApplyForm.jsp
│  │  │  ├─ ChangePassword.jsp
│  │  │  ├─ ContentsManagement.jsp
│  │  │  ├─ CreateAccount.jsp
│  │  │  ├─ FAQArticle.jsp
│  │  │  ├─ FAQInsert.jsp
│  │  │  ├─ FAQLists.jsp
│  │  │  ├─ FAQManagement.jsp
│  │  │  ├─ FAQManagementArticle.jsp
│  │  │  ├─ FAQUpdate.jsp
│  │  │  ├─ Feed.jsp
│  │  │  ├─ Footer.jsp
│  │  │  ├─ GuestBar.jsp
│  │  │  ├─ Leave.jsp
│  │  │  ├─ Login.jsp
│  │  │  ├─ MainNoticeArticle.jsp
│  │  │  ├─ MainNoticeInsert.jsp
│  │  │  ├─ MainNoticeLists.jsp
│  │  │  ├─ ManagementReport.jsp
│  │  │  ├─ MiniProfile.jsp
│  │  │  ├─ MyApply.jsp
│  │  │  ├─ MyPage.jsp
│  │  │  ├─ MyPastApply.jsp
│  │  │  ├─ MyPastPostLists.jsp
│  │  │  ├─ MyPastProjectHistory.jsp
│  │  │  ├─ MyPostLists.jsp
│  │  │  ├─ MyProjectHistory.jsp
│  │  │  ├─ PhotoUpdate.jsp
│  │  │  ├─ ProfileInsert.jsp
│  │  │  ├─ ProfileUpdateForm.jsp
│  │  │  ├─ ProfileView.jsp
│  │  │  ├─ ProjectorsMainPage.jsp
│  │  │  ├─ QnAArticle.jsp
│  │  │  ├─ QnALists.jsp
│  │  │  ├─ QnAQInsert.jsp
│  │  │  ├─ RecruitArticle.jsp
│  │  │  ├─ RecruitInsert.jsp
│  │  │  ├─ RecruitLists.jsp
│  │  │  ├─ RecruitReportForm.jsp
│  │  │  ├─ ReportManagement.jsp
│  │  │  ├─ ReportManagementApply.jsp
│  │  │  ├─ ReportManagementComm.jsp
│  │  │  ├─ ReportManagementComplete.jsp
│  │  │  ├─ ReportManagementCompleteApply.jsp
│  │  │  ├─ ReportManagementCompleteComm.jsp
│  │  │  ├─ ReportManagementCompleteNote.jsp
│  │  │  ├─ ReportManagementNote.jsp
│  │  │  ├─ TeamMeetingArticle.jsp
│  │  │  ├─ TeamMeetingList.jsp
│  │  │  ├─ TeamMeetingWrite.jsp
│  │  │  ├─ TeamMemberInfo.jsp
│  │  │  ├─ TeamMyWorkspace.jsp
│  │  │  ├─ TeamMyWorkspaceWrite.jsp
│  │  │  ├─ TeamNoticeArticle.jsp
│  │  │  ├─ TeamNoticeInsert.jsp
│  │  │  ├─ TeamNoticeList.jsp
│  │  │  ├─ TeamSpace.jsp
│  │  │  ├─ UserManagement.jsp
│  │  │  ├─ UserManagementLog.jsp
│  │  │  ├─ UserManagementLogOut.jsp
│  │  │  ├─ WithDrawUser.jsp
│  │  │  ├─ adminLogo.jsp
│  │  │  ├─ memberBar.jsp
│  │  │  ├─ menuBar.jsp
│  │  │  └─ uploadFileOK.jsp
│  │  └─ web.xml
│  ├─ css
│  │  ├─ apply.css
│  │  ├─ faq.css
│  │  ├─ flexBoxOne.css
│  │  ├─ flexBoxTwo.css
│  │  ├─ login.css
│  │  ├─ mainpage.css
│  │  ├─ myapply.css
│  │  ├─ mypost.css
│  │  ├─ myproject.css
│  │  ├─ notice.css
│  │  ├─ qna.css
│  │  ├─ recruitArticle.css
│  │  ├─ recruitInsertForm.css
│  │  ├─ recruitLists.css
│  │  ├─ report.css
│  │  ├─ reportManagement.css
│  │  └─ teamSpace.css
│  ├─ faq-article.action
│  ├─ faq-list.action
│  ├─ id_ck_ajax.jsp
│  ├─ images
│  │  ├─ ARIAL_BLACK_LOGO.png
│  │  ├─ Closed.png
│  │  ├─ NEXTART_LOGO.png
│  │  ├─ Opened.png
│  │  ├─ SEGOE_UI_BLACK_LOGO.png
│  │  ├─ adminPic.png
│  │  ├─ defaultPhoto.jpg
│  │  ├─ dot_loading.gif
│  │  ├─ exit.png
│  │  ├─ home.png
│  │  ├─ java.png
│  │  ├─ loading_01.gif
│  │  ├─ loading_paperplane.gif
│  │  ├─ loveLetter.png
│  │  ├─ megaphone.png
│  │  ├─ newMsg.png
│  │  ├─ send.png
│  │  ├─ test_profile.JPG
│  │  ├─ tmp_logo.JPG
│  │  ├─ tmp_logo_admin.jpg
│  │  └─ warning.png
│  ├─ inputemail_ck_ajax.jsp
│  ├─ js
│  │  └─ ajax.js
│  ├─ loadFeed.action
│  ├─ loginForm.action
│  ├─ nickname_ck_ajax.jsp
│  ├─ projectorsmain.action
│  ├─ q-list-4admin.action
│  ├─ question-article.action
│  ├─ question-insert-form.action
│  ├─ question-list.action
│  ├─ recruitlist.action
│  ├─ repw_ck_ajax.jsp
│  ├─ sample
│  │  ├─ SamplePageOne.jsp
│  │  ├─ SamplePageTwo.jsp
│  │  ├─ sample.css
│  │  └─ sample.html
│  ├─ show_subregion_ajax.jsp
│  ├─ show_update_subregion_ajax.jsp
│  └─ sql
│     ├─ Projectors_Admin_Query.sql
│     ├─ Projectors_query.sql
│     └─ devProjectors.sql
└─ src
   └─ com
      └─ projectors
         └─ mvc
            ├─ controller
            │  ├─ AccountManagementController.java
            │  ├─ AdminController.java
            │  ├─ AdminReportController.java
            │  ├─ ApplyController.java
            │  ├─ FaqController.java
            │  ├─ FeedController.java
            │  ├─ LoginController.java
            │  ├─ MainController.java
            │  ├─ MenuBarController.java
            │  ├─ MyApplyController.java
            │  ├─ MyPostController.java
            │  ├─ MyProjectController.java
            │  ├─ ProfileController.java
            │  ├─ QnaAController.java
            │  ├─ QnaQController.java
            │  ├─ RecruitController.java
            │  ├─ SendReportController.java
            │  ├─ TeamMeetingController.java
            │  ├─ TeamMyWorkspaceController.java
            │  ├─ TeamNoticeController.java
            │  ├─ TeamSpaceController.java
            │  └─ UsersController.java
            ├─ dao
            │  ├─ IAccountManagementDAO.java
            │  ├─ IAdminDAO.java
            │  ├─ IAdminNoticeDAO.java
            │  ├─ IApplyDAO.java
            │  ├─ IExceptionDAO.java
            │  ├─ IFeedDAO.java
            │  ├─ ILoginDAO.java
            │  ├─ IMenuBarDAO.java
            │  ├─ IMyApplyDAO.java
            │  ├─ IMyPostDAO.java
            │  ├─ IMyProjectDAO.java
            │  ├─ IProfileDAO.java
            │  ├─ IRecruitDAO.java
            │  ├─ IReportDAO.java
            │  ├─ ISendReportDAO.java
            │  ├─ ITeamMeetingDAO.java
            │  ├─ ITeamMyWorkspaceDAO.java
            │  ├─ ITeamNoticeDAO.java
            │  ├─ IUsersDAO.java
            │  ├─ IfaqDAO.java
            │  ├─ IqnaADAO.java
            │  └─ IqnaQDAO.java
            ├─ dto
            │  ├─ AccountManagementDTO.java
            │  ├─ AdminDTO.java
            │  ├─ AdminNoticeDTO.java
            │  ├─ ApplyDTO.java
            │  ├─ FaqDTO.java
            │  ├─ FeedDTO.java
            │  ├─ LoginDTO.java
            │  ├─ MenuBarDTO.java
            │  ├─ MyApplyDTO.java
            │  ├─ MyPostDTO.java
            │  ├─ MyProjectDTO.java
            │  ├─ ProfileDTO.java
            │  ├─ QnaADTO.java
            │  ├─ QnaQDTO.java
            │  ├─ RecruitDTO.java
            │  ├─ ReportDTO.java
            │  ├─ SendReportDTO.java
            │  ├─ TeamMeetingDTO.java
            │  ├─ TeamMyWorkspaceDTO.java
            │  ├─ TeamNoticeDTO.java
            │  └─ UsersDTO.java
            └─ mapper
               ├─ AccountManagementDAO.xml
               ├─ AdminDAO.xml
               ├─ AdminNoticeDAO.xml
               ├─ ApplyDAO.xml
               ├─ ExceptionDAO.xml
               ├─ FaqDAO.xml
               ├─ FeedDAO.xml
               ├─ LoginDAO.xml
               ├─ MenuBarDAO.xml
               ├─ MyApplyDAO.xml
               ├─ MyPostDAO.xml
               ├─ MyProjectDAO.xml
               ├─ ProfileDAO.xml
               ├─ QnaADAO.xml
               ├─ QnaQDAO.xml
               ├─ RecruitDAO.xml
               ├─ ReportDAO.xml
               ├─ SendReportDAO.xml
               ├─ TeamMeetingDAO.xml
               ├─ TeamMyWorkspaceDAO.xml
               ├─ TeamNoticeDAO.xml
               └─ UsersDAO.xml
```
## 파일별 설명
WebContent\
1. *_ajax.jsp ==> 아이디 중복확 검사 및 비밀번호 확인 검사 등 ajax 처리에 필요한 result 값을 가지고 있는 파일 (WebContent\)
2. .action ==> WEB-INF/view 에서 jsp 파일에 직접 접근할 수 없기 때문에 필용한 파일들  (WebContent\)
3. *.jsp ==> 어플리케이션에 필요한 모든 페이지 구성 파일들   (WebContent\WEB-INF\view\)
4. *dto.java  ==> 각 기능에 따라 필요한 변수들을 담을 파일,  변수에 직접 접근하지 않고 getter / setter 를 통해 접근한다. (src\com.projectors.mvc.*)
5. *dao.java  ==> 각 기능에 따라 필요한 메소드를 인터페이스 형식으로 작성한 파일, 의존성 주입을 위함 (src\com.projectors.mvc.*)
6. *Controller.java ==> 각 .action 호출에 따라 어떤 메소드를 수행시킬지, 다음 페이지로 어떤 것을 불러오는지를 결정하는 컨트롤러  (src\com.projectors.mvc.*)
7. *dao.xml ==> *.action - Controller - *dao.java  관계에서 인터페이스에 있는 추상메소드를 Oracle 쿼리문을 통해 정의하는 mapper (src\com.projectors.mvc.mapper_) 
8. ajax.js ==> ajax 호출을 위해 생성한 파일 (js\) 
9. *.css ==> 뷰 디자인 파일 (css\) 
10. 02.요구 분석_웹커뮤니티서비스(PROJECTORS).pdf   -  요구분석서 (Documnet\)
11. 05.DB모델링_테이블명세서_웹 프로젝트 관리 시스템(PROJECTORS).pdf - DB 테이블 명세서 (Documnet\)
12. 06_2.순서도(PROJECTORS).pdf  - 작업 순서도 (Documnet\)
13. 12.프로젝트_일정_계획및수행(PROJECTORS).xlsx  - 일정 기록 (Documnet\)
14. sample.css  
15. sample.html
16. SamplePageOne.jsp
17. SamplePageTwo.jsp
==> (14) ~ (17) 어플리케이션 제작에 사용된 샘플 파일  
