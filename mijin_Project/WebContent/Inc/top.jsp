<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    



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