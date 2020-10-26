<%@page import="java.io.File"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

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
	String pageNum = request.getParameter("pageNum");
	
	// 수정할 글 정보를 검색해서 가져옴
	BoardDAO dao = new BoardDAO();
	BoardBean boardBean = dao.Read_Board(num);
	
	// 수정할 글 정보 얻기
	int DBnum = boardBean.getNum();				
	String DBName = boardBean.getName();		
	String DBSubject = boardBean.getSubject();	
	String DBFile = boardBean.getFileOriginName();
	String DBContent = "";						
	String DBCategory = boardBean.getCategory();
	
	if(boardBean.getContent() != null){
		
		DBContent = boardBean.getContent().replace("<br>","\r\n");
		
	}
	
	
	String direcotory = application.getRealPath("/upload/");
	String[] files = new File(direcotory).list();
	

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
	
	
	
	
	$(document).ready(function(){
	
		// 글수정 페이지로 들어가면 DB에 저장된 카테고리가 선택되어 나오도록 설정
		var DBcate = "<%=DBCategory%>";
		$("#category").val(DBcate).prop("selected", true);
		
	});




</script>





<!-- 헤더 부분 -->
<jsp:include page="../Inc/top.jsp"></jsp:include>









<!-- 메인 부분 -->
<article id = "main" style="height: 900px;">

	<div class = "title">
		<h2>Edit Content</h2>
	</div>
	
	
	<form action="Update_board_Pro.jsp?pageNum=<%=pageNum%>" method="post" enctype="multipart/form-data">
		
		
		<div class = "WriteDiv">
		
			<!-- 수정할 글 번호를 전달 -->
			<input type="hidden" name="num" value="<%=num%>">
			<input type = "hidden" name = "pageNum" value="<%=pageNum%>"> 



			
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
									<option value = "To.Soyoon!">To.Soyoon!</option>
								<option value = "To.Yousu!">To.Yousu!</option>
								<option value = "To.Hyunjin!">To.Hyunjin!</option>
								<option value = "PIC">PIC</option>
								<option value = "INFORMATION">INFORMATION</option>
								<option value = "TALK">TALK</option>
							</select>
							
							<input type = "text" name = "subject" id = "subject" value="<%=DBSubject%>">
						</td>			
					</tr>
					
					
					
					<tr>
						<th scope="row">NAME</th>
						<td>
							<input type = "text" name ="name" value="<%=id%>" readonly>
						</td>
					</tr>
					
					<tr>
						<th scope="row">PASSWORD</th>
						<td>
							<input type = "password" name ="passwd">
						</td>
					</tr>
					
					<tr>
						<th scope = "row">CONTENT</th>
						<td colspan="2">
							<textarea name="content" rows="16" cols="40" id = "content">
							<%= DBContent %>
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
				<input type = "button" class = "sumbit" onclick="To.jsp?pageNum=<%=pageNum%>" value = "LIST">
			</span>
			
			<span class = "gright">
				<input type = "submit" class = "submit" onclick="javascript:return Check_sub_passwd()"
				value = "UPDATE!">
			</span>
		
		</div>
		
		
	</form>
	
		





</article>






<!-- 푸터 부분 -->
<jsp:include page="../Inc/bottom.jsp"></jsp:include>
</body>
</html>