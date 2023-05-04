<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>게시글 등록</h1>
<form action="${pageContext.request.contextPath}/boardInsert.do" method="post">
	제목 : <input type="text" id="title" name="title"> <br>
	내용 : <input type="text" id="content" name="content"> <br>
	<input type="submit" id="ins" value="등록하기">
	<input type="button" value="목록" id="list_back">
</form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
cnt = 0;
$(function(){
	

	
	$('#ins').on('click', function(event){
		event.preventDefault();
		
		let title = $('#title').val();
		let content = $('#content').val();
		
		if(title == ""){
			alert("제목을 입력해주세요")
			return false;	
		}
		
		if(content == ""){
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