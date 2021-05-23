<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		function setProductList(num){
			$.ajax({
				url : "selectProductList",
				data : $("#myinfoProductForm").serialize()+"&nowNum="+num,
				success : function(result){
					console.log(result);
					
				},error : function(e){
					console.log("error");	
				}
			});
		}
		setProductList(1);
	});
</script>

<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h2>판매관리 - 상품관리</h2>
		<div class="myInfoProductManagementTop">
			<div class="productManagementHeaderForm">
				<ul class="productManagementHeader">
					<li>총 등록상품 : 10개</li>
					<li>판매중 : 3개</li>
					<li>판매완료 : 7개</li>
					<li>종료예정 : 2개</li>
					<li>판매중단 : 0개</li>
				</ul>
			</div>
			<div class="productManagementLabelForm">
				<ul class="productManagementLabel">
					<li><label>판매상태</label></li>
					<li><label>기간선택</label></li>
					<li><label>검색</label></li>					
				</ul>
				<form method="post" id="myinfoProductForm" onsubmit="return false;">
				<div class="productManagementLabelCenter">
					<ul>
						<li><input type="checkbox" name="searchKey2"/>총 등록상품</li>
						<li><input type="checkbox" name="searchKey2"/>판매중</li>
						<li><input type="checkbox" name="searchKey2"/>판매완료</li>
						<li><input type="checkbox" name="searchKey2"/>종료예정</li>
						<li><input type="checkbox" name="searchKey2"/>판매중단</li>
					</ul>
					<div class="productManagementLabelCenterDiv">
						<input type="date" name="searchDate" value="2021-03-01" min="2021-03-01" max="2021-05-31"/>~
						<input type="date" name="searchDate2" value="2021-05-31" min="2021-03-01" max="2021-05-31"/>
					</div>
					<div class="productManagementLabelCenterDiv">
						<input type="hidden" name="searchKey" value="i_subject"/>
						<input type="text" name="searchWord"/>
						<input type="button" value="검색" class="btn commBtn productManagementBtn"/>
					</div>				
				</div>
				</form>				
			</div>
		</div>
		<div class="myInfoProductManagementBottom">
			<ul>
				<li><input type="button" value="상품등록" class="btn commBtn myInfoProductManagementBottomBtn"/></li>
				<li><input type="button" value="기간변경" class="btn commBtn myInfoProductManagementBottomBtn"/></li>
				<li><input type="button" value="판매중지" class="btn commBtn myInfoProductManagementBottomBtn"/></li>
				<li><input type="button" value="삭제" class="btn commBtn myInfoProductManagementBottomBtn"/></li>	
			</ul>
			<table class="myInfoProductManagementTable2">
				<tr>
					<td>글번호</td>
					<td>상품명</td>
					<td>가격</td>
					<td>종료일</td>
					<td>조회수</td>
					<td>구매수(총판매액)</td>
					<td>등록일</td>							
				</tr>
				<tr>
					<td>9</td>
					<td>감자</td>
					<td>10,000 원</td>
					<td>2021.04.11</td>
					<td>63 회</td>
					<td>23 회<br/>(230,000 원)</td>
					<td>2021.03.28</td>							
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
</div>
