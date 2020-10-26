<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

	request.setCharacterEncoding("UTF-8");
	
	// 입력한 아이디와 비밀번호를 받아옴
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
		
	
	
	MemberDAO memberdao = new MemberDAO();

	// 아이디, 비밀번호 확인
	// 아이디가 없다면 -1, 아이디가 있으나 비밀번호가 틀리다면 0, 아이디와 비밀번호 전부 존재한다면 1을 반환
	int check = memberdao.Check_User(id, passwd);
	
	
	
	
	if(check == 1){
		// 아이디와 비밀번호가 둘 다 맞으면 인덱스 페이지로 이동함
		// 세션에 있는 아이디를 저장
		response.sendRedirect("../Center/index.jsp");
		session.setAttribute("id", id);
}
	
	else if(check == 0){
%>
		<script type = "text/javascript">
			window.alert("비밀번호가 틀렸습니다.");
			history.back();
		</script>
<%
	}
	
	else{ 
%>
	<script type = "text/javascript">
		
		window.alert("존재하지 않는 아이디입니다.");
		history.go(-1);
		
	</script>
	
<%
	}
	
	


%>