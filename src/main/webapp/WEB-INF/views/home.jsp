<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%@ include file="/inc/sideBar.jspf" %>

<style>
	#sliderDiv {
		width: 100%;
		margin-top: 20px;
	}
	#slider {
		width: 100%;
	}
	.carousel-inner img{
		width: 100%; height: 400px;
	}
	#indexMain {
		width: 1300px; height: auto;
		margin: 0px auto;
	}
	#indexMain>div {
		margin-top: 100px;
	}
	#sell, #sell ul, #sell>ul li, #gachi, #gachi>ul, #sggSak, #sggSak>ul {
		text-align: center;
	}
	#sell>ul, #gachi>ul, #sggSak>ul {
		heigh
		text-align: center;
	}
	#sell>ul li, #gachi>ul li {
		display: inline-block;
	}
	#sell>ul li {
		width: 220px; height: 300px; border: 1px solid #ddd;
	}
	#gachi>ul>li {
		width: 220px; height: 250px; border: 1px solid #000; margin: 5px;
	}
	 #sggSak>ul img {
	 	width: 100%; height: 100%;
	 	border-radius: 10%;
	 	opacity: 90%;
	}
	#sggSak>ul li {
		width: 200px; height: 200px;
		display: inline-block;
	}
	.listNone {
		list-style-type: none;
		width: 1250px;
	}
	.divWidth {
		width: 1300px; height: auto;
		margin: 0 auto;
	}
	.sliderIndi {
		margin: 0 auto;
		width: 700px; height: 40px; 
	}
	.wordCut {
		white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
	}
	.innerUl {
		width: 200px; height: auto;
		margin: auto;
	}
	.carousel-control-prev, .carousel-control-next {
		width: 100px;
	}
	#gachi .innerUl>li{
		width: 200px;
		height: 40px; line-height: 40px;
		padding-left: 5px; padding-right: 5px;
	}
	#gachi .innerUl>li:nth-of-type(1) {
		margin-top: 10px;
	}
	#gachi .innerUl>li:nth-of-type(2) {
		height: 50px; line-height: 50px;
	}
	#gachi .innerUl>li:nth-of-type(2), #gachi .innerUl>li:nth-of-type(3), #gachi .innerUl>li:nth-of-type(4){
		height: 35px;
		text-align: left;
	}
	#gachi .innerUl>li:nth-of-type(5), #gachi .innerUl>li:nth-of-type(6){
		text-align: right;
	}
	#gachi .innerUl>li:nth-of-type(5) {
		padding-right: 10px;
	}
	.innerUl>li:last-child>img {
		width: 30px; height: 30px;
		border-radius: 70%;
	}
	.cntJoin {
		font-size: 22px; font-weight:bold; color: #3f1785;
	}

</style>

<script>
	document.title = "1ocler home";
	
	$(function(){
		//bxslider 넣을 부분
		
		//우리직구 게시판 클릭시 이동 이벤트
		$("#sell>ul li").on('click', function(){
			alert("우리직구 클릭함");
			location.href="#";
		})
		
		//가치가장 게시판 클릭시 이동 이벤트
		$(".innerUl").click(function(){
			alert("ul 클릭함 ");
			location.href="#";
		})
		
		//쓱싹레시피 게시판 클릭시 이동 이벤트
		$("#sggSak li").on('click', function(){
			alert("쓱싹 레시피 클릭함");
			location.href="#";
		})
		
		//사이드바 색깔 변경
		$(window).on("scroll", function(){
			var scrollTop = $(this).scrollTop();
			if(scrollTop==0){
// 				$("#sideBar li a img").attr("src", $("#sideBar li a img").attr("src").replace("000.png", "fff.png"));
			}
			if(scrollTop>0){
// 				$("#sideBar li a img").attr("src", $("#sideBar li a img").attr("src").replace("fff.png", "000.png"));
			}
		});
		
	});
	
	//배열 이미지 대입 
	
	
</script>

	<!-- bx-slider part -->
	<div id="sliderDiv">
		<div id="slider" class="carousel slide" data-ride="carousel">
			<!-- indicators -->
			<ul class="carousel-indicators sliderIndi">
				<li data-target="#slider" data-slide-to="0" class="active"></li>
				<li data-target="#slider" data-slide-to="1"></li>
				<li data-target="#slider" data-slide-to="2"></li>
			</ul>
			<!-- slide show -->
			<div class="carousel-inner">
				<div class="carousel-item active"><a href="joinMember"><img src="<%=request.getContextPath() %>/img/indexImg/ad1.png"/></a></div>
				<div class="carousel-item"><a href="login"><img src="<%=request.getContextPath() %>/img/indexImg/ad1.png"/></a></div>
				<div class="carousel-item"><a href="login"><img src="<%=request.getContextPath() %>/img/indexImg/ad1.png"/></a></div>
			</div>
			
			<!-- left and right controls -->
			<a class="carousel-control-prev" href="#slider" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a>
			<a class="carousel-control-next" href="#slider" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>	
		</div>
	</div>
	
<div id="indexMain">
	<!-- 게시판 부분 -->
	<div id="sell" class="divWidth">
		<div class="lgFnt" style="font-family: nsreb; padding-bottom: 20px">우리직구</div>
		
		<div class="mdFnt" style="font-family: nsr; padding-bottom: 5px"><img src="common/map_000.png" style="width: 25px; margin-right: 5px;">동네직구</div>
		<ul class="listNone">
			<li>아이템1</li>
			<li>아이템2</li>
			<li>아이템3</li>
			<li>아이템3</li>
		</ul>
		
		<div class="mdFnt" style="font-family: nsr; padding-bottom: 5px"><span style="font-size: 18px">오늘의</span> "착한발견"</div>
		<ul class="listNone">
			<li>아이템1</li>
			<li>아이템2</li>
			<li>아이템3</li>
			<li>아이템3</li>
		</ul>
	</div>
	
	<div id="gachi" class="divWidth">
		<div class="lgFnt" style="font-family: nsreb; padding-bottom: 20px;">가치가장</div>
		<ul class="listNone">
			<li>
				<ul class="innerUl">
					<li><img src="img/indexImg/dinner.png" style="width:30px;"/><span style="font-size: 18px; font-weight: bold;">&nbsp;한끼미식회</span></li>
					<li class="wordCut">해물찜 같이 드실 분?해물찜 같이 드실 분?</li>
					<li>04/29 15:00</li>
					<li class="smlFnt"><img src="img/indexImg/bo_pin.png" style="width: 15px; margin-bottom: 5px;"> 마포구청역 3번 출구</li>
					<li>
						<span class="cntJoin">1</span> / 3 명
					</li>
					<li class="smlFnt">goguma1234 &nbsp;&nbsp;<img src="common/user.png"/></li>
				</ul>
			</li>
			<li>
				<ul class="innerUl">
					<li><img src="img/indexImg/dinner.png" style="width:30px;"/><span style="font-size: 18px; font-weight: bold;">&nbsp;한끼미식회</span></li>
					<li class="wordCut">해물찜 같이 드실 분?해물찜 같이 드실 분?</li>
					<li>04/29 15:00</li>
					<li class="smlFnt"><img src="img/indexImg/bo_pin.png" style="width: 15px; margin-bottom: 5px;"> 마포구청역 3번 출구</li>
					<li>
						<span  class="cntJoin">1</span> / 3 명
					</li>
					<li class="smlFnt">goguma1234 &nbsp;&nbsp;<img src="common/user.png"/></li>
				</ul>
			</li>
			<li>
				<ul class="innerUl">
					<li><img src="img/indexImg/dinner.png" style="width:30px;"/><span style="font-size: 18px; font-weight: bold;">&nbsp;한끼미식회</span></li>
					<li class="wordCut">해물찜 같이 드실 분?해물찜 같이 드실 분?</li>
					<li>04/29 15:00</li>
					<li class="smlFnt"><img src="img/indexImg/bo_pin.png" style="width: 15px; margin-bottom: 5px;"> 마포구청역 3번 출구</li>
					<li>
						<span class="cntJoin">1</span> / 3 명
					</li>
					<li class="smlFnt">goguma1234 &nbsp;&nbsp;<img src="common/purplebg.jpeg"/></li>
				</ul>
			</li>
			<li>
				<ul class="innerUl">
					<li><img src="img/indexImg/dinner.png" style="width:30px;"/><span style="font-size: 18px; font-weight: bold;">&nbsp;한끼미식회</span></li>
					<li class="wordCut">해물찜 같이 드실 분?해물찜 같이 드실 분?</li>
					<li>04/29 15:00</li>
					<li class="smlFnt"><img src="img/indexImg/bo_pin.png" style="width: 15px; margin-bottom: 5px;"> 마포구청역 3번 출구</li>
					<li>
						<span class="cntJoin">1</span> / 3 명
					</li>
					<li class="smlFnt">goguma1234 &nbsp;&nbsp;<img src="common/alarm_000.png"/></li>
				</ul>
			</li>
			<li>
				<ul class="innerUl">
					<li><img src="img/indexImg/dinner.png" style="width:30px;"/><span style="font-size: 18px; font-weight: bold;">&nbsp;한끼미식회</span></li>
					<li class="wordCut">해물찜 같이 드실 분?해물찜 같이 드실 분?</li>
					<li>04/29 15:00</li>
					<li class="smlFnt"><img src="img/indexImg/bo_pin.png" style="width: 15px; margin-bottom: 5px;"> 마포구청역 3번 출구</li>
					<li>
						<span class="cntJoin">1</span> / 3 명
					</li>
					<li class="smlFnt">goguma1234&nbsp;&nbsp;<img src="common/user.png"/></li>
				</ul>
			</li>
		</ul>
	</div>
	
	<div id="sggSak" class="divWidth" style="margin-bottom: 100px;">
		<div class="lgFnt" style="font-family: nsreb; padding-bottom: 20px;">#쓱싹레시피</div>
		<ul class="listNone">
			<li><a href="#"><img src="img/indexImg/food1.jpeg"/></a></li>
			<li><a href="#"><img src="img/indexImg/food2.jpeg"/></a></li>
			<li><a href="#"><img src="img/indexImg/food3.jpeg"/></a></li>
			<li><a href="#"><img src="img/indexImg/food4.jpeg"/></a></li>
			<li><a href="#"><img src="img/indexImg/food5.jpeg"/></a></li>
		</ul>
	</div>
</div>

<%@ include file="/inc/footer.jspf" %>
</body>
</html>
