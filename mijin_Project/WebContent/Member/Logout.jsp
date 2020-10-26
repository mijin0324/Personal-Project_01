<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	// 세션에 있는 값을 없앰 
	session.invalidate();


%>

	<script>
	
		alert("LOGOUT!（╹◡╹)");
		location.href ="../Center/index.jsp";
	
	</script>