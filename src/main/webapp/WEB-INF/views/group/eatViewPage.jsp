<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->
<style>
	ul, li{ margin:0px; padding:0px; list-style-type:none;}
	#pageTop{display:none;}
	#footer{display:none;}
	#eatViewPagebody{overflow:hidden;}
	/*버튼*/
	.commBtn {width: 90px;	color: #3f1785;	border: 1px solid #3f1785;}
	.commBtn:hover {border: 1px solid #3f1785;	background-color: #3f1785;	font-weight: bold;	color: #fff;	font-weight: bold;}
	.cancelBtn {	border: 1px solid #ddd;	color: #ddd;	width: 90px;}
	.cancelBtn:hover {	background-color: #fff;	color: gray;}	
	.confBtn {	background: #3f1785;	color: #fff;	width: 90px;}
	.confBtn:hover {	color: #fff;	background: #B8B2F4;}
</style>
<script>	
		$(function(){	
			var x = window.innerWidth;
			var y = window.innerHeight;
			console.log(x/2);
			console.log(y/2);
			//팝업창 띄우기================================================
			/*위치설정*/
			var width =	$("#EVPProfilePopup").width();
			var height = $("#EVPProfilePopup").height();
			console.log(width,height)
			$("#EVPProfilePopup").css("top",y/2-height/2).css("left",x/2-width/2);
			/*띄우기*/
			$("#eatViewPageShowTopMenu>li:nth-child(4)").click(()=>{
				$("#EVPProfilePopup").css("display","block");
				
			});	
			/*팝업창 닫기*/
			
			$('#EVPProfilePopup>div:first-child>span').click(()=>{
				$("#EVPProfilePopup").css("display","none");
			});

			//버튼 클릭시============================================================================
				//뒤로가기	
			
			$("#eatViewPageBackBtn").click(()=>{
				history.back();
			})	
				//수정
				
				
				
				//삭제
			$("#eatViewDeleteBtn").click(()=>{
				if(confirm('삭제 하시겠습니까?')){
					location.href="eatViewPageDel?num=${vo.num}&loc_gu=${pageVO.loc_gu}&up_cate=${vo.up_cate}";
				}
			});
				
				
			//참여하기================================================================================
				$("#eatViewPageJoinBtn").click(()=>{
					var url = "joinInsert";
					var params ="num="+$("#eatViewPageJoinBtn").val();
					console.log(params);
					$.ajax({
						url : url,
						data : params,
						success:function(result){
							alert('신청이 완료되었습니다. 응답을 기다려 주세요');
							$("#eatViewPageJoinBtn").children("span").text('신청완료');//이거는 아작스로 바꿔준거고
							$("#eatViewPageJoinBtn").attr("disabled",true);
							
						},error:function(e){
							console.log('신청실패')
						}
					})
				});
			//참여하기 버튼이 disabled 일때 신청완료로 바꿔주기 다시접속했을 떄도 신청완료로 뜨게하려고 함
			var joinCheck = $("#eatViewPageJoinBtn").attr("disabled");
			console.log(joinCheck);
			if(joinCheck=='disabled'){
				$("#eatViewPageJoinBtn").children("span").text('신청완료');
			}
			
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
			<li><a href="eatPage?loc_gu=${pageVO.loc_gu }"><img src="<%=request.getContextPath()%>/img/groupImg/dishW.png"></a></li>
			<li><a href="withPage?loc_gu=${pageVO.loc_gu }"><img src="<%=request.getContextPath()%>/img/groupImg/cartW.png"></a></li>
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
			<li><span>조회수 : ${vo.g_hit } </span></li>
			<li><span> ${vo.g_subject }</span></li>
			<li><img id="EVPprofileView" src="<%=request.getContextPath()%>/common/user.png"/></li>
			<li><div>${vo.memberVO.mem_nick }</div><div>${vo.g_writedate }</div></li>
			<li>모집인원 : <span> ${appNum }</span> / <span> ${vo.g_cnt } </span></li> <!--  쒯 join 테이블도 join해야되네 -->
			
		</ul>
		<hr style="margin:5px 0px;"/>
		<div>
			${vo.g_content }
		</div>
		<hr style="width:480px; margin:0 auto;">	
		<span> 약속정보</span>
		<div><img src="<%=request.getContextPath()%>/img/groupImg/clock.png" title="약속시간"/><div>${vo.g_date }  ${vo.g_time }</div></div><!-- g_date, g_time 값을 가지고 온다. -->
		<div><img src="<%=request.getContextPath()%>/img/groupImg/markerB.png" title="약속장소"/><div> ${vo.g_loc1 }</div></div><!-- g_loc1 값을 가져온다. -->
		<div> ${vo.g_tag }</div>
		<hr style="width:480px; margin:0 auto;"/>
		<div>
			<button id="eatViewPageBackBtn" class="btn cancelBtn">뒤로가기</button>
			<c:if test="${vo.userid!=logId}"> 
				<button type="button" id="eatViewPageJoinBtn" class="btn confBtn" value="${vo.num }" <c:forEach var="joins" items="${joinList}"><c:if test="${joins.numJoin==vo.num && logId==joins.userid }">disabled</c:if></c:forEach>><span id="eatViewPagejoinCheck">참여하기</span></button>
			</c:if>
			<c:if test="${vo.userid==logId }"> <!--이건 작성자일경우 수정하기 버튼  -->
				<button id="eatViewDeleteBtn" class="btn commBtn">삭제</button>
				<button id="eatViewPageEditBtn" class="btn commBtn">수정</button>
			</c:if>
		</div>
	</div>
	
	<div id="EVPProfilePopup">
		<div><span>X</span></div>
		<div><span>활동정보</span></div>
		<div><img src="<%=request.getContextPath()%>/common/user.png"></div>
		<div>
			<ul>
				<li><span>goguam1234</span></li>
				<li><span>가입일 : 2021-08-29 </span></li>
				<li><span>총 게시물 : 100개</span></li>
				<li><span>총 댓글수 : 100개</span></li>
			</ul>
		</div>
		<div><button class="btn commBtn">1:1채팅</button><button class="btn commBtn">신고하기</button></div>
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