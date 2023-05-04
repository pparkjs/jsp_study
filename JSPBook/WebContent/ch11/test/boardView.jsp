<%@page import="ch11.test.BoardVO"%>
<%@page import="ch11.test.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
 	board.setHit(board.getHit() + 1);
 %>
<c:set value="<%=board %>" var="board"/>
<!--
	1. 게시글 상세보기를 출력해주세요.
		> JSTL을 활용해주세요. 
	
	[출력 예]
	
	게시판 상세보기
	──────────────────────────────────────────────
	제목 : 
	작성자 작성일 조회수
	──────────────────────────────────────────────
	내용
	──────────────────────────────────────────────
	
	[ 수정  ] [ 삭제  ] [ 목록  ]
	
	2. 수정 버튼 클릭 시, 수정 페이지(boardUpdateForm.jsp)로 이동합니다.
	3. 삭제 버튼 클릭 시, 해당 게시글이 삭제 처리 될 수 있도록 합니다.
		> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [확인]버튼을 클릭 시 삭제가 처리(boardRemove.jsp) 될 수 있도록 해주세요.
		> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [취소]버튼을 클릭 시 알림창이 꺼질 수 있게 해주세요.
	4. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동합니다.
 -->
<p>게시판 상세보기</p>
______________________________________________________<br>
제목 : ${board.getTitle()}<br>
작성자 : ${board.getWriter()} 작성일 : ${board.getRegDate()} 조회수 : ${board.getHit()}<br>
______________________________________________________<br>
내용 : ${board.getContent() }<br>
______________________________________________________
<br>

[ <input type="button" value="수정" onclick="location.href = 'boardUpdateForm.jsp?no=${board.getNo()}'" > ] ]
[ <input type="button" value="삭제" onclick="delCheck()"> ]
[ <input type="button" value="목록" onclick="location.href = 'boardList.jsp'">]

</body>
<script>
function delCheck(){
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href="boardRemove.jsp?no=${board.getNo()}"	
	}	
}
</script>
</html>