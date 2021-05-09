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
			/*신고하기*/
			$('#eatViewPageReportBtn').click(()=>{ //글번호 넘겨야해?memberPageVO 보고서 결정하자
				if(${logId!=null}){
					location.href="reportWrite?userid=${vo.userid}"	
				}else{
					alert('로그인후 사용할 수 있습니다.');
				}
			});

			//버튼 클릭시============================================================================
			//뒤로가기		
			$("#eatViewPageBackBtn").click(()=>{
				location.href="eatPage?&loc_gu=${pageVO.loc_gu}&pageNum=${pageVO.pageNum}&category=한끼미식회<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord }</c:if>";
			});	
			//수정
			$("#eatViewPageEditBtn").click(()=>{
				location.href="groupEditForm?num=${vo.num}&userid=${vo.userid}&loc_gu=${pageVO.loc_gu}&pageNum=${pageVO.pageNum}&category=한끼미식회<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord }</c:if>";
			})	
				
				
			//삭제
			$("#eatViewDeleteBtn").click(()=>{
				if(confirm('삭제 하시겠습니까?')){
					location.href="eatViewPageDel?loc_gu=${pageVO.loc_gu}&up_cate=${vo.up_cate}";
				}
			});	
			//참여하기================================================================================
				if(${logId!=null}){
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
				}else{
					$("#eatViewPageJoinBtn").click(()=>{
						alert('로그인 후 이용해 주세요')
						location.href="";
					});
				}
				
			//참여하기 버튼이 disabled 일때 신청완료로 바꿔주기 다시접속했을 떄도 신청완료로 뜨게하려고 함
			var joinCheck = $("#eatViewPageJoinBtn").attr("disabled");
			console.log(joinCheck);
			if(joinCheck=='disabled'){
				$("#eatViewPageJoinBtn").children("span").text('신청완료');
				$("#withViewPageJoinBtn").css('background',"#B8B2F4");
				$("#withViewPageJoinBtn").css('opacity',1);
			}
			
		//지도============================================================================================
		var markers = [];	
		//지도 검색 키워드 객체 생성
		var ps = new kakao.maps.services.Places();
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
			//지도 생성
			var container = document.getElementById("eatViewPageMap"),
				options = {
					center : new kakao.maps.LatLng(33.450701,126.570667),
					level : 4
				};
			var map = new kakao.maps.Map(container, options);
			//마커 찍기를 함수화
		
			var marker;	
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
			function displayMarker(place){
				//마커를 생성하고 지도에 표시한다.	
					marker = new kakao.maps.Marker({
						map : map,
						image : startMarkerImage,
						clickable : true,
						position : new kakao.maps.LatLng(place.y, place.x)
					});
					
					markers.push(marker);
					
				}
				
			
			
				
			//검색한 키워드 값을 내가 text에서입력한 값으로 셋팅해주는 작업
			function searchPlaces(){
				var keyword = $("#eatViewPageSearchWord").val();
				console.log(keyword);
				 if (!keyword.replace(/^\s+|\s+$/g, '')) {
				        alert('키워드를 입력해주세요!');
				        return false;
				 }
				
				 ps.keywordSearch( keyword, callback, {
					 size : 1
				 }); 
			}
			
			//KeyWordSearch 에서 키워드를 검색한다음에 실행하는 콜백 함수로 
			//검색한 다음의 결과값을 result로 받는다.
			function callback(data, status, pagination){
				if(status == kakao.maps.services.Status.OK){
					console.log(data)
					removeMarker();	
					$("#eatViewPageSearchWord").val("");
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
					 map.setLevel(4);
					
			    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
			        alert('검색 결과가 존재하지 않습니다.');
			        return;
	
			    } else if (status === kakao.maps.services.Status.ERROR) {
	
			        alert('검색 결과 중 오류가 발생했습니다.');
			        return;
	
			    }
			}
			
			
			
			
			
			

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${vo.g_loc1}', function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords,
			            image : startMarkerImage
			        });
			        
			        var content ='<div class="customOverlay"> 약속장소 </div>'
			        
			    	var customOverlay = new kakao.maps.CustomOverlay({
		        	    map: map,
		        	    position: coords,
		        	    content: content,
		        	    yAnchor: 1
		        	});

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    			
			//마커지우는용도
			function removeMarker() {
			    for ( var i = 0; i < markers.length; i++ ) {
			        markers[i].setMap(null);
			    }   
			    markers = [];
			}
			
			
			//검색기능
			$("#eatViewPageSearchFrm").click(()=>{
				searchPlaces();
			});
			
			
		})
</script>

</head>
<body id="eatViewPagebody">
	<div id="eatViewPageMap" style="width:2000px; height:1200px; position:relative; overflow:hidden;"></div>
		
	<!-- 맨위 폼 -->
	<div class="groupTopFrm">
		<ul>
			<li><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/img/groupImg/homeTop.png"></a></li>
			<li><a href="eatPage?loc_gu=${pageVO.loc_gu}&pageNum=${pageVO.pageNum}&category=한끼미식회<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord }</c:if>"><img src="<%=request.getContextPath()%>/img/groupImg/dishTop.png"></a></li>
			<li><a href="withPage?loc_gu=${pageVO.loc_gu}&pageNum=${pageVO.pageNum}&category=가치가장<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord }</c:if>"><img src="<%=request.getContextPath()%>/img/groupImg/bagTop.png"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/img/groupImg/carTop.png"></a></li>
		</ul>
	</div>
	<!-- 검색 폼 -->
	<div class="groupSearchFrm">
		<input type="text" name="eatViewPageSearchWord" id="eatViewPageSearchWord" value="" size=40; />
		<input type="image" id="eatViewPageSearchFrm" src="<%=request.getContextPath()%>/img/groupImg/search.png" value="검색"/>
	</div>

	<!-- showFrm 리스트 -->
	<div id="eatViewPageShowFrm">	
		<ul id="eatViewPageShowTopMenu">
			<li><img src="<%=request.getContextPath()%>/img/groupImg/dish.png"/><span>${vo.up_cate } > ${vo.down_cate }</span></li>
			<li><span>조회수 : ${vo.g_hit } </span></li>
			<li><span> ${vo.g_subject }</span></li>
			<li><img id="EVPprofileView" src="<%=request.getContextPath()%>/img/mem_prof/${vo.memberVO.mem_prof}"/></li>
			<li><div>${vo.memberVO.mem_nick }</div><div>${vo.g_writedate }</div></li>
			<li>모집인원 : <span> ${appNum }</span> / <span> ${vo.g_cnt } </span></li> <!--  쒯 join 테이블도 join해야되네 -->
			
		</ul>
		<hr style="margin:5px 0px;"/>
		<div>
			${vo.g_content }
		</div>
		<hr style="width:450px; margin:0 auto;">	
		<span> 약속정보</span>
		<div><img src="<%=request.getContextPath()%>/img/groupImg/clock.png" title="약속시간"/><div>${vo.g_date }  ${vo.g_time }</div></div><!-- g_date, g_time 값을 가지고 온다. -->
		<div><img src="<%=request.getContextPath()%>/img/groupImg/markerB.png" title="약속장소"/><div> ${vo.g_loc1 }</div></div><!-- g_loc1 값을 가져온다. -->
		<div> ${vo.g_tag }</div>
		<hr style="width:450px; margin:0 auto;"/>
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
		<div><img src="<%=request.getContextPath()%>/img/mem_prof/${vo.memberVO.mem_prof}"></div>
		<div>
			<ul id="EVPProfilePopupUl">
				<li><span>${vo.userid }</span></li>
				<li><span>가입일 : ${vo.memberVO.mem_sub } </span></li>
				<li><span>총 게시물 : ${vo.memberVO.mem_post }개</span></li>
				<li><span>총 댓글수 : ${vo.memberVO.mem_rev }개</span></li>
			</ul>
		</div>
		<div><button id="eatViewPageChatBtn"  class="btn commBtn">1:1채팅</button><button id="eatViewPageReportBtn" class="btn commBtn">신고하기</button></div>
	</div>
</body>
</html>