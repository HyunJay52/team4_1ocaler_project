<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script><script>
	$(function(){
		var date = new Date();
		
		var toYear = date.getFullYear();
		var toMonth = date.getMonth()+1;
		
		$(".setMonth").text(toMonth+"월");
		
		//달력 날짜 선택시 이벤트
		$(".date").on('change', function(){
			var monthArr = $(this).val().split("-");
			
			toYear = monthArr[0];
			toMonth = monthArr[1].replace(/(^0+)/, "");

			setMonth(toYear, toMonth);
		});
		
		//월 세팅
		function setMonth(toYear, toMonth){
			$(".setMonth").text(toMonth+"월");
			
			console.log(toYear);
			console.log(toMonth);
			console.log($("#sel").val());

		}
		
		//이전날짜
		$(".prev").click(function(){
			toMonth--;
			if(toMonth == 0){
				toMonth = 12;
				toYear--;
			}
			setMonth(toYear, toMonth);
		});
		
		//다음날짜
		$(".next").click(function(){
			toMonth++;
			if(toMonth == 13){
				toMonth = 1;
				toYear++;
			}
			setMonth(toYear, toMonth);
		});
		
		var nowMoney = 100000;
		setMoney(nowMoney); //현제 포인트 세팅
		//충전금액 버튼 선택시
		var firstMoney = nowMoney;
		setMoney(0);
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
			}else{
				$("#myPoint").children().next().text(myMoney.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");				
				if(payment()){
					
				}else{
					return false;					
				}
			}
			
		});
		
		function payment(){
			var IMP = window.IMP;
			IMP.init('imp45051525');
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : myMoney,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456',
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    }else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
				return rsp.success;
			});
		};
			

	});
</script>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
	<h2>충전하기</h2>
	<div class="loadTop">
		<div id="loadArea">
			<form method="post" action="load" id="loadFrom">
				<input type="text" name="load" class="lgFnt load"/>
					<span class="mdFnt">충전 후 잔액 :</span><span class="mdFnt" id="loadMoney"></span>
					<ul>
						<li><input type="button" class="btn commBtn mdFnt btn-block" title="10000" value="1 만원"/></li>
						<li><input type="button" class="btn commBtn mdFnt btn-block" title="50000" value="5 만원"/></li>
						<li><input type="button" class="btn commBtn mdFnt btn-block" title="100000" value="10 만원"/></li>
						<li><input type="button" class="btn commBtn mdFnt btn-block" title="200000" value="20 만원"/></li>
					</ul>
					<br/>
					<select class="selectBox" name="payWay">
						<option value="결제수단 선택">결제수단 선택</option>
						<option value="무통장입금">무통장입금</option>
						<option value="카드결제">카드결제</option>
					</select>
					<input type="submit" class="btn commBtn" value="충전하기"/>
			</form>
		</div>
		<div id="myPoint">
			<h2>잔액</h2>
			<h2 style="float:right">100,000원</h2>
		</div>
	</div>	
		<div id="loadList">
				<select class="selectBox " name="sel" id="sel">
					<option value="전체">전체</option>
					<option value="충전내역">충전내역</option>
					<option value="사용내역">사용내역</option>
				</select>
				<div class="loadLine"></div>
				<div class="loadDateFrm"><button class="dayBtn prev">《</button><button class="dayBtn mdFnt setMonth"></button><button class="dayBtn next">》</button></div>
				<input type="date" min="2021-01-01" max="2021-05-31" class="loadDate"/>
				
			<table class="myinfoTable2">
				<tr>
					<td>구분</td>
					<td>날짜</td>
					<td>수단</td>
					<td>금액</td>
				</tr>
				<tr>
					<td><label class="btn">충전</label></td>
					<td>2021.04.02</td>
					<td>카드결제</td>
					<td>100,000원</td>
				</tr>
				<tr>
					<td><label class="btn">사용</label></td>
					<td>2021.04.01</td>
					<td>포인트결제</td>
					<td>100,000원</td>
				</tr>
				<tr>
					<td><label class="btn">충전</label></td>
					<td>2021.04.02</td>
					<td>카드결제</td>
					<td>100,000원</td>
				</tr>
				<tr>
					<td><label class="btn">사용</label></td>
					<td>2021.04.01</td>
					<td>포인트결제</td>
					<td>100,000원</td>
				</tr>
				<tr>
					<td><label class="btn">충전</label></td>
					<td>2021.04.02</td>
					<td>카드결제</td>
					<td>100,000원</td>
				</tr>
				<tr>
					<td><label class="btn">사용</label></td>
					<td>2021.04.01</td>
					<td>포인트결제</td>
					<td>100,000원</td>
				</tr>
			</table>
		</div>
	</div>
</div>