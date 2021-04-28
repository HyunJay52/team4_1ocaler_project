<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h2>리뷰 관리</h2>
		<div class="myInfoProductManagementTop">
			<div class="productManagementLabelForm" style="height:120px">
				<ul class="productManagementLabel">
					<li><label>기간선택</label></li>
					<li><label>검색</label></li>					
				</ul>
				<div class="productManagementLabelCenter">
					<div class="productManagementLabelCenterDiv">
						<input type="date"/>~
						<input type="date"/>
						<input type="button" value="7일" class="btn commBtn productManagementBtn"/>
						<input type="button" value="1개월" class="btn commBtn productManagementBtn"/>
						<input type="button" value="3개월" class="btn commBtn productManagementBtn"/>
					</div>
					<div class="productManagementLabelCenterDiv">
						<input type="text" name="search"/>
						<input type="button" value="검색" class="btn commBtn productManagementBtn"/>
					</div>				
				</div>				
			</div>
		</div>
		<div class="myInfoReviewManagementBottom">
			<table class="myInfoReviewManagementTable">
				<tr>
					<td>평가</td>
					<td>판매글</td>
					<td>전체구매자수</td>
					<td>리뷰남긴 회원 수</td>
					<td>판매종료일</td>
				</tr>
				<tr>
					<td class="mdFnt info-font-weight"><img src="img/myInfo/slider/heart50.png"/><label>89%</label></td>
					<td class="mdFnt info-font-weight">청년농부 나주배</td>
					<td>123 명</td>
					<td>93 명</td>
					<td>2021.04.01</td>
				</tr>
				<tr>
					<td><img src="img/myInfo/slider/heart50.png"/></td>
					<td class="mdFnt info-font-weight">user123</td>
					<td>2021.03.31</td>
					<td class="wordCut">상태 뿐만 아니라 맛도 최고여서 선물하고 보람이 있었습니다. 다음에 또 오픈 해주셨으면</td>
					<td><input type="button" class="btn commBtn" value="답글달기"/></td>
				</tr>
			</table>
		</div>
	</div>
</div>