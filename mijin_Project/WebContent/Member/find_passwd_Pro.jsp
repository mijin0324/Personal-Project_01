<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
<%

	// find_id_Pro와 같음
	
	request.setCharacterEncoding("UTF-8");

	String radio = request.getParameter("find_passwd");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String radio_value = "";
	
	String email = "";
	String phone = "";
	String radio_word = "";
	
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
	
	
	String passwd = mdao.find_passwd(id, name, radio_value, radio_word);
		

	if(passwd == ""){
%>
	<script>
		alert("입력하신 정보로 가입 된 회원은 존재하지 않습니다.");
		history.back();
	</script>
<%
	}
	else{
%>
	<script>
		alert("비밀번호는 <%=passwd%>입니다.");
		history.back();
	</script>
<%
	}
%>