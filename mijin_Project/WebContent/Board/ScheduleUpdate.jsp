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
<title>UPDATE SCHEDULE</title>
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

<%
	
	request.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	ScheduleDAO sdao = new ScheduleDAO();
	ScheduleBean sbean = new ScheduleBean();
	
	sbean = sdao.select(num);
	
	
%>



</head>
<body>



<form action = "ScheduleUpdatePro.jsp" method="post" onsubmit="return submit_ck();">



	<div class = "selectdiv">
	
	<select name = "yearCategory" id = "yearCategory">
<%
		for(int i = 2022; i > 2016; i--){
%>
		<option value = "<%=i%>"><%=i%></option>
		
<%	
			// 	년도(i)가 sbean에 저장되어있는 year의 값과 같으면 선택되어져서 수정창에 나타남
			if(i == sbean.getYear()){
%>
			<script type="text/javascript">
			
			$("#yearCategory").val(<%=sbean.getYear()%>);
			
			</script>
<%
			}
		}
%>
	</select>
	
	
	
	
	<select name = "monthCategory" id = "monthCategory">
<%
	for(int i = 1; i < 13; i ++){
%>
		<option value = "<%=i%>"><%=i%></option>
		
<%	
		// 달(i)이 sbean에 저장되어있는 month 값과 같으면 select option에 선택되어져서 수정창에 나타남
		if(i == sbean.getMonth()){
%>
		<script type="text/javascript">
			
		$("#monthCategory").val(<%=sbean.getMonth()%>);
			
		</script>
<%
		}
	}
%>
	</select>

	
	
		<select name = "dayCategory" id = "dayCategory">
<%
	for(int i = 1; i < 32; i ++){
%>
		<option value = "<%=i%>"><%=i%></option>
		
<%	
		// 일(i)이 sbean에 저장되어있는 Day값과 같으면 select option에 선택되어져서 수정창에 나타남
		if(i == sbean.getDay()){
%>
		<script type="text/javascript">
			
		$("#dayCategory").val(<%=sbean.getDay()%>);
			
		</script>
<%
		}
	}
%>
	</select>
	</div>
	
	
	
	
	<!-- 수정하고자하는 스케줄의 정보를 나타냄 -->
	<div class = "submitdiv">
	SCHEDULE : 
	<br>
	<input type = "hidden" name = "num" value = "<%= sbean.getNum() %>">
	<input type = "text" name = "contents" class = "contents" value = "<%=sbean.getContents().trim() %>">
	<br>
	<input type = "submit" class = "sch_submit" value = "SUBMIT">
	</div>
	
</form>

</body>
</html>