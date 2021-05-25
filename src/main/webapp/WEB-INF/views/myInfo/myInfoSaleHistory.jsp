<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/inc/sideBar.jspf"%>

<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf"%>
	<!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<div class="saleHistoryCenter">
			<div id="saleHistoryTop">
				<h3>판매관리 - 메인</h3>
				<div id="saleGrade" class="saleHistoryTop">
					<ul>
						<li>셀러등급</li>
						<li><img src="img/myInfo/slider/heart${selInfo[0].sel_lvl }.png" style="margin-top: -10px;"/><span class="saleHistorySpan">${selInfo[0].sel_lvl }</span>%</li>
					</ul>
				</div>
				<div id="settlementAmount" class="saleHistoryTop">
					<ul>
						<li>정산금액</li>
						<li><span class="saleHistorySpan" style="color: orange">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${selInfo[0].rec_m }" />
						</span>원</li>
					</ul>
				</div>
				<div id="newQ&A" class="saleHistoryTop">
					<ul>
						<li>신규 Q&A</li>
						<li><span class="saleHistorySpan">${selInfo[0].qnacnt }</span>개</li>
					</ul>
				</div>
			</div>
			<div class="saleHistoryBottom">
				<span class="saleHistorySpan" style="font-size: 24px">today's update</span>
				<div id="saleHistoryList">
					<h5 class="saleHistoryHeader">
						<a href="myInfoSalesManagement">판매현황</a>
					</h5>
					<table class="myinfoSaleHistoryTable2">
						<tr>
							<td>신규주문</td>
							<td>배송중</td>
							<td>반품접수</td>
							<td>Q & A</td>
						</tr>
						<tr>
							<td>${orderCnt[0] } 건</td>
							<td>${orderCnt[1] } 건</td>
							<td>0 건</td>
							<td>${selInfo[0].qnacnt } 건</td>
						</tr>
					</table>
				</div>
				<div id="productList">
					<h5 class="saleHistoryHeader">
						<a href="myInfoProductManagement">상품현황</a>
					</h5>
					<table class="myinfoSaleHistoryTable2">
						<tr>
							<td>판매 중</td>
							<td>판매완료</td>
							<td>판매종료</td>
							<td>종료 7일 전</td>
						</tr>
						<tr>
							<td>${saleCount[0] } 건</td>
							<td>${saleCount[1] } 건</td>
							<td>${saleCount[2] } 건</td>
							<td>${saleCount[3] } 건</td>
						</tr>
					</table>
				</div>
				<div id="calculateList">
					<h5 class="saleHistoryHeader">
						<a href="myInfoStatistics?month=5">정산현황</a>
					</h5>
					<table class="myinfoSaleHistoryTable2">
						<tr>
							<td>구매확정 전</td>
							<td>구매확정</td>
							<td>취소/환불신청</td>
							<td>취소/환불예정</td>
						</tr>
						<tr>
							<td>${orderCnt[2] } 건</td>
							<td>${orderCnt[3] } 건</td>
							<td>0 건</td>
							<td>0 건</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

	</div>
</div>