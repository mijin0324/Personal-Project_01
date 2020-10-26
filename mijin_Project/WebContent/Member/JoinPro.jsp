<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    
    
<%

	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	String address = request.getParameter("address3") + " " +
					request.getParameter("address4");
	
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	
	String birthday = request.getParameter("birth_year") + 
			 request.getParameter("birth_month") +
			 request.getParameter("birth_day");
	
	String birth_radio = request.getParameter("birth_radio");
	String sub1 = request.getParameter("sub1");
	
	
	
	// *********************************************************************

	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	String address4 = request.getParameter("address4");
	String address5 = request.getParameter("address5");
	String address6 = request.getParameter("address6");

	String birth_year = request.getParameter("birth_year");
	String birth_month = request.getParameter("birth_month");
	String birth_day = request.getParameter("birth_day");
	
	
	MemberBean mb = new MemberBean();
	
	mb.setId(id);
	mb.setPasswd(passwd);
	mb.setName(name);
	mb.setAddress(address);
	mb.setPhone(phone);
	mb.setEmail(email);
	mb.setBirthday(birthday);
	mb.setBirth_radio(birth_radio);
	mb.setSub1(sub1);

	mb.setAddress1(address1);
	mb.setAddress2(address2);
	mb.setAddress3(address3);
	mb.setAddress4(address4);
	mb.setAddress5(address5);
	
	mb.setBirth_year(birth_year);
	mb.setBirth_month(birth_month);
	mb.setBirth_day(birth_day);
	
	MemberDAO memberDAO = new MemberDAO();
	memberDAO.insertMember(mb);

	
%>

	<script type="text/javascript">
		alert("회원가입이 완료되었습니다! ◟( ˘ ³˘)◞ ♡");
		location.href ="Login.jsp";
	</script>
<%

%>