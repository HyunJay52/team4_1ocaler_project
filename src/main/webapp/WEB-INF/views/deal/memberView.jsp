<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealBoardStyle.css"/>


<script>
		//지도============================================================================================
		$(function(){
			var markers = [];	
			//지도 검색 키워드 객체 생성
			var ps = new kakao.maps.services.Places();
		
				//지도 생성
				var container = document.getElementById("map"),
					options = {
						center : new kakao.maps.LatLng(33.450701,126.570667),
						level : 2
					};
				var map = new kakao.maps.Map(container, options);
				//마커 찍기를 함수화
			
				var marker;	
				var startMarkerImage = new kakao.maps.MarkerImage(
						'<%=request.getContextPath()%>/img/groupImg/startMarker.png',
						new kakao.maps.Size(35,35),
						{
					        offset: new kakao.maps.Point(16, 34),
					        alt: "출발지",
					        shape: "poly",
					        coords: "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
					    }
				);				
				function displayMarker(place){
					//마커를 생성하고 지도에 표시한다.	
						marker = new kakao.maps.Marker({
							map : map,
							image : startMarkerImage,
							clickable : true,
							position : new kakao.maps.LatLng(place.y, place.x)
						});
						
						markers.push(marker);
						
					   var content ='<div class="customOverlay"> 약속장소 </div>'
			                 
			                var customOverlay = new kakao.maps.CustomOverlay({
			                     map: map,
			                     position: new kakao.maps.LatLng(place.y, place.x),
			                     content: content,
			                     yAnchor: 1
		                 });
						
				}
					
				
				
					
				//검색한 키워드 값을 내가 text에서입력한 값으로 셋팅해주는 작업
				function searchPlaces(){
					var keyword = "가양역2번출구";
					console.log(keyword);
					 if (!keyword.replace(/^\s+|\s+$/g, '')) {
					        alert('키워드를 입력해주세요!');
					        return false;
					 }
					
					 ps.keywordSearch( keyword, callback, {
						 size : 1
					 }); 
				}
				searchPlaces();
				//KeyWordSearch 에서 키워드를 검색한다음에 실행하는 콜백 함수로 
				//검색한 다음의 결과값을 result로 받는다.
				function callback(data, status, pagination){
					if(status == kakao.maps.services.Status.OK){
						console.log(data)
						//검색된 장소를 기준으로 지도를 재설정하기 위해서 bounds를 통해 위도경도를 추가하기위한 객체를 생성
						var bounds = new kakao.maps.LatLngBounds();
						
						// 검색결과 result(배열임 여러개의 검색겨로가가 들어있음) result를 displayMarker 에 넣어줌으로써 마커를 생성해주고
						// 검색결과를 바탕으로 지도가 나타나야 하므로 bounds.extends 해서 위치를 지정해준다.
						for(var i=0; i<data.length; i++){
							displayMarker(data[i]);
							bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
						}
						
						//검색된 장소(위치)기준으로 지도를 셋팅해준다.
						 map.setBounds(bounds);
						 map.setLevel(2);
						
				    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			
				        alert('검색 결과가 존재하지 않습니다.');
				        return;
			
				    } else if (status === kakao.maps.services.Status.ERROR) {
			
				        alert('검색 결과 중 오류가 발생했습니다.');
				        return;
			
				    }
				}
		});
		
			
</script>


	<div id="dealViewMain">
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		<div id="divAll">
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
							<input type="button" value="찜하기" class="btn commBtnDeal" style="margin-left: 100px"/>
							<input type="submit" value="함께해요" class="btn commBtnDeal"/>
						</form>
					</li>
				</ul>
			</div>
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
			

		</div>
		
		<div id="editBtn">
			<button class="btn commBtnEdit " onclick = "location.href = '#' ">삭제</button>
			<button class="btn commBtnEdit" onclick = "location.href = 'memberEdit' ">수정</button>
		</div>
	</div>
</body>
</html>