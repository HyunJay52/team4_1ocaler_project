<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#pageTop{display:none;}
	#footer{display:none;}
	ul, li{ margin:0px; padding:0px; list-style-type:none;}
	/*withViewGroupList-like btn*/
	.fakeCheckBoxImg[type=checkbox]{ display:none; }
 	#withViewGroupList div>input[type=checkbox] + label { display: inline-block; cursor: pointer; line-height: 22px; padding-left: 22px; background: url("<%=request.getContextPath()%>/img/groupImg/likeE.png") left/22px no-repeat; }
	#withViewGroupList div>input[type=checkbox]:checked + label { background-image: url("<%=request.getContextPath()%>/img/groupImg/likeF.png"); }
	#withViewGroupList div>label{position: absolute; height: 30px; right: 20px; top: 4px;}
	#withViewGroupList a:hover{color:#000; text-decoration:none;}
	/*버튼*/
	.commBtn {width: 90px;	color: #3f1785;	border: 1px solid #3f1785;}
	.commBtn:hover {border: 1px solid #3f1785;	background-color: #3f1785;	font-weight: bold;	color: #fff;	font-weight: bold;}
	.cancelBtn {	border: 1px solid #ddd;	color: #ddd;	width: 90px;}
	.cancelBtn:hover {	background-color: #fff;	color: gray;}	
	.confBtn {	background: #3f1785;	color: #fff;	width: 90px;}
	.confBtn:hover {	color: #fff;	background: #B8B2F4;}
	.commBtnWrite{width:75px;}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->
<script>	
		$(function(){

			//접기 호버시 화살표 색이 바뀌고 클릭하면 withViewShowFrm 없어지고 open 화살표 생김
			$("#withViewfold").hover(function(){
				$("#withViewfold>img").attr("src","<%=request.getContextPath()%>/img/groupImg/leftP.png");
				$("#withViewfold").click(function(){	
					$("#withViewShowFrm").css("display","none");
					$("#withViewfold").css("display","none");
					$("#withViewOpen").css("display","block").css("top",140).css("left",30).css('margin-top','348px')
					.css("background-color","#fff").css("opacity",0.9).css("width","40px")
					.css("padding","5px").css("border-radius","10px");
				});
			},function(){			
				$("#withViewfold>img").attr("src","<%=request.getContextPath()%>/img/groupImg/left.png");
	
			});
			
			//open 화살표 오버시 색바뀌고 클릭시 withViewShowFrm 과 닫기 화살표 생김======================================
			$("#withViewOpen").hover(function(){
				$("#withViewOpen>img").attr("src","<%=request.getContextPath()%>/img/groupImg/rightP.png");
				
				$("#withViewOpen").click(function(){	
					$("#withViewShowFrm").css("display","block");
					$("#withViewfold").css("display","block");
					$("#withViewOpen").css("display","none");
				});
				
			},function(){
				$("#withViewOpen>img").attr("src","<%=request.getContextPath()%>/img/groupImg/right.png");
			});
			//==========================================================================================
			
			//==========================가치가자 한끼미식회 호버==============================================		
			$('#withViewShowTopMenu>li:first-child').hover(function(){
				$(this).next().children('img').css('display','none');
				$("#withViewWith").css("margin-left","32px").css("color","#000").css("font-weight","400");
				$(this).children('div').children('img').css('display','block');
				$("#withViewEat").css("margin-left","0px").css("color","#571fb8").css("font-weight","700");
			},function(){
				$(this).next().children('img').css('display','block');
				$("#withViewWith").css("margin-left","0px").css("color","#571fb8").css("font-weight","700");
				$(this).children('div').children('img').css('display','none');
				$("#withViewEat").css("margin-left","32px").css("color","#000").css("font-weight","400");
				
			});
			//==========================가치가자 한끼미식회 호버endddddddd===================================
				
			//글쓰기폼===================================================================================
			$("#withViewWriteForm").click(function(){
				location.href="writeForm?loc_gu=${pageVO.loc_gu}&category=${pageVO.category}";
			});
			//글쓰기폼end================================================================================	
			
			//검색 eat/withView에서의 검색======================================================================================
			$("#withViewGroupSearchFrm").submit(()=>{
				if($("#withViewSearchWord").val()==null || $("#withViewSearchWord").val()=='' ){
					alert('검색어를 입력해주세요');
					return false;
				}
				return true;
			});
			//==========================================================================================
				
			//좋아요======================================================================================
			if(${logId!=null}){
				$("#withViewGroupList div:first-child>input[name=numLike]").on('click',function(){
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
			//==========================================================================================
		})
</script>
</head>
<body id="withViewBody">
	<div id="withViewMap" style="width:2500px; height:1500px; position:relative; overflow:hidden;"></div>
	
	<!-- withViewShowFrm접기펴기 -->	
	<div id="withViewfold"><img src="<%=request.getContextPath()%>/img/groupImg/left.png"/></div>
	<div id="withViewOpen"><img src="<%=request.getContextPath()%>/img/groupImg/right.png"/></div>
	
	<!-- 맨위 폼 -->
	<div id="withViewTopFrm">
		<ul>
			<li><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/img/groupImg/home.png"></a></li>
			<li><a href="eatPage?loc_gu=${pageVO.loc_gu }"><img src="<%=request.getContextPath()%>/img/groupImg/dishW.png"></a></li>
			<li><a href="withPage?loc_gu=${pageVO.loc_gu }"><img src="<%=request.getContextPath()%>/img/groupImg/cartW.png"></a></li>
			<li><a href="#"><img src="<%=request.getContextPath()%>/img/groupImg/car.png"></a></li>
		</ul>
	</div>
	
	
	<!-- 검색 폼 -->
	<div id="withViewSearchFrm">
		<form onsubmit="searchPlaces(); return false;">
			<input type="text" name="withViewInnerSearchWord" id="withViewInnerSearchWord" value="${pageVO.loc_gu }" size=40; />
			<input type="image" src="<%=request.getContextPath()%>/img/groupImg/search.png" value="검색"/>
		</form>
	</div>
	
	<!-- withViewShowFrm 리스트 -->
	<div id="withViewShowFrm">	
		<ul id="withViewShowTopMenu">
			<li><div><img src="<%=request.getContextPath()%>/img/groupImg/dish.png"/><a href="eatPage?loc_gu=${pageVO.loc_gu }&category=한끼미식회"><span id="withViewEat">한끼미식회</span></a></div></li>
			<li><img src="<%=request.getContextPath()%>/img/groupImg/cartP.png"/><a href="withPage?loc_gu=${pageVO.loc_gu }&category=가치가장"><span id="withViewWith">가치가장</span></a></li>
			<c:if test="${logId!=null }">
				<li><button id="withViewWriteForm" class="btn commBtn commBtnWrite">글쓰기</button></li>
			</c:if>
		</ul>
		<hr style="width:430px; margin-bottom:20px; margin-top:0px; background:#a9a9a9; margin:0 auto;">
		<div> 서울틀별시 > <a href="groupPage">${pageVO.loc_gu }</a> > 가치가장  </div>
		<form id="withViewGroupSearchFrm" method="get" action="withPage">
			<input type="hidden" name="loc_gu" value="${pageVO.loc_gu }"/><!-- 나중에 로그인하면 세션값을 받아와서 띄워줘야 한다........................... -->
			<select name="searchKey">
				<option value="g_subject">제목</option>
				<option value="userid">작성자</option>
				<option value="g_content">내용</option>
			</select>
			<input type="text" name="searchWord" id="withViewSearchWord"/>
			<button id="withViewButton"><img src="<%=request.getContextPath()%>/img/groupImg/search.png"></button>
		</form>
		

		<ul id="withViewGroupList">
			<c:forEach var="vo" items="${withList }">
				<a href="withViewPage?num=${vo.num }&loc_gu=${pageVO.loc_gu}&pageNum=${pageVO.pageNum}&category=가치가장<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord }</c:if>"><li><!-- 나중에 searchkey, searchWord도 달고다녀야함 -->
					<div>
						<img src="<%=request.getContextPath()%>/img/groupImg/cartP.png"/><span>${vo.down_cate }</span>
						<c:if test="${logId!=null }">
						<input class="fakeCheckBoxImg" type="checkbox" name="numLike" id="like${vo.num }" value="${vo.num }" <c:forEach var="likes" items="${likeList}"><c:if test="${likes.numLike==vo.num && logId==likes.userid }">checked</c:if></c:forEach>/><label for="like${vo.num }"></label>
						</c:if>
					</div>
					<span>${vo.g_subject }</span>
					<div><img src="<%=request.getContextPath()%>/img/groupImg/clock.png" title="약속시간"/>${vo.g_date } ${vo.g_time }</div><!-- g_date, g_time 값을 가지고 온다. -->
					<div><img src="<%=request.getContextPath()%>/img/groupImg/markerB.png" title="약속장소"/>${vo.g_loc1 }</div><!-- g_loc1 값을 가져온다. -->
					<div><img src="<%=request.getContextPath()%>/img/groupImg/human.png" title="모집인원"/>1 / ${vo.g_cnt }명</div><!-- 1=> join테이블에서 게시글번호로 이어서 신청완료 상태를 count로 세어온다 -->
					<div>${vo.g_tag }</div><!-- 태그값을 가지고온다. -->
					<input type="hidden" name="num" value="${vo.num }" id="WVnum"/>
					<hr/>
				</li></a>
			</c:forEach>		
		</ul>
		
		<div>
			<!-- 페이징 할떄 category 도 가지도 다녀야함  -->
			<ul id="WVpaging"><!--이걸 어떻게 처리해야하나고민중 -->
				<c:if test="${pageVO.pageNum>1}">
					<li><a href='withPage?loc_gu=${pageVO.loc_gu }&pageNum=${pageVO.pageNum-1}&category=가치가장<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord }</c:if>'>이전</a></li>
				</c:if>
				<c:if test="${pageVO.pageNum<=1}">
					<li>이전</li>
				</c:if>
				<c:forEach var="p" begin="${pageVO.startPageNum }" end="${pageVO.startPageNum+pageVO.onePageNum-1 }">
					<c:if test="${p<=pageVO.totalPage }">
						<c:if test="${p==pageVO.pageNum }">
						<!-- 현재페이지일떄 -->
							<li style="background-color:#571fb8"><a href="withPage?loc_gu=${pageVO.loc_gu}&pageNum=${p}&category=가치가장<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
						</c:if>
						<c:if test="${p!=pageVO.pageNum }">
						<!-- 현재페이지가 아닐때 -->
							<li><a href="withPage?loc_gu=${pageVO.loc_gu }&pageNum=${p}&category=가치가장<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
						</c:if>
					</c:if>		
				</c:forEach>			
				<c:if test="${pageVO.pageNum<pageVO.totalPage}">
					<li><a href="withPage?loc_gu=${pageVO.loc_gu }&pageNum=${pageVO.pageNum+1}&category=가치가장<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord }</c:if>">다음</a></li>
				</c:if>	
				<c:if test="${pageVO.pageNum==pageVO.totalPage}">
					<li>다음</li>
				</c:if>	
			</ul>
		</div>
		
		
		
		
		
	</div>
	
	
	
	<script>
		
			//지도 생성
			var container = document.getElementById("withViewMap"),
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
				var keyword = document.getElementById('withViewInnerSearchWord').value;
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
					document.getElementById('withViewInnerSearchWord').value = '';
					
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