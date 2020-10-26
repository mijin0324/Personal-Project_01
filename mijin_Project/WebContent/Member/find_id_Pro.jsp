<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<%


	request.setCharacterEncoding("UTF-8");

	// 라디오버튼에서 어떤 값을 가져왔는지 확인
	String radio = request.getParameter("find_id");

	String name = request.getParameter("name");
	
	// 모든 값을 초기화
	String radio_value = "";
	String email = "";
	String phone = "";
	String radio_word = "";
	
	// 만약 라디오 버튼을 email로 선택하였다면 값을 raido value 값을 email로 변경하고
	// input name = email에 있는 값을 이메일에 저장
	if(radio.equals("find_email")){
		radio_value =  "email";
		email = request.getParameter("email");
		radio_word = email;
	}
	
	else if(radio.equals("find_phone")){
		radio_value = "phone";
		phone = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");
		radio_word = phone;
	}
	
	
	MemberBean mbean = new MemberBean();
	MemberDAO mdao = new MemberDAO();
	
	
	String id = mdao.find_id(name, radio_value, radio_word);
		
	// 아이디가 없다면
	if(id == ""){
%>
	<script>
		alert("입력하신 정보로 가입 된 회원 아이디는 존재하지 않습니다.");
		history.back();
	</script>
<%
	}
	else{
%>
	<script>
		alert("아이디는 <%=id%>입니다.");
		history.back();
	</script>
<%
	}
%>