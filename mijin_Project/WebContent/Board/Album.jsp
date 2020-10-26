<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-Enter">
<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-exit">
<title>Se So Neon</title>
<link href ="../css/index.css" rel = "stylesheet">
<link href ="../css/Album.css" rel = "stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Courier+Prime&family=Montserrat:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">


</head>
<body>


<!-- 헤더 부분 -->
<jsp:include page="../Inc/top.jsp"></jsp:include>












<article id = "main" style="height: 1000px;">

	<div class = "AlbumMainWrap">
	
	
		<div class = "AlbumTitle">
			<h2>ALBUM</h2>
		</div>
		
		<ul class = "imgUl">
		
			<li class = "Album_imgList0">
				<a href = "javascript:void(window.open('../Board/Album_List/Album_1.jsp', 'Holiday','width=700, height=700'))" class = "imgCap0">
					<img src ="../img/album6.jpeg" width="250px" height="250px">
					<span class = "cap0">HOLIDAY</span>
				</a>
			</li>
		
			<li class = "Album_imgList1">
				<a href = "javascript:void(window.open('../Board/Album_List/Album_2.jsp', '난춘','width=700, height=700'))" class = "imgCap1">
					<img src ="../img/album1.jpg" width="250px" height="250px">
					<span class = "cap1">난춘 (亂春)</span>
				</a>	
			</li>
			
			
			
			<li class = "Album_imgList2">
				<a href = "javascript:void(window.open('../Board/Album_List/Album_3.jsp', '비적응','width=700, height=700'))" class = "imgCap2">
					<img src ="../img/album2.jpg" width="250px" height="250px">
					<span class = "cap2">비적응</span>
				</a>
			</li>
			
			
			<li class = "Album_imgList3">
				<a href = "javascript:void(window.open('../Board/Album_List/Album_4.jsp', '여름깃','width=700, height=700'))" class = "imgCap3">
					<img src ="../img/album3.jpg" width="250px" height="250px">
					<span class = "cap3">여름깃</span>
				</a>
			</li>
			
			
			<li class = "Album_imgList4">
				<a href = "javascript:void(window.open('../Board/Album_List/Album_5.jsp', '파도','width=700, height=700'))" class = "imgCap4">
					<img src ="../img/album4.jpg" width="250px" height="250px">
					<span class = "cap4">파도</span>
				</a>
			</li>
			
						
			<li class = "Album_imgList5">
				<a href = "javascript:void(window.open('../Board/Album_List/Album_6.jsp', '긴 꿈','width=700, height=700'))" class = "imgCap5">
					<img src ="../img/album5.jpg" width="250px" height="250px">
					<span class = "cap5">긴 꿈</span>
				</a>
			</li>
			
			
			
		</ul>
 

	</div>

</article>











<!-- 푸터 부분 -->
<jsp:include page="../Inc/bottom.jsp"></jsp:include>

</body>
</html>