<%@page import="Schedule.ScheduleDAO"%>
<%@page import="Schedule.ScheduleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	request.setCharacterEncoding("UTF-8");

	// select option에서 선택한 값들을 가져옴
	int year = Integer.parseInt(request.getParameter("yearCategory"));
	int month = Integer.parseInt(request.getParameter("monthCategory"));
	int day = Integer.parseInt(request.getParameter("dayCategory"));

	String contents = request.getParameter("contents");
	
	
	ScheduleBean sbean = new ScheduleBean();
	
	sbean.setContents(contents);
	sbean.setMonth(month);
	sbean.setDay(day);
	sbean.setYear(year);
	
	ScheduleDAO sdao = new ScheduleDAO();
	
	sdao.insert(sbean);
%>
	<script type="text/javascript">
		
		// 스케줄을 추가하면 창이 꺼지고 부모창이 리로드 되도록 설정
		self.close();
		opener.location.reload();

	</script>