<%@page import="java.io.PrintWriter"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		// 입력한 아이디를 가져옴
		String id = request.getParameter("id");
		
		MemberDAO mdo = new MemberDAO();
		
		// result가 0이면 아이디 중복이 아님, 1이면 중복
		int result = mdo.ID_Check(id);
		out.print(result);

%>
