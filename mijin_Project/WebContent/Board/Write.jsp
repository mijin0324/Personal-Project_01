<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="javafx.scene.control.Alert"%>
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
<link href ="../css/Write.css" rel = "stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Courier+Prime&family=Montserrat:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville&display=swap" rel="stylesheet">

</head>
<body>




<%
	
	String id = (String)session.getAttribute("id");
	
	// 로그인 해야만 글을 쓸 수 있음
	if(id == null){
		

		out.println("<script>alert('로그인하고 이용할 수 있습니다.'); location.href='../Member/Login.jsp';</script>");

		
	}



%>


<script type="text/javascript">

	// Write 페이지의 필수 문항을 작성했는지 확인
	function Check_sub_passwd(){
		
		var subject = document.getElementById("subject");
		var passwd = document.getElementById("passwd");
		var content = document.getElementById("content");
		
		if( subject.value == ""){
			alert("제목을 입력해주세요.");
			subject.focus();
			return false;
		}
		
		else if( passwd.value == ""){
			alert("비밀번호를 입력해주세요.");
			passwd.focus();
			return false;
		}
		
		else if( content.value == ""){
			alert("내용을 입력해주세요.");
			content.focus();
			return false;
		}
		
	}



</script>










<!-- 헤더 부분 -->
<jsp:include page="../Inc/top.jsp"></jsp:include>









<!-- 메인 부분 -->
<article id = "main" style="height: 900px;">



	<div class = "title">
		<h2>Write</h2>
	</div>
	
	
	
	<form action="WritePro.jsp" method="post" enctype="multipart/form-data">

		
		
		<div class = "WriteDiv">
		
			<table border = "1">
				
				<colgroup>
					<col style = "width: 150;">
					<col style = "width: auto;">
				</colgroup>

				
				<tbody>
					<tr>
						<th scope="row">SUBJECT</th>		
						<td>
							<select id = "category" name = "category">
								<option value = "To.Soyoon!">To.Soyoon!</option>
								<option value = "To.Yousu!">To.Yousu!</option>
								<option value = "To.Hyunjin!">To.Hyunjin!</option>
								<option value = "PIC">PIC</option>
								<option value = "INFORMATION">INFORMATION</option>
								<option value = "TALK">TALK</option>
							</select>
							
							<input type = "text" name = "subject" id = "subject">
						</td>			
					</tr>
					
					
					
					<tr>
						<th scope="row">NAME</th>
						<td>
							<!-- id는 수정 못하게 설정 -->
							<input type = "text" name = "name" value = "<%=id%>" readonly>
						</td>
					</tr>
					
					<tr>
						<th scope="row">PASSWORD</th>
						<td>
							<input type = "password" name = "passwd" id = "passwd">
						</td>
					</tr>
					
					<tr>
						<th scope = "row">CONTENT</th>
						<td colspan="2" class = "text_con">
							<textarea name="content" rows="16" cols="40" id = "content">
							</textarea>
						</td>
					</tr>
					
					 	
				</tbody>
				
				
				
				<tbody>
					<tr>
						<th scope = "row">FILE</th>
						<td>
							<input type = "file" name = "file" id = "file">
						</td>
					</tr>
				</tbody>
			
			
			</table>
		</div>	
		
		
		
		<div class = "buttons">
		
			<span class = "gleft">
				<input type = "button" onclick = "location.href = 'To.jsp'" value = "LIST">
			</span>
			
			<span class = "gright">
				<!-- 전송 버튼을 누르면 필수문항을 작성하였는가 확인하는 function으로 이동 -->
				<input type = "submit" class = "submit" 
				value = "SUBMIT!"
				onclick="javascript:return Check_sub_passwd()">
			</span>
		
		</div>
		
		
	</form>
	
	

</article>




<!-- 푸터 부분 -->
<jsp:include page="../Inc/bottom.jsp"></jsp:include>





</body>
</html>