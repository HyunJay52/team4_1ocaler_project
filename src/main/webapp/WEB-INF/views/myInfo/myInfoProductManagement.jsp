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
					var tag = "<tr><td>글번호</td><td>상품제목</td><td>가격</td><td>구매수(총판매액)</td><td>종료일</td><td>등록일</td><td>조회수</td></tr>";
					var index = 0;
					result.list.forEach(function(data, idx){
						tag += "<tr><td>"+data.i_num+"</td>";
						tag += "<td><a href='sellView?i_num="+data.i_num+"'>"+data.i_subject+"</a></td>";
						tag += "<td>"+data.i_price+"원</td>";
						tag += "<td>"+data.orderCount+"<br/>("+data.revenue+")</td>";
						tag += "<td>"+data.i_period+"</td>";
						tag += "<td>"+data.i_writedate+"</td>";
						tag += "<td>"+data.i_hit+"</td>";
						tag += "</tr>";
						
						index = idx;
					});
					
					if(index < 10){
						for(var i = index; i < 7; i++){
							tag += "<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
						}							
					}
					setMyinfoProductPaging(result.pVO);
					$(".myInfoProductManagementTable2").html(tag);
				},error : function(e){
					console.log("error");	
				}
			});
		}
		setProductList(1);
		
		//상품관리 페이징
		function setMyinfoProductPaging(pVO){
			console.log(pVO);
			$(".myinfoProductManagementPaging").html("");
			var tag = '<ul class="pagination justify-content-center">';
			if(pVO.nowNum > 1){
				tag += '<li class="page-item"><button value="'+(pVO.nowNum-1)+'" class="page-link">Prev</button></li>';					
			}else{
				tag += '<li class="page-item disabled"><button class="page-link">Prev</button></li>';				
			}
			for(var p = pVO.startPage; p < pVO.startPage + pVO.onePageSize; p++){
				if(p <= pVO.totalPage){
					if(p == pVO.nowNum){
						tag += '<li class="page-item active"><button class="page-link" value="'+p+'">'+p+'</button></li>';						
					}else{
						tag += '<li class="page-item"><button class="page-link" value="'+p+'">'+p+'</button></li>';						
					}
				}	
			}
			if(pVO.nowNum == pVO.totalPage){
				tag += '<li class="page-item disabled"><button class="page-link">Next</button></li>';				
			}else{
				tag += '<li class="page-item"><button value="'+(pVO.nowNum+1)+'" class="page-link">Next</button></li>';				
			}
			tag += "</ul>";
			$(".myinfoProductManagementPaging").append(tag);
		}
		
		//상품관리 검색
		$(".productManagementBtn").click(function(){
			setProductList(1);
		});
	});
</script>
=======

<%@ include file="/inc/sideBar.jspf" %>
>>>>>>> refs/remotes/origin/totalMergeTest

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
					<li><label>제목검색</label></li>					
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
					<td>상품제목</td>
					<td>가격</td>
					<td>구매수(총판매액)</td>
					<td>종료일</td>
					<td>등록일</td>
					<td>조회수</td>
				</tr>	
			</table>
			<div class="myinfoProductManagementPaging">
			
			</div>
		</div>
	</div>
</div>
