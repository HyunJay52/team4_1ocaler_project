<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<div class="saleHistoryCenter">
			<h3>판매관리 - 메인</h3>
			<div id="saleGrade" class="saleHistoryTop">
				<h6>셀러등급</h6>
				<ul>
					<li><img src="img/myInfo/slider/heart60.png"/></li>
					<li><span class="saleHistorySpan">6/10</span></li>
				</ul>
			</div>
			<div id="settlementAmount" class="saleHistoryTop">
				<h6>정산금액</h6>
				<span class="saleHistorySpan">980,100원</span>
			</div>
			<div id="newQ&A" class="saleHistoryTop">
				<h6>신규 Q&A</h6>
				<span class="saleHistorySpan">12개</span>
			</div>
		</div>	
	
	</div>
</div>