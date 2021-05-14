<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealBoardStyle.css"/>


<script>

		function boardDel(){
			if(confirm("삭제하시겠습니까? ")){
				location.href="dealDel?num=${vo.num}";
			}
		}

		//지도============================================================================================
		$(function(){
			
			//함께하기================================================================================
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
					location.href="login";
				});
			}
			
		//참여하기 버튼이 disabled 일때 신청완료로 바꿔주기 다시접속했을 떄도 신청완료로 뜨게하려고 함
		var joinCheck = $("#eatViewPageJoinBtn").attr("disabled");
			console.log('여기들어옴?');
			console.log(joinCheck);
		if(joinCheck=='disabled'){
			$("#eatViewPageJoinBtn").children("span").text('신청완료');
			$("#withViewPageJoinBtn").css('background',"#B8B2F4");
			$("#withViewPageJoinBtn").css('opacity',1);
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
			$("#userImgPop img").click(()=>{
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
							<li style="width:50%; line-height:33px;margin:10 0" id="userImgPop">
								<img src="<%=request.getContextPath()%>/img/mem_prof/${vo.mem_prof}">&nbsp;&nbsp;
								<a href="#"> ${vo.userid }</a><hr/>
							</li>
							<li style="color: #3f1785;  font-weight: bold;  text-align: right;margin:10 0 ;width: 50%;font-size: 30px;">
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
								<span class="cntJoin">1</span>
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
					<li class="wordcut">${vo.s_tag }</li>
					<li>
						<input type="button" value="찜하기" class="btn commBtnDeal" style="margin-left: 100px"/>
					<!-- 	<input type="submit" value="함께해요" class="btn commBtnDeal"/> -->
						<button type="button" id="eatViewPageJoinBtn" class="btn commBtnDeal" value="${vo.num }"<c:forEach var="joins" items="${joinList}"><c:if test="${joins.numJoin==vo.num && logId==joins.userid }">disabled</c:if></c:forEach>>
							<span  id="eatViewPagejoinCheck">
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
		
		<div id="dealMap">
			<span style="margin: 90 10;"> 약속 장소</span>
			
			
			<div id="map">
			
			
			</div>
			

		</div>
		
		<div id="editBtn">
			<button class="btn commBtnEdit " onclick = "location.href = 'javascript:boardDel()' ">삭제</button>
			<button class="btn commBtnEdit" onclick = "location.href = 'memberEdit?num=${vo.num}' ">수정</button>
		</div>
		
		<div id="WVPProfilePopup">
		<div><span>X</span></div>
		<div><span>활동정보</span></div>
		<div><img src="<%=request.getContextPath()%>/img/mem_prof/${vo.mem_prof}"></div>
		<div>
			<ul>
				<li><span>${vo.userid }</span></li>
				<li><span>가입일 : ${vo.mem_sub } </span></li>
				<li><span>총 게시물 : ${vo.mem_post }개</span></li>
				<li><span>총 댓글수 : ${vo.mem_rev }개</span></li>
			</ul>
		</div>
		<div><button class="btn commBtn">1:1채팅</button><button class="btn commBtn">신고하기</button></div>
		</div>
		
		
	</div>
</body>
</html>