<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%


	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	CommentBean cbean = new CommentBean();
	CommentDAO cdao = new CommentDAO();
	
	int comment_num = Integer.parseInt(request.getParameter("comment_num"));
	String comment = request.getParameter("comment");
	
	cbean.setComment_num(comment_num);
	cbean.setComment(comment);
	
	
	int check = cdao.update_Comment(comment_num, comment);
	
	if(check == 1){
%>

<script type="text/javascript">
	alert("댓글을 수정하였습니다.");
	self.close();
	opener.location.reload();
</script>

<%
	} else{
%>

<script type="text/javascript">
	alert("댓글 수정 불가능");
	history.back();
</script>

<%
	}
%>