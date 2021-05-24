<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		//결제관리 리스트 불러오기
		function setOrderList(num){
			console.log( $("#saleManagementForm").serialize());
			$.ajax({
				url : "selectSalesManagement",
				data : $("#saleManagementForm").serialize()+"&nowNum="+num,
				success : function(result){
					console.log(result);
					var tag = "<tr><td>번호</td><td>상품제목</td><td>가격</td><td>주문일자</td><td>결제상태</td><td>결제수단</td><td>주문자</td></tr>";
					
					result.list.forEach(function(data, idx){
						tag += "<tr><td>"+data.o_num+"</td>";
						tag += "<td><a href='sellView?i_num="+data.num+"'>"+data.i_subject+"</a></td>";
						tag += "<td>"+data.o_price+"원</td>";
						tag += "<td>"+data.o_date+"</td>";
						if(data.o_conf == 1){
							tag += "<td>결제 미확인</td>";							
						}else{
							tag += "<td>결제완료</td>";
						}
						if(data.o_mtd == 1){
							tag += "<td>카드결제</td>";						
						}else if(data.o_mth == 2){
							tag += "<td>포인트결제</td>";
						}else{
							tag += "<td>미결제</td>";
						} 
						tag += "<td>"+data.userid+"</td>";
						
						tag += "</tr>";
					})
					var head = "<li>판매중 : "+result.count.count+"</li>";
						head += "<li>당일주문 : "+result.count.today+"</li>";
						head += "<li>결제완료 : "+result.count.confirmation+"</li>";
						head += "<li>결제대기 : "+result.count.stay+"</li>";
						head += "<li>취소/환불 : 0개</li>";
					
					$("#saleManagementHead").html(head);
					$("#myinfoSaleManagementTable").html(tag);
					$(".myInfoProductManagementBottom>ul>li>input").attr('value', "주문 :"+result.count.count+"건");
					setMyinfoSaleManagementPaging(result.pVO);
				}, error : function(e){
					console.log("error");
				}
			});
			
		}
		setOrderList(1);
	
		//결제관리 페이징
		function setMyinfoSaleManagementPaging(pVO){
			console.log(pVO);
			$("#SaleManagementPagingArea").html("");
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
			$("#SaleManagementPagingArea").append(tag);
		}
		
		//결제관리 검색버튼
		$(".saleManagementBtn").click(function(){
			setOrderList(1);
		});
		
		$(".productManagementLabelCenter>ul>li>input").change(function(){
			$(".productManagementLabelCenter>ul>li>input").prop('checked', false);
			$(this).prop('checked', true)
		});
	});
</script>
<%@ include file="/inc/sideBar.jspf" %>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h2>판매관리 - 결제관리</h2>
		<div class="myInfoProductManagementTop">
			<div class="shippingManagementHeaderForm">
				<ul class="managementHeader" id="saleManagementHead"> 
					<li>판매중 : 3개</li>
					<li>당일주문 : 20개</li>
					<li>결제완료 : 14개</li>
					<li>결제대기 : 6개</li>
					<li>취소/환불 : 0개</li>
				</ul>
			</div>
			<form method="post" id="saleManagementForm" onsubmit="return false;">
			<div class="productManagementLabelForm">
				<ul class="productManagementLabel">
					<li><label>판매상태</label></li>
					<li><label>기간선택</label></li>
					<li><label>검색</label></li>					
				</ul>
				<div class="productManagementLabelCenter">
					<ul>
						<li><input type="checkbox" value="all" name="searchKey2" checked/>전체</li>
						<li><input type="checkbox" value="2" name="searchKey2"/>결제완료</li>
						<li><input type="checkbox" value="1" name="searchKey2"/>결제대기</li>
						<li><input type="checkbox" value="" name="searchKey2"/>취소/환불</li>
					</ul>
					<div class="productManagementLabelCenterDiv">
						<input type="date" name="searchDate" value="2021-03-01" min="2021-03-01" max="2021-05-31"/>~
						<input type="date" name="searchDate2" value="2021-05-31" min="2021-03-01" max="2021-05-31"/>
					</div>
					<div class="productManagementLabelCenterDiv">
						<input type="hidden" name="searchKey" value="i_subject"/>
						<input type="text" name="searchWord"/>
						<input type="button" value="검색" class="btn commBtn saleManagementBtn"/>
					</div>				
				</div>				
			</div>
			</form>
		</div>
		<div class="myInfoProductManagementBottom">
			<ul>
				<li><input type="button" value="주문 : 14건" class="btn commBtn myInfoProductManagementBottomBtn"/></li>
			</ul>
			<table class="myInfoProductManagementTable2" id="myinfoSaleManagementTable">
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
			<div id="SaleManagementPagingArea"></div>
		</div>
	</div>
</div>
