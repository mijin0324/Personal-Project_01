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
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-Enter">
<meta content="BlendTrans(Duration=0.2)" http-equiv="Page-exit">
<title>Se So Neon</title>
<link href ="../css/index.css" rel = "stylesheet">
<link href ="../css/Content.css" rel = "stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Courier+Prime&family=Montserrat:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville&display=swap" rel="stylesheet">


<script type="text/javascript">




// 댓글 리스트 생성 => ajax
// 댓글 리스트가 계속 실행되도록
$(document).ready(function(){

	
	var num = $("#num").val();
	var id = $("#id").val();
	
	
	function re(){

		
	$.ajax({
		
		
		type: "post",
		async: false,
		url: "./CommentList.jsp",
		data: {"num": num, "id":id},
		dataType: "text",
			
		success: function(data, textStatus){
			
            var jsonInfo = JSON.parse(data);
            var comment = jsonInfo.CommentList;
            
            for(var i=0; i < comment.length; i++){
            	
				
				// 영역에 댓글 리스트를 추가하여 출력 되도록
            	$("#commentlist").append("<tbody><tr>"+
                	  "<th>" + "Comment" + "</th>" +
                	  "<td class = 'displaynone'><p class = 'comment_num'>" + comment[i].comment_num + "</p></td>" +
                      "<td><p>" + comment[i].writer + "</p></td>" + 
                      "<td><p>" + comment[i].comment +"</p></td>" +
                      "<td><p id = 'button_p" + [i] + "' class = 'co_date'>"+ comment[i].date + "</p></td>"
                 ); // for문 끝
                 
                 
                // 세션에 있는 아이디와 commentWriter(댓글 쓴 아이디)가 같으면 댓글 삭제와 수정 버튼이 나타나도록 함
                // => 자신이 쓴 댓글만 수정할 수 있도록 설정
                // 또는 관리자 아이디인 admin만 보이도록 설정
            	if(id == comment[i].writer || id == 'admin'){
                	$("#button_p" + [i]).append("<input type = 'hidden' id = 'up_comment_num' name = 'up_comment_num' value = '"+ comment[i].comment_num+"'>");
            		$("#button_p" + [i]).append("<input type = 'button' id = 'updatecomment' name = 'updatecomment' value = 'modify' onclick = 'updatecomment("+comment[i].comment_num+")'>");
                	$("#button_p" + [i]).append("<input type = 'button' id = 'deletecomment'  name = 'deletecomment' value = 'delete' onclick = 'deletecomment("+comment[i].comment_num+")'></tr></tbody>");
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
	function updatecomment(comment_num){
		
		window.open("CommentUpdate.jsp?comment_num="+comment_num,"","width=570,height=180");			
		
	}


	
	
	
	
	
	
	
	
	
	// 댓글을 지우는 fucntion ajax 생성
	function deletecomment(comment_num){
		
		
		
		$.ajax({
			
			
			type: "post",
			async: false,
			url: "./CommentDelete.jsp",
			data: {comment_num: comment_num},
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
	
	
	BoardDAO dao = new BoardDAO();
	BoardBean bBean = new BoardBean();
	
	
	// 글 상세보기를 누르면 num에 해당하는(글 번호에 해당하는) 게시물의 조회수가 증가하도록 
	dao.Plus_ReadCount(num);
	
	
	// 파일을 업로드한 폴더의 경로와 그 경로에 있는 파일들을 배열에 저장
	String directory = application.getRealPath("/upload/");
	String[] files = new File(directory).list();
	
	
	// 글 번호에 대한 글의 정보를 검색해서 bBean에 저장
	bBean = dao.Read_Board(num);
	
	
	int DBnum = bBean.getNum();				 	// 조회한 글의 번호
	String DBName = bBean.getName(); 		 	// 조회한 작성자
	int DBReadcount = bBean.getReadcount(); 	// 조회한 조회수
	
	
	SimpleDateFormat f = new SimpleDateFormat("yyyy/MM/dd");
	Timestamp DBDate = bBean.getDate(); 		
	String newDate = f.format(DBDate);
	// 조회한 작성일 => yyyy/MM/dd로 나타냄(ex: 2015/03/24)
	
			
	String DBContent = "";
	
	
	if(bBean.getContent() != null){ // => 조회한 글 내용이 존재하면 ? 
			
			// 조회한 글 내용을 변수에 저장
			// 작성한 글 내용 중 엔터키로 줄 바꿈 한것을 똑같이 처리하여 반환
			DBContent = bBean.getContent().replace("\r\n","<br/>");
			
		
	}
	
	
	String DBSubject = bBean.getSubject();		// 조회한 글제목
	String DBCategory = bBean.getCategory();	// 조회한 글의 카테고리
	
	int DBRe_ref = bBean.getRe_ref();		// 조회한 주글의 그룹번호
	int DBRe_lev = bBean.getRe_lev();		// 조회한 주글의 들여쓰기 정도값
	int DBRe_seq = bBean.getRe_seq();		// 주글들 내의 조회한 주글의 순서값
	
	
	
	// 세션에 있는 아이디를 가져와 저장
	String id = (String)session.getAttribute("id");
	
	
	


%>


<script type="text/javascript">




$(document).ready(function(){
	
	
	var id = '<%= (String)session.getAttribute("id") %>';
	
	// 로그인 된 아이디와 글을 쓴 사람의 아이디가 같으면 수정버튼과 삭제버튼이 나타남
	if(id == '<%=DBName%>' || id == 'admin'){
		$("#board_btn_list").append("<input type = 'button' value = 'EDIT' class = 'editbtn' onclick = 'editpage()'>" +
		"<input type = 'button' value = 'DELETE' class = 'deletebtn' onclick = 'deletepage()'>");
	}


});

// 수정 페이지로 이동
function editpage(){
	location.href='../Board/Update_board.jsp?num=<%= DBnum %>&pageNum=<%=pageNum%>';
}

// 삭제 페이지로 이동
function deletepage(){
	location.href='../Board/Delete_board.jsp?num=<%= DBnum %>&pageNum=<%=pageNum%>';
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
			<input type = "hidden" name = "re_ref" value = "<%= DBRe_ref %>">
			<input type = "hidden" name = "re_lev" value = "<%= DBRe_lev %>">
			<input type = "hidden" name = "re_seq" value = "<%= DBRe_seq %>">
					
			
			
			
			<!-- 글 상세 내용 나오는 부분 -->
			<div class = "Content_wrap">
				
				<p class = "subjectP">
					<%= DBSubject %>
					
				</p>
				
				
				<div class = "Content_top">
					
					<ul class = "left">
						<li class = "category">CATEGORY : <%= DBCategory %></li>
						<li class = "subject displaynone"><%= DBSubject %></li>
						<li class = "name">POSTED BY : <%= DBName %></li>
						<li class = "date">DATE  :  <% out.print(newDate); %></li>
						<li class = "readCount">HIT!  ▶       <%= DBReadcount %></li>
					</ul>
				
				</div>	
				
				<!-- 글의 내용 출력 부분 -->
				<div class = "detail">
				
					<p>
						<%=DBContent%>
<%
						if(bBean.getFileOriginName() != null || bBean.getFileSystemName() != null){
%>
<%-- 						<img src="<%=request.getContextPath()%>/downloadAction?file= --%>
<%-- 						<%=java.net.URLEncoder.encode(bBean.getFileSystemName(),"UTF-8")%>" --%>
<!-- 						style="max-width: 900px;"> -->
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
					
					if(file.equals(bBean.getFileSystemName())){
%>
						FILE DOWNLOAD CLICK NOW ! ▼<br>
						<!-- 받아온 파일 -->
						<a href="<%=request.getContextPath()%>/downloadAction?file=
							<%=java.net.URLEncoder.encode(file,"UTF-8")%>" class = "afile">
							<%=bBean.getFileOriginName()%>
						</a>
						
<%				
					} // if문 끝
					
				} // 파일 업로드 for문 끝
				
				// 파일이 업로드 되어있지 않다면 출력됨
				if(bBean.getFileOriginName() == null || bBean.getFileSystemName() == null){		
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
		<form action = "CommentPro.jsp" method="post" id = "commentPro" name = "cp">
			
			<!-- 댓글 작성 부분 -->
			<table class = "commentInput">
				
				<tbody>
				
					<tr>
						<th scope = "row">YOUR COMMENT</th>
						<td>
							<input type = "hidden" name = "num" value = "<%=num%>">
							<input type = "hidden" name = "pageNum" value = "<%=pageNum %>">
							<input type = "hidden" name = "board_num" value = "<%=num%>">
							<input type = "hidden" name = "ref" value = "<%=num%>">
							<!-- 쓰는 사람의 아이디가 출력되도록, 대신 수정 불가능, 읽을수만 있음 -->
							<input type = "text" name = "writer" id = "writer" value = "<%=id%>" readonly="readonly">
						</td>
						
						
						<td>
<%
							// 세션 영역에 아이디가 존재한다면
							// 즉 로그인을 하였다면 댓글을 쓸 수 있도록 함 
							if(id != null){
%>
							<!-- textarea에 댓글을 쓸 수 있음, 사이즈 조절 못하도록 설정 -->
							<textarea rows = "5" cols = "80" name = "comment" id = "comment" style="resize: none;">
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
							<input type = "submit" name = "comment_btn" id = "comment_btn" value = "SUBMIT"
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
			
			
			<!-- 게시물의 버튼 리스트들을 모아둔 공간 -->
			<div id = "board_btn_list">
			
				<input type = "button" value = "LIST" name = "list"  class = "listbtn"
						 onclick="location.href='../Board/To.jsp?pageNum=<%=pageNum%>'">
<%

				if(id != null){
				
%>
				<input type = "button" value = "REWRITE"  class = "deletebtn"
						onclick="location.href='../Board/reWrite.jsp?num=<%= DBnum %>&re_ref=<%= DBRe_ref %>&re_lev=<%= DBRe_lev%>&re_seq=<%= DBRe_seq%>'">
		
			
			</div>
<%
			} // if 끝
				
%>

		</div>
	
	
	
	</div>
	
	<div class = "page_location">
	<%
		
		// 하단 버튼을 누르면 다음 게시물 또는 이전 게시물로 이동하기 위한 공간
		
		// 마지막 게시물의 숫자와 첫 게시물의 숫자를 구함
		int board_maxnum = dao.max_board();
		int board_minnum = dao.min_board();
		
		
		// 가장 마지막 게시물과 현 게시물의 숫자가 같다면 이전 게시물 이동버튼만 나오게
		if(board_maxnum == num){
	%>
			<input type = "button" value = "PREV ▶"  class = "page_loc_btn next"
				onclick="location.href='../Board/Content.jsp?num=<%=num-1%>&pageNum=<%=pageNum%>'">
	<%
		}
		// 첫 게시물과 현 게시물의 숫자가 같다면 다음 게시물 이동버튼만 나오게
		else if(board_minnum >= num){
	%>
			<input type = "button" value = "◀ NEXT"    class = "page_loc_btn prev"
					onclick="location.href='../Board/Content.jsp?num=<%=DBnum+1%>&pageNum=<%=pageNum%>'">		<%	
	}
	// 나머지 경우는 두 버튼 다 나오게 설정
	else{
	%>
		<input type = "button" value = "◀ NEXT"    class = "page_loc_btn prev"
					onclick="location.href='../Board/Content.jsp?num=<%=DBnum+1%>&pageNum=<%=pageNum%>'">
		<input type = "button" value = "PREV ▶"    class = "page_loc_btn next"
				onclick="location.href='../Board/Content.jsp?num=<%=DBnum-1%>&pageNum=<%=pageNum%>'">
	</div>
	<%
	}
	%>
	

	
</article>















<!-- 푸터 부분 -->
<jsp:include page="../Inc/bottom.jsp"></jsp:include>








</body>
</html>