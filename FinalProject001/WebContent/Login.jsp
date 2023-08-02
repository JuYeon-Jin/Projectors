<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 창</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">

	*{font-size: 14pt;}
	#root{padding-top: 160px}
	
	#logoBox 					   /*로고 이미지*/
	{
		text-align: center;
		height: 100px;
		padding-top: 20px;
		/* border: 1px solid; */
	}
	
	#wrapper{margin: 10px 300px;}
	/*==================================================*/
	
	#roginBox /* 로그인 박스 영역 */
	{	
		width: 360px;
		height:140px;
		margin: 0px auto 4px;
		padding: 40px 30px 20px 50px;
		
		border: 1px solid;
		border-radius: 20px;
		
		font-weight: bold;
	}
	#roginBox span		/* 아이디,비번 글씨길이 고정*/
	{	
		display: inline-block;
		width: 100px;
		margin: 2px;
	}
	#roginBtn			/* 로그인 버튼*/
	{	
		width: 330px;
		height: 40px;
		background-color: black;
		color: white;
		
		padding: 2px;
		margin-top: 20px;
		font-weight: bold;
		
		border-radius: 16px;
	}
	#joinFind		/*하단 메뉴영역 (가입, 비번찾기..)*/
	{
		
		text-align: center;
	}
	#joinFind a			/* 하단메뉴 a태그 */
	{
		text-decoration: none;
		color: gray;
		font-size: 11pt;
		font-weight: bold;
		margin-left: 18px;
	}
	input::placeholder  /*플레이스 홀더*/
	{
	  color: gray;
	  font-size: 10pt;
	  text-align: center;
	}
	#adminCheck		/*관리자 체크*/
	{
	  float: right;
	  color: gray;
	  font-size: 10pt;
	  font-weight: bold;
	}
	
</style>

</head>
<body>
	<div id="root">
		<!-- ========== 로고만 import ======================== -->
		<div id="logoBox">    		<!-- 로고 이미지 -->
			<a href="MainPage.jsp"><img src="images/tmp_logo.JPG"/></a>
		</div>	
		<!-- ================================================= -->
		
		<div id="wrapper">
		
			<div id="roginBox">
				<form action="MainPage.jsp">
					<span>아이디</span> 
					<input type="text" id="id" name="id" placeholder="이메일 전체를 입력해주세요."/><br>
					<span>패스워드</span> 
					<input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요."/><br>
					<button id="roginBtn" type="submit">로그인</button>
					<span id="adminCheck">관리자
					<input type="checkbox" name="ManagerCheck" id="ManagerCheck"/>
					</span>
				</form>
			</div>
			<div id="joinFind">
				<a href="CreateAccount.jsp">회원가입 </a>
				<a href="FindPassword.jsp">아이디/비밀번호 찾기 </a>
			</div>
		</div><!-- end of #wrapper div -->
	</div><!-- end of #root div -->
</body>
</html>


