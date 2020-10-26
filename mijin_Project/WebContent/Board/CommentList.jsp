<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.Console"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="comment.CommentBean"%>
<%@page import="java.util.List"%>
<%@page import="comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    
    

<%
		

	// board 번호에 따른 댓글 리스트를 반환

	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	
	int num = Integer.parseInt(request.getParameter("num"));
	String id = request.getParameter("id");
	
	CommentDAO cdao = new CommentDAO();
	List<CommentBean> list = cdao.get_Comment(num);
	
	

	JSONObject totalobObject = new JSONObject();
	JSONArray commentArray = new JSONArray();


	for(int i = 0; i < list.size(); i++){
		
		JSONObject commentInfo = new JSONObject();

		SimpleDateFormat f = new SimpleDateFormat("yyyy. MM. dd");
		Timestamp DBDate = list.get(i).getReg_datetime(); 		
		String date = f.format(DBDate);
	
		CommentBean cbean = new CommentBean();

		commentInfo.put("comment_num", list.get(i).getComment_num());
		commentInfo.put("writer", list.get(i).getWriter());
		commentInfo.put("comment", list.get(i).getComment());
		commentInfo.put("date", date);
		
		commentArray.add(commentInfo);
		
	}
	
	totalobObject.put("CommentList", commentArray);
	String jsonInfo = totalobObject.toJSONString();
	out.print(jsonInfo);
	
%>