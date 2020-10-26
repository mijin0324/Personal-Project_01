<%@page import="java.util.List"%>
<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<%

	// 기본 세팅
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");

	CommentBean cb = new CommentBean();
	CommentDAO cdao = new CommentDAO();
	
	int comment_num = Integer.parseInt(request.getParameter("comment_num"));
	int check = cdao.delete_comment(comment_num);
	
	out.print(check);

%>