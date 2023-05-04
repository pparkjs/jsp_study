<%@page import="kr.or.ddit.vo.PageVO"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<% 
	MemberVO mem = (MemberVO)session.getAttribute("member");
	List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
	PageVO pageInfo = (PageVO)request.getAttribute("pageInfo");
%>
<c:set value="<%=list %>" var="list"/>
<c:set value="<%=mem %>" var="mem"/>
<c:set value="<%=pageInfo %>" var="pageInfo"/>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul li{margin-right:29px;}
.pagination{ margin-left: 282px;}
.pagination a {text-decoration: none; color: black;}
.selected{background: black; color:white;}
</style>
</head>
<body>
<h1>게시판 목록</h1>

<form action="${pageContext.request.contextPath}/boardList.do" style="margin-bottom: 20px;">
	<select name="type">
		<option value="">전체</option>
		<option value="bo_writer" <c:if test='${pageInfo.getStype() == "bo_writer"}'>selected</c:if>>작성자</option>
		<option value="bo_title" <c:if test='${pageInfo.getStype() == "bo_title"}'>selected</c:if>>제목</option>
		<option value="bo_content" <c:if test='${pageInfo.getStype() == "bo_content"}'>selected</c:if>>내용</option>
	</select>
	<input type="text" name="word" placeholder="제목 검색" value="${pageInfo.getSword()}">
	<input type="hidden" name="page" value="1">
	<input type="submit" value="검색">
	<a href="${pageContext.request.contextPath}/login.do" style="text-decoration: none; color:black; margin-left : 100px; margin-bottom: 60px;">로그아웃</a>
</form>
<div style="height:130px;">
	<table border="1"  style="text-align: center; border-collapse:collapse;"> 
		<tr  style="background: blue; color:white;">
			<td style="width: 70px;">번호</td>
			<td style="width: 400px;">제목</td>
			<td style="width: 120px;">작성자</td>
			<td style="width: 150px;">작성일</td>
			<td style="width: 140px;">조회수</td>
		</tr>
		<c:choose>
			<c:when test="${list.size() == 0}">
				<tr>
					<td colspan="5">조회하실 게시글이 존재하지 않습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.getBo_no()}</td>
					<td><a href="${pageContext.request.contextPath}/boardView.do?boNo=${list.getBo_no()}" style="text-decoration: none; color: black;">${list.getBo_title()}</a></td>
					<td>${list.getBo_writer()}</td>
					<td>${list.getBo_regdate() }</td>
					<td>${list.getBo_hit()}</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
</table>
</div>
<br>
<div class="pagination">
	<ul style="list-style: none; display:flex; ">
	
		<!-- 검색 키워드가 있거나 없는 경우 -->
		<c:choose>
			<c:when test="${pageInfo.getCulPageNum() > 4 && !empty pageInfo.getSword() && !empty pageInfo.getStype()}">
				<li><a href="${pageContext.request.contextPath}/boardList.do?page=${pageInfo.getStartPageNum() - 4 }&type=${pageInfo.getStype()}&word=${pageInfo.getSword()}">◀</a></li>
			</c:when>	
			<c:when test="${pageInfo.getCulPageNum() > 4 }">
				<li><a href="${pageContext.request.contextPath}/boardList.do?page=${pageInfo.getStartPageNum() - 4 }">◀</a></li>
			</c:when>	
		</c:choose>
		
        <c:forEach var="i" begin="${pageInfo.getStartPageNum() }" end="${pageInfo.getEndPageNum() }">
            <c:choose>
                <c:when test="${ i == pageInfo.getCulPageNum() }">
                    <li class="selected">${ i }</li>
                </c:when>
                <c:when test="${!empty pageInfo.getSword() && !empty pageInfo.getStype()}">
                    <li><a href="${pageContext.request.contextPath}/boardList.do?page=${ i }&type=${pageInfo.getStype()}&word=${pageInfo.getSword()}">${ i }</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageContext.request.contextPath}/boardList.do?page=${ i }">${ i }</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        
        <!-- 검색 키워드가 있거나 없는 경우 -->
        <c:choose>
	        <c:when test="${pageInfo.getTotalPageNum() > pageInfo.getEndPageNum() && !empty pageInfo.getSword() && !empty pageInfo.getStype()}">
				<li><a href="${pageContext.request.contextPath}/boardList.do?page=${pageInfo.getEndPageNum() + 1 }&type=${pageInfo.getStype()}&word=${pageInfo.getSword()}">▶</a></li>
			</c:when>	
	        
			<c:when test="${pageInfo.getTotalPageNum() > pageInfo.getEndPageNum()}">
				<li><a href="${pageContext.request.contextPath}/boardList.do?page=${pageInfo.getEndPageNum() + 1 }">▶</a></li>
			</c:when>	
		</c:choose>
		
	</ul>
</div>
<a href="${pageContext.request.contextPath}/boardInsert.do" style="text-decoration: none; color: black; margin-left: 100px;">게시글 등록</a>
</body>
</html>