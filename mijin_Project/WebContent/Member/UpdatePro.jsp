<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

	// 회원정보 수정 페이지
	
	
	request.setCharacterEncoding("UTF-8");
	
	
	
%>


	
	<jsp:useBean id="memberDAO" class = "member.MemberDAO"></jsp:useBean>
	<jsp:useBean id="memberBean" class = "member.MemberBean"></jsp:useBean>
	<jsp:setProperty property="*" name="memberBean"/>

<%

	String id = (String)session.getAttribute("id");
	memberBean.setId(id);
	memberDAO.Update_Member(memberBean);
	
%>	
	<script type = "text/javascript">
	
		alert("회원정보 수정이 완료 되었습니다!");
		location.href = "../Center/index.jsp"
			
	</script>
