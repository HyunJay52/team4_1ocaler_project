<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!-- 카카오 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script>	

<%@ include file="/inc/sideBar.jspf" %>
<div class="aboutDiv">
	<span id="followMe">오시는 길</span>
	<div id="routeMap" style="width: 1300px; height: 350px;"></div>
	<div id="innerContent">
		<ul>		
			<li>주소</li>
			<li>서울특별시 마포구 백범로 23 구프라자 3층</li>			
			<li>대표번호</li>
			<li>02-3486-9600</li>
			<li>지하철</li>
			<li>지하철 : 신촌역 6번출구 도보 5분 서강대역 1번출구 도보 7분 대흥역
						1번출구 도보 10분</li>
			<li>버스</li>
			<li>버스 : 6712, 5714, 7016, 7613, 604, 740, 6716 등 서강대 정류장 또는 신촌로터리 정류장 하차</li>
	</ul>
	</div>
	
</div>

<script>
	var mapContainer = document.getElementById("routeMap"), 
		options = {
		center : new kakao.maps.LatLng(37.55250348958828, 126.93769444015136),
		level : 3
	};
	var map = new kakao.maps.Map(mapContainer, options);
	
	
	var markerPosition = new kakao.maps.LatLng(37.55250348958828, 126.93769444015136);
	var marker = new kakao.maps.Marker({
		position: markerPosition
	});
	var content = '<div id="infoWindow">서울특별시 마포구 백범로 23 구프라자 3층<div>';
	var customOverlay = new kakao.maps.CustomOverlay({
		map:map,
	    position: markerPosition,
	    content: content,
	    yAnchor: 1
	});
	marker.setMap(map);
	
</script>

