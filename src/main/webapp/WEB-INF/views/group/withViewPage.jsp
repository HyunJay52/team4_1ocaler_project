<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->
<style>

	
	/*기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능*/
	/*버튼이벤트*/
	.cancelBtn {border: 1px solid #ddd;	color: #ddd;width: 90px;}
	.cancelBtn:hover {background-color: #fff; color: gray;}	
	.confBtn {background: #3f1785; color: #fff; width: 90px;}
	.confBtn:hover {color: #fff; background: #B8B2F4;}
	
	/*폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼*/
	ul, li{ margin:0px; padding:0px; list-style-type:none;}
	#header{display:none;}
	#withViewPageBody{overflow:hidden;}
	/*searchFrm*/
	#withViewPageSearchFrm{position:absolute; top:20px; right:0px; z-index:1;}
	#withViewPageSearchFrm input[type=text]{float:left; height:48px; border-radius:5px;}
	#withViewPageSearchFrm input[type=image]{display:block; height:48px;}
	/*topFrm*/
	#withViewPageTopFrm{position:absolute; width:250px; top:20px; right:50%; z-index:1; transform:translateX(50%) }
	#withViewPageTopFrm>ul{text-align:center; overflow:auto; border-radius:10px; background-color:#571FB8;}
	#withViewPageTopFrm li{display:inline-block; background-color:#571FB8; margin:0 10px;}
	#withViewPageTopFrm img{width:30px; margin:9px 0px;}
	#withViewPageTopFrm li:first-child>a>img{ margin-left:10px;}
	#withViewPageTopFrm li:last-child>a>img{ margin-right:10px;}
	/*showFrm*/
	#withViewPageShowFrm{position:absolute; top:100; height:auto; left:30px; z-index:1; width:500px; background-color:#fff; opacity:0.9; border-radius:10px;}
	#withViewPageShowTopMenu{overflow:auto;}
	#withViewPageShowTopMenu>li{float:left; width:100%; line-height:30px;}
	#withViewPageShowTopMenu>li:first-child>img{height:22px; padding-right:10px;}	
	#withViewPageShowTopMenu>li:first-child{width:70%; padding:10px 0px 10px 10px;}
	#withViewPageShowTopMenu>li:first-child>span{color:#3f1785; font-weight:bold;}
	#withViewPageShowTopMenu>li:nth-child(2){width:30%; padding:10px 15px 10px 0px; text-align:right; }
	#withViewPageShowTopMenu>li:nth-child(3)>span{display:block; margin-bottom:5px; padding: 0 10px; font-size:22px; font-weight:bold;}	
	#withViewPageShowTopMenu>li:nth-child(4){width:13%; padding-left:10px;}
	#withViewPageShowTopMenu>li:nth-child(4)>img{width:40px;}
	#withViewPageShowTopMenu>li:nth-child(5){width:47%}
	#withViewPageShowTopMenu>li:nth-child(5)>div{font-size:13px; height: 20px; line-height: 20px;}
	#withViewPageShowTopMenu>li:nth-child(5)>div:first-child{padding-left:30pxx}
	#withViewPageShowTopMenu>li:nth-child(6){width:40%; height:40px; line-height:40px; text-align:right;}
	#withViewPageShowTopMenu>li:nth-child(6)>span:nth-of-type(2){padding-right:15px;}
	#withViewPageShowFrm>div:first-of-type{padding:10px; overflow:auto; height:400px;}
	#withViewPageShowFrm>span{display: block;font-size: 16px;font-weight: bold;padding: 20px 0px 0px 20px; color: 3f1785;}
	#withViewPageShowFrm>div:not(:first-of-type){overflow:auto; margin:10px 15px 15px 15px;}
	#withViewPageShowFrm>div>img{height:20px; margin: 5px 30px 0px 0px; float:left;}
	#withViewPageShowFrm>div>div{border:1px solid gray; border-radius:5px; float:left; text-align:center; font-size: 16px; line-height: 30px; height: 30px; width: 400px;}
	#withViewPageShowFrm>div:nth-of-type(4){white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	#withViewPageShowFrm>div:last-of-type{text-align:center;}
	#withViewPageShowFrm button{width:120px; height:40px; margin:20px 0px;}
	#withViewPageShowFrm button:first-child{margin-right:80px;}
	
	
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
			<li><img src="<%=request.getContextPath()%>/img/groupImg/cartP.png"/><span>up_cate > down_cate</span></li>
			<li><span>조회수 : g_hit </span></li>
			<li><span> 이것은 제목이라고 하지 나도 알고 너도 알고 다알고</span></li>
			<li><img src="<%=request.getContextPath()%>/common/user.png"/></li>
			<li><div>고구마777</div><div>2021-04-25 16:25</div></li>
			<li>모집인원 : <span> 2</span> / <span> 5 </span></li>
			
		</ul>
		<hr style="margin:5px 0px;"/>
		<div>
			정말로 같이 밥드실분이 한명도 없는 건가요..? 정말 슬플거 같습니다... 이 홈페이지<br/>
			사실 아무도 안쓴다는걸 다 알고 잇습니다.정말로 같이 밥드실분이 한명도 없는 건가요..? 정말 슬플거 같습니다... 이 홈페이지<br/>
			사실 아무도 안쓴다는걸 다 알고 잇습니다.정말로 같이 밥드실분이 한명도 없는 건가요..? 정말 슬플거 같습니다... 이 홈페이지<br/>
			사실 아무도 안쓴다는걸 다 알고 잇습니다.정말로 같이 밥드실분이 한명도 없는 건가요..? 정말 슬플거 같습니다... 이 홈페이지<br/>
			사실 아무도 안쓴다는걸 다 알고 잇습니다.정말로 같이 밥드실분이 한명도 없는 건가요..? 정말 슬플거 같습니다... 이 홈페이지<br/>
			사실 아무도 안쓴다는걸 다 알고 잇습니다.정말로 같이 밥드실분이 한명도 없는 건가요..? 정말 슬플거 같습니다... 이 홈페이지<br/>
			사실 아무도 안쓴다는걸 다 알고 잇습니다.정말로 같이 밥드실분이 한명도 없는 건가요..? 정말 슬플거 같습니다... 이 홈페이지<br/>
		</div>
		<hr style="width:480px; margin:0 auto;">
		<span> 약속정보</span>
		<div><img src="<%=request.getContextPath()%>/img/groupImg/clock.png" title="약속시간"/><div>2021-04-25 20:20</div></div><!-- g_date, g_time 값을 가지고 온다. -->
		<div><img src="<%=request.getContextPath()%>/img/groupImg/markerB.png" title="약속장소/출발지"/><div> 가양역 2번출구 앞</div></div><!-- g_loc1 값을 가져온다. -->
		<%-- <c:if test="">	loc2 값이 null 이 아닐경우 띄워주고 null일경우 안띄워주고  --%> 
			<div><img src="<%=request.getContextPath()%>/img/groupImg/markerP.png" title="도착지"/><div> 가양역 2번출구 앞</div></div><!-- g_loc1 값을 가져온다. -->
		<%-- </c:if> --%>
		<div> #하기시르다 정말시르다 ...</div>
		<hr style="width:480px; margin:0 auto;"/>
		<div>
			<button id="withViewPageBackBtn" class="btn cancelBtn">뒤로가기</button>
			<%-- <c:if test="${ }">  이건 작성자가 아닌경우 버튼 아닐경우--%> 
			<button id="withViewPageJoinBtn" class="btn confBtn">참여하기</button>
			<%-- </c:if>
			<c:if test="${ }"> 이건 작성자일경우 수정하기 버튼
			<button id="withViewPageEditBtn" class="btn confBtn">수정하기</button>
			</c:if> --%>
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