<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.6.4.js"></script>
<script>
$(function(){
	var text = "";
	var obj;
	var flag = false;
	var idText = "";
	var his = document.querySelector("#history");
	$('.dtext').on('click',function(){
		if(flag){
			flag = false;
			
			obj.html($(this).html())
			$(this).html(text)
			
			text = "";
			obj = null;
			
			idText += $(this).attr("id") + "가 출력되었습니다! <br>"
			$(".dtext").css("background", "white");
			his.innerHTML = idText;
			his.scrollTop = his.scrollHeight;
		}else{
			flag = true;
			text = $(this).html();
			obj = $(this);
			idText += $(this).attr("id") + "가 출력되었습니다! <br>"
			$(this).css("background", "yellow");
			his.innerHTML = idText;
			
			his.scrollTop = his.scrollHeight;
			console.log(his.scrollHeight)
		}
	})
	
	$("#pBtn").on("click", function(){
		var txt = $("#content").val()
		var selNum = $("#boxSelect").val()
		
		if(selNum == 1){
			$('#firstDiv').html(txt);
		}
		if(selNum == 2){
			$('#secondDiv').html(txt);
		}
		if(selNum == 3){
			$('#thirdDiv').html(txt);
		}
		if(selNum == 4){
			$('#fourDiv').html(txt);
		}
		
	})
	
})
</script>
<style>
.dtext{
	width : 400px;
	height : 60px;
	border : 1px solid black;
}
</style>
</head>
<body>
	<!-- 
		총 4가지의 div가 있습니다.
		제일 먼저 선택한(클릭) div에 있는 텍스트를 
		두번째 눌린 div로 옮기는데 이때, 서로 박스에 들어있는 텍스트를 교체한다.
	 -->
	<div class="dtext" id="firstDiv">첫번째 박스</div>
	<div class="dtext" id="secondDiv">두번째 박스</div>
	<div class="dtext" id="thirdDiv">세번째 박스</div>
	<div class="dtext" id="fourDiv">네번째 박스</div>
	
	<br/>
	<hr/>
	<br/>
	
	<div style="overflow-y: scroll; border : 1px solid black; height:100px;" id="history">
	</div>
	<!-- 
		아래 select box에 있는 박스 순서를 선택하고
		출력 할 텍스트를 입력 후에 출력 버튼을 클릭 시,
		내가 입력한 텍스트가 선택한 div 박스안에 
		내가 입력한 텍스트가 추가로 출력되게 해주세요.
	 -->
	<select id="boxSelect">
		<option value="1">첫번째 박스</option>
		<option value="2">두번째 박스</option>
		<option value="3">세번째 박스</option>
		<option value="4">네번째 박스</option>
		<option value="5">모든 박스</option>
	</select>
	<input type="text" id="content"/>
	<input type="button" value="출력" id="pBtn"/>
</body>
</html>