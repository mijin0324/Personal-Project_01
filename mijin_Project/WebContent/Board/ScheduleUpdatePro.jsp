<%@page import="Schedule.ScheduleDAO"%>
<%@page import="Schedule.ScheduleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	int year = Integer.parseInt(request.getParameter("yearCategory"));
	int month = Integer.parseInt(request.getParameter("monthCategory"));
	int day = Integer.parseInt(request.getParameter("dayCategory"));
	String contents = request.getParameter("contents");

	
	ScheduleBean sbean = new ScheduleBean();
	
	// update창에서 적은 값들을 새롭게 저장
	sbean.setYear(year);
	sbean.setMonth(month);
	sbean.setDay(day);
	sbean.setContents(contents);
	sbean.setNum(num);
	
	ScheduleDAO sdao = new ScheduleDAO();
	
	int check = sdao.update(sbean, num);
	
	if(check == 1){
%>
	<script type="text/javascript">
		
		alert("수정이 완료되었습니다.");
		self.close();
		opener.location.reload()

	</script>
<%
	} else{
%>
	<script type="text/javascript">
		
		alert("수정에 실패했습니다.");
		history.back();
		
	</script>
<%
	}
%>