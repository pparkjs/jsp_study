<%@page import="ch11.test.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="ch11.test.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% 
	BoardRepository rep = BoardRepository.getInstance();
	List<BoardVO> list = rep.selectBoardList();
%>
<c:set value="<%=list %>" var="board"/>
<body>
<!-- 
	첨부한 파일들을 확인 할 수 있는 자료실 페이지를 구성해주세요.
	- 자료실을 구성하는데 필요한 내용 모두는 board를 작성했던 방식을 참고하여 작성한다.
	
	1. 파일의 유형에 따라 유형에 맞는 default 이미지로 리스트를 구성하세요.
	
	[출력 예]
	
	자료실
	[pdf]	[excel]	[excel]	[ppt]
	[image] [txt]	[word]	[txt]
	[etc]	[etc]	[pdf]	[ppt]
	[...]
	
	목록 
 -->
 <h3>자료실</h3>
 <c:forEach items="${board}" var="board">
	 <img style="width:116px;" alt="" src="${pageContext.request.contextPath }/resources/files/${board.getFileName()}">
	  ${board.getFileName()}
 </c:forEach>
</body>
</html>