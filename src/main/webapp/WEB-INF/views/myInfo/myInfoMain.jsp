<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(function() {
		//마음 세팅
		// 		var tag = "";
		// 		for(var i = 0; i <= 100; i += 10){
		// 			tag += "<li><img src='img/myInfo/slider/heart"+i+".png'/></li>";
		// 		}
		// 		$("#slider").html(tag);			

		//시작 페이지 설정 변수
		//		var startSlide = 7;

		//bx슬라이더 셋팅
		// 		$("#slider").bxSlider({
		// 			mode : 'fade' // 'horizontal', 'vertical', 'fade'	
		// 			, slideWidth:264
		// 			, slideHeight:300
		//		, speed : 1000 // default : 500
		// 			, auto :  false//자동시작 : true, false
		//		, randomStart : true //시작을 랜덤으로 : true false;
		// 			, captions : false //설명을 표시 : true false img 태그의 타이틀 내용을 설명으로 표사
		//		, ticker : true // 자막처럼...
		// 			, infiniteLoop : false // 반복여부
		//		, addaptiveHeight : true // 이미지 크기에 따라 높이 자동 조절
		// 			, hideControlOnEnd : false // 컨트롤 버튼 처음과 끝을 표시할지 여부 infiniteLoop가 false일때 가능

		//easing
		// 			, useCSS : true // easing 사용여부 (true: easing사용안함, false: easing사용함)
		// 			, easing : 'easeOutElastic'

		// 			, startSlide : startSlide
		// 		}); 

		// 		//등급만큼 이미지 띄우기
		// 		if(startSlide > 0){
		// 			var setPX = startSlide*19.3;
		// 			$("#slider img").css('margin-left', setPX+'px');
		// 		}

		function myInfoMainDeal() {
			$
					.ajax({
						url : "myInfoMainDeal",
						data : {
							"nowNum" : 1,
							"kategorie" : "mem_share",
							"dateContent" : "j_writedate",
							"searchDate" : "2021-03-01 00:00:00",
							"searchDate2" : "2021-05-31 23:59:59",
							"searchKey" : "j_status",
							"searchWord" : "%%",
							"onePageRecord" : 3,
							"onePageSize" : 3
						},
						dataType : "json",
						success : function(result) {
							var tag = "<tr><td>구분</td><td>제목</td><td>참여자</td><td>날짜</td><td>상태</td></tr>";
							console.log(result);
							//리스트 두 개를 하나의 배열로 합친다 : concat();
							var concatData = result.joinList
									.concat(result.shareList)

							//합친 리스트를 날짜 기준으로 정렬한다 : sort();
							concatData.sort(function(a, b) {
								var a = new Date(a.j_writedate).getTime();
								var b = new Date(b.j_writedate).getTime();

								return a < b ? 1 : -1;
							});
							console.log(concatData);
							concatData
									.forEach(function(data, idx) {
										if (data.share_userid == '${logId}'
												&& data.userid != '${logId}') {
											tag += "<tr><td>내 모집글</td>";
											tag += "<td>" + data.s_subject
													+ "</td>";
											tag += "<td>" + data.userid
													+ "</td>";
											tag += "<td>" + data.j_writedate
													+ "</td>";
											tag += "<td><button class='btn btn-info btn-block'>승인대기</button></td>";

										} else if (data.userid == '${logId}') {
											tag += "<tr><td>참여신청</td>";
											tag += "<td>" + data.s_subject
													+ "</td>";
											tag += "<td>" + data.userid
													+ "</td>";
											tag += "<td>" + data.j_writedate
													+ "</td>";
											if (data.j_status == '참여취소') {
												tag += "<td><button class='btn btn-danger btn-block'>"
														+ data.j_status
														+ "</button></td>";
											} else {
												tag += "<td><button class='btn btn-primary btn-block'>"
														+ data.j_status
														+ "</button></td>";
											}
										}
										// data-target='#myinfoMainMd' data-toggle='modal'

										tag += "</tr>";
									});
							$("#myinfoMainDealTable").html(tag);
						},
						error : function() {
							console.log("error");
						}
					});
		}
		//myInfoMainDeal();

		$("#myprof").click(function() {
			alert("내 정보 페이지로 이동합니다");
			location.href = "myInfoCheck"
		})
	});

// hj script 2021.05.21
	$(function() {
		$(document).on('click', '#myinfoMainDealTable button ', function() {
			
			var btnText = $(this).text(); //버튼 속성
			var j_num = $(this).parent('td').prev().prev().prev().children('input').val(); //글번호	
			
			var up_title = $(this).parent('td').prev().prev().prev().prev().text(); //타이틀
		
			if(up_title=='나의 모집'){
				if(btnText=='참여신청'){
					$(".myinfoApprPopup").css({'display': 'block'});
					//참여 승락
					$(document).on('click', '.myinfoMainAppr', function(){
						var param = 'j_num='+j_num;
						
						$.ajax({
							url: 'joinUpdate',
							data: param,
							success: function(result){
								$(".myinfoApprPopup").css({'display': 'none'});
								alert('참여신청을 수락했습니다.');
							},
							error: function(error){
								console.log('참여신청 승인 에러...');
								console.log(error);
							}
						});
					});
					
					//참여 거절
					$(document).on('click', '.myinfoMaindec', function(){
						var param = 'j_num='+j_num;
						
						$.ajax({
							url: 'joinCancel',
							data: param,
							success: function(result){
								console.log('승인 성공!', result)
								$(".myinfoApprPopup").css({'display': 'none'});
								alert('참여신청을 거절했습니다.');
							},
							error: function(error){
								console.log('참여신청 승인 에러...');
								console.log(error);
							}
						});
					});
				}
			}else if(up_title=='나의 참여'){
				if(btnText=='참여신청'){
					alert('상대방의 승인을 기다리고 있습니다, 잠시만 기다려주세요!');					
				}else if(btnText=='참여승인'){
					$("#myinfoCancelApp").css({'display': 'block'});
					//참여 승락
					$(document).on('click', '.myinfoMainAppr', function(){
						var param = 'j_num='+j_num;
						$.ajax({
							url: 'joinCancel',
							data: param,
							success: function(result){
								$(".myinfoApprPopup").css({'display': 'none'});
								alert('참여신청을 거절했습니다.');
							},
							error: function(error){
								console.log('참여신청 승인 에러...');
								console.log(error);
							}
						});
						
					});
						
					//참여 거절
					$(document).on('click', '.myinfoMaindec', function(){
						$("#myinfoCancelApp").css({'display': 'none'});
					});
				}
			}
		});
		
		//qna 답변 보기
		$(document).on('click', '.qnaTitle', function(){
			alert("adjfhklajsdfh?")
			var q_con = $(this).text();
			var adate = $(this).next().next().children('input').val();
			var answer = $(this).next().next().next().children('input').val();
			
			console.log(q_con, '?', adate, '?', answer);
			$('#viewQnaAnswer li:nth-child(1)').children('span').text(q_con);
			$('#viewQnaAnswer li:nth-child(2)').children('span').text(adate);
			$('#viewQnaAnswer li:last-child').children('div').text(answer);
			
			$('#viewQnaAnswer').css('display', 'block');
		});
		
	});
	//리뷰확인창 닫기 
	function closeQnaAnswer(){
		$('#viewQnaAnswer').css('display', 'none');
	}
</script>
<%@ include file="/inc/sideBar.jspf"%>
<div class="myinfoBody">
	<!-- <button id="toggle" class="btn btn-outline-dark btn-light">||</button> -->

	<%@ include file="/inc/sideMenu.jspf"%>
	<!-- 사이드 메뉴 include -->

	<div class="myinfoContainer">
		<div id="profile">
			<ul id="myprof">
				<li class="profileHeadfont">MY PROFILE</li>
				<li><img
					src="<%=request.getContextPath()%>/img/mem_prof/${logProf }" /></li>
				<li>"&nbsp;${myVO.mem_nick}&nbsp;"</li>
				<li><div>${myVO.mem_content }</div></li>
				<li><span>'${myVO.loc_gu }'&nbsp;</span>에서 주로 활동하시네요!</li>
			</ul>
			<ul id="myPointShip">
				<li class="profileHeadfont">나의 포인트</li>

				<li><span><fmt:formatNumber type="number"
							maxFractionDigits="3" value="${myPoint}" />&nbsp;원</span></li>
				<li><a href="myInfoLoad">충전하러가기</a></li>
				<li class="profileHeadfont">배송상태<span>update</span> <!-- 배송상태 업데이트 안되면 색상 #ddd로 바꾸기 -->
				</li>
				<li class="wordCut shipUpdate">[주문글:여름나기 차렵이불..] 배송시작되었습니다.</li>
				<li class="wordCut shipUpdate">[주문글:수공예 매듭팔찌..] 배송시작되었습니다.</li>
				<li class="wordCut shipUpdate">[주문글:욕실을 더 모던하게..] 배송시작되었습니다.</li>
				<li class="wordCut shipUpdate">[주문글:옻칠 수저세트 4인용..] 배송시작되었습니다.</li>
			</ul>
		</div>
		<div class="myinfoTop">
			<h3>내 등급</h3>
			<ul class="myinfoTopCount">
				<li>방문&nbsp;(${myAct.logcount })</li>
				<li>작성글&nbsp;(${myAct.board + myAct.mem_share + myAct.grouplocal })</li>
				<li>후기평가&nbsp;(70%)</li>
			</ul>
			<div id="grade">
				<ul id="slider">
					<!-- 자바스크립트로 만들어줌 -->
					<li><img
						src='<%=request.getContextPath()%>/img/myInfo/slider/heart${myVO.mem_rev }.png' /></li>
					<li>
						<div>나의 마음지수</div>
						<div>
							<span>&nbsp;${myVO.mem_rev }&nbsp;%&nbsp;</span>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="myinfoBottom">
			<div id="waiting">
				<span class="myinfoHeader mdFnt info-font-weight">&nbsp;&nbsp;참여현황</span>
				<a href="myInfoDeal" style="float: right">더보기</a>
				<table class="myinfoTable2" id="myinfoMainDealTable">
					<tr>
						<td>구분</td>
						<td>제목</td>
						<td>참여자</td>
						<td>날짜</td>
						<td>상태</td>
					</tr>

					<c:forEach var="join" items="${myJoin }" begin='1' end='10'>
						<tr>
							<c:if test="${join.auth==logId }">
								<td>나의 참여</td>
								<td><!-- (${join.up_cate }) -->${join.title }<input type='hidden' value='${join.j_num }' /></td>
								<td>${join.userid }</td>
								<td>${join.j_writedate }</td>
								<td><button class='joincnfbtn btn btn-info btn-block '>${join.j_status }</button></td>
							</c:if>
							<c:if test="${join.auth!=logId }">
								<td>나의 모집</td>
								<td><input type='hidden' value='${join.j_num }' /><!-- (${join.up_cate }) -->${join.title }</td>
								<td>${join.auth }</td>
								<td>${join.j_writedate }</td>
								<c:if test="${join.j_status=='참여취소' }">
									<td><button class='btn btn-danger btn-block'>${join.j_status }</button></td>
								</c:if>

								<c:if test="${join.j_status!='참여취소' }">
									<td><button class='btn btn-primary btn-block'>${join.j_status }</button></td>
								</c:if>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div id="QnA">
				<span class="myinfoHeader mdFnt info-font-weight">&nbsp;&nbsp;QnA</span>
				<table class="myinfoTable2">
					<tr>
						<td style="width: 55%;">제목</td>
						<td>글쓴이</td>
						<td>날짜</td>
						<td>상태</td>
					</tr>
					
					<c:forEach var="qvo" items="${qnaVO }">
						<tr>
							<c:if test="${qvo.q_status==1 }">
								<td class="qnaTitle" style="cursor: pointer; font-family: nsrb; width: 55%;" >${qvo.q_content }</td>
								<td>${qvo.sellerid }</td>
								<td>${qvo.q_adate }<input type="hidden" value="${qvo.q_adate }"/></td>
								<td style="font-family: nsrb; color: #5f0080;">답변완료
									<input type="hidden" value="${qvo.q_answer }"/>
								</td>
							</c:if>
							<c:if test="${qvo.q_status==2 }">
								<td style="cursor: pointer; font-family: nsrb; width: 55%;" onclick="alert('답변을 기다리고 있습니다. 잠시만 더 기다려주세요!')">${qvo.q_content }</td>
								<td>${qvo.sellerid }</td>
								<td>${qvo.q_writedate }</td>
								<td>답변대기</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	
</div>

<!-- 참여자 승인 이벤트 -->
<div class="myinfoApprPopup">
	<div>참여신청 거절 시, 재수락이 불가능합니다.</div>
	<ul>
		<li><button type="button" class="myinfoMainAppr">수락</button></li>
		<li><button type="button" class="myinfoMaindec">거절</button></li>
	</ul>
</div>
<div class="myinfoApprPopup" id="myinfoCancelApp">
	<div>참여신청 취소 시, 재수락이 불가능합니다.</div>
	<ul>
		<li><button type="button" class="myinfoMainAppr">취소</button></li>
		<li><button type="button" class="myinfoMaindec">뒤로가기</button></li>
	</ul>
</div>

<!-- 등록된 답변 보기용 div -->
<div id="viewQnaAnswer" >
	<ul>
		<li>질문제목<span></span></li>
		<li>답변날짜<span></span></li>
		<li>답변<br/>
			<div></div>
		</li>
	</ul>
	<div><button type="button" onclick="javascript:closeQnaAnswer();">확인</button></div>
</div>