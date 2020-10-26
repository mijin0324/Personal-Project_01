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
<link href ="../css/find_id.css" rel ="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">





<script type="text/javascript">


$(document).ready(function(){
	
    $('input[name="find_passwd"]').click(function(){
    	
    	var find_id_check = $('input[name="find_passwd"]:checked');
    	
    	if(find_id_check.val() == 'find_email'){
    		$("#find_id_radioView").empty();
    		$("#find_id_radioView").append("EMAIL<input type = 'text' name = 'email'  class= 'inputFIND email' placeholder='Input your email!'>");
    	}
    	
    	else if(find_id_check.val() == 'find_phone'){
    		$("#find_id_radioView").empty();
    		$("#find_id_radioView").append("PHONE "+"<input type = 'text' name = 'phone1' class = 'phone'>-<input type = 'text' name = 'phone2'  class = 'phone'>-"+
    				"<input type = 'text' name = 'phone3' class = 'phone'>");
    				
    	}

    
    })
});

	

 // 비밀번호 찾는 페이지에서 모든 사항을 적었는가 확인
 function find_ck(){
 	
    var id = $(".id");
    var name = $("#name");
 	var email = $(".email");
 	var phone = $(".phone");
	
 	
 	if(id.val() == ""){
 		alert("ID를 입력해주세요.");
 		return false;
 	} 
 	if(name.val() == ""){
 		alert("이름을 입력해주세요.");
 		return false;
 	} 
 	if(email.val() == ""){
 		alert("이메일을 입력해주세요.");
 		return false;
 	}
 	if(phone.val() == ""){
 		alert("휴대폰 번호를 입력해주세요.");
 		return false;
 	}
 	

 }
	

</script>


</head>
<body>


<!-- 헤더 부분 -->
<jsp:include page="../Inc/top.jsp"></jsp:include>




<!-- 메인 부분 -->
<article id = "main" style="height: 450px;">

	<div class = "find_id_title">
		<h2>FIND PASSWORD!</h2>
	</div>
	
	
	<div class = "find_id_form">
		
		<form action = "find_passwd_Pro.jsp" method="post" class="FindForm" onsubmit="return find_ck();">
		
			<div class = "inputDiv">
				EMAIL <input type = "radio" name = "find_passwd" value = "find_email" checked="checked">
				PHONE <input type = "radio" name = "find_passwd" value = "find_phone">
				<br>
			</div>
				ID<input type = "text" name = "id"  class= "inputFIND id name" placeholder="Input your ID!"><br>
				NAME<input type = "text" name = "name" id = "name" class= "inputFIND name" placeholder="Input your name!">
			
			<div id = "find_id_radioView">
				EMAIL<input type = "text" name = "email"  class= "inputFIND email" placeholder="Input your email!">
			</div>
			
			<input type = "submit" value = "FIND PASSWORD!" class="submit" style="width: 320px;"><br>
			<input type = "button" value = "GO TO LOGIN!" class="submit gotologin" style="width: 320px;"
				onclick="location.href='../Member/Login.jsp'">
			
		      
		</form>
	</div>   
	
</article>



<!-- 푸터 부분 -->
<jsp:include page="../Inc/bottom.jsp"></jsp:include>


</body>
</html>