<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-Enter">
<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-exit">
<title>Se So Neon</title>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link href ="../css/index.css" rel ="stylesheet">
<link href ="../css/Login.css" rel ="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">

<script type="text/javascript">

	// 로그인하기 전 아이디와 비밀번호 입력했는지 체크
	function check_form() {

		var id = $("#id");
		var passwd =  $("#passwd");
		
		if(id.val() == ""){
			alert("아이디를 입력하세요.");
			id.focus();
			return false;
		}
		
		if(passwd.val() == ""){
			alert("비밀번호를 입력하세요.");
			passwd.focus();
			return false;
		}
	}
	
</script>




</head>
<body>


<!-- 헤더 부분 -->
<jsp:include page="../Inc/top.jsp"></jsp:include>




<!-- 메인 부분 -->
<article id = "main" style="height: 400px;">

	
	<form action="LoginPro.jsp" method="post" class="LoginForm"  onsubmit="return check_form();">
	
	      <p><h1><b>LOG IN</b></h1><p>
	      
	      <div id = "IdForm">
	      	<input type = "text" name = "id" class = "id" id = "id" placeholder="ID">
	      </div>
	      
	      <div id = "PasswordForm">
	      	<input type = "password" name = "passwd" id = "passwd" class = "passwd" placeholder="PASSWORD" >
	      </div>
	      
	      
		<div id="Buttons">
			<input type = "submit" value="LOGIN" class="submit" style="width: 216px;"><br>
			<input type = "button" value = "FORGOT ID?" class = "reset"
				onclick =  "location.href='find_id.jsp'">
			<input type = "button" value = "FORGOT PASSWD?" class = "reset"
					onclick =  "location.href='find_passwd.jsp'">
		</div>
	      
	</form>
   
</article>



<!-- 푸터 부분 -->
<jsp:include page="../Inc/bottom.jsp"></jsp:include>


</body>
</html>