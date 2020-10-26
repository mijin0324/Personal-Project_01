<%@page import="Schedule.ScheduleDAO"%>
<%@page import="Schedule.ScheduleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	
	request.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	ScheduleDAO sdao = new ScheduleDAO();
	ScheduleBean sbean = new ScheduleBean();
	
	int check = sdao.delete(num);
	
	// check값이 1이면 삭제, 0이면 삭제 실패
	if(check == 1){
%>
	<script type="text/javascript">
		alert("스케줄이 삭제되었습니다.");
		location.replace("Schedule.jsp");
	</script>
<%
	} else{
%>
	<script type="text/javascript">
		alert("스케줄 삭제에 실패하였습니다.");
	</script>
<%
	}
%>

</body>
</html>