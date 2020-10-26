<%@page import="comment.Pic_CommentBean"%>
<%@page import="comment.Pic_CommentDAO"%>
<%@page import="comment.CommentBean"%>
<%@page import="comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Comment Update!</title>
<link href ="../css/Content.css" rel = "stylesheet">

<style>

#submitCo{
	background-color: white;
	padding: 10px;
	margin-top: 20px;
	border: 1px solid black;
}
#submitCo:HOVER {
	background-color: black;
	color: white; 
}

</style>



</head>

<%

	request.setCharacterEncoding("UTF-8");
	
	int pic_comment_num = Integer.parseInt(request.getParameter("pic_comment_num"));
	
	Pic_CommentDAO pdao = new Pic_CommentDAO();
	// 수정할 코멘트의 정보를 가져옴
	Pic_CommentBean pbean = pdao.update_read_comment(pic_comment_num);
	

%>

<body>
		
	<center>
	
	<form action="Pic_CommentUpdatePro.jsp" style="margin-top: 20px;">
	
		<input type = "hidden" name = "pic_comment_num" value = "<%=pbean.getPic_comment_num()%>">
		<input type = "hidden" name = "pic_board_num" value = "<%=pbean.getPic_board_num()%>">
		<input type = "hidden" name = "pic_writer" value = "<%=pbean.getPic_comment_writer()%>">
		<input type = "hidden" name = "pic_comment_datetime" value = "<%=pbean.getPic_comment_datetime()%>">
	
		<textarea rows = "5" cols = "80" name = "pic_comment" id = "pic_comment" style="resize: none;">
		<%=pbean.getPic_comment().trim()%> 
		</textarea>	
		
			<input type="submit" name = "submit" value = "Update Comment!" id = "submitCo">
	
	</form>
	</center>
</body>
</html>