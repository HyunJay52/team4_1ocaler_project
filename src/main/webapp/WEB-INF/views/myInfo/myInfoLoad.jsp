<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$(function(){

		var nowMoney = ${myPoint};
		setMoney(nowMoney); //현제 포인트 세팅
		//충전금액 버튼 선택시
		var firstMoney = nowMoney;
		setMoney(${myPoint});
		$(".load").val(0);
		$("#loadArea>form>ul>li input").click(function(){
			var charge = parseInt($(this).attr("title"));
			var nowCharge = parseInt($(".load").val());
			nowCharge += charge;
			$(".load").val(nowCharge);
			setMoney(nowCharge);
		});
		
		//충전후 잔액 세팅
		var myMoney = 0;
		function setMoney(money){
			var chargeMoney = money += firstMoney;
			myMoney = chargeMoney;
			$("#loadMoney").text(money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
		}
		
		//입력 이벤트 세팅
		$(".load").on("keyup", function(){
			if($(this).val()== "" || $(this).val() < 0){
				$(this).val("0");
			}
			var charge = parseInt($(".load").val());
			setMoney(charge);
		});

		//결제수단 이벤트
		$("#loadFrom").on("submit", function(){
			if($("#loadArea>form>select").val() == '결제수단 선택'){
				alert("결제수단을 선택해주세요");
				return false;
			}else if('${logId}' == '' || '${logId}' == null){
				alert("로그인 후 이용 가능합니다.");
				location.href="login";
				return false;
			}else{
				if(payment()){
					$("#myPoint").children().next().text(myMoney.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");				
										
				}else{
					return false;
				}
	
				
	
			}
			
		});
		
		var msg ="";
		
		//결제 api 식별코드 세팅
		var IMP = window.IMP;
		IMP.init('imp45051525');
			
			
		function payment(){
			var userid = '${logId}';
			var username = '${logName}';
			var payStatus = $("#payStatus option:selected").val();
			console.log(payStatus);
			IMP.request_pay({
			    pg : 'html5_inicis', // version 1.1.0부터 지원.
			    pay_method : payStatus,
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '포인트 충전',
			    amount : 100,
			    buyer_email : 'test@localer.com',
			    buyer_name : username,
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			 	m_redirect_url : 'myInfoLoad'
			}, function(rsp) {
			    if ( rsp.success ) {
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        msg += '결제수단 : ' + rsp.pay_method;
				        msg += '결제상태 : ' + rsp.status;
				        msg += '결제시간 : ' + rsp.paid_at;
				        
				        //post방식 전송을 위해 json데이터로 저장한다 
				        var data = {			//결제 금액 세팅
				        		'cha_point' : rsp.paid_amount
				        		};
				        $.ajax({
				        	type : 'POST',				 	//post방식
				        	url : 'myInfoPointCharge',		//전송할 url
				        	dataType : 'json', 				// json타입
				        	data : data,					// 데이터
				        	success : function(result){
				        		console.log("충전완료");
				        	}, error : function(e){
				        		console.log("충전실패");
				        	}
				        });
				        location.href="";
				     /*   if(payStatus == 'vbank'){
				        	msg += '가상계좌 입금계좌번호 : ' + rsp.vbank_num;
				        	msg += '가상계좌 은행명 : ' + rsp.vbank_name;
				        	msg += '가상계좌 예금주 : ' + rsp.vbank_holder;
				        	msg += '가상계좌 입금기한 : ' + rsp.vbank_date;
				        	
				        }*/
				       
				        alert("결제가 완료되었습니다.");
				        
				       
			    } else {
			        msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			    return rsp.success;
			});
		};
		
		//페이징		
		var nowNum = 1;	//현제 페이지
		var date = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 
		$(document).ready(function(){
			var searchDate = $(".loadDate").val();
			console.log(searchDate);
			setPointRecord(1, searchDate, 'all', "");
		});
		
		//시작 페이지

		function setPointRecord(p, date, key, word){
			$.ajax({
				url : "myPointSelect",
				data : "nowNum="+p+"&searchDate="+date+"&searchKey="+key+"&searchWord="+word,
				success : function(result){
					console.log(result.pList);
					$(".pointList").html("");
					result.pList.forEach(function(data,idx){
						var tag = "<li>";
						if(data.cha_mth == 1){
							tag += "<div class='pointStatus point-color-green'>적립</div>";
							tag += "<p class='pointDate'>"+data.po_date+"</p>";
							tag += "<span class='pointContent'>구매 적립</span>";
							tag += "<span class='usePoint point-color-green'>+"+data.cha_point+"원</span>";
							tag == "<p class='pointItem'>충전포인트 결제(카드)<p>";
							tag += "</li>"
						}else if(data.cha_mth > 1){
							tag += "<div class='pointStatus point-color-red point-status-red'>사용</div>";
							tag += "<p class='pointDate'>"+data.po_date+"</p>";
							tag += "<span class='pointContent'>포인트 결제</span>";
							tag += "<span class='usePoint point-color-red'>-"+data.cha_point+"원</span>";
							tag == "<p class='pointItem'>물품 결제(포인트)<p>";
							tag += "</li>"
						}
						$(".pointList").append(tag);
					});
					setpaging(result.pVO);
			
				}, error : function(e){
					console.log(e);
				}
			
			 
			});
		}
		
		function setpaging(pVO){
			console.log(pVO);
			$(".pagingArea").html("");
			var tag = '<ul class="pagination justify-content-center">';
			if(pVO.nowNum > 1){
				tag += '<li class="page-item"><button value="'+(pVO.nowNum-1)+'" class="page-link">Prev</button></li>';					
			}else{
				tag += '<li class="page-item disabled"><button class="page-link">Prev</button></li>';				
			}
			for(var p = pVO.startPage; p < pVO.startPage + pVO.onePageSize; p++){
				if(p <= pVO.totalPage){
					if(p == pVO.nowNum){
						tag += '<li class="page-item active"><button class="page-link" value="'+p+'">'+p+'</button></li>';						
					}else{
						tag += '<li class="page-item"><button class="page-link" value="'+p+'">'+p+'</button></li>';						
					}
				}	
			}
			if(pVO.nowNum == pVO.totalPage){
				tag += '<li class="page-item disabled"><button class="page-link">Next</button></li>';				
			}else{
				tag += '<li class="page-item"><button value="'+(pVO.nowNum+1)+'" class="page-link">Next</button></li>';				
			}
			tag += "</ul>";
			$(".pagingArea").append(tag);
		}
		
		$(document).on('click', '.pagingArea>ul>li>button', function(){
			var nowNum = $(this).val(); //현제 페이지
			//검색할 날짜 데이터
			var searchDate = $(".loadDate").val();
			//검색할 키 데이터
			var searchKey = $("#selPayment option:selected").val();//
			
			console.log(nowNum+"/"+searchDate+"/"+searchKey);
			
			setPointRecord(nowNum, searchDate, searchKey, "");			
		});
		$("#selPayment").change(function(){
			//검색할 날짜 데이터
			var searchDate = $(".loadDate").val();
			//검색할 키 데이터
			var searchKey = $("#selPayment option:selected").val();//
			setPointRecord(1, searchDate, searchKey, "");			

		})
		
	});
</script>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
	<h2>충전하기</h2>
	<div class="loadTop">
		<div id="loadArea">
			<form method="post" action="myInfoLoad" id="loadFrom">
				<input type="text" name="load" class="lgFnt load"/>
					<span class="mdFnt">충전 후 잔액 :</span><span class="mdFnt" id="loadMoney"></span>
					<ul>
						<li><input type="button" class="btn commBtn mdFnt btn-block" title="10000" value="1 만원"/></li>
						<li><input type="button" class="btn commBtn mdFnt btn-block" title="50000" value="5 만원"/></li>
						<li><input type="button" class="btn commBtn mdFnt btn-block" title="100000" value="10 만원"/></li>
						<li><input type="button" class="btn commBtn mdFnt btn-block" title="200000" value="20 만원"/></li>
					</ul>
					<br/>
					<select class="selectBox" id="payStatus" name="payStatus">
						<option value="결제수단 선택">결제수단 선택</option>
						<option value="card">카드결제</option>
			<!--		<option value="trans">실시간 계좌이체</option>
						<option value="vbank">가상계좌</option>
						<option value="phone">휴대폰 소액결제</option>
			 -->
					</select>
					<input type="submit" class="btn commBtn" value="충전하기"/>
			</form>
		</div>
		<div id="myPoint">
			<h2>잔액</h2>
			<h2 style="float:right">${myPoint}</h2>
		</div>
	</div>	
		<div id="loadList">
				<select class="selectBox " name="selPayment" id="selPayment">
					<option value="all">전체</option>
					<option value="1">충전내역</option>
					<option value="2">사용내역</option>
				</select>
				<div class="loadLine"></div>
				<div class="loadDateFrm"><button class="dayBtn prev">《</button><button class="dayBtn mdFnt setMonth"></button><button class="dayBtn next">》</button></div>
				<input type="date" value="2021-05-06" min="2020-01-01" max="2022-01-01" class="loadDate"/>
				<ul class="pointList">
				
				</ul>
			<!--
			<table class="myinfoTable2">
				<tr>
					<td>구분</td>
					<td>날짜</td>
					<td>수단</td>
					<td>금액</td>
				</tr>
				<c:forEach var="i" items="${pList }">
					<c:if test="${i.cha_mth == 1 }">
						<tr>
							<td><label class="btn">충전</label></td>
							<td>${i.po_date }</td>
							<td>카드결제</td>
							<td>${i.cha_point }원</td>
						</tr>
					</c:if>
					<c:if test="${i.cha_mth > 1 }">
						<tr>
							<td><label class="btn">사용</label></td>
							<td>${i.po_date }</td>
							<td>포인트결제</td>
							<td>${i.cha_point }원</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			-->
			<div class="pagingArea">
			
			</div>
		</div>
	</div>
</div>