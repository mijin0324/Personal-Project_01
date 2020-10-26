<%@page import="Schedule.ScheduleBean"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.time.Month"%>
<%@page import="java.time.Year"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-Enter">
<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-exit">
<title>Se So Neon</title>
<link href ="../css/index.css" rel = "stylesheet">
<link href ="../css/Schedule.css" rel = "stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Courier+Prime&family=Montserrat:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>





<script type="text/javascript">

	// ADD Schedule 버튼을 누르면 열리는 창
	function insertSchedule(){
		
		var win = window.open("Schedule_insert.jsp", "INSERT SCHEDULE","width=520, height=230", "_blank"); // 새창에서 열림
	
	}


	//id가 admin인 즉, 관리자만 글쓰기 버튼이 보이도록 설정
	$(document).ready(function(){

		var id = '<%= (String)session.getAttribute("id") %>';
		
		if(id == 'admin'){
			$("#insert_btn").append("<input type = 'button' value = 'ADD SCHEDULE!' id = 'inputbtn' onclick = 'insertSchedule()'>");
		}
		
		
	});
	
	

	
	
	

</script>


</head>
<body>


<%

	request.setCharacterEncoding("UTF-8");
	

	// DB연결 부분
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// DB정보
	String DRIVER = "com.mysql.jdbc.Driver";
	String DBURL = "jdbc:mysql://localhost:3306/mijin_db";
	String DBID = "root";
	String DBPW = "1234";
	
	try {
	
		Class.forName(DRIVER);
		con = DriverManager.getConnection(DBURL, DBID, DBPW);
	
	} catch (ClassNotFoundException e) {
		
		System.out.println("드라이버 로드 실패" + e);
		
	} catch (SQLException e) {
		
		System.out.println("DB 연결 실패! " + e);

	}
	
	
	

	Calendar cal = Calendar.getInstance();
	
	// 현재 날짜를 저장 
	int currentYear = cal.get(Calendar.YEAR);
	int currentMonth = cal.get(Calendar.MONTH);
	int currentDate = cal.get(Calendar.DATE);
	
	String Year = request.getParameter("year");
	String Month = request.getParameter("month");
	
	int year, month;
	
	if(Year == null && Month == null){
		year = currentYear;
		month = currentMonth;
	}
	else{
		year = Integer.parseInt(Year);
		month = Integer.parseInt(Month);
		
		if(month < 0){
			month = 11;
			year = year - 1;
		}
		if(month > 11){
			month = 0;
			year = year + 1;
		}
	}
	
	
	
	
	// 세션 아이디 가져오기
	String id = (String)session.getAttribute("id");
	
%>








<!-- 헤더 부분 -->
<jsp:include page="../Inc/top.jsp"></jsp:include>







<article id = "main" style="min-height: 1100px;">


	<div class = "scheduleDiv">
		
		<div class = "scheduleTitleDiv">
			<h2>SCHEDULE!</h2>
		</div>
		
		<div id = "insert_btn">
		</div>
		
		<table border="0" class = "scheduleTable1">
			<tr>
				<td align="left" width="200">
					    <a href="Schedule.jsp?year=<%= year-1 %>&month=<%= month %>">◀	</a>
						    <%= year %>년
						<a href="Schedule.jsp?year=<%= year+1 %>&month=<%= month %>">	▶</a>
				</td>
				
				<td align="center" width="300">
					 <a href="Schedule.jsp?year=<%=year%>&month=<%=month-1%>">◀</a>
	   				 <%= month+1 %>월
	 				   <a href="Schedule.jsp?year=<%=year%>&month=<%= month+1%>">▶</a>
				</td>
				
					<td align=right width=200>
						<%=currentYear%>.<%=currentMonth+1%>.<%=currentDate%>
					</td>
			</tr>
		</table>
		
		
		
		<table border="0"  class = "scheduleTable2">		
			
			   <tr>
			 	  <!-- 
			 	  	일 1
			 	  	월 2
			 	  	화 3
			 	  	...
			 	  	토 7 
			 	  -->
			 	  <td width="100" class ="sat">SUN</td> 
			 	  <td width="100">MON</td> 
			 	  <td width="100">TUE</td> 
			 	  <td width="100">WED</td> 
			 	  <td width="100">THU</td> 
			 	  <td width="100">FRI</td> 
			 	  <td width="100">SAT</td> 
			   </tr>
			   
				<tr height="100">
<%
				cal.set(year, month, 1);

				int startDay = cal.get(Calendar.DAY_OF_WEEK);
				int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
				int br = 0;
				
				for(int i = 0; i < startDay - 1; i++){
%>
					<td>&nbsp;</td>
<%
					br++;
					
					if(br % 7 == 0){
%>
					<br>
<%
					}
				}
				
				for(int i = 1; i < endDay; i++){
					
%>					
					<td class = "day"><%=i%><br>

<%					
					int sche_year, sche_month, sche_day;

					try{
						
						// 모든 스케줄의 정보를 가져옴
						String sql = "select * from schedule";
						pstmt = con.prepareStatement(sql);
							
						rs = pstmt.executeQuery();
						
						
						while(rs.next()){
							
							sche_year = rs.getInt("year");
							sche_month = rs.getInt("month");
							sche_day = rs.getInt("day");
							
							int num = rs.getInt("num");
							
							if(year == sche_year && month+1 == sche_month && i == sche_day){
%>
								<div class = "con">
									<%=rs.getString("contents")%><br>
								</div>

<%
							// 아이디가 admin이면 삭제, 수정 버튼이 활성화됨
							if(id.equals("admin")){
			
%>								
								<!-- 선택한 스케줄의 넘버(고유번호)를 넘겨줌 -->
								<input type = "button" value = "delete" id = "sche_btn"
								onclick = "location.href='ScheduleDelete.jsp?num=<%=rs.getInt("num")%>'">
								
								<input type = "button" value = "update" id = "sche_btn"
								onclick = "javascript:void(window.open('../Board/ScheduleUpdate.jsp?num=<%=rs.getInt("num")%>', 'Update','width=520 height=230'))">

								
<%
							}
						}
							
					}
						
						rs.close();
				
					} catch(Exception e){
						System.out.print(e);
					}
%>
						</td>
<%
					br++;
					// 7일마다 다음줄로 넘어가게 설정
					if( br%7 == 0 && i != endDay){
%>
					</tr><tr height = '100'>
<%
					} // if문 끝
					
				} // for문 끝
				while( (br++) % 7 != 0 ){
%>
					<td>&nbsp;</td>
<%
				}
				pstmt.close();
				con.close();

%>
				</tr>
		</table>
	</div>
</article>











	
<!-- 푸터 부분 -->
<jsp:include page="../Inc/bottom.jsp"></jsp:include>





	

</body>
</html>