<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
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
<link href ="../css/To.css" rel = "stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Courier+Prime&family=Montserrat:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<body>



<%
	

	// 한글 깨지는 것 방지
	request.getParameter("UTF-8");

	BoardDAO boardDAO = new BoardDAO();

	String search_key = "subject";		// 검색 카테고리의 기본값 지정
	String search_word;					// 검색할 단어
	
	
	
	// 검색할 단어가 null이라면 request에서 받아옴
	if(request.getParameter("search_word") != null){
		
		search_word = request.getParameter("search_word");
		search_key = request.getParameter("search_key");
			
	}
	else{
		search_word = "";
	}
		
	
	// 전체 게시판의 글 개수 조회
	int count = boardDAO.get_BoardList_Count();
		
	// 검색할 단어가 있으면 count를 검색한 게시물의 개수로 변경
	if(search_word != ""){
		count = boardDAO.search_BoardCount(search_key, search_word);
	}
	
	
	
	
	// 한 페이지당 보여줄 게시물 개수
	int pageSize = 10;
	
	// 클릭한 페이지 번호
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum = "1";
	}
	
	// 현재 보여질(선택한) 페이지 번호 "1"을 기본형 정수 1로 변경
	int currentPage = Integer.parseInt(pageNum);
	
	// 각 페이지마다 첫번째로 보여질 시작 글번호 구하기
	// (현재 보여질 페이지 번호 - 1) * 한페이지당 보여줄 글 개수 10
	int startRow = (currentPage - 1) * pageSize;

	
	CommentBean cobean = new CommentBean();
	CommentDAO cdao = new CommentDAO();
	
	int comment_count = 0;
	

%>



<!-- 헤더 부분 -->
<jsp:include page="../Inc/top.jsp"></jsp:include>












<!-- 메인 부분 -->
<article id = "main" style="height: 1100px;">


	<div class = "ToDIV">
		
		
		<div class = "To_Title">
			<h2>To.</h2>
		</div>
			
		
		<!-- 게시물 출력하는 곳 -->
		<div class = "boardDiv">
			
			<table border="1">
				
				<thead class = "borderList">
					
					<colgroup>
						<col style="width: 50px">
						<col style="width: auto;">
						<col style="width: 130px">
						<col style="width: 100px">
						<col style="width: 100px"  class = "displaynone">
						<col style="width: 100px">
					</colgroup>
					
					
				<thead>
					<tr>
						<th scope="col"> NO.</th>
						<th scope="col">TITLE</th>
						<th scope="col" width="120px">POSTED BY</th>
						<th scope="col"class = "displaynone">DATE</th>
						<th scope="col">HIT</th>
					</tr>
				</thead>
					
					
					
					
<%
		// 검색해서 나온 게시물들을 list라는 ArrayList에 저장
		ArrayList<BoardBean> list = boardDAO.search_Board(startRow, pageSize, search_key, search_word);

		// list에 값이 있다면
		if(list.size() != 0){

			for(int i = 0; i < list.size(); i++){
				
				BoardBean bbean = list.get(i);
%>
		
		<tbody id = "boardList">
		<tr onclick="location.href ='Content.jsp?num=<%=bbean.getNum()%>&pageNum=<%=pageNum %>'">
				<td><%=bbean.getNum()%>
				<td align="left" id = "subjectHover">
							
<%
				// 들여쓰기 값 설정
				int wid = 0;	
				int board_num = bbean.getNum();
				
				if(bbean.getRe_lev() > 0 ){
					wid = bbean.getRe_lev() * 10;
%>
				<img src = "../img/level.gif" width = "<%=wid%>" height = "15">
				<img src = "../img/re.png" width = "10">
<% 
			} // 들여쓰기 값 가져오는 if문 끝
			
				
				
			// 게시판에 있는 댓글 수 출력
			comment_count = cdao.count_comment(board_num);
			
			// 댓글이 없다면 댓글수가 출력되지 않음
			if(comment_count == 0){
%>
					<%= bbean.getSubject() %>
<%
			}
			// 댓글이 있다면 댓글의 수가 출력됨
			else{
%>
					<%= bbean.getSubject() %> &nbsp;&nbsp;[<%= comment_count %>] 
<%
			}
%>
					<td><%= bbean.getName() %></td>
					<td class = "displaynone"><%= new SimpleDateFormat("yyyy.MM.dd").format(bbean.getDate()) %></td>
					<td><%= bbean.getReadcount() %></td>
				</tr>
			</tbody>
<%		
		}

	}
	
	// 만약 검색된 게시물이 없다면 출력
	else{
%>
	<tbody>
		<tr>
			<td colspan = "4">게시판에 글이 없습니다.</td>
		</tr>
	</tbody>	
<%	
	}
%>	
	</table>
</div>
		
		
			<div class = "boardFooter">

				<!-- 필요없으면 지우기 -->		
				<form action="boardSearchForm" action = "" method="post">
					<input id = "board_no" type = "hidden">
					<input id = "page" type = "hidden">
					<input id = "board_sort" type = "hidden">
				</form>
			
			</div>
				
				
			<!-- 게시물 검색 부분  -->
			<form action = "To.jsp" name = "searchForm" class = "board_search" method="get">
				
				<fieldset class = "boardSearch">
					
					<legend>게시물 검색</legend>
						
					<p class = "displaynone"></p>
					<p class = "search_p">
					
						<select id = "search_key" name = "search_key">
							<option value ="subject">제목</option>
							<option value ="content">내용</option>
							<option value ="name">아이디</option>
						</select>

						
						<input type = "text" name = "search_word" id = "search_word" >
						<input type = "submit" id = "search_btn" class = "search_btn" value = "SEARCH">
					</p>
						
				</fieldset>				
			</form>
						
						
			<!-- 글쓰기 버튼 -->	
			<div class = "writerDiv">
					<a href = "Write.jsp" class = "write">WRITE</a>
			</div>
				
				
		</div>
		
	
	
	
	
	
	
		<!-- 페이징 하는 부분 -->
		<div class ="board_paging">
		
<%
		if(count > 0){
			
			int pageCount = count / pageSize + (count % pageSize == 0? 0:1);
			int pageBlock = 5;
			int startPage = ((currentPage/pageBlock)-(currentPage%pageBlock==0?1:0))*pageBlock + 1;
			int endPage = startPage + pageBlock-1;

			if(endPage > pageCount){
				endPage = pageCount;
			}
		
			
			if(startPage > pageBlock){
%>
			<a href ="To.jsp?pageNum=<%=startPage-pageBlock%>&search_key=<%=search_key%>&search_word=<%=search_word%>">PREV</a>

<%
			}
			
			for (int i = startPage; i <= endPage; i++){
%>	
				<ol class = "pagingOL">
					<li>
						<a href = "To.jsp?pageNum=<%=i%>&search_key=<%=search_key%>&search_word=<%=search_word%>"><%=i%></a>
					</li>
				</ol>
<%
			}
			if(endPage < pageCount){
%>
			<a href = "To.jsp?pageNum=<%=startPage+pageBlock%>&search_key=<%=search_key%>&search_word=<%=search_word%>">NEXT</a>
			
		
<%			
				}
		}

%>
			

			
			
		</div>


</article>
















<!-- 푸터 부분 -->
<jsp:include page="../Inc/bottom.jsp"></jsp:include>
	

</body>
</html>