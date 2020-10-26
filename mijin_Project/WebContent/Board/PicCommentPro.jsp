<%@page import="comment.Pic_CommentBean"%>
<%@page import="comment.Pic_CommentDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%

	request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	
%>

	
	<jsp:useBean id="pcbean" class ="comment.Pic_CommentBean"/>
	<jsp:setProperty property="*" name="pcbean"/>



<%

	pcbean.setPic_board_num(Integer.parseInt(request.getParameter("num")));
	pcbean.setPic_comment_datetime(new Timestamp(System.currentTimeMillis()));
	
	Pic_CommentDAO pcdao = new Pic_CommentDAO();
	pcdao.insert_PicComment(pcbean);
	response.sendRedirect("../Board/Pic_Content.jsp?num="+num+"&pageNum="+pageNum);

%>

