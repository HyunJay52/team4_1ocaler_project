<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->
<script>	
		var inner = window.innerHeight;
		console.log(inner);
		$(function(){
			
			
			var localName = ['전체','강서구','양천구','구로구','영등포구','금천구','동작구','관악구','서초구','강남구','송파구','강동구',
							'마포구','용산구','서대문구','중구','성동구','광진구','종로구','동대문구','성북구','중랑구','은평구','강북구','노원구','도봉구'];
			var tag = "";
			localName.map(function(obj, idx){
				tag = "<li><a href='eatPage?g_loc="+obj+"&up_cate=1'>"+obj+"</a></li>";
				$("#showFrm>ul").append(tag);
			});
	
			$("#showFrm").css('top',140);
			$("#fold").css('top',140).css('left',493).css('margin-top','348px');
			
			
			//접기 호버시 화살표 색이 바뀌고 클릭하면 showFrm 없어지고 open 화살표 생김
			$("#fold").hover(function(){
				$("#fold>img").attr("src","<%=request.getContextPath()%>/img/groupImg/leftP.png");
				$("#fold").click(function(){	
					$("#showFrm").css("display","none");
					$("#fold").css("display","none");
					$("#open").css("display","block");
				});
			},function(){			
				$("#fold>img").attr("src","<%=request.getContextPath()%>/img/groupImg/left.png");
	
			});
			
			//open 화살표 오버시 색바뀌고 클릭시 showFrm 과 닫기 화살표 생김
			$("#open").hover(function(){
				$("#open>img").attr("src","<%=request.getContextPath()%>/img/groupImg/rightP.png");
				
				$("#open").click(function(){	
					$("#showFrm").css("display","block");
					$("#fold").css("display","block");
					$("#open").css("display","none");
				});
				
			},function(){
				$("#open>img").attr("src","<%=request.getContextPath()%>/img/groupImg/right.png");
			});
	
		})
</script>
<style>
	#header{display:none}
	body{overflow:hidden;}
	ul, li{ margin:0px; padding:0px; list-style-type:none;}
	
	#fold, #open{position:absolute; z-index:1;}	
	#fold{background-color:#fff; opacity:0.9; width:40px; padding:5px; border-radius:10px;}
	#open{display:none; top: 140px; left:30px; margin-top:348px; background-color:#fff; opacity:0.9; width:40px; padding:5px; border-radius:10px;}
	
	#searchFrm{position:absolute; top:20px; right:0px; z-index:1;}
	#searchFrm input[type=text]{float:left; height:58px; }
	#searchFrm input[type=image]{display:block; height:58px;}
	
	
	#topFrm{position:absolute; top:20px; right:50%; z-index:1; transform:translateX(50%) }
	#topFrm>ul{overflow:auto; border-radius:10px; background-color:#571FB8;}
	#topFrm li{float:left; background-color:#571FB8; margin:0 10px;}
	#topFrm img{width:40px; margin:9px 0px;}
	#topFrm li:first-child>a>img{ margin-left:10px;}
	#topFrm li:last-child>a>img{ margin-right:10px;}
	

	#showFrm{position:absolute; height:760px; left:30px; z-index:1; width:460px; background-color:#fff; opacity:0.9; border-radius:10px;}
	#showFrm li>a{text-decoration:none; color:#000}
	#showFrm li>a:hover{color:#571fb8; font-weight:bold;}
	#showFrm li{float:left; width:230px; padding-left:80px; height:50px; line-height:50px; border-bottom:1px solid #e1e1e1;}
	#showFrm>div:first-child{margin:10px; overflow:auto;}
	#showFrm>div>span{display:block; width:auto; height:45px; line-height:45px; float:left; font-size:22px; color:#571fb8;} 
	#showFrm img{display:block; width:45px; float:left; margin-right:7px;}
	#showFrm img:nth-child(3){float:right} 
</style>

<div id="map" style="width:2000px; height:1000px; position:relative; overflow:hidden;"></div>
	
	<!-- showFrm접기펴기 -->	
	<div id="fold"><img src="<%=request.getContextPath()%>/img/groupImg/left.png"/></div>
	<div id="open"><img src="<%=request.getContextPath()%>/img/groupImg/right.png"/></div>
	
	<!-- 맨위 폼 -->
	<div id="topFrm">
		<ul>
			<li><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/img/groupImg/home.png"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/img/groupImg/dishW.png"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/img/groupImg/cartW.png"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/img/groupImg/car.png"></a></li>
		</ul>
	</div>
	
	<!-- 검색 폼 -->
	<div id="searchFrm">
		<form id="searchFrmInner" onsubmit="searchPlaces(); return false;">
			<input type="text" name="searchWord" id="searchWord" value="강서구" size=40; />
			<input type="image" src="<%=request.getContextPath()%>/img/groupImg/search.png" value="검색"/>
		</form>
	</div>
	
	<!-- showFrm 리스트 -->
	<div id="showFrm">
		<div><img src="<%=request.getContextPath() %>/img/groupImg/aimP.png"/><span style="font-weight:bold;">지역선택</span></div>
		<hr style="width:430px; margin-bottom:20px; margin-top:0px; background:#a9a9a9">
		<hr style="margin:0px;">
		<ul></ul>
	</div>
	<script>
			//지도 생성
			var container = document.getElementById("map"),
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
				var keyword = document.getElementById('searchWord').value;
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
					document.getElementById('searchWord').value = '';
					
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