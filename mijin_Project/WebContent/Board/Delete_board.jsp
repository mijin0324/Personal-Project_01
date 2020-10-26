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
<link href ="../css/Login.css" rel ="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">

</head>
<body>

<%


	String id = (String)session.getAttribute("id");
	
	if(id == null){

%>	
	<script type="text/javascript">
		alert("로그인하고 이용할 수 있습니다.");
	</script>

<%		
	response.sendRedirect("../Member/Login.jsp");
	
	}
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>


<!-- 헤더 부분 -->
<jsp:include page="../Inc/top.jsp"></jsp:include>







<!-- 메인 부분 -->
<article id = "main" style="height: 300px;">

	<form action="Delete_board_Pro.jsp?pageNum=<%= pageNum %>" method="post" class="LoginForm">
	
		<input type = "hidden" name = "num" value = "<%= num %>">
	      <h1><b>Delete</b></h1>
	      
	      
	    <div id = "PasswordForm">
	      	<input type = "password" name = "passwd" id = "passwd" class = "passwd" placeholder="PASSWORD" >
	    </div>
	      
	      
		<div id="Buttons">
			<input type="submit" value="DELETE" class="submit">
			<input type="button" value="LIST" class="list submit" onclick="location.href = '../Board/To.jsp?pageNum=<%=pageNum%>'">
		</div>	
		      
	      
	</form>


</article>














<!-- 푸터 부분 -->
<jsp:include page="../Inc/bottom.jsp"></jsp:include>



</body>
</html>