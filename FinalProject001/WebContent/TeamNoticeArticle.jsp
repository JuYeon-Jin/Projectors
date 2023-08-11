<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String spaceNoticeNo = request.getParameter("spaceNoticeNo"); //-- 이전 페이지로부터 넘겨받은 팀 공지번호
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀 스페이스 > 공지 상세: Projectors </title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	
	body { overflow: hidden;} /* 스크롤 제거*/
	a{text-decoration: none;} 
	/*===================================================*/
	#root						   /*루트 박스*/
	{
		width: 1400px;
		height:1000px;
		margin: auto;
		/* border: 2px solid #d1d7e0; */  /*영역 확인용*/
		
	}
	#innerBox				
	{
		margin: auto;
	}
	/*===================================================*/
	#spaceName 					/*스페이스 명(최상단 타이틀 )*/
	{
		display: inline-block;
		text-align: left;
		font-size: 26px;
		padding-left: 80px;		/* 왼쪽 패딩*/
		
	}
	/*===================================================*/
	#categoryBar 				/* 메뉴 인덱스바 영역*/
	{	
		width: 660px;
		height: 40px;
		
		background-color: #fae896;
		padding: 10px 0px 0px 20px;
		margin-left: 60px;
		
		border-top: 2px solid;
		border-left: 2px solid;
		border-right: 2px solid;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	.index					/*메뉴 인덱스 클래스 영역*/
	{
		display: inline;
		/* border: 2px solid;  */			 /* 영역 확인용 */
		border-radius: 10px;
		
		vertical-align: bottom;
		font-weight: bold;
		padding: 6px 8px;
	}			
	
	.index a				/* 메뉴 인덱스 글자*/
	{
		text-decoration: none;
		 
		font-size: 20px;
		padding: 4px 6px;
		margin: 0px;
	}
	/*===================================================*/	
	#exitBtn					/* 나가기 버튼 */
	{	
		float: right;  
		margin-top: -12px; 	   /* 위 여백 줄여서 이미지를 위로 */
		padding-right: 60px;  /* 왼쪽으로*/
	}
	/*===================================================*/
	#directoryBox 	/*(메뉴 인덱스 제외) 폴더모양 박스 영역 전체*/
	{	
		position: relative; /* 자식요소 위치 고정을 위한 속성지정 */
  		border: 2px solid;
		border: 2px solid; 
		border-radius: 20px;
		
		width: 1300px;
		height:740px;
		
		background-color: #fae896;  
		margin: auto;	/* 가운데 정렬*/
	}
	/*===================================================*/
	#topLeftBox			/* 좌측 상단 영역 */
	{
		width: 260px;
		height: 200px;
		border: 2px solid;
		border-radius: 10px;
		margin: 30px 20px 20px 20px;
		padding: 10px;
		background-color: gray;
	}
	/*===================================================*/
	#feed					/* 담벼락 영역 */
	{
		float: left;
		width: 260px;
		height: 430px;
		
		text-align: center;
		padding: 5px;
		margin: 0px 20px 10px 20px;
		border: 3px solid lightgreen;
		border-radius: 10px;
	}

	#feedContent			/* 담벼락 입력된 공간 */
	{
		width: 240px;
		background-color: #d5ffc4;
		margin: auto;
		margin-top: 10px;
		border-radius: 10px;
	}
	#feedInsert 			/* 담벼락 입력 창*/
	{
		width: 240px;
		margin: auto;
		margin-top: 10px ;
		border-radius: 10px;
		text-align: left;
	}
	
    /*===================================================*/
	#titleBox 	/* 타이틀 영역 */
	{
	  position: absolute; /* 윈도우 조절해도 변화 없이 고정 (부모요소와 연관 제거)*/ 
	  top: 30px;   /* 고정 top 마진 */
	  right: 20px; /* 고정 우측 마진 */
	  background-color: white;
	  width: 920px;
	  border: 2px solid;
	  border-radius: 10px;
	  
	  font-size: 16px;
	  font-weight: bold;
	  text-align: left;
	  padding: 4px 4px 6px 14px;
	}
	
	#lineNotice	,#noticeDate	/* 공지 글씨 (span) */
	{
		vertical-align: super;	/*베이스 라인을 위로.*/
	}

	/*===================================================*/
	#workSpaceBox			/* 공지글 리스트 영역*/
	{
	  position: absolute; /* 윈도우 조절해도 변화 없이 고정 (부모요소와 연관 제거)*/ 
	  top: 90px;   		/* 고정 top 마진 */
	  right: 20px; 		/* 고정 우측 마진 */
	  
	  background-color: white;
	  width: 920px;
	  height:596px;
	  
	  border: 2px solid;
	  border-radius: 10px;
	  padding: 10px;
	}
	#teamNoticeArticleTbl /* 공지 아티클 테이블*/
	{
		border: solid 1px;
		border-radius: 10px;
		margin:40px 0px 20px 50px;
		font-size: 12pt;
		text-align: center;
	}
	#teamNoticeTextArea /* 내용 출력 부분 */
	{
		width: 88%;
		height: 400px;
		magin: 10px;
		border-radius: 10px;
		padding: 10px;
	}
	/*======================================================*/
	
	#bottomBox				/* 하단 버튼 3개 영역*/
	{
		width: 300px;
		margin: 10px auto;
		padding: 4px;
	}
	.btn							/* 버튼 클래스 공통 */
	{	
		background-color: black;
		color: white;
		font-weight: bold;
		font-size: 10pt;
		padding: 2px 10px;
		border-radius: 12px;
	}
	#backBtn:hover					/* 목록으로 버튼*/
	{	
		border: 2px solid black;
		background-color: #dbd1ce;
		color: black;
	}
	#modifyBtn 						/* 수정 버튼 */
	{	
		background-color: #fadc6e;
		color: black;
	}	
	#modifyBtn:hover						
	{	
		background-color: #f5b576;
	}	
	#deleteBtn						/* 삭제 버튼*/
	{
		background-color: #fa6e6e;
		color: black;
	}
	#deleteBtn:hover						
	{	
		background-color: #d94925;
	}	
</style>
<script type="text/javascript">
	
	// 담벼락에 메세지 붙이기
    function sendFeed()
	{
		document.getElementById("feedContent").value += document.getElementById("feedInsert").value;
	}
	
	// 삭제 버튼 클릭시 확인받기 
	function deleteTeamNotice() 
	{
        var confirmDelete = confirm("정말로 삭제하시겠습니까?");
        
        if (confirmDelete) {
            window.location.href = "teamNoticeDelete.action?spaceNoticeNo=<%=spaceNoticeNo%>";
        }
    }
</script>


</head>
<body>

	<div id="root">
		<div id="innerBox">
			
			<div>
				<h1 id="spaceName">팀 스페이스 : 우리동네 밥친구 프로젝트 </h1>
			</div>
			<div id="exitBtn">
				<a href="MainPage.jsp"><img src="images/exit.png" style="width:50px"></a>
			</div> 
			
			<!-- 공지, 작업실, 회의록, 히스토리 (메뉴 인덱스) -->
			<div id="categoryBar">
				<div class="index idx1">
					<a href="TeamSpace.jsp">
						<img src="images/home.png" style="width:30px;"/>
					</a>
				</div>
				<div class="index idx2"><a href="teamNoticeList.action">공지</a></div>
				<div class="index idx3"><a href="TeamNoticeList.jsp">작업실</a></div>
				<div class="index idx4"><a href="TeamMeetingList.jsp">회의록</a></div>
				<div class="index idx5"><a href="TeamTotalRecord.jsp">히스토리</a></div>
				<div class="index idx6"><a href="TeamMemberInfo.jsp">멤버</a></div>
				<div class="index idx7"><a href="TeamSetting.jsp">설정</a></div>
			</div>
				
			<div id="directoryBox">
				
				<div id="topLeftBox"> <!-- 왼쪽 상단 영역 -->
						
					여기 뭐 넣져??
				</div>
				
				
				<!-- ==============[ 담벼락 ] ============= -->
				<div id="feed" name="FeedSector">
					<textarea id="feedContent" name="feedContent" id="" cols="50" rows="15" readonly="readonly"></textarea>
					<br>
					<textarea id="feedInsert" name="feedInsert"" cols="50 " rows="5"
								placeholder="내용을 입력하세요."></textarea>
					<br>
					<button type="submit" id="feedBtn" name="feedBtn" onclick="sendFeed()">보내기</button>
				</div>
				
				<!-- ===========[ 타이틀 (공지게시판)  ]=========== -->
				<div id="titleBox">
					<img src="images/megaphone.png" style="width:30px;">
					<span id="lineNotice">공지게시판</span>
				</div>
				
				<!-- ==========[ 팀 공지 아티클 상세 보기 영역 ]========== -->
				<div id="workSpaceBox">
					
					<table id="teamNoticeArticleTbl">
						<tr>
							<th width="100px">글 번호</th>
							<th width="500px">제목</th>
							<th width="200px">작성일</th>
						</tr>
						<tr>
							<td>${teamArticle.spaceNoticeNo }</td>
							<td>${teamArticle.title }</td>
							<td>${teamArticle.createdDate }</td>
						</tr>
						<tr>
    						<td colspan="3">
    							<hr>
	    						<textarea id="teamNoticeTextArea">${teamArticle.content}
	    						</textarea>
    						</td>
						</tr>
					</table>
					 
					
					<div id="bottomBox">
						
						<a href="teamNoticeList.action">
							<button type="button" class="btn" id="backBtn">목록으로</button>
						</a>
						
						<!-- ※ 팀장에게만 보이는 버튼 -->
						<a href="teamNoticeModify.action">  
							<button type="button" class="btn" id="modifyBtn">수정하기</button>
						</a>
						<button type="button" class="btn" id="deleteBtn" onclick="deleteTeamNotice()">삭제하기</button>
					</div>
			
				</div><!-- end of #workSpaceBox  -->
				
			</div><!-- end of #directoryBox div (콘텐츠 영역)-->
			
		</div><!-- end of #innerBox div  -->
		
	</div><!-- end of #root div -->

</body>
</html>
						
						