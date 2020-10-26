<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="comment.Pic_CommentBean"%>
<%@page import="board.Pic_BoardBean"%>
<%@page import="comment.Pic_CommentDAO"%>
<%@page import="java.io.Console"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="comment.CommentBean"%>
<%@page import="java.util.List"%>
<%@page import="comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    
    

<%
	// comment List 출력을 위한 페이지
	

	// board 번호에 따른 댓글 리스트를 반환

	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	
	int num = Integer.parseInt(request.getParameter("num"));
	String id = request.getParameter("id");
	
	Pic_CommentDAO pcdao = new Pic_CommentDAO();
	List<Pic_CommentBean> list = pcdao.get_PicComment(num);
	
	

	JSONObject totalobObject = new JSONObject();
	JSONArray commentArray = new JSONArray();


	for(int i = 0; i < list.size(); i++){
		
		JSONObject commentInfo = new JSONObject();
		
		// timestamp 데이터를 String 타입으로 바꾸기 위함
		SimpleDateFormat f = new SimpleDateFormat("yyyy. MM. dd");
		Timestamp DBDate = list.get(i).getPic_comment_datetime(); 		
		String date = f.format(DBDate);
		
		
		CommentBean cbean = new CommentBean();
		
		commentInfo.put("pic_comment_num", list.get(i).getPic_comment_num());
		commentInfo.put("pic_comment_writer", list.get(i).getPic_comment_writer());
		commentInfo.put("pic_comment", list.get(i).getPic_comment());
		commentInfo.put("date", date);
		
		commentArray.add(commentInfo);
		
	}
	
	totalobObject.put("PicCommentList", commentArray);
	String jsonInfo = totalobObject.toJSONString();
	out.print(jsonInfo);
	
%>