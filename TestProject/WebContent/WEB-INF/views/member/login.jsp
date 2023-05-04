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
	String res = request.getParameter("res");
	String error = request.getParameter("error");
%>
	<c:set value="<%=res %>" var="res"/>
	<c:set value="<%=error%>" var="error"/>
	
<form action="${pageContext.request.contextPath}/login.do" method="post">
	<h1> 로그인 </h1>
	아이디 : <input type="text" name="id" class="id"><br>
	비밀번호 : <input type="password" name="pw" class="pw"><br>
	<input type="submit" value="로그인 " name="loginBtn" class="login">
	<input type="button" value="회원가입" class="joinBtn">
</form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	if("${error}" == "1"){
		alert("존재하지 않는 회원입니다.")
	}
	
	if("${res}" == "1"){
		alert("회원가입에 성공하였습니다.")
	}
	
	$(".joinBtn").on("click", function(){
		location.href = "${pageContext.request.contextPath}/join.do";
	})
	
	$('.login').on("click", function(event){
		event.preventDefault();
		
		let id = $('.id').val();
		let pw = $('.pw').val();
		
		if(id == ""){
			alert("아이디를 입력해주세요");
			$('.id').focus();
			return false;
		}
		
		if(pw == ""){
			alert("비밀번호를 입력해주세요");
			$('.pw').focus();
			return false;
		}
		
		$('form').submit();
		
	})
	
	
})
</script>

</html>