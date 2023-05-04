<%@page import="ch11.test.BoardRepository"%>
<%@page import="ch11.test.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionBoard_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
	1. 게시글 수정을 처리해주세요.
		> 수정 성공 후, 상세보기 페이지(boardView.jsp)로 이동해주세요.
		> 수정 실패 후, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
 -->
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	int no = Integer.parseInt( request.getParameter("no"));
	int hit = Integer.parseInt( request.getParameter("hit"));
	String fileName = request.getParameter("fileName");
	
	BoardVO vo = new BoardVO();
	BoardRepository rep = BoardRepository.getInstance();
	
	vo.setHit(hit);
	vo.setTitle(title);
	vo.setWriter(writer);
	vo.setContent(content);
	vo.setNo(no);
	vo.setRegDate(rep.getCurrenTime());
	vo.setFileName(fileName);
	
	rep.updateBoard(vo);	
	
	
	response.sendRedirect("boardView.jsp?no="+no);
	
	
%>

</body>
</html>