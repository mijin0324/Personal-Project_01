<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   


<%

	request.setCharacterEncoding("UTF-8");
	

	String directory = application.getRealPath("/upload/");
	int max = 100 * 1024 * 1024;
	MultipartRequest multi = new MultipartRequest(request,directory,max,"UTF-8",new DefaultFileRenamePolicy());

	int num = Integer.parseInt(multi.getParameter("num")); 

	int	re_ref = Integer.parseInt(multi.getParameter("re_ref"));
	int	re_lev = Integer.parseInt(multi.getParameter("re_lev"));
	int	re_seq = Integer.parseInt(multi.getParameter("re_seq"));
	
	String name = multi.getParameter("name");
	String passwd = multi.getParameter("passwd");
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	String fileOriginName = multi.getParameter("file");
	String fileSystemName = multi.getParameter("file");
	
	String date = multi.getParameter("date");	
	String category = multi.getParameter("category");
	
	
	BoardBean bbean = new BoardBean();
	
	bbean.setNum(num);
	bbean.setRe_lev(re_lev);
	bbean.setRe_ref(re_ref);
	bbean.setRe_seq(re_seq);
	bbean.setName(name);
	bbean.setPasswd(passwd);
	bbean.setSubject(subject);
	bbean.setContent(content);
	bbean.setFileOriginName(fileOriginName);
	bbean.setFileSystemName(fileSystemName);
	bbean.setDate(new Timestamp(System.currentTimeMillis()));
	bbean.setCategory(category);
	
	
	BoardDAO dao = new BoardDAO();
	dao.Re_insertBoard(bbean);
	
	response.sendRedirect("../Board/To.jsp");
	
	
	
%>