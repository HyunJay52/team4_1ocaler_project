<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/showCompleStyle.css"/>
<script>
	$(()=>{
		$("#homeBtn").click(function(){
			location.href="/1ocaler/";
		});
		$("#moreViewBtn").click(function(){
			location.href="selBard";
		});
		
	})
</script>


<div id="showMainFrm">
	<span>주문 / 결제</span>
	<hr id="liner"/>
	<div id="showInnerFrm">
		<div><span>주문이 성공적으로 완료</span><span>되었습니다.</span></div>
		<hr id="innerLiner"/>
	</div>
	<div>
		<div>
		<ul id="shipMemo">
			<li>주문번호</li>
			<li style="color:red; font-weight:bold">21521412321</li>
			<li>배송지정보</li>
			
			<li>
				<div>강남콩</div>
				<div>(Tel).  01086179084</div>
				<div>(12512)서울시 강남구 상호빌딩 203호</div>
			</li>
			<li>배송메모</li>
			<li> 부재시 경비실에 맡겨 주세요</li>
		</ul>
		</div>
		<div>
			<ul id="itemMemo">
				<li> 상품내용</li>
				<li>상품명</li>
				<li>가나다라마바사</li>
				<li>옵션명</li>
				<li>가나다라마바사</li>	
			</ul>
			<ul id="cashMemo">
				<li>결제 정보</li>
				<li>주문금액</li>
				<li style="color:red; font-weight:bold">47000원</li>
				<li style="padding-left:20px; font-size:14px; color:gray">ㄴ 상품금액</li>
				<li>30000원</li>
				<li style="padding-left:20px; font-size:14px; color:gray">ㄴ 배송비</li>
				<li>3000원</li>
			</ul>
		</div>
	</div>
	<div id="btnFrm">
		<input class="btn cancelBtn" type="button" id="homeBtn" value="홈으로">
		<input class="btn confBtn" type="button" id="moreViewBtn" value="더보기">
	</div>
</div>