<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/inc/sideBar.jspf" %>

<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h2>판매관리 - 배송관리</h2>
		<div class="myInfoProductManagementTop">
			<div class="shippingManagementHeaderForm">
				<ul class="managementHeader" style="margin-left:80px;">
					<li>배송대기 : 6개</li>
					<li>배송중 : 3개</li>
					<li>배송완료 : 20개</li>
					<li>주문확정 : 14개</li>
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
						<li><input type="checkbox"/>배송대기</li>
						<li><input type="checkbox"/>배송중</li>
						<li><input type="checkbox"/>배송완료</li>
						<li><input type="checkbox"/>주문확정</li>
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
			<select id="shipSelectbox">
				<option value="5개 보기">5개 보기</option>
				<option value="10개 보기">10개 보기</option>
				<option value="15개 보기">15개 보기</option>
				<option value="20개 보기">20개 보기</option>
				
			</select>
			<table class="myInfoProductManagementTable2">
				<tr>
					<td>번호</td>
					<td>상품명</td>
					<td>가격</td>
					<td>주문일</td>
					<td>결제상태</td>
					<td>주문확정</td>
					<td>주문인</td>							
				</tr>
				<tr>
					<td>14</td>
					<td data-target='#shippingManagementMd' data-toggle='modal'>감자</td>
					<td>10,000 원</td>
					<td>2021.04.11</td>
					<td>배송중</td>
					<td>대기중</td>
					<td>test</td>							
				</tr>
				<tr>
					<td>13</td>
					<td>감자</td>
					<td>10,000 원</td>
					<td>2021.04.11</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>test2</td>							
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="modal fade mdFnt" id="shippingManagementMd">
		<div class="modal-dialog">
			<div class="modal-content shippingManagementContent">
				<div class="modal-header shippingManagementHeader">
				<h4 class="modal-title">고구마 10kg</h4>

				</div>
				<div class="modal-body shippingManagementBody">
					<ul>
						<li>주문일 : 2021.03.25</li>
						<li>받으실 분 : user0909(김자바)</li>
						<li>
							<select class="shippingManagementSelectbox">
								<option value="">한진택배</option>
								<option value="">로젠택배</option>
								<option value="">우체국택배</option>					
							</select>
						</li>
						<li>
							<textarea class="shippingManagementTextarea mdFnt" name="shipNum" placeholder="송장번호를 입력해주세요"></textarea>
						</li>
						<li><button class="btn btn-outline-dark btn-lg">작성완료</button>
							<button class="btn btn-outline-dark btn-lg" data-dismiss="modal">취소</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
