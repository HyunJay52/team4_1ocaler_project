<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->
<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script> 	
<link ref="stylesheet" href="<%=request.getContextPath()%>/css/commonStyle.css" type="html/css"/>
<style>
	#pageTop{display:none;}
	#footer{display:none;}
	#groupWriteFormBody{overflow:hidden;}
	ul, li{ margin:0px; padding:0px; list-style-type:none;}
	/*버튼*/
	.commBtn {width: 90px;	color: #3f1785;	border: 1px solid #3f1785;}
	.commBtn:hover {border: 1px solid #3f1785;	background-color: #3f1785;	font-weight: bold;	color: #fff;	font-weight: bold;}
	.cancelBtn {	border: 1px solid #ddd;	color: #ddd;	width: 90px;}
	.cancelBtn:hover {	background-color: #fff;	color: gray;}	
	.confBtn {	background: #3f1785;	color: #fff;	width: 90px;}
	.confBtn:hover {	color: #fff;	background: #B8B2F4;}
	/* 맨위 셀렉트 박스 부분 */
	#groupWriteFormUp_cate, #groupWriteFormDown_cate{ width:150px; height:40px; padding-left:10px; border:1px solid #d3d3d3;
	background:url("<%=request.getContextPath()%>/img/groupImg/dropDown.png")  no-repeat 95% 50%; border-radius:5px; apperance:none; -webkit-appearance:none;}
	#groupWriteFormUp_cate{margin:20px 10px 10px 15px;}
	#groupWriteFormG_cnt{ width:100px; height:40px; padding-left:5px; border:1px solid #d3d3d3;
	background:url("<%=request.getContextPath()%>/img/groupImg/dropDown.png")  no-repeat 95% 50%; border-radius:5px; apperance:none; -webkit-appearance:none;}
	/*출발지 도착지*/
	#groupWriteFormG_loc1{background:url("<%=request.getContextPath()%>/img/groupImg/startMarker.png")  no-repeat 98% 50%; background-size:5%; apperance:none; -webkit-appearance:none; }
	#groupWriteFormG_loc2{background:url("<%=request.getContextPath()%>/img/groupImg/arrivedMarker.png")  no-repeat 98% 50%; background-size:5%; apperance:none; -webkit-appearance:none; }
</style>
<script>	
	$(function(){
		//==============================================================================
		
		//ck editor
		CKEDITOR.replace("groupWriteFormG_content", {
			height:300
		});
		
		
		//작성폼 유효성 검사===========================================================================
		if($("#groupWriteFormUp_cate").val()=="한끼미식회"){
			$("#groupWriteFormGroupWriteFrm").on('submit',function(){
				if($("#groupWriteFormG_subject").val()=='' || $("#groupWriteFormG_subject").val()==null){
					alert('제목입력해라');
					return false;
				}
				if(CKEDITOR.instances.groupWriteFormG_content.getData()==''){
					alert('내용입력해라');
					return false;
				}
				if($("#groupWriteFormG_date").val()=='' || $("#groupWriteFormG_date").val()==null){
					alert('날짜입력해라');
					return false;
				}
				if($("#groupWriteFormG_time").val()=='' || $("#groupWriteFormG_time").val()==null){
					alert('시간입력해라');
					return false;
				}
				if($("#groupWriteFormG_cnt").val()=='' || $("#groupWriteFormG_cnt").val()==null){
					alert('모집인원입력해라');
					return false;
				}
				if($("#groupWriteFormG_loc1").val()=='' || $("#groupWriteFormG_loc1").val()==null){
					alert('지역입력해라');
					return false;
				}
			});
		}else{
			$("#groupWriteFormGroupWriteFrm").on('submit',function(){
				if($("#groupWriteFormDown_cate option:selected").val()=='동네마트'){
					if($("#groupWriteFormG_subject").val()=='' || $("#groupWriteFormG_subject").val()==null){
						alert('제목입력해라');
						return false;
					}
					if(CKEDITOR.instances.groupWriteFormG_content.getData()==''){
						alert('내용입력해라');
						return false;
					}
					if($("#groupWriteFormG_date").val()=='' || $("#groupWriteFormG_date").val()==null){
						alert('날짜입력해라');
						return false;
					}
					if($("#groupWriteFormG_time").val()=='' || $("#groupWriteFormG_time").val()==null){
						alert('시간입력해라');
						return false;
					}
					if($("#groupWriteFormG_cnt").val()=='' || $("#groupWriteFormG_cnt").val()==null){
						alert('모집인원입력해라');
						return false;
					}
					if($("#groupWriteFormG_loc1").val()=='' || $("#groupWriteFormG_loc1").val()==null){
						alert('지역입력해라');
						return false;
					}
				}else{
					if($("#groupWriteFormG_subject").val()=='' || $("#groupWriteFormG_subject").val()==null){
						alert('제목입력해라');
						return false;
					}
					if(CKEDITOR.instances.groupWriteFormG_content.getData()==''){
						alert('내용입력해라');
						return false;
					}
					if($("#groupWriteFormG_date").val()=='' || $("#groupWriteFormG_date").val()==null){
						alert('날짜입력해라');
						return false;
					}
					if($("#groupWriteFormG_time").val()=='' || $("#groupWriteFormG_time").val()==null){
						alert('시간입력해라');
						return false;
					}
					if($("#groupWriteFormG_cnt").val()=='' || $("#groupWriteFormG_cnt").val()==null){
						alert('모집인원입력해라');
						return false;
					}
					if($("#groupWriteFormG_loc1").val()=='' || $("#groupWriteFormG_loc1").val()==null){
						alert('지역입력해라123123123123');
						return false;
					}
					if($("#groupWriteFormG_loc2").val()=='' || $("#groupWriteFormG_loc2").val()==null){
						alert('지역입력해라AAAAAAAAAAAAAAAAAAAAAAAAAAa');
						return false;
					}
				}
			});
		}
		//작성폼 유효성 검사 end================================================================================================
		
		//===================================================================================================
		
		$("#groupWriteFormCancleBtn").on('click',()=>{
			history.back();
		});
		
		//지도 스크립트==============================================
		var marker;
		var marker1;
		var marker2;
		var markers = [];
		var markers2 = [];
		var customOverlay;
		var customOverlay2;
		var customOverlays = [];
		var customOverlays2 = [];
		
		//지도 검색 키워드 객체 생성
		var ps = new kakao.maps.services.Places();
		var geocoder = new kakao.maps.services.Geocoder();
		
	
		var container = document.getElementById("groupWriteFormMap"),
			options = {
				center : new kakao.maps.LatLng(33.450701,126.570667),
				level : 7
			};
		var map = new kakao.maps.Map(container, options);

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
		var arrivedMarkerImage = new kakao.maps.MarkerImage(
				'<%=request.getContextPath()%>/img/groupImg/arrivedMarker.png',
				new kakao.maps.Size(35,35),
				{
			        offset: new kakao.maps.Point(16, 34),
			        alt: "도착지",
			        shape: "poly",
			        coords: "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
			    }
		);
		
		
		
		
		
		
		function displayMarker(place){
				marker = new kakao.maps.Marker({
				map : map,
				image : startMarkerImage,
				clickable : true,
				position : new kakao.maps.LatLng(place.y, place.x)
			});
			markers.push(marker);
		}
	
		function searchPlaces(){
			var keyword = document.getElementById('groupWriteFormSearchWord').value;
			console.log(keyword);
			 if (!keyword.replace(/^\s+|\s+$/g, '')) {
			        alert('키워드를 입력해주세요!');
			        return false;
			 }		
			 ps.keywordSearch( keyword, callback, {
				 size : 1
			 }); 
		}
		
		
		function callback(data, status, pagination){
			if(status == kakao.maps.services.Status.OK){					
				removeMarker();	
				document.getElementById('groupWriteFormSearchWord').value = '';
				var bounds = new kakao.maps.LatLngBounds();			
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
		
		if(${pageVO.category=='가치가장'}){
			//출발지 도착지 찍기
			if('${withVO.g_loc2}'!=null && '${withVO.g_loc2}'!=''){
				locMarker('${withVO.g_loc1}',startMarkerImage, '출발지');
				locMarker('${withVO.g_loc2}',arrivedMarkerImage, '도착지');
			}else{
				locMarker('${withVO.g_loc1}',startMarkerImage, '약속장소');
			}
		}else{		
			locMarker('${eatVO.g_loc1}',startMarkerImage, '약속장소');
		}
		
		
		
		
		function locMarker(locations, markerImage, contents){
			geocoder.addressSearch( locations , function(result, status) {
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);					     
			        console.log(contents.includes('도착지'));
			        if(contents.includes('도착지')){
			            marker2 = new kakao.maps.Marker({
				            map: map,
				            position: coords,
				            image : markerImage
				        });   
			    		
			        }else{
			        	marker1 = new kakao.maps.Marker({
				            map: map,
				            position: coords,
				            image : markerImage
				        }); 			    		
			    		
			        }
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			}); 	
		}
		//출발지위치찍지
		startMarker();
		//도착지 위치찍기 (창고형마트일때만)
		if(${withVO.g_loc2!=null}){
			arrivedMarker();
		}

		function searchDetailAddrFromCoords(coords, callback) {
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		
		
		//마우스 클릭시 출발지 
		function startMarker(){
			marker1 = new kakao.maps.Marker({
						map: map,
						image:startMarkerImage			
			});
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {	        	
			            var detailAddr = result[0].address.address_name;
						console.log(detailAddr);
						document.getElementById('groupWriteFormG_loc1').value = detailAddr;
			            // 마커를 클릭한 위치에 표시합니다 
			            marker1.setPosition(mouseEvent.latLng);
			            marker1.setMap(map);	 
			        }   
			    });
			});
		}
		
		
		
		
		//마우스 우클릭시 도착지
		function arrivedMarker(){
			marker2 = new kakao.maps.Marker({
					map: map,
					image:arrivedMarkerImage
					
			});
			kakao.maps.event.addListener(map, 'rightclick', function(mouseEvent) {
				searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            var detailAddr = result[0].address.address_name;   
						console.log(detailAddr);
						document.getElementById('groupWriteFormG_loc2').value = detailAddr;								
			            // 마커를 클릭한 위치에 표시합니다 
			            marker2.setPosition(mouseEvent.latLng);
			            marker2.setMap(map);
			            markers2.push(marker2);			        
			        }   		       
			    });	
			});
		}
		
		
		
		//마커지우는용도
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
		
		$("#groupWriteFormSearchFrms").click(()=>{
			searchPlaces();
		});
	});
</script> 	
</head>
<body id="groupWriteFormBody">
	<div id="groupWriteFormMap" style="width:2000px; height:1200px; position:relative; overflow:hidden;"></div>
	
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
			<input type="text" name="groupWriteFormSearchWord" id="groupWriteFormSearchWord" value="${pageVO.loc_gu }" size=40; />
			<input type="image" id='groupWriteFormSearchFrms' src="<%=request.getContextPath()%>/img/groupImg/search.png" value="검색"/>
	</div>
	
	

	<!-- groupWriteFormShowFrm 리스트 -->
	<div id="groupWriteFormShowFrm">
		<form id="groupWriteFormGroupWriteFrm" method="post" action="groupEditOk">
			
			<!-- pageVO 에서 끝낼수 있는 항목 -->
			<div> 
				<select name="up_cate" id="groupWriteFormUp_cate" size="1" >
					<c:if test="${pageVO.category=='한끼미식회' }">
						<option value="한끼미식회" selected>한끼미식회</option>
					</c:if>
					<c:if test="${pageVO.category=='가치가장' }">
						<option value="가치가장" selected>가치가장</option>
					</c:if>
				</select>
				
				
				<select name="down_cate" id="groupWriteFormDown_cate" size="1">
					<c:if test="${pageVO.category=='한끼미식회' }">
						<option value="같이먹어요" selected>같이먹어요</option>
					</c:if>
					<c:if test="${pageVO.category=='가치가장' }">
						<c:if test="${withVO.down_cate=='동네마트'}">
							<option value="동네마트">동네마트</option>
						</c:if>
						<c:if test="${withVO.down_cate=='창고형마트'}">
							<option value="창고형마트">창고형마트</option>
						</c:if>
					</c:if>
				</select><br/>
			</div>
			
			
			<!-- 한끼미식회일때 수정폼 -->
			<c:if test="${pageVO.category=='한끼미식회' }">
				<div>
					<input type="text" name="g_subject" id="groupWriteFormG_subject" value='${eatVO.g_subject }' placeholder="&nbsp;제목을 입력하세요.....">
				</div>
			
				<textarea name="g_content" id="groupWriteFormG_content">${eatVO.g_content }</textarea>
			
				<div>
					<input type="date" name="g_date" id="groupWriteFormG_date" value="${eatVO.g_date }"/>
					<input type="time" name="g_time" id="groupWriteFormG_time" value="${eatVO.g_time }"/>
					<select name="g_cnt" id="groupWriteFormG_cnt" size="1" >
							<option value="" disabled selected hidden>모집인원</option>
							<option value="1" <c:if test='${eatVO.g_cnt==1 }'>selected</c:if>>1명</option>
							<option value="2" <c:if test='${eatVO.g_cnt==2 }'>selected</c:if>>2명</option>
							<option value="3" <c:if test='${eatVO.g_cnt==3 }'>selected</c:if>>3명</option>
							<option value="4" <c:if test='${eatVO.g_cnt==4 }'>selected</c:if>>4명</option>
							<option value="5" <c:if test='${eatVO.g_cnt==5 }'>selected</c:if>>5명</option>
					</select>
					
					
					<div>
						<input type="text" name="g_loc1" id="groupWriteFormG_loc1" value="${eatVO.g_loc1 }" placeholder="지역을 입력해주세요(지도를 클릭하세요)" readonly/>
						<input type="text" name="g_tag" id="groupWriteFormG_tag" value="${eatVO.g_tag }" placeholder="해시태그를 달아주세요 Ex) #한끼미식회 #가치가장" />
					</div>
					
					<div id="groupWriteFormCcFrm">
						<input class="btn cancelBtn" id="groupWriteFormCancleBtn" type="button" value="취소"/>
						<input class="btn confBtn" id="groupWriteFormConfBtn" type="submit" value="수정"/>
					</div>
				</div>
				
					<input type="hidden" name="num" value="${eatVO.num }"/><!-- num -->
					<input type="hidden" name="userid" value="${eatVO.userid }"/><!-- num -->
					<input type="hidden" name="loc_gu" value="${pageVO.loc_gu }"/><!-- num -->
					<input type="hidden" name="pageNum" value="${pageVO.pageNum }"/><!-- pageNum -->
					<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">
						<input type="hidden" name="searchKey" value="${pageVO.searchKey }"/><!--searchkey  -->
						<input type="hidden" name="searchWord" value="${pageVO.searchWord }"/><!--searchword  -->
					</c:if>
			</c:if>

			<!--가치가장일때 수정폼 -->
			<c:if test="${pageVO.category=='가치가장' }">
				<div>
					<input type="text" name="g_subject" id="groupWriteFormG_subject" value='${withVO.g_subject }' placeholder="&nbsp;제목을 입력하세요.....">
				</div>
			
				<textarea name="g_content" id="groupWriteFormG_content">${withVO.g_content }</textarea>
			
				<div>
					<input type="date" name="g_date" id="groupWriteFormG_date" value="${withVO.g_date }"/>
					<input type="time" name="g_time" id="groupWriteFormG_time" value="${withVO.g_time }"/>
					<select name="g_cnt" id="groupWriteFormG_cnt" size="1" >
							<option value="" disabled selected hidden>모집인원</option>
							<option value="1" <c:if test='${withVO.g_cnt==1 }'>selected</c:if>>1명</option>
							<option value="2" <c:if test='${withVO.g_cnt==2 }'>selected</c:if>>2명</option>
							<option value="3" <c:if test='${withVO.g_cnt==3 }'>selected</c:if>>3명</option>
							<option value="4" <c:if test='${withVO.g_cnt==4 }'>selected</c:if>>4명</option>
							<option value="5" <c:if test='${withVO.g_cnt==5 }'>selected</c:if>>5명</option>
					</select>
					
					
					<div>
						<input type="text" name="g_loc1" id="groupWriteFormG_loc1" value="${withVO.g_loc1 }" placeholder="지역을 입력해주세요(지도를 클릭하세요)" readonly/>
						<c:if test="${withVO.g_loc2!=null }">
							<input type="text" name="g_loc2" id="groupWriteFormG_loc2" value="${withVO.g_loc2 }" placeholder="지역을 입력해주세요(지도를 클릭하세요)" readonly/>
						</c:if>
						<input type="text" name="g_tag" id="groupWriteFormG_tag" value="${withVO.g_tag }" placeholder="해시태그를 달아주세요 Ex) #한끼미식회 #가치가장" />
					
					</div>
					
					<div id="groupWriteFormCcFrm">
						<input class="btn cancelBtn" id="groupWriteFormCancleBtn" type="button" value="취소"/>
						<input class="btn confBtn" id="groupWriteFormConfBtn" type="submit" value="수정"/>
					</div>
				</div>
					<input type="hidden" name="num" value="${withVO.num }"/><!-- num -->
					<input type="hidden" name="userid" value="${withVO.userid }"/><!-- num -->
					<input type="hidden" name="loc_gu" value="${pageVO.loc_gu }"/><!-- num -->
					<input type="hidden" name="pageNum" value="${pageVO.pageNum }"/><!-- pageNum -->
					<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">
						<input type="hidden" name="searchKey" value="${pageVO.searchKey }"/><!--searchkey  -->
						<input type="hidden" name="searchWord" value="${pageVO.searchWord }"/><!--searchword  -->
					</c:if>
			</c:if>
			
			
			</form>	
	</div>
</body>
</html>	