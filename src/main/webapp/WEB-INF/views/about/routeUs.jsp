<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<div class="aboutDiv">
	<ul class="listNone aboutCenter">
		<li><span class="routeTitle">오시는 길</span>
			<div id="routeWay">
				<div class="port">버스 : 6712, 5714, 7016, 7613, 604, 740, 6716
					등 서강대 정류장 또는 신촌로터리 정류장 하차</div>
				<div class="porty">지하철 : 신촌역 6번출구 도보 5분 서강대역 1번출구 도보 7분 대흥역
					1번출구 도보 10분</div>
			</div></li>
		<li>
			<div id="dealMap">
				<div id="routeMap" style="width: 300px; height: 300px;"></div>
			</div>
		</li>
	</ul>
</div>

<script>
	var mapContainer = document.getElementById("routeMap"), 
		options = {
		center : new kakao.maps.LatLng(37.55250348958828, 126.93769444015136),
		level : 4
	};
	var map = new kakao.maps.Map(mapContainer, options);
	
	var markerPosition = new kakao.maps.LatLng(37.55250348958828, 126.93769444015136);
	var marker = new kakao.maps.Marker({
		position: markerPosition
	});
	marker.setMap(map);
	
</script>

