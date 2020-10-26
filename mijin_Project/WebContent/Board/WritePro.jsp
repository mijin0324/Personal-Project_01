<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>

<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%

	// 한글처리
	request.setCharacterEncoding("UTF-8");
	
	
	String directory = application.getRealPath("/upload/");
	int max = 100 * 1024 * 1024;
	MultipartRequest multi = new MultipartRequest(request, directory, max, "UTF-8", new DefaultFileRenamePolicy());

%>

<jsp:useBean id="bbean" class ="board.BoardBean"/>
<jsp:setProperty property="*" name="bbean"/>

<%

	bbean.setSubject(multi.getParameter("subject"));
	bbean.setCategory(multi.getParameter("category"));
	bbean.setName(multi.getParameter("name"));
	bbean.setPasswd(multi.getParameter("passwd"));
	bbean.setContent(multi.getParameter("content"));
	
	bbean.setFileOriginName(multi.getOriginalFileName("file"));
	bbean.setFileSystemName(multi.getFilesystemName("file"));
	
	bbean.setDate(new Timestamp(System.currentTimeMillis()));
	System.out.println(directory);

	BoardDAO bdao = new BoardDAO();
	bdao.insert_Board(bbean);
	response.sendRedirect("../Board/To.jsp");
	
%>


