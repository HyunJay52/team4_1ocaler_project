<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->
<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<script>	
		var inner = window.innerHeight;
		console.log(inner);
		$(function(){
			//==============================================================================
			$("#showFrm").css('top',80);
			$("#fold").css('top',140).css('left',493).css('margin-top','348px');
			
	
			//접기 호버시 화살표 색이 바뀌고 클릭하면 showFrm 없어지고 open 화살표 생김
			$("#fold").hover(function(){
				$("#fold>img").attr("src","<%=request.getContextPath()%>/img/groupImg/leftP.png");
				$("#fold").click(function(){	
					$("#showFrm").css("display","none");
					$("#fold").css("display","none");
					$("#open").css("display","block").css("top",140).css("left",30).css('margin-top','348px')
					.css("background-color","#fff").css("opacity",0.9).css("width","40px")
					.css("padding","5px").css("border-radius","10px");
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
			//===========================================================================
			
				
			//ck editor
			CKEDITOR.replace("g_content", {
				height:300
			});
			
			
			
		})
</script>
<style>
	#header{display:none;}
	body{overflow:hidden;}
	ul, li{ margin:0px; padding:0px; list-style-type:none;}
	
	#fold, #open{position:absolute; z-index:1;}	
	#fold{background-color:#fff; opacity:0.9; width:40px; padding:5px; border-radius:10px;}
	#open{display:none; top: 140px; left:30px; margin-top:348px; background-color:#fff; opacity:0.9; width:40px; padding:5px; border-radius:10px;}
	
	#searchFrm{position:absolute; top:20px; right:0px; z-index:1;}
	#searchFrm input[type=text]{float:left; height:58px; }
	#searchFrm input[type=image]{display:block; height:58px;}
	
	
	#topFrm{position:absolute; width:250px; top:20px; right:50%; z-index:1; transform:translateX(50%) }
	#topFrm>ul{text-align:center; overflow:auto; border-radius:10px; background-color:#571FB8;}
	#topFrm li{display:inline-block; background-color:#571FB8; margin:0 10px;}
	#topFrm img{width:30px; margin:9px 0px;}
	#topFrm li:first-child>a>img{ margin-left:10px;}
	#topFrm li:last-child>a>img{ margin-right:10px;}

	#showFrm{position:absolute; height:850px; left:30px; z-index:1; width:500px; background-color:#fff;  border-radius:10px;}		
	/* 맨위 셀렉트 박스 부분 */
	#up_cate, #down_cate{ width:150px; height:40px; padding-left:10px; border:1px solid #d3d3d3;
   background:url("<%=request.getContextPath()%>/img/groupImg/dropDown.png")  no-repeat 95% 50%; border-radius:5px; apperance:none; -webkit-appearance:none;}
	#up_cate{margin:20px 10px 10px 15px;}
	#g_cnt{ width:100px; height:40px; padding-left:5px; border:1px solid #d3d3d3;
   background:url("<%=request.getContextPath()%>/img/groupImg/dropDown.png")  no-repeat 95% 50%; border-radius:5px; apperance:none; -webkit-appearance:none;}
	
	
	
	/*제목라인*/
	#g_subject{border:1px solid #d9d9d9; border-radius:5px; margin:0 15px; width:470px; height:40px; padding-left:10px;}
	/*input 박스 클릭시, 호버시 */
	#g_subject:hover {border:1px solid #571fb8;}  #g_subject:focus{border:1px solid #571fb8; outline: none;}
	/* check 박스 클릭시, 호버시*/
	#up_cate:active{border:2px solid #571fb8;} #up_cate:focus{border:2px solid #571fb8; outline: none;}
	
	/*CKEDTOR 필요없는거 삭제*/
	 #cke_32, #cke_30, #cke_44,  #cke_38, #cke_1_bottom{display:none; }
	 #cke_g_content{ margin:15px;}
	
	 
	/*버튼이벤트*/
	.commBtn {	width: 90px; color: #3f1785; border: 1px solid #3f1785;}
	.commBtn:hover { border: 1px solid #3f1785; background-color: #3f1785; font-weight: bold; color: #fff; font-weight: bold;}
	.commBtnWrite{width:75px;}
	
</style> 	
</head>
<body>
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
		<form id="groupWriteFrm "method="post" action="">
			<div> 
				<select name="up_cate" id="up_cate" size="1">
					<c:if test="${vo.up_cate=='한끼미식회' }">
						<option value="한끼미식회" selected>한끼미식회</option>
					</c:if>
					<c:if test="${vo.up_cate=='가치가장' }">
						<option value="가치가장" selected>가치가장</option>
					</c:if>
				</select>
				
				<select name="down_cate" id="down_cate" size="1">
					<c:if test="${vo.up_cate=='한끼미식회' }">
						<option value="같이먹어요">같이먹어요</option>
					</c:if>
					<c:if test="${vo.up_cate=='가치가장' }">
						<option value="동네마트">동네마트</option>
						<option value="창고형마트">창고형마트</option>
					</c:if>
				</select><br/>
			</div>
			<div>
				<input type="text" name="g_subject" id="g_subject" placeholder="&nbsp;&nbsp;&nbsp;제목을 입력하세요.....">
			</div>
			
			
			<textarea name="g_content" id="g_content"></textarea>
			
			<div>
			<input type="date" name="" id=""/>
			<select name="g_cnt" id="g_cnt" size="1" >
					<option value="" disabled selected hidden>모집인원</option>
					<option value="1">1명</option>
					<option value="2">2명</option>
					<option value="3">3명</option>
					<option value="4">4명</option>
					<option value="5">5명</option>
				</select>	
				
			
			</div>	
			
		</form>	
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