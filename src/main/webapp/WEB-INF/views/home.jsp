<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<script>
	document.title = "1ocler home";
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
				<div class="carousel-item"><a href="joinSeller"><img src="<%=request.getContextPath() %>/img/indexImg/ad1.png"/></a></div>
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
	<%@ include file="/inc/sideBar.jspf" %>
	<!-- 게시판 부분 -->
	<div id="sell" class="indexDivWidth">
		<div id="selltitle" class="lgFnt indexBoardTitle">우리직구</div>
		
		<div class="mdFnt indexSubTitle"><img src="common/map_000.png" style="width: 25px; margin-right: 5px;">동네직구</div>
		<div class="selBoard">
			<ul class="boardText">
				<c:forEach var="i" begin="1" end="5">
				<li class="selList">
					<div OnClick="location.href='sellView'">
						<div>
							<img src="img/deal/Karrot.jpeg" />
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
				<c:forEach var="i" begin="1" end="5">
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
		<ul class="indexListNone">
			<li>
				<ul class="indexInnerUl">
					<li class="gachiPostTitle"><img src="img/indexImg/dinner.png" class="gachiPostImg"/><span class="gachiPoastTitle">&nbsp;한끼미식회</span></li>
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
				<ul class="indexInnerUl">
					<li><img src="img/indexImg/dinner.png" class="gachiPostImg"/><span class="gachiPoastTitle">&nbsp;한끼미식회</span></li>
					<li class="wordCut">해물찜 같이 드실 분?해물찜 같이 드실 분?</li>
					<li>04/29 15:00</li>
					<li class="smlFnt"><img src="img/indexImg/bo_pin.png" class="gachiPostLoc"> 마포구청역 3번 출구</li>
					<li>
						<span  class="cntJoin">1</span> / 3 명
					</li>
					<li class="smlFnt">goguma1234 &nbsp;&nbsp;<img src="common/user.png"/></li>
				</ul>
			</li>
			<li>
				<ul class="indexInnerUl">
					<li><img src="img/indexImg/dinner.png" class="gachiPostImg"/><span class="gachiPoastTitle">&nbsp;한끼미식회</span></li>
					<li class="wordCut">해물찜 같이 드실 분?해물찜 같이 드실 분?</li>
					<li>04/29 15:00</li>
					<li class="smlFnt"><img src="img/indexImg/bo_pin.png" class="gachiPostLoc"> 마포구청역 3번 출구</li>
					<li>
						<span class="cntJoin">1</span> / 3 명
					</li>
					<li class="smlFnt">goguma1234 &nbsp;&nbsp;<img src="common/purplebg.jpeg"/></li>
				</ul>
			</li>
			<li>
				<ul class="indexInnerUl">
					<li><img src="img/indexImg/dinner.png" class="gachiPostImg"/><span class="gachiPoastTitle">&nbsp;한끼미식회</span></li>
					<li class="wordCut">해물찜 같이 드실 분?해물찜 같이 드실 분?</li>
					<li>04/29 15:00</li>
					<li class="smlFnt"><img src="img/indexImg/bo_pin.png" class="gachiPostLoc"> 마포구청역 3번 출구</li>
					<li>
						<span class="cntJoin">1</span> / 3 명
					</li>
					<li class="smlFnt">goguma1234 &nbsp;&nbsp;<img src="common/alarm_000.png"/></li>
				</ul>
			</li>
			<li>
				<ul class="indexInnerUl">
					<li><img src="img/indexImg/dinner.png" class="gachiPostImg"/><span class="gachiPoastTitle">&nbsp;한끼미식회</span></li>
					<li class="wordCut">해물찜 같이 드실 분?해물찜 같이 드실 분?</li>
					<li>04/29 15:00</li>
					<li class="smlFnt"><img src="img/indexImg/bo_pin.png" class="gachiPostLoc"> 마포구청역 3번 출구</li>
					<li>
						<span class="cntJoin">1</span> / 3 명
					</li>
					<li class="smlFnt">goguma1234&nbsp;&nbsp;<img src="common/user.png"/></li>
				</ul>
			</li>
		</ul>
	</div>
	
	<div id="sggSak" class="indexDivWidth" style="margin-bottom: 100px;">
		<div class="lgFnt indexBoardTitle">#쓱싹레시피</div>
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
		</ul>
	</div>
</div>
