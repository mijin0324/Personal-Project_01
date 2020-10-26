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
<link href ="../css/Delete_Member.css" rel ="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>


<script type="text/javascript">


	// 비밀번호 입력했는지 확인
	function check_form() {
		
		var passwd = $("#passwd");
		
		if(passwd.val() == ""){
			alert("비밀번호를 입력해주세요.");
			passwd.focus();
			return false;
		}
		
		
	}



</script>




</head>
<body>



<!-- 헤더 부분 -->
<jsp:include page="../Inc/top.jsp"></jsp:include>





<article id = "main" style="height: 480px;">
	
	<div class = "title">
		<h2>MEMBER SECESSION</h2>
		<p>비밀번호를 입력하세요.</p>
	</div>
	
	<div id = "Delete_mainWrap">
		
		<form action="Delete_Member_Pro.jsp" method="post" name = "DeleteMemberForm" id = "DeleteMemberForm" onsubmit="return check_form();">
		
		
			<table>
				<tr>
					<th class = "thpass" >PASSWORD</th>
					<td >
						<input type = "password" name = "passwd" id = "passwd" class = "passwd">
					</td>
				</tr>
				
			</table>
			
			
			
			<div class = "clearButton">
			
				<input type ="submit" name = "go_deletePro" id = "go_deletePro" value = "Member Secession">
			
			</div>	
				
				
				
			
			
		</form>
	
	</div>

	

</article>








<!-- 푸터 부분 -->
<jsp:include page="../Inc/bottom.jsp"></jsp:include>



</body>
</html>