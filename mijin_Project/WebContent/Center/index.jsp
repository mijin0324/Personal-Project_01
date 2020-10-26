<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-Enter">
<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-exit">
<title>Se So Neon</title>
<link href ="../css/index.css" rel ="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

</head>
<body>


<!-- 헤더 부분 -->
<header id = "header">
	<div class = "headDiv">


<%

	String id = (String)session.getAttribute("id");

	if(session.getAttribute("id") == null){

%>
		<!-- 로그인과 JOIN 부분-->
		
		<div class = "LoginDiv">
		
			<ul class = "LogInJoin">
				<li><a href = "../Member/Login.jsp">LOG IN</a></li>
				<li><a href = "../Member/Join.jsp">JOIN</a></li>
			</ul>
			
		</div>
		
<%
	}
	
	else{

%>		

		<div class = "LoginDiv">
		
			<ul class = "LogInJoin">
				<li>
					<a href = "../Member/MyPage.jsp">
						<img src = "../img/user.png" width="23px" height="23px" class = "userIcon" 
						style="margin-top: 5px;">
					<%=id%> WELCOM!</a></li>
				<li style="margin-top: 7.6px;"><a href = "../Member/Logout.jsp" class = "logout">LOG OUT</a></li>
			</ul>
			
		</div>
		
<%
		
	}
%>

		
		<!-- 로고 이미지 부분-->
		<div class = "menu">
		
			<a href = "../Center/index.jsp" id = "logo">
				<img src ="../img/logo1.png" class = "logoImg"
				onmouseover="this.src='../img/logo.gif';"
				onmouseout="this.src='../img/logo1.png';">
			</a>
		
		
		<!-- 메뉴 부분-->
			<ul class = "menuList">
				<li class = "top_menu1"><a href ="../Board/Profile.jsp" class ="top_menu1">PROFILE</a></li>
				<li class = "top_menu2"><a href ="../Board/Album.jsp">ALBUM</a></li>
				<li class = "top_menu3"><a href ="../Board/Schedule.jsp">SCHEDULE</a></li>
				<li class = "top_menu4"><a href ="../Board/Pic.jsp">PIC</a></li>
				<li class = "top_menu5"><a href ="../Board/To.jsp">TO.</a></li>
				<li class = "top_menu6"><a href ="../Board/Contact.jsp">CONTACT</a></li>
			</ul>
			
		</div>
		
		
		
	</div>		
		
</header>












<!-- 메인 부분 -->
<article id = "main">

	<div class = "mainDiv">

		<section class = "content1">
			<span>Se So Neon</span>
		</section>
		
		<section class = "content2">
			<div class = "pho1"></div>
			<div class = "pho2"></div>
			<div class = "pho3"></div>
			<div class = "pho4"></div>
			<div class = "pho5"></div>
		</section>
		
	</div>

</article>












<!-- 푸터 부분 -->
<footer id = "footer">

	<div class = "click">
		<span class = "cText">CLICK NOW!</span>
	</div>

	
	<div class = "foot_icon">
		<a href = "https://www.facebook.com/se.so.neon/"><img src ="../img/face.png" width="100px" height="100px" class = "m"></a>
		<a href = "https://www.instagram.com/se_so_neon/"><img src ="../img/insta.png" width="100px" height="100px"></a>
		<a href = "http://www.msbsound.com/artist/sesoneon/youtube.com/c/SESONEON"><img src ="../img/youtube.png" width="100px" height="100px"></a>
		<a href = "https://twitter.com/se_so_neon"><img src ="../img/twit.png" width="100px" height="100px"></a>
	</div>
	© 2020 by Kim Mi jin
	ALL RIGHT RESERVED.
</footer>


</body>
</html>