<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% response.setHeader("Refresh", "5"); %>
<%=new java.util.Date() %>
<a href="response_data.jsp">Google 홈페이지로 이동하기</a>
</body>
</html>