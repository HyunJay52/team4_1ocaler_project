<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealBoardStyle.css"/>


<style>
		.aaaa[type=checkbox]{ display:none; }
 		#likeBtnInput input[name=numLike] + label {margin:0px; display: inline-block; cursor: pointer; line-height: 0px; padding-left: 22px; background: url("<%=request.getContextPath()%>/img/groupImg/likeE.png") left/22px no-repeat; }
		#likeBtnInput input[name=numLike]:checked + label {
		 background-image: url("<%=request.getContextPath()%>/img/groupImg/likeF.png");
		 line-height: 0px; }
		#likeBtnInput label{ height: 30px; right: 20px; top: 4px;margin:0px;line-height: 0px; 
		}
</style>
	

<script>

		function boardDel(){
			if(confirm("삭제하시겠습니까? ")){
				location.href="dealDel?num=${vo.num}";
			}
		}

		//지도============================================================================================
		$(function(){
			//좋아요=================================================================================================	
			if(${logId!=null}){
				$("#likeBtnInput input[name=numLike]").on('click',function(){
					if($(this).is(':checked')){
						
						var url = "likeInsert";
						var params = "numLike="+$(this).val();	
						$.ajax({
							url : url,
							data : params,
							success : function(result){
								console.log(result,"좋아요 추가 성공");
							},error :function(request,status,error){
								 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
							}
						})
					}else{
						var url = "likeDelete";
						var params = "numLike="+$(this).val();	
						$.ajax({
							url : url,
							data : params,
							success : function(result){
								console.log(result,"좋아요 삭제 성공");
							},error :function(request,status,error){
								 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
							}
						})
						
					}
				});	
			}
			
			
			
			//함께하기================================================================================
			if(${logId!=null}){
				$("#ViewPageJoinBtn").click(()=>{
					var url = "joinInsert";
					var params ="num="+$("#ViewPageJoinBtn").val();
					console.log(params+"뭘까?");
					$.ajax({
						url : url,
						data : params,
						success:function(result){
							alert('신청이 완료되었습니다. 응답을 기다려 주세요');
							$("#ViewPageJoinBtn").children("span").text('신청완료');//이거는 아작스로 바꿔준거고
							$("#ViewPageJoinBtn").attr("disabled",true);
							
						},error:function(e){
							console.log('신청실패')
						}
					})
				});
			}else{
				$("#ViewPageJoinBtn").click(()=>{
					alert('로그인 후 이용해 주세요')
					location.href="login";
				});
				
	
			}
			
		//참여하기 버튼이 disabled 일때 신청완료로 바꿔주기 다시접속했을 떄도 신청완료로 뜨게하려고 함
		var joinCheck = $("#ViewPageJoinBtn").attr("disabled");
			console.log('여기들어옴?');
			console.log(joinCheck);
		if(joinCheck=='disabled'){
			$("#ViewPageJoinBtn").children("span").text('신청완료');
			$("#ViewPageJoinBtn").css('background',"rgb(254 214 67)");
			$("#ViewPageJoinBtn").css('color',"#222");
			$("#ViewPageJoinBtn").css('border',"1px solid rgb(254 214 67)");
		}
		
	//지도============================================================================================
			
			//팝업창 띄우기================================================
			/*위치설정*/
			var x = window.innerWidth;
			var y = window.innerHeight;
			var width =	$("#WVPProfilePopup").width();
			var height = $("#WVPProfilePopup").height();
			console.log(width,height)
			$("#WVPProfilePopup").css("top",y/2-height/2).css("left",x/2-width/2);
			/*띄우기*/
			$("#userImgPop").click(()=>{
				$("#WVPProfilePopup").css("display","block");
				
			});	
			
			/*팝업창 닫기*/
			
			$('#WVPProfilePopup>div:first-child>span').click(()=>{
				$("#WVPProfilePopup").css("display","none");
			});
			
			$('#withViewPageReportBtn').click(()=>{ //글번호 넘겨야해?memberPageVO 보고서 결정하자
				if(${logId!=null}){
					location.href="reportWrite?userid=${vo.userid}"	
				}else{
					alert('로그인후 사용할 수 있습니다.');
					location.href="login";
				}
			});
			
			/*신고하기*/
			$('#eatViewPageReportBtn').click(()=>{
				if(${logId!=null}){
					location.href="reportWrite?num=${vo.num}"	
				}else{
					alert('로그인후 사용할 수 있습니다.');
					location.href="login";
				}
			});
			
			var markers = [];	
			//지도 검색 키워드 객체 생성
			var ps = new kakao.maps.services.Places();
		
				//지도 생성
				var container = document.getElementById("map"),
					options = {
						center : new kakao.maps.LatLng(33.450701,126.570667),
						level : 2
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
						
					   var content ='<div class="customOverlay"> "${vo.s_loc}"에서 만나요 </div>'
			                 
			                var customOverlay = new kakao.maps.CustomOverlay({
			                     map: map,
			                     position: new kakao.maps.LatLng(place.y, place.x),
			                     content: content,
			                     yAnchor: 1
		                 });
						
				}
					
				
				
					
				//검색한 키워드 값을 내가 text에서입력한 값으로 셋팅해주는 작업
				function searchPlaces(){
					var keyword = "${vo.s_loc}";
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
						 map.setLevel(2);
						
				    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			
				        alert('검색 결과가 존재하지 않습니다.');
				        return;
			
				    } else if (status === kakao.maps.services.Status.ERROR) {
			
				        alert('검색 결과 중 오류가 발생했습니다.');
				        return;
			
				    }
				}
		});
		
			
</script>


	<div id="dealViewMain">
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		<div id="divAll">
			<div id="dealImg">
				<img src="<%=request.getContextPath()%>/img/dealFileImg/${vo.s_img1}"/>
			</div>
			<div id="dealInfo">
				<ul >	
					<li class="wordcut">
						${vo.s_subject }
						
									
						<span  style="display: none">${vo.num }</span>
					</li>
					<li style="width:100%;">
						<ul style="margin: 20 0;">
							<li style="width:40%; line-height:24px;margin:13 0" id="userImgPop">
								<img src="<%=request.getContextPath()%>/img/mem_prof/${vo.mem_prof}">&nbsp;&nbsp;
								${vo.userid }<hr/>
							</li>
							<li style="color: orange;  font-weight: bold;  text-align: right;margin:10 0 ;width: 60%;font-size: 30px;">
								${vo.s_price }원 &nbsp; &nbsp;	<hr/>
							</li>				
						</ul>
					</li>
					<li>
						<ul>
							<li>상품 종류</li>
							<c:if test="${vo.s_cate==1 }">
								<li>식료품</li>
							</c:if>	
							<c:if test="${vo.s_cate==2 }">
								<li>생필품</li>
							</c:if>
							<c:if test="${vo.s_cate==3 }">
								<li>기타</li>
							</c:if>
						</ul>
					</li>
					<li>
						<ul>
							<li>거래 위치</li>
							<li>${vo.s_loc }</li>
						</ul>
					</li>
					<li>
						<ul>
							<li>판매 개수</li>
							<li>
								<span class="cntJoin"> ${appNum }</span>
								/${vo.s_cnt }개
							</li>
						</ul>
					</li>
					<li>
						<ul>
							<li>판매 기한</li>
							<li>${vo.s_date}</li>
						</ul>
					</li>
					<li>
						<ul>
							<li>좋아요 </li>
							<li id ="likeBtnInput" style="line-height:0px;">
								<c:if test="${logId==null }">
									로그인 후 이용해주세요.
								</c:if>
								 <c:if test="${logId!=null }">
		                           <input class="aaaa" type="checkbox" name="numLike" id="like${vo.num}" value="${vo.num}" 
			                           <c:forEach var="likes" items="${likeList}">
		                           			<c:if test="${likes.numLike==vo.num && logId==likes.userid }">
		                           				checked
		                           			</c:if>
		                           		</c:forEach> 
		                           	/>	
		                           <label for="like${vo.num}"></label>
								</c:if>
							</li>
						</ul>
					</li>
					<li class="wordcut">${vo.s_tag }</li>
					<li>
						
					<!-- 	<input type="submit" value="함께해요" class="btn commBtnDeal"/> -->
						<button type="button" id="ViewPageJoinBtn" class="btn withCommBtnDeal" value="${vo.num }"<c:forEach var="joins" items="${joinList}"><c:if test="${joins.numJoin==vo.num && logId==joins.userid }">disabled</c:if></c:forEach>>
							<span  id="ViewPagejoinCheck">
								함께해요
							</span>	
						</button>
					</li>
				</ul>
			</div>
		</div>
		<div id="boardInfo">
			<ul>
				<li>
					${vo.s_content }
				</li>
			</ul>		
		</div>
		
		<div id="dealMap" style="margin-top: 37px;">
			<span style="margin: 1px;font-size: 26px;"> 약속 장소</span>
			
			
			<div id="map" style="margin-top:10px;">
			
			
			</div>
			

		</div>
		
		<div id="editBtn">
			<c:if test="${vo.userid==logId}">
				<button class="btn commBtnEdit " onclick = "location.href = 'javascript:boardDel()' ">삭제</button>
				<button class="btn commBtnEdit" onclick = "location.href = 'memberEdit?num=${vo.num}' ">수정</button>
			</c:if>	
		</div>
		
		<div id="WVPProfilePopup">
		<div><span>X</span></div>
		<div><span>활동정보</span></div>
		<div><img src="<%=request.getContextPath()%>/img/mem_prof/${vo.mem_prof}"></div>
		<div>
			<ul>
				<li><span>${vo.userid }</span></li>
				<li><span>가입일 : ${vo.mem_sub } </span></li>
				<li><span>총 게시물 : ${vo.mem_post } / 100</span></li>
				<li><span>회원등급 : ${vo.mem_rev }개</span></li>
			</ul>
		</div>
		<div><button id="eatViewPageChatBtn"  class="btn commBtn">1:1채팅</button><button id="eatViewPageReportBtn" class="btn commBtn">신고하기</button></div>
		</div>
		
		
	</div>
</body>
</html>