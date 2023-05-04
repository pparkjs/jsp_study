<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<% BoardVO board = (BoardVO)session.getAttribute("board"); %>
<c:set value="<%=board %>" var="board"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 게시판 수정 </h1>
<form action="${pageContext.request.contextPath}/boardUpdate.do?boNo=${board.getBo_no()}" method="post">
	제목 : <input type="text" id="title" name="title" value="${board.getBo_title()}"> <br>
	내용 : <input type="text" id="content" name="content" value="${board.getBo_content()}"> <br>
	<input type="submit" class="modi" value="수정하기">
	<input type="button" value="목록" id="list_back">
</form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	

	
	$('.modi').on('click', function(event){
		event.preventDefault();
		
		title = $('#title').val();
		content = $('#content').val();
		
		if(title == "" || title == null){
			alert("제목을 입력해주세요")
			return false;	
		}
		
		if(content == "" || content == null){
			alert("내용을 입력해주세요")
			return false;	
		}
		
		$('form').submit();
		
	})
	
	$('#list_back').on('click', function(){
		location.href = "${pageContext.request.contextPath}/boardList.do";
	})
})
</script>
</html>