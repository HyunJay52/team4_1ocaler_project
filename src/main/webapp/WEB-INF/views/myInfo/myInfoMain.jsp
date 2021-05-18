<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){

		//마음 세팅
		var tag = "";
		for(var i = 0; i <= 100; i += 10){
			tag += "<li><img src='img/myInfo/slider/heart"+i+".png'/></li>";
		}
		$("#slider").html(tag);			
		
		//시작 페이지 설정 변수
		var startSlide = 5;
		
		//bx슬라이더 셋팅
		$("#slider").bxSlider({
			mode : 'fade' // 'horizontal', 'vertical', 'fade'	
			, slideWidth:264
			, slideHeight:300
	//		, speed : 1000 // default : 500
			, auto :  false//자동시작 : true, false
	//		, randomStart : true //시작을 랜덤으로 : true false;
			, captions : false //설명을 표시 : true false img 태그의 타이틀 내용을 설명으로 표사
	//		, ticker : true // 자막처럼...
			, infiniteLoop : false // 반복여부
	//		, addaptiveHeight : true // 이미지 크기에 따라 높이 자동 조절
			, hideControlOnEnd : false // 컨트롤 버튼 처음과 끝을 표시할지 여부 infiniteLoop가 false일때 가능
			
			//easing
			, useCSS : true // easing 사용여부 (true: easing사용안함, false: easing사용함)
			, easing : 'easeOutElastic'
			
			, startSlide : startSlide
		}); 
		
		//등급만큼 이미지 띄우기
		if(startSlide > 0){
			var setPX = startSlide*19.3;
			$("#slider img").css('margin-left', setPX+'px');
		}
		
		function myInfoMainDeal(){
			$.ajax({
				url : "myInfoMainDeal",
				success : function(result){
					var tag = "<tr><td>구분</td><td>제목</td><td>참여자</td><td>날짜</td><td>상태</td></tr>";
					console.log(result);
					//리스트 두 개를 하나의 배열로 합친다 : concat();
					var concatData = result.joinList.concat(result.shareList)
					
					//합친 리스트를 날짜 기준으로 정렬한다 : sort();
					concatData.sort(function(a, b){
						var a = new Date(a.j_writedate).getTime();
						var b = new Date(b.j_writedate).getTime();

						return a < b ? 1 : -1;
					});
					console.log(concatData);
					concatData.forEach(function(data,idx){
						if(data.share_userid == '${logId}' && data.userid != '${logId}'){
							tag += "<tr><td>내 모집글</td>";
							tag += "<td>"+data.s_subject+"</td>";
							tag += "<td>"+data.userid+"</td>";
							tag += "<td>"+data.j_writedate+"</td>";
							tag += "<td><button class='btn btn-info btn-block'>승인대기</button></td>";

						}else if(data.userid == '${logId}'){
							tag += "<tr><td>참여신청</td>";
							tag += "<td>"+data.s_subject+"</td>";
							tag += "<td>"+data.userid+"</td>";
							tag += "<td>"+data.j_writedate+"</td>";
							if(data.j_status == '참여취소'){
								tag += "<td><button class='btn btn-danger btn-block'>"+data.j_status+"</button></td>";							
							}else{
								tag += "<td><button class='btn btn-primary btn-block'>"+data.j_status+"</button></td>";							
							}
						}
						// data-target='#myinfoMainMd' data-toggle='modal'
						
					
			
						
						tag += "</tr>";
					});
					$("#myinfoMainDealTable").html(tag);
				},error : function(){
					console.log("error");
				}
			});
		}
		myInfoMainDeal();
	});
</script>
<div class="myinfoBody"> 
	<!-- <button id="toggle" class="btn btn-outline-dark btn-light">||</button> -->
	
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	
	<div class="myinfoContainer">
	
		<div id="profile">
			<ul>
				<li><img src="<%=request.getContextPath()%>/img/myInfo/delivery/box.png"/></li>
				<li>${myVO.mem_nick}</li>
				<li>${myVO.loc_gu }</li>
				<li><a href="myInfoCheck" type="button" class="btn">내 정보</a></li>
			</ul>
		</div>
		<div class="myinfoTop">
			<div id="grade">
				<h2>내 등급</h2>
				<ul id="slider">

				</ul>
				<div style="margin-top:30px;">
					<span style="float:left; margin-left:28px;">0</span>
					<span style="float:right; margin-right:30px;">100(%)</span>				
				</div>
			</div>
			<div id="myPoint">
				<h2>잔액</h2>
				<h2 style="float:right">${myPoint }원</h2>
			</div>
		</div>
		<div class="myinfoBottom">	
			<div id="status">
				<span class="myinfoHeader mdFnt info-font-weight">배송상태</span>
				<div>
					<label class="btn btn-primary">update</label>
					<div><a href="#">[나주베]배송이 시작되었습니다.</a></div>
				</div>
			</div>
			<div id="waiting">
				<span class="myinfoHeader mdFnt info-font-weight">참여현황</span>
				<a href="myInfoDeal" style="float:right">더보기</a>
				<table class="myinfoTable2" id="myinfoMainDealTable">
					
				</table>
			</div>
			
			<div id="QnA">
			<span class="myinfoHeader mdFnt info-font-weight">QnA</span>
			<a href="#" style="float:right">더보기</a>
			<table class="myinfoTable2">
					<tr>
						<td>제목</td>
						<td>유저</td>
						<td>날짜</td>
						<td>상태</td>
					</tr>
					<tr>
						<td>고구마 추가구매</td>
						<td>test</td>
						<td>2021-04-18</td>
						<td>답변대기</td>
					</tr>
					<tr>
						<td>셀러가입문의</td>
						<td>test2</td>
						<td>2021-04-18</td>
						<td>답변완료</td>
					</tr>
					<tr>
						<td>고구마 추가구매</td>
						<td>test</td>
						<td>2021-04-18</td>
						<td>답변대기</td>
					</tr>
					<tr>
						<td>셀러가입문의</td>
						<td>test2</td>
						<td>2021-04-18</td>
						<td>답변완료</td>
					</tr>
			</table>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myinfoMainMd"	>
		<div class="modal-dialog"  style="margin-top:20%">
			<div class="modal-content"  style="width:600px; height:300px">
				<div class="modal-body"  style="text-align:center; padding:40px; overflow:auto;">
					<h2 class="mdFnt">참여회원 정보<button class="close" data-dismiss="modal">&times;</button></h2>
					<div id="joinMemberinfo">
						<ul>
							<li>
								<div style="border: none; width: 110px; height:155px; margin-right: 10px; float: left;">
									<img src="<%=request.getContextPath()%>/common/user.png"
									id="previewImg" class="profImg form-control-file border" />
									<label style="margin-top:10px;">회원 별명</label>
								</div>
							</li>
							<li>아이디 : <label></label></li>
							<li>참여율 : <span></span></li>
							<li>평가점수 : <span></span></li>
							<li>신청일 :</li>
						</ul>
						<div>
							<input class="btn commBtn" type="button" value="참여승인"/>
							<input class="btn btn-danger" style="width:90px" type="button" value="참여거절"/>						
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>	
