<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h2>리뷰 관리</h2>
		<div class="myInfoProductManagementTop">
			<div class="productManagementLabelForm">
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
			<ul>
				<li>평가</li>
				<li>판매글</li>
				<li>전체구매자수</li>
				<li>리뷰남긴 회원 수</li>
				<li>판매종료일</li>

			</ul>
		</div>
	</div>
</div>