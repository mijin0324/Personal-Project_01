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
	
	request.setCharacterEncoding("UTF-8");

	
	String id = (String)session.getAttribute("id");

	if(id == null){

		out.println("<script>alert('로그인하고 이용할 수 있습니다.'); location.href='../Member/Login.jsp';</script>");
	}
	
	int num = Integer.parseInt(request.getParameter("num")); 
	int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	int re_seq = Integer.parseInt(request.getParameter("re_seq"));
	
	

%>

<script type="text/javascript">
	
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
		<h2>ReWrite</h2>
	</div>


	<form action="reWritePro.jsp" method="post"  enctype="multipart/form-data">
		
			
		<input type = "hidden" name = "num" value ="<%=num%>"> 
		<input type = "hidden" name = "re_ref" value = "<%=re_ref%>">
		<input type = "hidden" name = "re_lev" value = "<%=re_lev%>">
		<input type = "hidden" name = "re_seq" value = "<%=re_seq%>">
		
		<div class = "WriteDiv">
		
			<table border = "1">
				
				<colgroup>
					<col style = "width: 130;">
					<col style = "width: auto;">
				</colgroup>

				
				<tbody>
					<tr>
						<th scope="row">SUBJECT</th>		
						<td>
							<select id = "category" name = "category">
								<option value = "To.Soyoon">To.Soyoon!</option>
								<option value = "To.Yousu">To.Yousu!</option>
								<option value = "To.Hyunjin">To.Hyunjin!</option>
								<option value = "pic">PIC</option>
								<option value = "info">INFORMATION</option>
								<option value = "talk">TALK</option>
							
							</select>
							<input type = "text" name = "subject" id = "subject" value = "[REWRITE]">
						</td>			
					</tr>
					
					
					
					<tr>
						<th scope="row">NAME</th>
						<td>
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
						<td colspan="2">
							<textarea name="content" rows="16" cols="40" id = "content">
							</textarea>
						</td>
					</tr>
					
					 	
				</tbody>
				
				
				
				<tbody>
					<tr>
						<th scope = "row">FILE1</th>
						<td>
							<input type = "file" name = "file">
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
				<input type = "submit" class = "submit" 
				value = "SUBMIT!"
				onclick="javascript:return Check_sub_passwd()">
			</span>
		
		</div>
		
		
	</form>
	
	
	
	<div>
	
	</div>
	





</article>

<% 

System.out.println(request.getParameter("num"));

%>



<!-- 푸터 부분 -->
<jsp:include page="../Inc/bottom.jsp"></jsp:include>
</body>
</html>