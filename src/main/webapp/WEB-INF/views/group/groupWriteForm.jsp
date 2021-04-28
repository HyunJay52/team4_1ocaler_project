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
	#groupWriteFormG_loc1{background:url("<%=request.getContextPath()%>/img/groupImg/markerG.png")  no-repeat 98% 50%; background-size:5%; apperance:none; -webkit-appearance:none; }
	#groupWriteFormG_loc2{background:url("<%=request.getContextPath()%>/img/groupImg/markerP.png")  no-repeat 98% 50%; background-size:5%; apperance:none; -webkit-appearance:none; }
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
		
		// groupWriteFormG_loc1 (출발지)에 값이 없으면 회색 있으면 보라색
			$('#groupWriteFormG_loc1').change(()=>{
			if($("#groupWriteFormG_loc1").val()=='' || $("#groupWriteFormG_loc1").val()==null){
				$('#groupWriteFormG_loc1').css("background-image","url('/1ocaler/img/groupImg/markerG.png')");
			}else{
				$('#groupWriteFormG_loc1').css("background-image","url('/1ocaler/img/groupImg/markerP.png')");
			}
		});
		
		//창고형마트-동네마트 이동시 값들 disable 처리 및 값초기화 작업====================================================================================================
		$("#groupWriteFormDown_cate").change(()=>{
			var values = $("#groupWriteFormDown_cate option:selected").val();
			console.log(values);
			if(values == '창고형마트'){
				$("#groupWriteFormG_loc1").val("");
				$('#groupWriteFormG_loc1').css("background-image","url('/1ocaler/img/groupImg/markerG.png')");		
				$("#groupWriteFormG_loc2").attr("type","text").attr("disabled",false);				
				$("#groupWriteFormShowFrm").css("height","auto");			
			}else{	
				$("#groupWriteFormG_loc2").attr("type","hidden").attr("disabled",true);
				$("#groupWriteFormG_loc1").val("");
				$("#groupWriteFormG_loc2").val("");
				$("#groupWriteFormShowFrm").css("height","auto");
			}
		});
		//===================================================================================================
		
		$("#groupWriteFormCancleBtn").on('click',()=>{
			history.back();
		});
		
	})
</script> 	
</head>
<body id="groupWriteFormBody">
	<div id="groupWriteFormMap" style="width:2500px; height:1500px; position:relative; overflow:hidden;"></div>
	
	<!-- 맨위 폼 -->
	<div id="groupWriteFormTopFrm">
		<ul>
			<li><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/img/groupImg/home.png"></a></li>
			<li><a href="eatPage?loc_gu=${pageVO.loc_gu }"><img src="<%=request.getContextPath()%>/img/groupImg/dishW.png"></a></li>
			<li><a href="withPage?loc_gu=${pageVO.loc_gu }"><img src="<%=request.getContextPath()%>/img/groupImg/cartW.png"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/img/groupImg/car.png"></a></li>
		</ul>
	</div>
	
	
	<!-- 검색 폼 -->
	<div id="groupWriteFormSearchFrms">
		<form onsubmit="searchPlaces(); return false;">
			<input type="text" name="groupWriteFormSearchWord" id="groupWriteFormSearchWord" value="강서구" size=40; />
			<input type="image" src="<%=request.getContextPath()%>/img/groupImg/search.png" value="검색"/>
		</form>
	</div>
	
	<!-- groupWriteFormShowFrm 리스트 -->
	<div id="groupWriteFormShowFrm">
		<form id="groupWriteFormGroupWriteFrm" method="post" action="writeFormOk">
			<input type="hidden" name="loc_gu" value="${pageVO.loc_gu }"/>
			
			<div> 
				<select name="up_cate" id="groupWriteFormUp_cate" size="1">
					<c:if test="${pageVO.category=='한끼미식회' }">
						<option value="한끼미식회" selected>한끼미식회</option>
					</c:if>
					<c:if test="${pageVO.category=='가치가장' }">
						<option value="가치가장" selected>가치가장</option>
					</c:if>
				</select>
				
				<select name="down_cate" id="groupWriteFormDown_cate" size="1">
					<c:if test="${pageVO.category=='한끼미식회' }">
						<option value="같이먹어요">같이먹어요</option>
					</c:if>
					<c:if test="${pageVO.category=='가치가장' }">
						<option value="동네마트">동네마트</option>
						<option value="창고형마트">창고형마트</option>
					</c:if>
				</select><br/>
			</div>
			<div>
				<input type="text" name="g_subject" id="groupWriteFormG_subject" placeholder="&nbsp;제목을 입력하세요.....">
			</div>
			
			
			<textarea name="g_content" id="groupWriteFormG_content"></textarea>
			
			<div>
				<input type="date" name="g_date" id="groupWriteFormG_date"/>
				<input type="time" name="g_time" id="groupWriteFormG_time"/>
				<select name="g_cnt" id="groupWriteFormG_cnt" size="1" >
						<option value="" disabled selected hidden>모집인원</option>
						<option value="1">1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
						<option value="5">5명</option>
				</select>
				<div>
					<input type="text" name="g_loc1" id="groupWriteFormG_loc1" placeholder="지역을 입력해주세요(지도를 클릭하세요)"/>
					<div>				
						<input  type="hidden" name="g_loc2" id="groupWriteFormG_loc2" placeholder="도착지를 입력해 주세요..." disabled/>					
					</div>
					<input type="text" name="g_tag" id="groupWriteFormG_tag" placeholder="해시태그를 달아주세요 Ex) #한끼미식회 #가치가장" />
				</div>
				<div id="groupWriteFormCcFrm">
					<input class="btn cancelBtn" id="groupWriteFormCancleBtn" type="button" value="취소"/>
					<input class="btn confBtn" id="groupWriteFormConfBtn" type="submit" value="등록"/>
				</div>
			</div>	 
			
		</form>	
	</div>
	
	
	
	
	
	<script>
		
			//지도 생성
			var container = document.getElementById("groupWriteFormMap"),
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
			searchPlaces();
			
			//KeyWordSearch 에서 키워드를 검색한다음에 실행하는 콜백 함수로 
			//검색한 다음의 결과값을 result로 받는다.
			function callback(data, status, pagination){
				if(status == kakao.maps.services.Status.OK){
					console.log(data)
					document.getElementById('groupWriteFormSearchWord').value = '';
					
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