<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/showCompleStyle.css"/>
<script>

	$(document).ready(function(){
		window.history.forward();
	});
	
	
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
	<div id="middleFrm">
		<div id="showInnerFrm">
			<span>주문이 성공적으로 완료</span><span>되었습니다.</span>
			<hr id="innerLiner"/>
		</div>
		<div>
			<div>
			<ul id="shipMemo">
				<li>주문번호</li>
				<li style="color:red; font-weight:bold">${complVO.o_num }</li>
				<li>결제일</li>
				<li>${complVO.b_date}</li>
				<li>배송지정보</li>
				
				<li>
					<div>${complVO.getter }</div>
					<div>(Tel).  ${complVO.ship_tel }</div>
					<div>(${complVO.ship_zip })${complVO.ship_addr } ${complVO.ship_detail }</div>
				</li>
				<li>배송메모</li>
				<li> ${complVO.ship_msg } </li>
			</ul>
			</div>
			<div>
				<ul id="itemMemo">
					<li style="font-size:19px"> 상품내용</li>
					<li>상품명</li>
					<li>${complVO.i_subject }</li>
					<li>옵션명</li>
					<li>${complVO.opt_str }</li>	
				</ul>
				<hr style="width: 430px; margin: 9 auto;"/>
				<ul id="cashMemo">
					<li style="font-size:19px">결제 정보</li>
					<li>주문금액</li>
					<li style="color:red; font-weight:bold">${complVO.o_price }원</li>
					<li style="padding-left:30px; font-size:14px; color:gray">ㄴ 상품금액</li>
					<li>${complVO.o_price-complVO.o_ship }원</li>
					<li style="padding-left:30px; font-size:14px; color:gray">ㄴ 배송비</li>
					<li>${complVO.o_ship }원</li>
				</ul>
			</div>
		</div>
	</div>
	<hr/>
	<div id="btnFrm">
		<input class="btn cancelBtn" type="button" id="homeBtn" value="홈으로">
		<input class="btn confBtn" type="button" id="moreViewBtn" value="더보기">
	</div>
</div>