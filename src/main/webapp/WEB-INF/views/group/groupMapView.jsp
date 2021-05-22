<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#pageTop{display:none;}
	#mainFooter{display:none;}
	#mem_login{display:none;}
	#groupMapViewBody{overflow:hidden;}
	ul, li{ margin:0px; padding:0px; list-style-type:none;}	
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->
<script>	
		$(function(){
			
			
			var localName = ['강서구','양천구','구로구','영등포구','금천구','동작구','관악구','서초구','강남구','송파구','강동구',
							'마포구','용산구','서대문구','중구','성동구','광진구','종로구','동대문구','성북구','중랑구','은평구','강북구','노원구','도봉구'];
			var tag = "";
			localName.map(function(obj, idx){
				tag = "<li><a href='eatPage?loc_gu="+obj+"&category=한끼미식회'>"+obj+"</a></li>";
				$("#groupMapViewShowFrm>ul").append(tag);
			});
		
			//접기 호버시 화살표 색이 바뀌고 클릭하면 showFrm 없어지고 open 화살표 생김
			$(".groupViewFold").hover(function(){
				$(".groupViewFold>img").attr("src","<%=request.getContextPath()%>/img/groupImg/leftP.png");
				$(".groupViewFold").click(function(){	
					$("#groupMapViewShowFrm").css("display","none");
					$(".groupViewFold").css("display","none");
					$(".groupViewOpen").css("display","block");
				});
			},function(){			
				$(".groupViewFold>img").attr("src","<%=request.getContextPath()%>/img/groupImg/left.png");
	
			});
			
			//open 화살표 오버시 색바뀌고 클릭시 showFrm 과 닫기 화살표 생김
			$(".groupViewOpen").hover(function(){
				$(".groupViewOpen>img").attr("src","<%=request.getContextPath()%>/img/groupImg/rightP.png");
				
				$(".groupViewOpen").click(function(){	
					$("#groupMapViewShowFrm").css("display","block");
					$(".groupViewFold").css("display","block");
					$(".groupViewOpen").css("display","none");
				});
				
			},function(){
				$("#groupMapViewOpen>img").attr("src","<%=request.getContextPath()%>/img/groupImg/right.png");
			});
			
			$("#groupMapViewButton").click(()=>{
				searchPlaces();
			});	
		})
</script>
<body id="groupMapViewBody">
<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
<div id="groupMapViewMap" style="width:2500px; height:1500px; position:relative; overflow:hidden;"></div>
	
	<!-- showFrm접기펴기 -->	
	<div class="groupViewFold"><img src="<%=request.getContextPath()%>/img/groupImg/left.png"/></div>
	<div class="groupViewOpen"><img src="<%=request.getContextPath()%>/img/groupImg/right.png"/></div>
	
	<!-- 맨위 폼 -->
	<div class="groupTopFrm">
		<ul>
			<li><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/img/groupImg/homeTop.png"></a></li>
			<li><a href="eatPage?loc_gu=<c:if test="${logId!=null && logId!='' }">${logLoc_gu }</c:if><c:if test="${logId==null || logId=='' }">강서구</c:if>&category=한끼미식회<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord }</c:if>"><img src="<%=request.getContextPath()%>/img/groupImg/dishTop.png"></a></li>
			<li><a href="withPage?loc_gu=<c:if test="${logId!=null && logId!='' }">${logLoc_gu }</c:if><c:if test="${logId==null || logId=='' }">강서구</c:if>&category=가치가장<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord }</c:if>"><img src="<%=request.getContextPath()%>/img/groupImg/bagTop.png"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/img/groupImg/carTop.png"></a></li>
		</ul>
	</div>
	
	<!-- 검색 폼 -->
	<div class="groupSearchFrm">
		<form onsubmit="searchPlaces(); return false;">
			<input type="text" name="groupMapViewSearchWord" id="groupMapViewSearchWord" value="신촌 비트캠프" size=40; />
			<input type="image" id="groupMapViewButton" src="<%=request.getContextPath()%>/img/groupImg/search.png" value="검색"/>
		</form>
	</div>
	
	<!-- showFrm 리스트 -->
	<div id="groupMapViewShowFrm">
		<div><img src="<%=request.getContextPath() %>/img/groupImg/aimP.png"/><span style="font-weight:bold;">지역선택</span></div>
		<hr style="margin:0px;">
		<ul></ul>
	</div>
	<script>
	// 지도폼============================================================================
	var markers = [];	
	var ps = new kakao.maps.services.Places();
	var bounds = new kakao.maps.LatLngBounds();
	
	//지도 생성
	var container = document.getElementById("groupMapViewMap"),
		options = {
			center : new kakao.maps.LatLng(33.450701,126.570667),
			level : 7
		};
	var map = new kakao.maps.Map(container, options);
	
	function displayMarker(place){
		
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
		
		
		var marker = new kakao.maps.Marker({
			map : map,
			position : new kakao.maps.LatLng(place.y, place.x),
			image : startMarkerImage
		});
		
		markers.push(marker);
	}


	function searchPlaces(){
		var keyword = document.getElementById('groupMapViewSearchWord').value;
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

	function callback(data, status, pagination){
		if(status == kakao.maps.services.Status.OK){
			removeMarker();
			document.getElementById('groupMapViewSearchWord').value = '';
			
			for(var i=0; i<data.length; i++){
				displayMarker(data[i]);
				bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			}
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
	
	//마커지우는용도
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	
	
	</script>

</body>
</html>