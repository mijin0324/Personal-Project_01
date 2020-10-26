<%@page import="board.Pic_BoardBean"%>
<%@page import="board.Pic_BoardDAO"%>
<%@page import="comment.CommentBean"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="member.MemberBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-Enter">
<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-exit">
<title>Se So Neon</title>
<link href ="../css/index.css" rel = "stylesheet">
<link href ="../css/Pic_Content.css" rel = "stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Courier+Prime&family=Montserrat:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<script type="text/javascript">






$(document).ready(function(){
	
	var id = '<%= (String)session.getAttribute("id") %>';

	// 관리자로 로그인을 하였다면 글 수정, 글 삭제 버튼이 나타남
	if(id == 'admin'){
		$("#board_btn_list").append("<input type = 'button' value = 'EDIT' class = 'editbtn' onclick = 'editpage()''>"+
		"<input type = 'button' value = 'DELETE' class = 'deletebtn' onclick = 'deletepage()'>");
	}
	
});









// 댓글 리스트 생성 => ajax
// 댓글 리스트가 계속 실행되도록
$(document).ready(function(){

	
	var num = $("#num").val();
	var id = $("#id").val();
	
	
	function re(){

		
	$.ajax({
		
		
		type: "post",
		async: false,
		url: "./PicCommentList.jsp",
		data: {"num": num, "id":id},
		dataType: "text",
			
		success: function(data, textStatus){
			
            var jsonInfo = JSON.parse(data);
            var comment = jsonInfo.PicCommentList;
            
            
            for(var i=0; i < comment.length; i++){
				
				// 영역에 댓글 리스트를 추가하여 출력 되도록
            	$("#commentlist").append("<tbody><tr>"+
                	  "<th>" + "Comment" + "</th>" +
                	  "<td class = 'displaynone'><p class = 'comment_num'>" + comment[i].pic_comment_num + "</p></td>" +
                      "<td><p>" + comment[i].pic_comment_writer + "</p></td>" + 
                      "<td><p>" + comment[i].pic_comment + "</p></td>" +
                      "<td><p id = 'button_p" + [i] + "' class = 'co_date'>" + comment[i].date + "</p></td>"

                 ); // for문 끝
                 
                 
                 // 세션에 있는 아이디와 commentWriter(댓글 쓴 아이디)가 같으면 댓글 삭제와 수정 버튼이 나타나도록 함
                 // => 자신이 쓴 댓글만 수정할 수 있도록 설정
                 // 또는 관리자 아이디인 admin만 보이도록 설정
            	if(id == comment[i].pic_comment_writer || id == 'admin'){
                	$("#button_p" + [i]).append("<input type = 'button' id = 'updatecomment' name = 'updatecomment' value = 'modify' onclick = 'updatecomment("+comment[i].pic_comment_num+")'>");
                	$("#button_p" + [i]).append("<input type = 'button' id = 'deletecomment' name = 'deletecomment' value = 'delete' onclick = 'deletecomment("+comment[i].pic_comment_num+")'></tr></tbody>");
            	}
                 
            }
				
		}, // success 끝
		
		error: function(data, textStatus){
		
			alert("에러 발생"+ data + textStatus);
			console.log(data);
			
		} // error 끝
	
	
	});		
	
	}
	
	re();
	
}); // comment_list 끝







		
		
	// 댓글 수정창 열어줌
	function updatecomment(pic_comment_num){
			
		window.open("Pic_CommentUpdate.jsp?pic_comment_num="+pic_comment_num,"","width=530,height=160");			
			
		
	} // update_comment 끝



	
	
	
	
	
	// 댓글을 지우는 fucntion ajax 생성
	function deletecomment(pic_comment_num){
		
		
		
		$.ajax({
			
			
			type: "post",
			async: false,
			url: "./PicCommentDelete.jsp",
			data: {pic_comment_num: pic_comment_num},
			dataType: "text",
				
			success: function(data, textStatus){
				
				var result = data;
				
				// CommentDelete에서 받아온 데이터가 1이면 댓글을 삭제
				if(result == 1){
					alert("댓글을 삭제하였습니다.");
					$("#commentlist").empty();
					location.reload();
					re();
					
				}
				
				else{
					alert("삭제에 실패하였습니다.");
				}
				
			}, // success 끝
			
			error: function(data, textStatus){
			
				alert("에러 발생"+ data + textStatus);
				console.log(data);
				console.log(textStatus);
				
			} // error 끝
		
		
		});		
			
	} // delete_comment 끝
	
	
	
	
	
	
	
	
	
</script>

    
</head>
<body>





<% 


	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	
	Pic_BoardDAO pdao = new Pic_BoardDAO();
	Pic_BoardBean pbean = new Pic_BoardBean();
	
	
	// 글 상세보기를 누르면 num에 해당하는(글 번호에 해당하는) 게시물의 조회수가 증가하도록 
	pdao.Plus_ReadCount(num);
	
	
	// 파일을 업로드한 폴더의 경로와 그 경로에 있는 파일들을 배열에 저장
	String directory = application.getRealPath("/pic_upload/");
	String[] files = new File(directory).list();
	
	
	// 글 번호에 대한 글의 정보를 검색해서 bBean에 저장
	pbean = pdao.Read_PicBoard(num);
	
	
	int DBnum = pbean.getPic_num();				 	// 조회한 글의 번호
	String DBName = pbean.getPic_name(); 		 	// 조회한 작성자
	int DBReadcount = pbean.getPic_readcount(); 	// 조회한 조회수
	
	
	SimpleDateFormat f = new SimpleDateFormat("yyyy/MM/dd");
	Timestamp DBDate = pbean.getPic_date(); 		
	String newDate = f.format(DBDate);
	// 조회한 작성일 => yyyy/MM/dd로 나타냄(ex: 2015/03/24)
	
			
	
	
	String DBSubject = pbean.getPic_subject();		// 조회한 글제목
	
	
	// 세션에 있는 아이디를 가져와 저장
	String id = (String)session.getAttribute("id");
	


%>


<script type="text/javascript">


// edit 버튼을 누르면 수정 페이지로 이동
function editpage(){
	
	location.href='../Board/Pic_Update.jsp?num=<%= DBnum %>&pageNum=<%=pageNum%>';
	
}

// delete 페이지를 누르면 삭제 페이지로 이동
function deletepage(){
	location.href='../Board/Delete_Picboard.jsp?num=<%= DBnum %>&pageNum=<%=pageNum%>';
}


</script>
	
	











<!-- 헤더 부분 -->
<jsp:include page="../Inc/top.jsp"></jsp:include>











<!-- 메인 부분 -->
<article id = "main" style="height: auto; min-height: 800px;">

	<div class = "ContentDiv">
	
		<div class = "ContentDiv2">
		
			<!-- hidden으로 값을 전달 -->
			<input type = "hidden" name = "num" value = "<%=num%>" id = "num"> 
			<input type = "hidden" name = "id" value = "<%=id%>" id = "id"> 
					
			
			
			
			<!-- 글 상세 내용 나오는 부분 -->
			<div class = "Content_wrap">
				
				<p class = "subjectP">
					<%= DBSubject %>
				</p>
				
				
				<div class = "Content_top">
					
					<ul class = "left">
						<li class = "subject displaynone"><%= DBSubject %></li>
						<li class = "name">POSTED BY : <%= DBName %></li>
						<li class = "date">DATE  :  <% out.print(newDate); %></li>
						<li class = "readCount">HIT!  ▶       <%= DBReadcount %></li>
					</ul>
				
				</div>	
				
				<!-- 글의 내용 출력 부분 -->
				<div class = "detail">
				
					<p>
<%
						if(pbean.getPic_fileOriginName() != null || pbean.getPic_fileSystemName() != null){
%>
						<img src="<%=request.getContextPath()%>/pic_downloadAction?file=
						<%=java.net.URLEncoder.encode(pbean.getPic_fileSystemName(),"UTF-8")%>
						" style="max-width: 1100px;">
<%							
						}

%>


					</p>
				
				</div>
				
			</div> <!-- 글 상세 내용 끝 -->
			
			
			
			<div class = "fileupload">
	
				<ul>
					<li class = "fileList">
<%
				// 서버에 실제로 업로드된 파일명의 갯수만큼 반복
				for(String file : files){
					
					if(file.equals(pbean.getPic_fileSystemName())){
%>
						PICTURE DOWNLOAD CLICK NOW ! ▼<br>
						<!-- 받아온 파일 -->
						<a href="<%=request.getContextPath()%>/pic_downloadAction?file=
							<%=java.net.URLEncoder.encode(file,"UTF-8")%>" class = "afile">
							<%=pbean.getPic_fileOriginName()%>
						</a>
						
<%				
					} // if문 끝
					
				} // 파일 업로드 for문 끝
				
				// 파일이 업로드 되어있지 않다면 출력됨
				if(pbean.getPic_fileOriginName() == null || pbean.getPic_fileSystemName() == null){		
%>			
					<p>업로드한 파일이 존재하지 않습니다.</p>
<%
				}
%>
					</li>
				</ul>
				
			</div> <!-- 파일 업로드 끝 -->
			
			
			
			
	<!-- 코멘트에 관한 부분 -->				
	<div class = "CommentDiv">
		
		
		
		<!-- 코멘트 출력되는 부분 -->
		<div class = "comdiv">
		
			<table id = "commentlist">
			
			</table>
			
		</div>	
		
		
		
		<!-- form을 통해 댓글에 관한 정보를 CommentPro에 넘김 -->
		<form action = "PicCommentPro.jsp" method="post" id = "commentPro">
			
			<!-- 댓글 작성 부분 -->
			<table class = "commentInput">
				
				<tbody>
				
					<tr>
						<th scope = "row">YOUR COMMENT</th>
					
						<th scope = "row">
							<input type = "hidden" name = "num" value = "<%=num%>">
							<input type = "hidden" name = "pageNum" value = "<%=pageNum %>">
							<input type = "hidden" name = "board_num" value = "<%=num%>">
						</th>
						<th scope = "row">
<%
							if(id != null){
%>	
							<!-- 쓰는 사람의 아이디가 출력되도록, 대신 수정 불가능, 읽을수만 있음 -->
							<input type = "text" name = "pic_comment_writer" id = "writer" value = "<%=id%>" readonly="readonly">
							</th>
							<th scope = "row">
<%
							}
							else if(id == null){
%>							
							<input type = "text" name = "null_writer" id = "writer" value = "" readonly="readonly">
						</th>
<%

							}
%>
						
						<td>
<%
							// 세션 영역에 아이디가 존재한다면
							// 즉 로그인을 하였다면 댓글을 쓸 수 있도록 함 
							if(id != null){
%>
							<!-- textarea에 댓글을 쓸 수 있음, 사이즈 조절 못하도록 설정 -->
							<textarea rows = "5" cols = "80" name = "pic_comment" id = "pic_comment" style="resize: none;">
							</textarea>
						</td>
						
						<td>
							<!-- 로그인을 하였다면 댓글 등록 버튼이 활성화 -->
							<input type = "submit" name = "comment_btn" id = "comment_btn" value = "Comment!">
						</td>
						
						<td>
<%
							} // if 끝
							// 로그인을 하지 않았을 경우
							else{
%>
							<textarea rows = "8" cols = "100" id = "comment" name = "comment" readonly="readonly" style="resize: none;">
							</textarea>
						</td>
						<td>
							<!-- 로그인을 하지 않았으므로 댓글 등록 버튼이 비활성화 -->
							<input type = "submit" name = "comment_btn" id = "comment_btn" value = "Comment!"
										onclick="Comment_submit()" disabled="disabled">
						</td>
<%
							} // else 끝
%>
					</tr>
				</tbody>
						
			</table>
		</form>
	</div>
	<!-- 댓글 작성 부분 끝 -->
			
			
			
		</div>
		
	<!-- 게시물의 버튼 리스트들을 모아둔 공간 -->
	<div id = "board_btn_list">
		
		<!-- 
			만약 관리자로 로그인을 하지 않았다면 LIST 버튼만 출력,
			관리자로 로그인을 하였다면 글 수정, 삭제 버튼이 나타남
		-->	
		<input type = "button" value = "LIST" name = "list" class = "listbtn" onclick="location.href='../Board/Pic.jsp?pageNum=<%=pageNum%>'">

	</div>
	
	
	
	
	
	<div class = "page_location">
	<%
		
		// 하단 버튼을 누르면 다음 게시물 또는 이전 게시물로 이동하기 위한 공간
		
		// 마지막 게시물의 숫자와 첫 게시물의 숫자를 구함
		int board_maxnum = pdao.max_board();
		int board_minnum = pdao.min_board();
		
		
		// 가장 마지막 게시물과 현 게시물의 숫자가 같다면 이전 게시물 이동버튼만 나오게
		if(board_maxnum == num){
	%>
			<input type = "button" value = "PREV ▶"  class = "page_loc_btn next"
				onclick="location.href='../Board/Pic_Content.jsp?num=<%=num-1%>&pageNum=<%=pageNum%>'">
	<%
		}
		// 첫 게시물과 현 게시물의 숫자가 같다면 다음 게시물 이동버튼만 나오게
		else if(board_minnum >= num){
	%>
			<input type = "button" value = "◀ NEXT"    class = "page_loc_btn prev"
					onclick="location.href='../Board/Pic_Content.jsp?num=<%=DBnum+1%>&pageNum=<%=pageNum%>'">		<%	
	}
	// 나머지 경우는 두 버튼 다 나오게 설정
	else{
	%>
		<input type = "button" value = "◀ NEXT"    class = "page_loc_btn prev"
					onclick="location.href='../Board/Pic_Content.jsp?num=<%=DBnum+1%>&pageNum=<%=pageNum%>'">
		<input type = "button" value = "PREV ▶"    class = "page_loc_btn next"
					onclick="location.href='../Board/Pic_Content.jsp?num=<%=DBnum-1%>&pageNum=<%=pageNum%>'">
	</div>
	<%
	}
	%>
	
	
	
	</div>
	



</article>















<!-- 푸터 부분 -->
<jsp:include page="../Inc/bottom.jsp"></jsp:include>








</body>
</html>