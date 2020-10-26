<%@page import="board.Pic_BoardDAO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
	
	Pic_BoardDAO pdao = new Pic_BoardDAO();
	int check = pdao.Delete_PicBoard(num, passwd);
	
	if(check == 1){

%>
	<script type = "text/javascript">
	
		alert("게시물이 삭제 되었습니다.");
		location.href = "Pic.jsp?pageNum=<%=pageNum%>";
	</script>
	
<%
	}
	else{

%>
	<script type = "text/javascript">
	
		alert("비밀번호가 다릅니다. 비밀번호를 확인해주세요.");
		history.back();
	</script>
	
<%
	}
%>

	
