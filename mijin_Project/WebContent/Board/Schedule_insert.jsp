<%@page import="Schedule.ScheduleDAO"%>
<%@page import="Schedule.ScheduleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>INSERT SCHEDULE</title>
<link href ="../css/Schedule_insert.css" rel = "stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Courier+Prime&family=Montserrat:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<script type="text/javascript">

	
	function submit_ck() {
	
		var contents = $(".contents");
		
		// 내용을 입력하지 않았으면 submit 불가능함
		if(contents.val() == ""){
			
			alert("스케줄 내용을 입력하십시오.");
			contents.focus();
			return false;
		}
		
	}




</script>




</head>
<body>



<form action = "Schedule_insertPro.jsp" method="post" onsubmit="return submit_ck();">

	<div class = "selectdiv">
	<select name = "yearCategory">
<%		
	// for문을 사용하여 2017~2022년까지 나오도록
	for(int i = 2022; i > 2016; i--){
%>
		<option value = "<%=i%>"><%=i%></option>
<%
		}
%>
	</select>
	
	
	
	
	<select name = "monthCategory">
<%
// for문 사용해서 1월에서 12월까지 나오도록
	for(int i = 1; i < 13; i ++){
%>				
	<option value = "<%=i%>"><%=i%></option>
<%
	}
%>
	</select>

	
	
		<select name = "dayCategory">
<%
	// for문 사용해서 1일에서 31일까지 나오도록
	for(int i = 1; i < 32; i ++){
%>				
	<option value = "<%=i%>"><%=i%></option>
<%
	}
%>
	</select>
	</div>
	
	
	
	
	
	<div class = "submitdiv">
	SCHEDULE : 
	<br>
	<input type = "text" name = "contents" class = "contents">
	<br>
	<input type = "submit" class = "sch_submit" value = "SUBMIT">
	</div>
</form>





</body>
</html>