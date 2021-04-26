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
	#header{display:none;}
	#eatViewPagebody{overflow:hidden;}
	ul, li{ margin:0px; padding:0px; list-style-type:none;}
	/*searchFrm*/
	#eatViewPageSearchFrm{position:absolute; top:20px; right:0px; z-index:1;}
	#eatViewPageSearchFrm input[type=text]{float:left; height:48px; border-radius:5px;}
	#eatViewPageSearchFrm input[type=image]{display:block; height:48px;}
	/*topFrm*/
	#eatViewPageTopFrm{position:absolute; width:250px; top:20px; right:50%; z-index:1; transform:translateX(50%) }
	#eatViewPageTopFrm>ul{text-align:center; overflow:auto; border-radius:10px; background-color:#571FB8;}
	#eatViewPageTopFrm li{display:inline-block; background-color:#571FB8; margin:0 10px;}
	#eatViewPageTopFrm img{width:30px; margin:9px 0px;}
	#eatViewPageTopFrm li:first-child>a>img{ margin-left:10px;}
	#eatViewPageTopFrm li:last-child>a>img{ margin-right:10px;}
	/*showFrm*/
	#eatViewPageShowFrm{position:absolute; height:auto; top:100px; left:30px; z-index:1; width:500px; background-color:#fff; opacity:0.9; border-radius:10px;}
	#eatViewPageShowTopMenu{overflow:auto;}
	#eatViewPageShowTopMenu>li{float:left; width:100%; line-height:30px;}
	#eatViewPageShowTopMenu>li:first-child>img{height:22px; padding-right:10px;}	
	#eatViewPageShowTopMenu>li:first-child{width:70%; padding:10px 0px 10px 10px;}
	#eatViewPageShowTopMenu>li:first-child>span{color:#3f1785; font-weight:bold;}
	#eatViewPageShowTopMenu>li:nth-child(2){width:30%; padding:10px 15px 10px 0px; text-align:right; }
	#eatViewPageShowTopMenu>li:nth-child(3)>span{display:block; margin-bottom:5px; padding: 0 10px; font-size:22px; font-weight:bold;}	
	#eatViewPageShowTopMenu>li:nth-child(4){width:13%; padding-left:10px;}
	#eatViewPageShowTopMenu>li:nth-child(4)>img{width:40px;}
	#eatViewPageShowTopMenu>li:nth-child(5){width:47%}
	#eatViewPageShowTopMenu>li:nth-child(5)>div{font-size:13px; height: 20px; line-height: 20px;}
	#eatViewPageShowTopMenu>li:nth-child(5)>div:first-child{padding-left:30pxx}
	#eatViewPageShowTopMenu>li:nth-child(6){width:40%; height:40px; line-height:40px; text-align:right;}
	#eatViewPageShowTopMenu>li:nth-child(6)>span:nth-of-type(2){padding-right:15px;}
	#eatViewPageShowFrm>div:first-of-type{padding:10px; overflow:auto; height:400px;}
	#eatViewPageShowFrm>span{display: block;font-size: 16px;font-weight: bold;padding: 20px 0px 0px 20px; color: 3f1785;}
	#eatViewPageShowFrm>div:not(:first-of-type){overflow:auto; margin:10px 15px 15px 15px;}
	#eatViewPageShowFrm>div>img{height:20px; margin: 5px 30px 0px 0px; float:left;}
	#eatViewPageShowFrm>div>div{border:1px solid gray; border-radius:5px; float:left; text-align:center; font-size: 16px; line-height: 30px; height: 30px; width: 400px;}
	#eatViewPageShowFrm>div:nth-of-type(4){white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	#eatViewPageShowFrm>div:nth-of-type(5){text-align:center;}
	#eatViewPageShowFrm button{width:120px; height:40px; margin:20px 0px;}
	#eatViewPageShowFrm button:first-child{margin-right:80px;}
	
	
</style>
<script>	
		$(function(){	
			//버튼 클릭시============================================================================
				//뒤로가기	
			$("#eatViewPageBackBtn").click(()=>{
				history.back();
			})	
				//참여하기
				
			$("#eatViewPageJoinBtn").click(()=>{
				//참여하기 버튼을 누르면 join 테이블에 insert 되야한다. 
				//다음에 들어왔을떄 이미 신청되어있으면 신청한 거라고 떠야한다.
				//(신청을 했다면 --> 취소하기 버튼으로 변경?) 버튼도 있어야 한다.[그 좋아요 이미 신청한건 체크되있고 누르면 삭제되는거 비슷할듯]
				//
			})
			//============================================================================================
		})
</script>

</head>
<body id="eatViewPagebody">
	<div id="eatViewPageMap" style="width:2500px; height:1500px; position:relative; overflow:hidden;"></div>
		
	<!-- 맨위 폼 -->
	<div id="eatViewPageTopFrm">
		<ul>
			<li><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/img/groupImg/home.png"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/img/groupImg/dishW.png"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/img/groupImg/cartW.png"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/img/groupImg/car.png"></a></li>
		</ul>
	</div>
	<!-- 검색 폼 -->
	<div id="eatViewPageSearchFrm">
		<form onsubmit="searchPlaces(); return false;">
			<input type="text" name="eatViewPageSearchWord" id="eatViewPageSearchWord" value="${pageVO.loc_gu }" size=40; />
			<input type="image" src="<%=request.getContextPath()%>/img/groupImg/search.png" value="검색"/>
		</form>
	</div>

	<!-- showFrm 리스트 -->
	<div id="eatViewPageShowFrm">	
		<ul id="eatViewPageShowTopMenu">
			<li><img src="<%=request.getContextPath()%>/img/groupImg/dish.png"/><span>${vo.up_cate } > ${vo.down_cate }</span></li>
			<li><span>조회수 : ${vo.g_cnt } </span></li>
			<li><span> ${vo.g_subject }</span></li>
			<li><img src="<%=request.getContextPath()%>/common/user.png"/></li>
			<li><div>${vo.memberVO.mem_nick }</div><div>${vo.g_writedate }</div></li>
			<li>모집인원 : <span> 2</span> / <span> ${vo.g_cnt } </span></li> <!--  쒯 join 테이블도 join해야되네 -->
			
		</ul>
		<hr style="margin:5px 0px;"/>
		<div>
			${vo.g_content }
		</div>
		<hr style="width:480px; margin:0 auto;">
		<span> 약속정보</span>
		<div><img src="<%=request.getContextPath()%>/img/groupImg/clock.png" title="약속시간"/><div>${vo.g_date } ${vo.g_time }</div></div><!-- g_date, g_time 값을 가지고 온다. -->
		<div><img src="<%=request.getContextPath()%>/img/groupImg/markerB.png" title="약속장소"/><div> ${vo.g_loc1 }</div></div><!-- g_loc1 값을 가져온다. -->
		<div> ${vo.g_tag }</div>
		<hr style="width:480px; margin:0 auto;"/>
		<div>
			<button id="eatViewPageBackBtn" class="btn cancelBtn">뒤로가기</button>
			<c:if test="${vo.userid!=logId }"> 
				<button id="eatViewPageJoinBtn" class="btn confBtn">참여하기</button>
			</c:if>
			<c:if test="${vo.userid==logId }"> <!--이건 작성자일경우 수정하기 버튼  -->
				<button id="eatViewPageEditBtn" class="btn confBtn">수정하기</button>
			</c:if>
		</div>
		
		
	</div>
	
	
	
	
	
	<script>
		
			//지도 생성
			var container = document.getElementById("eatViewPageMap"),
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
				var keyword = document.getElementById('eatViewPageSearchWord').value;
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
					document.getElementById('eatViewPageSearchWord').value = '';
					
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