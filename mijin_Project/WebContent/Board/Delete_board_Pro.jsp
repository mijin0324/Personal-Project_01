<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
	
	BoardDAO dao = new BoardDAO();
	int check = dao.Delete_Board(num, passwd);
	
	
	// check의 값이 1이면 삭제, 0이면 삭제 불가
	if(check == 1){

%>
	<script type = "text/javascript">
	
		alert("게시물이 삭제 되었습니다.");
		location.href = "To.jsp?pageNum=<%=pageNum%>";
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

	
