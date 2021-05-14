<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<script>
	document.title = "1ocler home";
	
	$(document).ready(function(){
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
							"<li class='gachiPostTitle'><span class='gachiPoastTitle'>&nbsp;"+list.up_cate+"</span></li>"+
							"<li class='wordCut'>"+list.g_subject+"</li>"+
							"<li>"+list.g_date+", "+list.g_time+"</li>"+ //g_time undefined error 해결 필요 
							"<li class='smlFnt'><img src='img/indexImg/bo_pin.png' class='gachiPostLoc'>"+list.g_loc1+"</li>"+
							"<li><span class='cntJoin'>"+list.g_joinCnt+"</span>/"+list.g_cnt+"명 </li>"+
							"<li><span>"+list.userid+"</span>&nbsp;&nbsp;<img src='common/user.png' class='gachiPostImg'/></li>"+
							"</ul></li>"
						);	
				})
			},
			error: function(error){
				console.log("리스트 불러오기 에러...", error);
			}
		});
		
	
	});
   }
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
				<c:forEach var="i" begin="1" end="4">
				<li class="selList" OnClick="location.href='sellView'">
					<div>
						<div>
							<img src="img/deal/food1.jpeg" />
						</div>
						<ul>
							<li class="wordcut">D.I.Y 오르골 엔틱소품</li>
							<li><span class="cntJoin">&nbsp;&nbsp;5</span> /160개</li>
							<li>20,000원</li>
							<li class="wordcut">#오르골 #DIY #엔틱소품 #소품</li>
							<li>goguma1234 &nbsp; <img src="common/user.png">&nbsp;&nbsp;
							</li>
						</ul>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="mdFnt indexSubTitle"><span class="indexSubTitleSpan">오늘의</span> "착한발견"</div>
		<div class="selBoard">
			<ul class="boardText">
				<c:forEach var="i" begin="1" end="4">
				<li class="selList">
					<div OnClick="location.href='sellView'">
						<div>
							<img src="img/deal/div.jfif" />
						</div>
						<ul>
							<li class="wordcut">D.I.Y 오르골 엔틱소품</li>
							<li><span class="cntJoin">&nbsp;&nbsp;5</span> /160개</li>
							<li>20,000원</li>
							<li class="wordcut">#오르골 #DIY #엔틱소품 #소품</li>
							<li>goguma1234 &nbsp; <img src="common/user.png">&nbsp;&nbsp;
							</li>
						</ul>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<div id="gachi" class="indexDivWidth">
		<div id="gachititle" class="lgFnt indexBoardTitle">가치가장</div>
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
