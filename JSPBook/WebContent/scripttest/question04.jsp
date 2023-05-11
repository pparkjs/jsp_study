<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
#myProgress {
  width: 100%;
  background-color: #ddd;
}
#myBar {
  width: 10%;
  height: 30px;
  background-color: #04AA6D;
  text-align: center; /* To center it horizontally (if you want) */
  line-height: 30px; /* To center it vertically */
  color: white;
}
</style>
<script>
$(function(){
var cnt = 0;
	$('button').on('click',function(){
		$('.sr-only').text("0%")
		no=setInterval(() => {
			cnt += 1;
			var num = $('.sr-only').text()
			$('td').css('background', '')
			var rnd = parseInt(Math.random()*27);
			
			$('td:eq('+ rnd +')').css('background', 'yellow')
			$(".sr-only").text(cnt + '%')
			
			num = parseInt(num) + 1 + "%";

			if(num == "100%"){
				clearInterval(no)
			}
				
			
			$('#myBar').css('width', num)
			
			console.log(num)
		}, 100);
		
		
	})
	
	
	
})
</script>
<body>
	<caption>앞(SEM PC 자리)</caption>
	<table width="100%" border="1" style="text-align:center; font-size:24px;">
		<tr width="100%" height="80px">
			<td width="10%"></td>
			<td width="10%">전지혜</td>
			<td width="10%">신현근</td>
			<td width="10%">이지영</td>
			<td width="20%"></td>
			<td width="10%">김지완</td>
			<td width="10%">신국현</td>
			<td width="10%">이성일</td>
			<td width="10%"></td>
		</tr>
		<tr height="80px">
			<td>고영우</td>
			<td>정재균</td>
			<td>황지현</td>
			<td>박윤수</td>
			<td></td>
			<td>변정민</td>
			<td>정은지</td>
			<td>박정수</td>
			<td>조성희</td>
		</tr>
		<tr height="80px">
			<td>김민정</td>
			<td>박승우</td>
			<td>김동혁</td>
			<td>이수진</td>
			<td></td>
			<td>홍기태</td>
			<td>김민욱</td>
			<td>진현성</td>
			<td>오미나</td>
		</tr>
		<tr height="80px">
			<td></td>
			<td>구기현</td>
			<td>오대환</td>
			<td>전다미</td>
			<td></td>
			<td>배문기</td>
			<td>유이현</td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<hr/>
	<div class="progress" style="height: 40px;">
		<div class="progress-bar progress-bar-striped" id="myBar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
			aria-valuemax="100" style="width: 1px; height: 40px;">
			<span class="sr-only">0%</span>
		</div>
	</div>
	<br/>
	<h4 id="txt"></h4>
	<button type="button" style="padding:12px;border:none;cursor:pointer;">출력</button>
</body>
</body>
</html>