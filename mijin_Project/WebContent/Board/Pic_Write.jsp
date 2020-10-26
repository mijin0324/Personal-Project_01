<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
<link href ="../css/Pic_Write.css" rel = "stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Courier+Prime&family=Montserrat:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>




<script type="text/javascript">

	

function fileCheck(file) {
	
	
	// 파일 유효성 검사: 이미지 파일만 올릴 수 있음
	var reg = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/; 

	
	if(file.match(reg)) {
		return true;
	} 
	else if(file == ""){
		alert("파일을 첨부하여야합니다.");
		return false;
	}
	else {
		alert("해당 파일은 이미지 파일이 아닙니다. 이미지 파일만 올려주세요.");
		return false;
	}
	
	

}		

	
	




</script>


</head>
<body>





<!-- 헤더 부분 -->
<jsp:include page="../Inc/top.jsp"></jsp:include>







<!-- 메인 부분 -->
<article id = "main" style="height: auto; min-height: 800px;">


	<div class = "PicDiv">
		
		
		<div class = "Pic_Title">
			<h2>WRITE</h2>
		</div>
		

	
		<div class = "formDiv">
			<!-- 파일을 올리려면 post, multipart로 설정해야함 -->
			<form action="Pic_Write_Pro.jsp" method="post" enctype="multipart/form-data" onsubmit ="return fileCheck(pic_fileOnly.value);">
			
				<table border="0">
					
					<tr>
						<th scope="row">SUBJECT</th>
						<td>
							<input type = "text" name = "pic_subject" id = "pic_subject">
						</td>
					</tr>
					
					
					<tr>
						<th scope="row">NAME</th>
						<td>
							<input type = "text" name = "pic_name" value = "<%=(String)session.getAttribute("id")%>" readonly="readonly">
						</td>
					</tr>
					
					<tr>
						<th scope="row">PASSWORD</th>
						<td>
							<input type = "password" name = "pic_passwd" id = "pic_passwd">
						</td>
					</tr>
					
					
					<tr>
						<th scope="row">FILE</th>
						<td>
							<input type = "file" name = "file" value = "pic_fileOnly" 
							id = "pic_fileOnly" 
							accept="image/gif, image/jpeg, image/png, image/jpg">
						</td>
					</tr>
					
				
				</table>
				
				<input type="submit" value = "UPLOAD!">
		
			</form>
		
		</div>
	
	</div>
</article>






<!-- 푸터 부분 -->
<jsp:include page="../Inc/bottom.jsp"></jsp:include>

</body>
</html>