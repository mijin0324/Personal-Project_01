<%@page import="comment.Pic_CommentDAO"%>
<%@page import="comment.Pic_CommentBean"%>
<%@page import="java.util.List"%>
<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<%

	// 기본 세팅
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");

	Pic_CommentBean pcb = new Pic_CommentBean();
	Pic_CommentDAO pdao = new Pic_CommentDAO();
	
	int pic_comment_num = Integer.parseInt(request.getParameter("pic_comment_num"));
	
	int check = pdao.delete_PicComment(pic_comment_num);
	
	out.print(check);


%>