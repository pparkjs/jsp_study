<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<% BoardVO board = (BoardVO)session.getAttribute("board"); %>
<% MemberVO mem = (MemberVO)session.getAttribute("member"); %>
<c:set value="<%=board %>" var="board"/>
<c:set value="<%=mem %>" var="mem"/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시판 상세정보</h1>
<br>
	<p> 제목 : ${board.getBo_title()}</p>
	<span>작성자 : ${board.getBo_writer()}</span>
	<span style="margin-left: 30px"> ${board.getBo_regdate()}</span>
	<p> 내용 : ${board.getBo_content()}</p>
	<c:choose>
		<c:when test="${mem.getMem_id() == board.getBo_writer()}">
			<button class="act" id="modify">수정</button>	
			<button class="act" id="delete">삭제</button>	
		</c:when>
	</c:choose>
	<button class="act" id="back">목록</button>	
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
$(function(){
	if("${board.getBo_no()}" == "null" || "${board.getBo_no()}" == ''){
		alert("삭제된 게시글 입니다.")
		location.href = "${pageContext.request.contextPath}/boardList.do";
	}
	
	$(".act").on('click', function(){
		let act = $(this).attr('id')
		
		if(act == 'modify'){
			location.href = "${pageContext.request.contextPath}/boardUpdate.do?boNo=${board.getBo_no()}";
		}
		
		if(act == 'delete'){
			if(confirm('정말 삭제하시겠습니까?')){
				location.href = "${pageContext.request.contextPath}/boardDelete.do?boNo=${board.getBo_no()}";
			}
		}
		
		if(act == 'back'){
			location.href = "${pageContext.request.contextPath}/boardList.do";
		}
	})
})
</script>
</html>