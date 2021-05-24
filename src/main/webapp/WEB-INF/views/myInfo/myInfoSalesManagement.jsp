<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/inc/sideBar.jspf" %>

<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h2>판매관리 - 결제관리</h2>
		<div class="myInfoProductManagementTop">
			<div class="shippingManagementHeaderForm">
				<ul class="managementHeader"> 
					<li>판매중 : 3개</li>
					<li>당일주문 : 20개</li>
					<li>결제완료 : 14개</li>
					<li>결제대기 : 6개</li>
					<li>취소/환불 : 0개</li>
				</ul>
			</div>
			<div class="productManagementLabelForm">
				<ul class="productManagementLabel">
					<li><label>판매상태</label></li>
					<li><label>기간선택</label></li>
					<li><label>검색</label></li>					
				</ul>
				<div class="productManagementLabelCenter">
					<ul>
						<li><input type="checkbox"/>총주문</li>
						<li><input type="checkbox"/>결제완료</li>
						<li><input type="checkbox"/>결제대기</li>
						<li><input type="checkbox"/>취소/환불</li>
					</ul>
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
		<div class="myInfoProductManagementBottom">
			<ul>
				<li><input type="button" value="주문 : 14건" class="btn commBtn myInfoProductManagementBottomBtn"/></li>
			</ul>
			<table class="myInfoProductManagementTable2">
				<tr>
					<td>번호</td>
					<td>상품명</td>
					<td>가격</td>
					<td>주문일</td>
					<td>결제상태</td>
					<td>결제방법</td>
					<td>주문인</td>							
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.o_num}</td>
						<td>${vo.i_subject}</td>
						<td>${vo.i_price}</td>
						<td>${vo.o_date}</td>
						<td>${vo.i_img1}</td>
						<c:if test="${vo.o_conf==1 }">
							<td>주문미확정</td>
						</c:if>
						<c:if test="${vo.o_conf==2 }">
							<td>주문확정</td>
						</c:if>
						<c:if test="${vo.o_conf==3 }">
							<td>취소/반품</td>
						</c:if>
						<td>${vo.userid}</td>						
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
