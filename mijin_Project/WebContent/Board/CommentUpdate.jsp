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
	
	int comment_num = Integer.parseInt(request.getParameter("comment_num"));
	
	CommentDAO cdao = new CommentDAO();
	CommentBean cbean = cdao.update_read_comment(comment_num);
	
	

%>

<body>
		
	<center>
	
	<form action="CommentUpdatePro.jsp" style="margin-top: 20px;">
	
		<input type = "hidden" name = "comment_num" value = "<%=cbean.getComment_num()%>">
		<input type = "hidden" name = "board_num" value = "<%=cbean.getBoard_num()%>">
		<input type = "hidden" name = "writer" value = "<%=cbean.getWriter()%>">
		<input type = "hidden" name = "reg_datetime" value = "<%=cbean.getReg_datetime()%>">
		<input type = "hidden" name = "ref" value = "<%=cbean.getRef()%>">
	
		<textarea rows = "5" cols = "80" name = "comment" id = "comment" style="resize: none;">
		<%=cbean.getComment().trim()%>
		</textarea>	
		
			<input type="submit" name = "submit" value = "Update Comment!" id = "submitCo">
	
	</form>
	</center>
</body>
</html>