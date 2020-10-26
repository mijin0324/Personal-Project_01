<%@page import="mail.SMTPAuthenticator"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	 
	String from = request.getParameter("from"); 		// 보내는 사람
	String name = request.getParameter("name");	 		// 보내는 사람의 이름
	String to = request.getParameter("to");				// 받는 사람
	String subject = request.getParameter("subject");	// 제목
	String content = request.getParameter("content");	// 내용
	String email = request.getParameter("from");		// 이메일
	String phone = request.getParameter("phone");		// 휴대폰 번호
	 
	
	// 정보를 담음
	Properties p = new Properties(); 
	 
	// SMTP 서버에 접속하기 위한 정보
	p.put("mail.smtp.host", "smtp.gmail.com");	
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	 
	
	
	try{
		
		Authenticator auth = new SMTPAuthenticator();
	    Session ses = Session.getInstance(p, auth);
	     
	    ses.setDebug(true);
	     
	    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
	    msg.setSubject(subject); // 제목
	     
	    Address fromAddr = new InternetAddress(from);
	    msg.setFrom(fromAddr); // 보내는 사람
	     
	    Address toAddr = new InternetAddress(to);
	    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
	    
	    // 보내는 사람의 정보를 버퍼에 저장
	    StringBuffer buffer = new StringBuffer();
	    buffer.append("이름: ");
	    buffer.append(name + "<br>");
	    buffer.append("번호: ");
	    buffer.append(phone + "<br>");
	    buffer.append("이메일: ");
	    buffer.append(email + "<br>");
	    buffer.append("내용: ");
	    buffer.append(content + "<br>");
	
	    // 버퍼에 담은 내용을 내용으로 전달함
	    msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용과 인코딩
	    Transport.send(msg); // 전송
	    
	    
	} catch(Exception e){
		
	    e.printStackTrace();
	    // 오류 발생시 뒷 페이지로 이동
	    out.println("<script>alert('메일 보내기에 실패하였습니다.');history.back();</script>");
	    return;
	}
	 
	// 성공 시
	out.println("<script>alert('메일을 성공적으로 전송하였습니다.');location.href='Contact.jsp';</script>");
%>


