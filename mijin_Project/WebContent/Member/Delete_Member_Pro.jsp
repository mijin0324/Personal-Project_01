<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%

	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("id");
	String passwd = request.getParameter("passwd");

%>

	<jsp:useBean id="memberDAO" class = "member.MemberDAO"></jsp:useBean>
	<jsp:useBean id="memberBean" class = "member.MemberBean"></jsp:useBean>
<%

	// 아이디와 비밀번호를 확인하여 check 1이면 삭제, 0이면 삭제 실패
	int check = memberDAO.Delete_Member(id, passwd);
	

	if(check == 1){
%>	
	<script type = "text/javascript">
	
		alert("탈퇴하셨습니다. 다음에 다시 만나요! ( ღ'ᴗ'ღ )");
		location.href = "../Center/index.jsp";
<%	
		// 탈퇴하면 세션에 있는 데이터를 지움
		session.invalidate();
%>
	</script>
	
<% 

	} else if (check == 0){

%>	
	<script type = "text/javascript">
	
		alert("비밀번호를 확인해주세요.");
		history.back();

	</script>

<%
	}
%>