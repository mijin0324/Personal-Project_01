<%@page import="board.Pic_BoardDAO"%>
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
	
	
	String directory = application.getRealPath("/pic_upload/");
	int max = 100 * 1024 * 1024;
	MultipartRequest multi = new MultipartRequest(request,directory,max,"UTF-8",new DefaultFileRenamePolicy());

%>

<jsp:useBean id="pbean" class ="board.Pic_BoardBean"/>
<jsp:setProperty property="*" name="pbean"/>

<%

	pbean.setPic_name(multi.getParameter("pic_name"));
	pbean.setPic_passwd(multi.getParameter("pic_passwd"));
	pbean.setPic_subject(multi.getParameter("pic_subject"));
		
	pbean.setPic_fileOriginName(multi.getOriginalFileName("file"));
	pbean.setPic_fileSystemName(multi.getFilesystemName("file"));
		
	pbean.setPic_date(new Timestamp(System.currentTimeMillis()));
		
	Pic_BoardDAO pdao = new Pic_BoardDAO();
	pdao.insert_PicBoard(pbean);
	response.sendRedirect("../Board/Pic.jsp");
	
%>


