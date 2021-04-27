<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->
<style>
	ul, li{ margin:0px; padding:0px; list-style-type:none;}
	#header{display:none;}
	#footer{display:none;}
	#withViewPageBody{overflow:hidden;}
</style>
<script>	
		$(function(){	
				
			//버튼 클릭시============================================================================
				//뒤로가기	
			$("#withViewPageBackBtn").click(()=>{
				history.back();
			})	
				//참여하기
				
			$("#withViewPageJoinBtn").click(()=>{
				//참여하기 버튼을 누르면 join 테이블에 insert 되야한다. 
				//다음에 들어왔을떄 이미 신청되어있으면 신청한 거라고 떠야한다.
				//(신청을 했다면 --> 취소하기 버튼으로 변경?) 버튼도 있어야 한다.[그 좋아요 이미 신청한건 체크되있고 누르면 삭제되는거 비슷할듯]
				//
			})
			//============================================================================================
		})
</script>

</head>
<body id="withViewPageBody">
	<div id="withViewPageMap" style="width:2500px; height:1500px; position:relative; overflow:hidden;"></div>
	
	<!-- 맨위 폼 -->
	<div id="withViewPageTopFrm">
		<ul>
			<li><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/img/groupImg/home.png"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/img/groupImg/dishW.png"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/img/groupImg/cartW.png"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/img/groupImg/car.png"></a></li>
		</ul>
	</div>
	<!-- 검색 폼 -->
	<div id="withViewPageSearchFrm">
		<form onsubmit="searchPlaces(); return false;">
			<input type="text" name="withViewPageSearchWord" id="withViewPageSearchWord" value="${pageVO.loc_gu }" size=40; />
			<input type="image" src="<%=request.getContextPath()%>/img/groupImg/search.png" value="검색"/>
		</form>
	</div>

	<!-- showFrm 리스트 -->
	<div id="withViewPageShowFrm">	
		<ul id="withViewPageShowTopMenu">
			<li><img src="<%=request.getContextPath()%>/img/groupImg/cartP.png"/><span> ${vo.up_cate} > ${vo.down_cate }</span></li>
			<li><span>조회수 : ${vo.g_hit } </span></li>
			<li><span> ${vo.g_subject }</span></li>
			<li><img src="<%=request.getContextPath()%>/common/${vo.memberVO.mem_prof}"/></li>
			<li><div>${vo.memberVO.mem_nick }</div><div>${vo.g_writedate }</div></li>
			<li>모집인원 : <span> 2</span> / <span> ${vo.g_cnt } </span></li>
			
		</ul>
		<hr style="margin:5px 0px;"/>
		<div>
			${vo.g_content }
		</div>
		<hr style="width:480px; margin:0 auto;">
		<span> 약속정보</span>
		<div><img src="<%=request.getContextPath()%>/img/groupImg/clock.png" title="약속시간"/><div>${vo.g_date } ${vo.g_time}</div></div><!-- g_date, g_time 값을 가지고 온다. -->
		<div><img src="<%=request.getContextPath()%>/img/groupImg/markerB.png" title="약속장소/출발지"/><div> ${vo.g_loc1 }</div></div><!-- g_loc1 값을 가져온다. -->
		<c:if test="${vo.g_loc2!=null }">
			<div><img src="<%=request.getContextPath()%>/img/groupImg/markerP.png" title="도착지"/><div>${vo.g_loc2 }</div></div><!-- g_loc1 값을 가져온다. -->
		</c:if>
		<div>${vo.g_tag }</div>
		<hr style="width:480px; margin:0 auto;"/>
		<div>
			<button id="withViewPageBackBtn" class="btn cancelBtn">뒤로가기</button>
			<c:if test="${logId!=vo.userid }">  
			<button id="withViewPageJoinBtn" class="btn confBtn">참여하기</button>
			</c:if>
			<c:if test="${logId==vo.userid }">
			<button id="eatViewPageEditBtn" class="btn confBtn">삭제</button>
			<button id="withViewPageEditBtn" class="btn confBtn">수정하기</button>
			</c:if>
		</div>
		 
		
	</div>
	
	
	
	
	
	<script>
		
			//지도 생성
			var container = document.getElementById("withViewPageMap"),
				options = {
					center : new kakao.maps.LatLng(33.450701,126.570667),
					level : 7
				};
			var map = new kakao.maps.Map(container, options);
					
			//센터의 lat,lng값을 가져옴 
			var maps = map.getCenter();
			console.log(maps);
			//마커 찍기
			/* 
			var marker = new kakao.maps.Marker({
				map : map,
				position : maps
			}).setMap(map);
			*/	
			
			//마커 찍기를 함수화
			function displayMarker(place){
				//미리 띄워진 마커를 삭제한다음에 마커를 새로띄운다
				
				
				//마커를 생성하고 지도에 표시한다.
				var marker = new kakao.maps.Marker({
					map : map,
					position : new kakao.maps.LatLng(place.y, place.x)
				});
			}
			
			//지도 검색 키워드 객체 생성
			var ps = new kakao.maps.services.Places();
				
			//검색한 키워드 값을 내가 text에서입력한 값으로 셋팅해주는 작업
			function searchPlaces(){
				var keyword = document.getElementById('withViewPageSearchWord').value;
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
					document.getElementById('withViewPageSearchWord').value = '';
					
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
					 map.setLevel(7);
					
			    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
			        alert('검색 결과가 존재하지 않습니다.');
			        return;
	
			    } else if (status === kakao.maps.services.Status.ERROR) {
	
			        alert('검색 결과 중 오류가 발생했습니다.');
			        return;
	
			    }
			}
		
			
		
	</script>

</body>
</html>