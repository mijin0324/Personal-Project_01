<%@page import="comment.Pic_CommentDAO"%>
<%@page import="comment.Pic_CommentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%


	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	
	Pic_CommentBean pbean = new Pic_CommentBean();
	Pic_CommentDAO pdao = new Pic_CommentDAO();
	
	int pic_comment_num = Integer.parseInt(request.getParameter("pic_comment_num"));
	String pic_comment = request.getParameter("pic_comment");
	
	pbean.setPic_comment_num(pic_comment_num);
	pbean.setPic_comment(pic_comment);
	
	
	int check = pdao.update_PicComment(pic_comment_num, pic_comment);
	
	if(check == 1){
%>

<script type="text/javascript">
	alert("댓글을 수정하였습니다.");
	self.close();
	opener.location.reload()
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