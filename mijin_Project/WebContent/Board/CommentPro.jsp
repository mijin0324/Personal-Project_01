<%@page import="java.sql.Timestamp"%>
<%@page import="comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%

	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>

<jsp:useBean id="cb" class ="comment.CommentBean"/>
<jsp:setProperty property="*" name="cb"/>



<%

	cb.setBoard_num(Integer.parseInt(request.getParameter("num")));
	cb.setRef(num);
	cb.setReg_datetime(new Timestamp(System.currentTimeMillis()));
	
	CommentDAO cdao = new CommentDAO();
	cdao.insert_comment(cb);
	response.sendRedirect("../Board/Content.jsp?num="+num+"&pageNum="+pageNum);

%>

