<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/inc/sideBar.jspf" %>
<script>
	$(function(){
		//리스트 불러오기
		function setProductList(num){
			$.ajax({
				url : "selectProductList",
				data : $("#myinfoProductForm").serialize()+"&nowNum="+num,
				success : function(result){
					console.log(result);
					var tag = "<tr><td>글번호</td><td>상품제목</td><td>가격</td><td>구매수(총판매액)</td><td>조회수</td><td>상태</td><td>종료일</td></tr>";
					var index = 0;
					result.list.forEach(function(data, idx){
						tag += "<tr class='productEvent'><td>"+data.i_num+"</td>";
						tag += "<td><a href='sellView?i_num="+data.i_num+"'>"+data.i_subject+"</a></td>";
						tag += "<td>"+data.i_price+"원</td>";
						tag += "<td>"+data.orderCount+"건<br/>("+data.revenue+"원)</td>";
						tag += "<td>"+data.i_hit+"</td>";
						if(data.i_status == 1){
							tag += "<td>판매 중</td>";							
						}else if(data.i_status == 2){
							tag += "<td>판매완료</td>";								
						}else if(data.i_status == 3){
							tag += "<td>종료예정</td>";								
						}else{
							tag += "<td>판매중단</td>";								
						}
						tag += "<td>"+data.i_period+"</td>";
						tag += "</tr>";
						
						index = idx;
					});
					
					if(index < 10){
						for(var i = index; i < 7; i++){
							tag += "<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
						}							
					}
					var header = "<li>총 등록상품 : "+result.count.myItem+"개</li>";
					header += "<li>판매 중 : "+result.count.sale+"개</li>";
					header += "<li>판매완료 : "+result.count.completed+"개</li>";
					header += "<li>종료예정 : "+result.count.expected+"개</li>";
					header += "<li>판매중단 : "+result.count.itemStop+"개</li>";
					
					setMyinfoProductPaging(result.pVO);
					$(".productManagementHeader").html(header);
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
		
		//상품 판매중지
		function setStopProduct(i_num){
			$.ajax({
				url : "updateProductStatus",
				data : {"i_num":i_num},
				success : function(result){
					if(result > 0){
						alert("판매가 중지되었습니다.");
						setProductList(1);
					}
				},error : function(e){
					console.log("판매중지 실패");
				}
			});
		}
		
		//상품관리 검색
		$("#productSearchBtn").click(function(){
			setProductList(1);
		});
		
		//체크박스 
		$(".productManagementLabelCenter>ul>li>input").change(function(){
			$(".productManagementLabelCenter>ul>li>input").prop('checked', false);
			$(this).prop('checked', true)
		});
		//테이블 클릭이벤트
		$(document).on("click", ".productEvent>td", function(){
			$(".productEvent").css('background-color', '#fff');
			$(this).parent().css('background-color', '#ddd');
			$(".myInfoProductManagementBottom>ul>li>input").attr('class', 'btn commBtn myInfoProductManagementBottomBtn productEventBtn');
			$("#productNum").attr('value', $(this).parent().children().first().text());
			$("#productStatus").attr('value',  $(this).parent().children().eq(5).text());
		});
		
		//상품 수정 버튼 이벤트
		$(".myInfoProductManagementBottom>ul>li:nth-child(4)").click(function(){
			var i_num = $("#productNum").attr('value');
			
			if(i_num != null && i_num != ''){
				console.log(i_num);
				location.href="modifySellView?i_num="+i_num;
			}
		});
		//상품 상태변경 버튼 이벤트
		$(".myInfoProductManagementBottom>ul>li:nth-child(3)").click(function(){
			var i_num = $("#productNum").attr('value');
			var status = $("#productStatus").attr('value');
			console.log(status);
			if(i_num != null && i_num != '' ){
				if(status != '판매중단'){
					if(confirm("해당 상품의 판매를 중지하겠습니까?")){
						setStopProduct(i_num);
					}					
				}else{
					alert("해당 상품은 이미 판매중지되었습니다.");
				}
			}
			
		});
		
		//상품 기간변경 버튼 이벤트
		$(".myInfoProductManagementBottom>ul>li:nth-child(2)").click(function(){
			var i_num = $("#productNum").attr('value');
			var status = $("#productStatus").attr('value');
			if(i_num != null && i_num != '' ){
				if(status != '판매중단'){	
					$("#productMd").modal("show");												
				}else{
					alert("판매 중지된 상품은 변경할 수 없습니다.");
				}
			}
		});
		
		//기간변경하기
		$("#productPeriodChange").click(function(){
			if(confirm("종료일을 변경하시겠습니까?")){
				var i_num = $("#productNum").attr('value');
				var date = $("#periodDate").val();
				$.ajax({
					url : "updateProductPeriod",
					data : {"i_num":i_num,
							"date":date },
					dataType : "json",
					success : function(result){
						if(result > 0){
							alert("종료일이 변경되었습니다.");
							$("#productMd").modal("hide");
							setProductList(1);
						}
					},error : function(e){
						console.log("기간변경 에러");
					}
				});
			}
		});
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
					<li><label>제목검색</label></li>					
				</ul>
				<form method="post" id="myinfoProductForm" onsubmit="return false;">
				<div class="productManagementLabelCenter">
					<ul>
						<li><input type="checkbox" name="searchKey2" value="0" checked/>전체</li>
						<li><input type="checkbox" name="searchKey2" value="1"/>판매중</li>
						<li><input type="checkbox" name="searchKey2" value="2"/>판매완료</li>
						<li><input type="checkbox" name="searchKey2" value="3"/>종료예정</li>
						<li><input type="checkbox" name="searchKey2" value="4"/>판매중단</li>
					</ul>
					<div class="productManagementLabelCenterDiv">
						<input type="date" name="searchDate" value="2021-03-01" min="2021-03-01" max="2021-05-31"/>~
						<input type="date" name="searchDate2" value="2021-05-31" min="2021-03-01" max="2021-05-31"/>
					</div>
					<div class="productManagementLabelCenterDiv">
						<input type="hidden" name="searchKey" value="i_subject"/>
						<input type="text" name="searchWord"/>
						<input type="button" id="productSearchBtn" value="검색" class="btn commBtn myInfoProductManagementBottomBtn"/>
					</div>				
				</div>
				</form>				
			</div>
		</div>
		<div class="myInfoProductManagementBottom">
			<ul>
				<li><a href="selWrite"><input type="button" value="상품등록" class="btn commBtn myInfoProductManagementBottomBtn"/></a></li>
				<li><input type="button" value="기간변경" class="btn cancelBtn myInfoProductManagementBottomBtn"/></li>
				<li><input type="button" value="판매중지" class="btn cancelBtn myInfoProductManagementBottomBtn"/></li>
				<li><input type="button" value="상품수정" class="btn cancelBtn myInfoProductManagementBottomBtn"/></li>
				<li><input type="hidden" id="productNum" name="i_num" value=""/></li>
				<li><input type="hidden" id="productStatus" value=""/></li>
					
			</ul>
			<table class="myInfoProductManagementTable2">
				<tr>
					<td>글번호</td>
					<td>상품제목</td>
					<td>가격</td>
					<td>구매수(총판매액)</td>
					<td>조회수</td>
					<td>상태</td>
					<td>종료일</td>
				</tr>	
			</table>
			<div class="myinfoProductManagementPaging">
			
			</div>
		</div>
	</div>
	<div class="modal fade" id="productMd" data-backdrop="static">
		<div class="modal-dialog modal-sm" style="margin-top:25%">
			<div class="modal-content" style="height:240px">
				<div class="modal-header reviewHeader" data-backdrop="static">
				<h4 class="modal-title">상품 기간변경 </h4>

				</div>
				<div class="modal-body productMdBody" data-backdrop="static">
					<ul>
						<li><input type="date" id="periodDate" min="2021-05-25"/><br/>종료일 선택</li>
						<li>
							<button class="btn btn-outline-dark btn-lg" id="productPeriodChange">변경하기</button>
							<button class="btn btn-outline-dark btn-lg" data-dismiss="modal">변경 취소</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
