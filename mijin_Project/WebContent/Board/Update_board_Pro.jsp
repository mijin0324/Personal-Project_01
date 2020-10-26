<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");

	String directory = getServletContext().getRealPath("/upload/");
	int max = 100 * 1024 * 1024;	
	
	BoardDAO bdao = new BoardDAO();
	BoardBean bbean = new BoardBean();
	
	
	try{
		
		MultipartRequest multi = new MultipartRequest(request,directory,max,"UTF-8",new DefaultFileRenamePolicy());

		String name = multi.getParameter("name");
		String passwd = multi.getParameter("passwd");
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		String category = multi.getParameter("category");
		String fileOriginName = multi.getOriginalFileName("file");
		String fileSystemName = multi.getFilesystemName("file");


		bbean.setNum(Integer.parseInt(multi.getParameter("num")));
		bbean.setName(name);
		bbean.setPasswd(passwd);
		bbean.setSubject(subject);
		bbean.setContent(content);
		bbean.setCategory(category);
		bbean.setFileOriginName(fileOriginName);
		bbean.setFileSystemName(fileSystemName);
	
		

		int check = bdao.Update_Board(bbean);
	
		
		if(check == 1){
	%>	
		<script type="text/javascript">
		 alert("글 수정 성공");
		 location.href="To.jsp?pageNum=<%=pageNum%>";
		</script>	
	<%
		} 
		else if(check == 0) {
	%>
		<script type="text/javascript">
		alert("글 수정 실패");
		history.back();
		</script>
	<%
		}
		
	} catch (Exception e){
		
		e.printStackTrace();
		
	}
	
%>