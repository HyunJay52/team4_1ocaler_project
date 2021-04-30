<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#toggle{
	position:relative;
}
#profile{
	width:200px; height:370px; background-color:#fff; border:1px solid #ddd; float:left;
}
#profile>ul>li:nth-child(1)>img{
	width:198px; height:180px;
}
#profile>ul>li:nth-child(2), #profile>ul>li:nth-child(3), #profile>ul>li:nth-child(4){
	margin:10px;
}
#profile>ul>li:nth-child(3){
	height:90px;
}
#profile>ul>li:nth-child(4){
	text-align:right;
}
.top{
	width:700px; height:370px; border-top:1px solid black; border-bottom:1px solid black; margin:0 50px; float:right; padding:90px 30px;
}
#grade{
	width:300px;
	float:left;
}
#myPoint{
	border:3px solid #3f1785;
	color:#3f1785;
	width:300px;
	float:right;
	padding:50px 30px;
	font-weight:bold;
	border-radius:5em;
}

#waiting{
	width:450px; float:left; margin-top:30px; margin-right:20px;
}
#status{
	width:530px; float:right; margin-top:30px; height:100px;
}
#status>div{
	height:60px; background-color:#ddd; border:1px solid #ddd; padding:10px;
}
#status>div>div{
	float:right; background-color:#fff; height:40px; width:420px;
}
#QnA{
	width:530px; float:right; margin-top:20px;
}
</style>	
<script>
	$(function(){

		//마음 세팅
		var tag = "";
		for(var i = 0; i <= 100; i += 10){
			tag += "<li><img src='img/myInfo/slider/heart"+i+".png'/></li>";
		}
		$("#slider").html(tag);			
		
		//시작 페이지 설정 변수
		var startSlide = 8;
		
		//bx슬라이더 셋팅
		$("#slider").bxSlider({
			mode : 'fade' // 'horizontal', 'vertical', 'fade'	
			, slideWidth:264
			, slideHeight:300
	//		, speed : 1000 // default : 500
			, auto :  false//자동시작 : true, false
	//		, randomStart : true //시작을 랜덤으로 : true false;
			, captions : false //설명을 표시 : true false img 태그의 타이틀 내용을 설명으로 표사
	//		, ticker : true // 자막처럼...
			, infiniteLoop : false // 반복여부
	//		, addaptiveHeight : true // 이미지 크기에 따라 높이 자동 조절
			, hideControlOnEnd : false // 컨트롤 버튼 처음과 끝을 표시할지 여부 infiniteLoop가 false일때 가능
			
			//easing
			, useCSS : true // easing 사용여부 (true: easing사용안함, false: easing사용함)
			, easing : 'easeOutElastic'
			
			, startSlide : startSlide
		}); 
		
		//등급만큼 이미지 띄우기
		if(startSlide > 0){
			var setPX = startSlide*20;
			$("#slider img").css('margin-left', setPX+'px');
		}
	});
</script>
<div class="myinfoBody"> 
	<!-- <button id="toggle" class="btn btn-outline-dark btn-light">||</button> -->
	
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	
	<div class="myinfoContainer">
	
		<div id="profile">
			<ul>
				<li><img src="<%=request.getContextPath()%>/img/myInfo/delivery/box.png"/></li>
				<li>${myVO.mem_nick}</li>
				<li>${myVO.loc_gu }</li>
				<li><input type="button" value="버튼" class="btn"/></li>
			</ul>
		</div>
		<div class="myinfoTop">
			<div id="grade">
				<h2>내 등급</h2>
				<ul id="slider">

				</ul>
				<span style="float:left; margin-left:28px;">0</span>
				<span style="float:right; margin-right:30px;">100(%)</span>
			</div>
			<div id="myPoint">
				<h2>잔액</h2>
				<h2 style="float:right">100,000원</h2>
			</div>
		</div>
		<div id="waiting">
			<span class="header">참여대기</span>
			<a href="#" style="float:right">더보기</a>
			<table class="myinfoTable2">
				<tr>
					<td>구분</td>
					<td>제목</td>
					<td>참여자</td>
					<td>날짜</td>
					<td>승인</td>
				</tr>
				<tr>
					<td>참여글</td>
					<td>신촌역</td>
					<td>goguma</td>
					<td>2021.04.16</td>
					<td><button class="btn btn-primary btn-block">참여됨</button></td>
				</tr>
					<tr>
					<td>내글</td>
					<td>서강대역</td>
					<td>gamja</td>
					<td>2021.04.17</td>
					<td><button class="btn btn-danger btn-block">승인하기</button></td>
				</tr>
				<tr>
					<td>참여글</td>
					<td>신촌역</td>
					<td>goguma</td>
					<td>2021.04.16</td>
					<td><button class="btn btn-primary btn-block">참여됨</button></td>
				</tr>
				<tr>
					<td>내글</td>
					<td>서강대역</td>
					<td>gamja</td>
					<td>2021.04.17</td>
					<td><button class="btn btn-danger btn-block">승인하기</button></td>
				</tr>
				<tr>
					<td>참여글</td>
					<td>신촌역</td>
					<td>goguma</td>
					<td>2021.04.16</td>
					<td><button class="btn btn-primary btn-block">참여됨</button></td>
				</tr>
				<tr>
					<td>내글</td>
					<td>서강대역</td>
					<td>gamja</td>
					<td>2021.04.17</td>
					<td><button class="btn btn-danger btn-block">승인하기</button></td>
				</tr>
				<tr>
					<td>내글</td>
					<td>서강대역</td>
					<td>gamja</td>
					<td>2021.04.17</td>
					<td><button class="btn btn-danger btn-block">승인하기</button></td>
				</tr>
			</table>
		</div>
		<div id="status">
			<span class="header">배송상태</span>
			<div>
				<label class="btn btn-primary">update</label>
				<div><a href="#">[나주베]배송이 시작되었습니다.</a></div>
			</div>
		</div>
		<div id="QnA">
		<span class="header">QnA</span>
		<a href="#" style="float:right">더보기</a>
		<table class="myinfoTable2">
				<tr>
					<td>제목</td>
					<td>유저</td>
					<td>날짜</td>
					<td>상태</td>
				</tr>
				<tr>
					<td>고구마 추가구매</td>
					<td>test</td>
					<td>2021-04-18</td>
					<td>답변대기</td>
				</tr>
				<tr>
					<td>셀러가입문의</td>
					<td>test2</td>
					<td>2021-04-18</td>
					<td>답변완료</td>
				</tr>
				<tr>
					<td>고구마 추가구매</td>
					<td>test</td>
					<td>2021-04-18</td>
					<td>답변대기</td>
				</tr>
				<tr>
					<td>셀러가입문의</td>
					<td>test2</td>
					<td>2021-04-18</td>
					<td>답변완료</td>
				</tr>
		</table>
		</div>
	</div>
</div>	
