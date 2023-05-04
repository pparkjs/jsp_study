<%@page import="ch11.test.BoardRepository"%>
<%@page import="ch11.test.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	BoardRepository rep = BoardRepository.getInstance();
	BoardVO board = rep.getBoardById(no);
%>
<c:set value="<%=board %>" var="board"/>
<!-- 
	1. 게시판 수정 페이지를 작성해주세요.
	
	[출력 예]
	
	게시글 등록
	─────────────────────────────
	제목 : 제목입니다1
	작성자 : 홍길동
	내용 : 내용입니다1
	─────────────────────────────
	[ 수정  ] [ 목록 ]
	
	2. 수정 버튼 클릭 시, 게시글 수정(boardUpdate.jsp)을 진행해주세요.
	3. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동해주세요. 
 -->
   <h3>게시글 수정</h3>
 <form action="boardUpdate.jsp" method="post">
 	<input type="hidden" name="fileName" value="${board.getFileName()}">
 	<input type="hidden" name="hit" value="${board.getHit()}">
 	<input type="hidden" name="no" value="${board.getNo()}">
 	제목 : <input type="text" name="title" value="${board.getTitle()}"><br>
 	작성자 : <input type="text" name="writer" value="${board.getWriter()}"><br>
 	내용 : <input type="text" name="content" value="${board.getContent()}"><br>
 	<input type="submit" value="수정">
 	<input type="button" value="목록 " onclick="location.href = 'boardList.jsp'">
 </form>
</body>
</html>