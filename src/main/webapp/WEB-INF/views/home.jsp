<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<script>
	document.title = "1ocler home";
	
	$(document).ready(function(){
		//같이가치 리스트 불러오기
		var url = "sendGroupList";
		var g_gu = '${logLoc_gu}';
		
		$.ajax({
			url: url,
			data: {'g_gu': g_gu},
			type : 'post',
			success: function(result){
				console.log(result);
				var $result = $(result); //ajax 결과값 변수에 담음
				var idx = 10;
				$result.each(function(idx, list){
					$("#gachiIndex").append(
							"<li><ul class='indexInnerUl'>"+
								"<li class='gachiPostTitle'><span class='gachiPoastTitle'>"+list.up_cate+"</span><input type='hidden' value='"+list.g_gu+"'/></li>"+
								"<li class='wordCut'>"+list.g_subject+"<input type='hidden' value='"+list.num+"'/></li>"+
								"<li>"+list.g_date+", "+list.g_time+"</li>"+
								"<li class='smlFnt'><img src='img/indexImg/bo_pin.png' class='gachiPostLoc'>"+list.g_loc1+"</li>"+
								"<li><span class='cntJoin'>"+list.g_joinCnt+"</span>/"+list.g_cnt+"명 </li>"+
								"<li><img src='common/user.png' class='gachiPostImg'/>&nbsp;&nbsp;<span>"+list.userid+"</span></li>"+
							"</ul></li>"
						);	
				})
			},
			error: function(error){
				console.log("리스트 불러오기 에러...", error);
			}
		});
		
		$(document).on('click', '#gachiIndex>li', function(){
			var goCate = $(this).children('ul').children('li:first-child').children('span').text();
			var g_gu = $(this).children('ul').children('li:first-child').children('input').val();
			var num = $(this).children('ul').children('li:nth-child(2)').children('input').val();
			
			console.log(num, "????", goCate, "???", g_gu)
			
			//번호비교하면 페이지 넘어감... 왜 span 값 비교 못함?
			if(goCate=="한끼미식회"){
				var addr = 'eatViewPage?num='+num+'&loc_gu='+g_gu+'&category=한끼미식회';
				console.log(addr, "???????", goCate)
				location.href= addr;
			}
			
			if(goCate=='가치가장'){
				//withViewPage?num=242&loc_gu=강서구&category=가치가장
				console.log( "???????", goCate)
				location.href='withViewPage?num='+num+'&loc_gu='+g_gu+"&category=가치가장";
			}
		})
	});
	
</script>

	<!-- bx-slider part -->
	<div id="slidersDiv">
		<div id="slider" class="carousel slide" data-ride="carousel">
			<!-- indicators -->
			<ul class="carousel-indicators sliderIndi">
				<li data-target="#slider" data-slide-to="0" class="active"></li>
				<li data-target="#slider" data-slide-to="1"></li>
				<li data-target="#slider" data-slide-to="2"></li>
			</ul>
			<!-- slide show -->
			<div class="carousel-inner">
				<div class="carousel-item active"><a href="joinMember"><img src="<%=request.getContextPath() %>/img/indexImg/banner2.png"/></a></div>
				<div class="carousel-item"><a href="joinSeller"><img src="<%=request.getContextPath() %>/img/indexImg/ad2.png"/></a></div>
				<div class="carousel-item"><a href="login"><img src="<%=request.getContextPath() %>/img/indexImg/banner1.png"/></a></div>
			</div>
			
			<!-- left and right controls -->
<!-- 			<a class="carousel-control-prev" href="#slider" data-slide="prev"> -->
<!-- 				<span class="carousel-control-prev-icon"></span> -->
<!-- 			</a> -->
<!-- 			<a class="carousel-control-next" href="#slider" data-slide="next"> -->
<!-- 				<span class="carousel-control-next-icon"></span> -->
<!-- 			</a>	 -->
		</div>
	</div>
	
<div id="indexMain">
	<%@ include file="/inc/sideBar.jspf" %>
	<!-- 게시판 부분 -->
	<div id="sell" class="indexDivWidth">
		<div id="selltitle" class="lgFnt indexBoardTitle">우리직구</div>
		
		<div class="mdFnt indexSubTitle"><img src="common/map_000.png" style="width: 25px; margin-right: 5px;">동네직구</div>
		<div class="selBoard">
			
			<ul class="boardText">
				<c:forEach var="mem" items="${memVO }" begin="1" end="10">
				<li class="selList" OnClick="location.href='sellView'">
					<div>
						<div>
							<img src="<%=request.getContextPath() %>/img/dealFileImg/${mem.s_img1 }" />
						</div>
						<ul>
							<li class="wordcut">${mem.s_subject }</li>
							<li><span class="priceSpan">${mem.s_price } 원</span></li>
							<li><span class="locationSpan wordCut">${mem.s_loc }</span></li>
							<li>${mem.s_date }</li>
							<li>${mem.userid } &nbsp; <img src="<%=request.getContextPath() %>/img/mem_prof/${mem.mem_prof}">&nbsp;&nbsp;</li>
						</ul>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="mdFnt indexSubTitle"><span class="indexSubTitleSpan">오늘의</span> "착한발견"</div>
		<div class="selBoard">
			<ul class="boardText">
				<c:forEach var="i" begin="1" end="10">
				<li class="selList" OnClick="location.href='sellView'">
					<div>
						<div>
							<img src="img/deal/food1.jpeg" />
						</div>
						<ul>
							<li class="wordcut">D.I.Y 오르골 엔틱소품</li>
							<li><span class="priceSpan">20,000 원</span></li>
							<li><span class="locationSpan wordCut">염창역</span>, 05/28</li>
							<li><span class="locationSpan wordCut">염창역</span>, 05/28</li>
							<li>goguma1234 &nbsp; <img src="common/user.png">&nbsp;&nbsp;</li>
						</ul>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<div id="gachi" class="indexDivWidth">
		<div id="gachititle" class="lgFnt indexBoardTitle"><span style="font-size: 14px; color: gray;">동네에서 찾는 이웃사촌</span><br/>가치가장</div>
		<ul id="gachiIndex" class="indexListNone">
			<!-- 반복문이 들어 갈 자리 -->
		</ul>
	</div>
	
	<div id="sggSak" class="indexDivWidth" style="margin-bottom: 100px;">
		<div class="lgFnt indexBoardTitle"><span style="font-size: 14px; color: gray;">오늘뭐해먹지?</span><br/>#쓱싹레시피</div>
		<ul class="indexListNone">
			<li><a href="commuBoard"><img src="img/indexImg/food1.jpeg"/></a></li>
			<li><a href="commuBoard"><img src="img/indexImg/food2.jpeg"/></a></li>
			<li><a href="commuBoard"><img src="img/indexImg/food3.jpeg"/></a></li>
			<li><a href="commuBoard"><img src="img/indexImg/food4.jpeg"/></a></li>
			<li><a href="commuBoard"><img src="img/indexImg/food5.jpeg"/></a></li>
			<li><a href="commuBoard"><img src="img/indexImg/food1.jpeg"/></a></li>
			<li><a href="commuBoard"><img src="img/indexImg/food2.jpeg"/></a></li>
			<li><a href="commuBoard"><img src="img/indexImg/food3.jpeg"/></a></li>
			<li><a href="commuBoard"><img src="img/indexImg/food4.jpeg"/></a></li>
			<li><a href="commuBoard"><img src="img/indexImg/food5.jpeg"/></a></li>
			<li><a href="commuBoard"><img src="img/indexImg/food4.jpeg"/></a></li>
			<li><a href="commuBoard"><img src="img/indexImg/food5.jpeg"/></a></li>
		</ul>
	</div>
	
<!-- 	<div style="width:350px; height: 700px; background-color: pink; float:left; margin-right: 20px;"></div> -->
<!-- 	<div style="width:900px; height: 700px; background-color: yellow; float:left; "></div> -->
</div>
