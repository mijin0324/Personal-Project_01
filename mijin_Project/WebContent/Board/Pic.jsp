<%@page import="board.Pic_BoardBean"%>
<%@page import="board.Pic_BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
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
<link href ="../css/Pic.css" rel = "stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Red+Hat+Display:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lalezar&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Courier+Prime&family=Montserrat:wght@300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>



<script type="text/javascript">

	// id가 admin인 즉, 관리자만 글쓰기 버튼이 보이도록 설정
	$(document).ready(function(){

		var id = '<%= (String)session.getAttribute("id") %>';

		// 관리자만 Pic.jsp에서 글을 쓸 수 있게 설정 		
		if(id == 'admin'){
			$("#write_btndiv").append("<input type='button' class = 'write_btn' value = 'WRITE' onclick='writerCheck();'>");
		}
		
	});
	
	
	// Write버튼을 클릭하면 이동하도록 설정
	function writerCheck(){
		
		location.href='../Board/Pic_Write.jsp';
		
	}

	
</script>

</head>
<body>



<%
	

	// 한글 깨지는 것 방지
	request.getParameter("UTF-8");


	Pic_BoardDAO pdao = new Pic_BoardDAO();

	String search_key = "pic_subject";		// 검색 카테고리의 기본값 지정
	String search_word;						// 검색할 단어
	
	
	
	// 검색할 단어가 null이라면 request에서 받아옴
	if(request.getParameter("search_word") != null){
		search_word = request.getParameter("search_word");
		search_key = request.getParameter("search_key");
	}
	else{
		search_word = "";
	}
		
	
	// 전체 게시판의 글 개수 조회
	int count = pdao.get_PicBoardList_Count();
		
	// 검색할 단어가 있으면 count를 검색한 게시물의 개수로 변경
	if(search_word != ""){
		count = pdao.search_PicBoardCount(search_key, search_word);
	}
	
	
	
	
	// 한 페이지당 보여줄 게시물 개수
	int pageSize = 6;
	
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

	

	
	String id = (String)session.getAttribute("id");
%>










<!-- 헤더 부분 -->
<jsp:include page="../Inc/top.jsp"></jsp:include>














<!-- 메인 부분 -->
<article id = "main" style="height: auto; min-height: 1100px;">
	
	<input type = "hidden" name = "id" id = "id" value = "<%=id %>">

	<div class = "PicDiv">
		
		
		
		
		
		
		<div class = "Pic_Title">
			<h2>PIC</h2>
		</div>
		
		
		
		
		<div class = "PicboardDiv">
		
<%
			// 검색해서 나온 게시물들을 list라는 ArrayList에 저장
			ArrayList<Pic_BoardBean> list = pdao.search_PicBoard(startRow, pageSize, search_key, search_word);
	
			// list에 값이 있다면
			if(list.size() != 0){
				
				int br = 0;
	
				for(int i = 0; i < list.size(); i++){
					
					br++;
					
					Pic_BoardBean pbean = list.get(i);
%>
 					
					<div  class = "pic_infoDiv" 
						onclick="location.href ='Pic_Content.jsp?num=<%= pbean.getPic_num() %>&pageNum=<%= pageNum %>'">
						
						<!-- 이미지 파일을 가져와 보이도록 설정 -->
						<div class = "imgDiv">
						<img src="<%=request.getContextPath()%>/pic_downloadAction?file=
						<%=java.net.URLEncoder.encode(pbean.getPic_fileSystemName(),"UTF-8")%>"
						class = "Thumbnail_Photo">
						<span class = "cap<%=i%>"></span>
						</div>	
							
						<div class = "pic_subjectlist">
							<ul>
								<li><%= pbean.getPic_subject() %></li>
								<li><%= new SimpleDateFormat("yyyy.MM.dd").format(pbean.getPic_date()) %></li>
								<li class = displaynone><%= pbean.getPic_name() %></li>
								<li>HIT! ▶ <%= pbean.getPic_readcount() %></li>
							</ul>	

						</div> <!-- 게시물 정보 -->
						
				</div>
<% 			
			// 한줄에 게시물 3개만 나오도록, br이 3의 배수면 줄 바꿈
			if(br%3==0){
					
%>
				<br>
<%

			}
		}
		

	}

	// 만약 검색된 게시물이 없다면 출력
	else{
%>
	<ul>
		<li>
			<div>게시판에 글이 없습니다.</div>
		</li>
	</ul>	
<%	
	}
%>					
				
	
</div> <!-- 게시물 하나 전체를  감싸는 영역 -->
		

	<div class = "write_btndiv" id = "write_btndiv">
		<!-- 
			Write 버튼이 출력되는 공간 
			관리자만 보이도록 설정함
		 -->
	</div>

	
				
				
	<!-- 게시물 검색 부분  -->
	<form action = "Pic.jsp" name = "searchForm" class = "board_search" method="get">
				
		<fieldset class = "boardSearch">
					
			<legend>게시물 검색</legend>
						
			<p class = "displaynone"></p>
			<p class = "search_p">
					
				<select id = "search_key" name = "search_key">
					<option value ="pic_subject">제목</option>
					<option value ="pic_name">아이디</option>
				</select>

				
				<input type = "text" name = "search_word" id = "search_word" >
				<input type = "submit" id = "search_btn" class = "search_btn" value = "SEARCH">
			</p>
						
		</fieldset>				 
	</form>

	







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
			<a href ="Pic.jsp?pageNum=<%=startPage-pageBlock%>&search_key=<%=search_key%>&search_word=<%=search_word%>">PREV</a>

<%
			}
			
			for (int i = startPage; i <= endPage; i++){
%>	
			<ol>
				<li>
					<a href = "Pic.jsp?pageNum=<%=i%>&search_key=<%=search_key%>&search_word=<%=search_word%>"><%=i%></a>
				</li>
			</ol>		
<%
			}
			if(endPage < pageCount){
%>
			<a href = "Pic.jsp?pageNum=<%=startPage+pageBlock%>&search_key=<%=search_key%>&search_word=<%=search_word%>">NEXT</a>
			
		
<%			
				}
		}

%>
			

			
			
		</div>
</div>

</article>






<!-- 푸터 부분 -->
<jsp:include page="../Inc/bottom.jsp"></jsp:include>

</body>
</html>