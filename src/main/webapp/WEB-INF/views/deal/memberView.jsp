<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealBoardStyle.css"/>


	<div id=body>
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		
		<div id="dealImg">
			<img src="img/deal/Karrot.jpeg"/>
		</div>
		<div id="dealInfo">
			<ul >	
				<li class="wordcut">당근 같이 나누실 분?</li>
				<li style="width:100%;">
					<ul style="margin: 20 0;">
						<li style="width:50%; line-height:33px;margin:10 0">
							<img src="common/user.png">&nbsp;&nbsp;
							<a href="#"> goguma1234</a><hr/>
						</li>
						<li style="color: #3f1785;  font-weight: bold;  text-align: right;margin:10 0 ;width: 50%;font-size: 30px;">
							1,000원 &nbsp; &nbsp;	<hr/>
						</li>				
					</ul>
				</li>
				<li>
					<ul>
						<li>상품 종류</li>
						<li>식료품</li>
					</ul>
				</li>
				<li>
					<ul>
						<li>거래 위치</li>
						<li>강서구 등촌역 근처 직거래</li>
					</ul>
				</li>
				<li>
					<ul>
						<li>판매 개수</li>
						<li>
							<span class="cntJoin">1</span>
							/5개
						</li>
					</ul>
				</li>
				<li>
					<ul>
						<li>판매 기한</li>
						<li>2020  / 05 / 28 일 까지</li>
					</ul>
				</li>
				<li class="wordcut">#당근 #등촌역 #식품 #야채</li>
				<li>
					<form>
						<input type="submit" value="찜하기" class="btn commBtn" style="margin-left: 100px"/>
						<input type="submit" value="함께해요" class="btn commBtn"/>
					</form>
				</li>
			</ul>
		</div>
		
		<div id="boardInfo">
			<ul>
				<li>
					당근 나눔하실 분이 계실까요?
					많이사서.ㅠㅠ 같이 나눠요 직거래 예정인데 연락주세요!
				</li>
			</ul>		
		</div>
		
		<div id="dealMap">
			<span style="margin: 90 10;"> 약속 장소</span>
			<div id="map">
			</div>
			
			<script>
		      
		         //지도 생성
		         var container = document.getElementById("map"),
		            options = {
		               center : new kakao.maps.LatLng(33.450701,126.570667),
		               level : 7
		            };
		         var map = new kakao.maps.Map(container, options);
			</script>
		</div>
	</div>
</body>
</html>