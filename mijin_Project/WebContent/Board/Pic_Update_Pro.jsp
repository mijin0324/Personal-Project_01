<%@page import="board.Pic_BoardDAO"%>
<%@page import="board.Pic_BoardBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

	request.setCharacterEncoding("UTF-8");

	Pic_BoardDAO pdao = new Pic_BoardDAO();
	Pic_BoardBean pbean = new Pic_BoardBean();

	try{
		
		String directory = getServletContext().getRealPath("/pic_upload/");
		int max = 100 * 1024 * 1024;	
		MultipartRequest multi = new MultipartRequest(request,directory,max,"UTF-8",new DefaultFileRenamePolicy());

		
		String pageNum = multi.getParameter("pageNum");
		int num = Integer.parseInt(multi.getParameter("num"));

	
		

		String name = multi.getParameter("pic_name");
		String pic_passwd = multi.getParameter("pic_passwd");
		String subject = multi.getParameter("pic_subject");
		String fileOriginName = multi.getOriginalFileName("file");
		String fileSystemName = multi.getFilesystemName("file");

		pbean.setPic_num(num);
		pbean.setPic_name(name);
		pbean.setPic_subject(subject);
		pbean.setPic_fileOriginName(fileOriginName);
		pbean.setPic_fileSystemName(fileSystemName);
		pbean.setPic_passwd(pic_passwd);
		
		

		int check = pdao.Update_PicBoard(pbean);
	
		if(check == 1){
	%>	
		<script type="text/javascript">
		 alert("글 수정 성공");
		 location.href="Pic.jsp?pageNum=<%=pageNum%>";
		</script>	
	<%
		} 
		else{
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
