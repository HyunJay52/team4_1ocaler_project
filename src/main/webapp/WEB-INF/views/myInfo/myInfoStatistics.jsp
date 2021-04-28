<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->	
	<div class="myinfoContainer">
		<div class="myinfoStatisticsTop">
			<div class="myinfoStatisticsHeader">
				<h3>판매관리 - 통계</h3>
				<ul>
					<li><input type="date"/>~</li>
					<li><input type="date"/></li>
					<li><input type="button" value="7일" class="btn commBtn productManagementBtn"/></li>
					<li><input type="button" value="1개월" class="btn commBtn productManagementBtn"/></li>
					<li><input type="button" value="3개월" class="btn commBtn productManagementBtn"/></li>
				</ul>
			</div>
			<div class="myinfoStatisticsLeft">
				<table class="myinfoStatisticsTable2 info-font-weight mdFnt">
					<tr>
						<td style="height:70px;">오늘 총매출 현황</td>
					</tr>
					<tr>	
						<td>550,000원</td>				
					</tr>
				</table>
				<table class="myinfoStatisticsTable2">
					<tr>
						<td>결제대기</td>
						<td>결제완료</td>
						<td>주문확정</td>
					</tr>
					<tr>
						<td>8건</td>
						<td>4건</td>
						<td>10건</td>
					</tr>
					<tr>
						<td>400,000</td>
						<td>150,000</td>
						<td>500,000</td>
					</tr>
				</table>
				<label class="myinfoStatisticsLabel mdFnt info-font-weight">이달정산예정금액:2,380,000원</label>
			</div>
			<div class="myinfoStatisticsRight">
				<div id="myinfoBar"></div>
			</div>
		</div>
		<div class="myinfoStatisticsBottom">
			<div class="myinfoStatisticsBottomHeader">
				<div class="dealDateForm">
					<input type="date" min="2021-01-01" max="2021-05-31" class="date"/>
					<div class="myDealFrm"><button class="dayBtn prev">《</button><button class="dayBtn setMonth mdFnt"></button><button class="dayBtn next">》</button></div>
				</div>
				<div class="myinfoStatisticsLabel mdFnt info-font-weight">
					<label>총 수수료 : 320,000원</label>
					<label>총 순매출 : 2,380,000원</label>
				</div>
			</div>
			<table class="myinfoStatisticsTable2 tableSet">
				<tr>
					<td rowspan="2">일자</td>
					<td colspan="5">주문상세</td>
					<td rowspan="2">결제합계</td>
					<td colspan="4">취소/환불 상세</td>
					<td rowspan="2">수수료</td>
					<td rowspan="2">순매출</td>
				</tr>
				<tr>
					<td>주문수</td>
					<td>결제대기수</td>
					<td>결제완료수</td>
					<td>상품<br/>구매내역</td>
					<td>배송비</td>
					<td>취소수</td>
					<td>취소</td>
					<td>환불수</td>
					<td>환불</td>
				</tr>
				<tr>
					<td>04.03(토)</td>
					<td>12</td>
					<td>8</td>
					<td>4</td>
					<td>550,000</td>
					<td>7,500</td>
					<td>557,500</td>
					<td>1</td>
					<td>20,000</td>
					<td>0</td>
					<td>0</td>
					<td>27,500</td>
					<td>522,500</td>
				</tr>
			</table>
		</div>
		
	</div>
</div>