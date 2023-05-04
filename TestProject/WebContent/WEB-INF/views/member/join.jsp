<%@page import="kr.or.ddit.vo.MemberVO"%>
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
	MemberVO mem = (MemberVO)request.getAttribute("mem");
%>
<c:set value="<%=mem %>" var="mem"/>

<body>
<h1>회원가입</h1>
<form action="${pageContext.request.contextPath}/join.do" method="post">
	아이디 : <input type="text" class="jid" name="id" value="${mem.getMem_id()}"><br>
	비밀번호 : <input type="password" class="jpw" name="pw" value="${mem.getMem_pw()}"><br>
	이름 : <input type="text" class="jname" name="name" value="${mem.getMem_name()}"><br>
	<input type="submit" value="등록" name="join" id="joinBtn">
	<input type="button" value="뒤로" class="back">
</form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
$(function(){
	
	if("${mem}" != ""){
		alert("서버 에러!! 다시 시도해주세요!")
	}
	
	let join = $('#joinBtn');
	
	join.on('click', function(event){
		event.preventDefault();
		
		id = $('.jid').val();
		pw = $('.jpw').val();
		name = $('.jname').val();
		
		if(id == null || id == ""){
			alert("아이디를 입력하세요")
			$('.jid').focus();
			return false;
		}
		
		if(pw == null || pw == ""){
			alert("비밀번호를 입력하세요")
			$('.jpw').focus();
			return false;
		}
		
		if(name == null || name == ""){
			alert("이름을 입력하세요")
			$('.jname').focus();
			return false;
		}
		
		$('form').submit();
	})	
	
	$('.back').on("click", function(){
		location.href = "${pageContext.request.contextPath}/login.do";
	})
})
</script>
</html>