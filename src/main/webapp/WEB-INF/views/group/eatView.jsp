<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->
<style>

	
	/*기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능기능*/
	/*열고 닫기*/
	#fold, #open{position:absolute; z-index:1;}	
	#fold{background-color:#fff; opacity:0.9; width:40px; padding:5px; border-radius:10px;}
	#open{display:none; top: 140px; left:30px; margin-top:348px; background-color:#fff; opacity:0.9; width:40px; padding:5px; border-radius:10px;}
	/*버튼이벤트*/
	.commBtn {	width: 90px; color: #3f1785; border: 1px solid #3f1785;}
	.commBtn:hover { border: 1px solid #3f1785; background-color: #3f1785; font-weight: bold; color: #fff; font-weight: bold;}
	.commBtnWrite{width:75px;}
	
	/*폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼폼*/
	#header{display:none;}
	body{overflow:hidden;}
	ul, li{ margin:0px; padding:0px; list-style-type:none;}
	/*searchFrm*/
	#searchFrm{position:absolute; top:20px; right:0px; z-index:1;}
	#searchFrm input[type=text]{float:left; height:48px; border-radius:5px;}
	#searchFrm input[type=image]{display:block; height:48px;}
	/*topFrm*/
	#topFrm{position:absolute; width:250px; top:20px; right:50%; z-index:1; transform:translateX(50%) }
	#topFrm>ul{text-align:center; overflow:auto; border-radius:10px; background-color:#571FB8;}
	#topFrm li{display:inline-block; background-color:#571FB8; margin:0 10px;}
	#topFrm img{width:30px; margin:9px 0px;}
	#topFrm li:first-child>a>img{ margin-left:10px;}
	#topFrm li:last-child>a>img{ margin-right:10px;}
	/*showFrm*/
	#showFrm{position:absolute; height:850px; left:30px; z-index:1; width:460px; background-color:#fff; opacity:0.9; border-radius:10px;}
	#showTopMenu{overflow:auto;}
	#showTopMenu>li{float:left; width:180px; padding: 10px 0px 10px 10px;}
	#showTopMenu>li:nth-of-type(3){width:100px;}
	#showTopMenu img{display:block; width:25px; float:left; margin-right:7px; padding-top:11px;}
	#showTopMenu img[src*=cart]{display:none;} 
	#showTopMenu span{display:block;  height:45px; line-height:45px; float:left; font-size:22px;} 
	#showTopMenu a{color:#000;}
	#showTopMenu>li:first-child>div>a{color:#571fb8; font-weight:700}
	#with{margin-left:32px;}
	#showTopMenu>li:first-child>div{overflow:auto; padding-left:15px;}
	#showTopMenu button{height:45px;}
	/*group검색폼*/
	#groupSearchFrm>select{height: 32px; width: 100px; margin: 15px 10px 15px 15px; border: 1px solid #d9d9d9; border-radius: 5px;}	    
	#groupSearchFrm>input:nth-of-type(3){    height: 32px;   width: 270px; border: 1px solid #d9d9d9;  border-radius: 5px;  margin: 15px 0px;}
    #groupSearchFrm>input:nth-of-type(4){    display: block;  height: 32px;   float: right;   margin: 15px 15px 15px 0px;}
	/*groupList*/
/* 	#groupList{overflow:auto; height:640px;}
 	#groupList>li{float:left; height:35px; line-height:38px; width:100%; padding-left:15px;}
	#groupList>li:nth-child(6n+1){font-size:22px; margin-top: 5px;}
	#groupList>li:nth-child(6n+1)>img{height:24px; margin-right:20px;} 
	#groupList>li:nth-child(6n+1)>img:nth-child(3){height:24px; margin-top: 5.5px; display:block; float:right} 
	#groupList>li:nth-child(6n+2){padding:0px; text-align:center; font-size:20px;}
	#groupList>li:nth-child(6n+6){border-bottom:1px solid #d9d9d9; font-size:13px; overflow:hidden;}
	#groupList>li:not(:nth-child(6n+1))>img{margin:0 25px;}  */
	#groupList{overflow:auto; height:640px;}
/* 	#groupList>li{border-bottom:1px solid gray;} */
	#groupList div:first-child{overflow:auto; position:relative;}
 	#groupList div:first-child>span{display:block; float:left; font-size:16px; margin:15px 0px;}
	#groupList div:first-child>img:first-child{display:block; float:left; height:16px; margin: 19px 15px;}
	#groupList div:first-child>img:nth-child(3){position:absolute; right:30px; height:30px; margin: 12px 0;}
	#groupList span{display:block; text-align:center; font-size:22px;}
	#groupList div:not(:first-child)>img{margin:5px 40px;}
	#groupList div:nth-child(6){font-size: 13px;  white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 15px; padding-right: 15px; margin-top:3px; margin-bottom:5px;}
	
	
	
	/*paging*/
	#page{text-align:center}
	#page>li{display:inline-block; border:1px solid #d9d9d9; width:35px; height:40px; line-height:40px; margin:19px auto;}
	#page>li:first-child{width:50px; border-top-left-radius:8px; border-bottom-left-radius:8px }
	#page>li:last-child{width:50px; border-top-right-radius:8px; border-bottom-right-radius:8px}
</style>
<script>	
		var inner = window.innerHeight;
		console.log(inner);
		$(function(){
			//==============================================================================
			$("#showFrm").css('top',90);
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
			
			//==========================가치가자 한끼미식회 호버==================================
			if(${vo.up_cate=='한끼미식회'}){
				$('#showTopMenu>li:nth-child(2)').hover(function(){
					//1일때 가치가자를 호버하면	
					//한끼미식회의 이미지가 사라지고 이미지가 사라진 만큼 왼쪽에 margin을 준다
					$(this).prev().children("div").children("img").css("display","none");
					$("#eat").css("margin-left","32px");					
					//가치가자의 이미지가 생기니까 가지가자가 margin-left가 0이 된다
					$(this).children("img").css("display","block");
					$("#with").css("margin-left","0px");					
					//호버한 가지가자의 글씨 굵기가 bold가 되고 한끼미식회는 plain이 된다.
					$(this).children("a").css("color","#571fb8").css("font-weight","700"); 		
					$(this).prev().children("div").children("a").css("color","#000").css("font-weight","400");			
				},function(){
					//가치가자 호버를 때면
					$(this).prev().children("div").children("img").css("display","block");
					$("#eat").css("margin-left","0px");			
					$(this).children("img").css("display","none");
					$("#with").css("margin-left","32px");					
					$(this).children("a").css("color","#000").css("font-weight","400");
					$(this).prev().children("div").children("a").css("color","#571fb8").css("font-weight","700");					
				});
			}else{
				$('#showTopMenu>li:nth-child(2)').children("img").css("display","block");
				$('#showTopMenu>li:nth-child(2)').children("a").css("font-weight","700").css("color","#571fb8");
				$("#with").css("margin-left","0px");
				$('#showTopMenu>li:nth-child(1)').children("img").css("display","none");
				$('#showTopMenu>li:nth-child(1)').children("a").css("font-weight","400").css("color","#000");
				$("#eat").css("margin-left","32px");		
					$('#showTopMenu>li:nth-child(1)').hover(function(){
						//2일때 한끼미식회를 호버하면					
						//가치가자의 이미지가 사라지고 이미지가 사라진 만큼 왼쪽에 margin을 준다
						$(this).next().children("img").css("display","none");
						$("#with").css("margin-left","32px");
						//한끼미식회의 이미지가 생기니까 가지가자가 margin-left가 0이 된다
						$(this).children("img").css("display","block");
						$("#eat").css("margin-left","0px");					
						//호버한 가지가자의 글씨 굵기가 bold가 되고 가치가자는 plain이 된다.
						$(this).children("a").css("color","#571fb8").css("font-weight","700"); 		
						$(this).next().children("a").css("color","#000").css("font-weight","400");		
					},function(){
						$(this).next().children("img").css("display","block");
						$("#with").css("margin-left","0px");
						$(this).children("img").css("display","none");
						$("#eat").css("margin-left","32px");			
						$(this).children("a").css("color","#000").css("font-weight","400"); 		
						$(this).next().children("a").css("color","#571fb8").css("font-weight","700");	
					});
	
			}
			//==========================가치가자 한끼미식회 호버endddddddd==================================
			
			
				
			//글쓰기폼=====================================================================================
			$("#WriteForm").click(function(){
				location.href="WriteForm?g_loc=${vo.g_loc}&up_cate=한끼미식회";
			});
			//글쓰기폼end=====================================================================================	
			
			//검색=====================================================================================
				$("#groupSearchFrm").submit(()=>{
					if($("#searchWord").val()==null || $("#searchWord").val()=='' ){
						alert('검색어를 입력해주세요');
						return false;
					}
					return ture;
				});
			//
		})
</script>

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
			<input type="text" name="searchWord" id="searchWord" value="${vo.g_loc }" size=40; />
			<input type="image" src="<%=request.getContextPath()%>/img/groupImg/search.png" value="검색"/>
		</form>
	</div>

	<!-- showFrm 리스트 -->
	<div id="showFrm">	
		<ul id="showTopMenu">
			<li><div><img id="dishImg" src="<%=request.getContextPath()%>/img/groupImg/dish.png"/><a href="eatPage?g_loc=${vo.g_loc }&up_cate=한끼미식회"><span id="eat">한끼미식회</span></a></div></li>
			<li><img style="display:none" src="<%=request.getContextPath()%>/img/groupImg/cartP.png"/><a href="withPage?g_loc=${vo.g_loc }&up_cate=가치가장"><span id="with">가치가장</span></a></li>
			<li><button id="WriteForm" class="btn commBtn commBtnWrite">글쓰기</button>
		</ul>
		<hr style="width:430px; margin-bottom:20px; margin-top:0px; background:#a9a9a9; margin:0 auto;">
		<form id="groupSearchFrm" method="get" action="eatPage">
			<input type="hidden" name="g_loc" value="강서구"/><!-- 나중에 로그인하면 세션값을 받아와서 띄워줘야 한다........................... -->
			<input type="hidden" name="up_cate" value="한끼미식회"/>
			<select name="searchKey">
				<option value="g_subject">제목</option>
				<option value="userid">작성자</option>
				<option value="g_content">내용</option>
			</select>
			<input type="text" name="searchWord"/>
			<input type="image" src="<%=request.getContextPath()%>/img/groupImg/search.png" value="검색"/>
		</form>
		

		<ul id="groupList">
	   		<%-- <li><img src="<%=request.getContextPath()%>/img/groupImg/dish.png"/><span>같이먹어요(up_cate)</span><img src="<%=request.getContextPath()%>/img/groupImg/likeE.png"/></li>
			--%>
			<c:forEach var="i" begin="1" end="5">
				<li>
					<div><img src="<%=request.getContextPath()%>/img/groupImg/dish.png"/><span>같이먹어요</span><img src="<%=request.getContextPath()%>/img/groupImg/likeE.png"/></div>
					<span>오늘 점심 같이 드실분 있나요 [솥밥]</span>
					<div><img src="<%=request.getContextPath()%>/img/groupImg/clock.png" title="약속시간"/>2021-04-21 오후 6시 29분</div><!-- g_date, g_time 값을 가지고 온다. -->
					<div><img src="<%=request.getContextPath()%>/img/groupImg/markerB.png" title="약속장소"/>가양역1번출구</div><!-- g_loc1 값을 가져온다. -->
					<div><img src="<%=request.getContextPath()%>/img/groupImg/human.png" title="모집인원"/>1 / 3명</div><!-- 1=> join테이블에서 게시글번호로 이어서 신청완료 상태를 count로 세어온다 -->
					<div>#아 #하기 #시르다 #아 #하기 #시르다 #아 #하기 #시르다 #아 #하기 #시르다 </div><!-- 태그값을 가지고온다. -->
					<hr/>
				</li>
			</c:forEach>	
			
		</ul>
		
		
		
		
		<div>
			<ul id="page">
				<li>이전</li>
				<li>1</li>
				<li>2</li>
				<li>3</li>
				<li>4</li>
				<li>5</li>
				<li>다음</li>
			</ul>
		</div>
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