<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		function setQnAlist(num){
			$.ajax({
				url : "selectMyBoard",
				data : $("#myinfoQnAForm").serialize()+"&nowNum="+num,
				success : function(result){
					console.log(result);
					var tag = "<tr><td>번호</td><td>상품명</td><td>질문자</td>";
						tag += "<td>질문 작성일</td><td>답변상태</td><td>내용</td></tr>";
					result.list.forEach(function(data,idx){
						tag += "<tr>";
						tag += "<td>"+data.q_num+"</td>";
						tag += "<td>"+data.i_subject+"</td>" 
						tag += "<td>"+data.userid+"</td>"
						tag += "<td>"+data.q_writedate+"</td>";
						if(data.answer != null){
							tag += "<td>답변완료</td>";
							tag += "<td><button class='btn commBtn' data-target='#myInfoQnAManagementMd' data-toggle='modal' value='"+data.q_num+"'>답변보기</button></td>"; 
						}else{
							tag += "<td>답변 대기중</td>";
							tag += "<td><button class='btn commBtn' data-target='#myInfoQnAManagementMd' data-toggle='modal' value='"+data.q_num+"'>답변하기</button></td>"; 
						}
					});
					$("#myInfoQnAManagementTable").html(tag);
					setMyinfoQnAManagementPaging(result.pVO);
				}, error : function(e){
					console.log("error");
				}
				
			});
		}
		//QnA페이징
		function setMyinfoQnAManagementPaging(pVO){
			console.log(pVO);
			$("#myInfoQnAManagementTablePagingArea").html("");
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
			$("#myInfoQnAManagementTablePagingArea").append(tag);
		}
		setQnAlist(1);
		
		//QnA페이징 이벤트
		$(document).on('click', "#myInfoQnAManagementTablePagingArea>ul>li>button", function(){
			console.log("페이지 번호="+$(this).val());
			var num = $(this).val();
			var kategorie = $("#activitySelectbox option:checked").val();

			setBoardList(num, kategorie);
		});
	});
</script>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h2>QnA 관리</h2>
		<div class="myInfoProductManagementTop">
			<div class="productManagementLabelForm">
				<ul class="productManagementLabel">
					<li><label>답변상태</label></li>
					<li><label>기간선택</label></li>
					<li><label>질문내용 검색</label></li>					
				</ul>
				<form method="post" id="myinfoQnAForm" onsubmit="return false;">
				<div class="productManagementLabelCenter">
					<ul>
						<li><input type="checkbox"/>답변대기</li>
						<li><input type="checkbox"/>답변완료</li>
					</ul>
					<div class="productManagementLabelCenterDiv">
						<input type="date" name="searchDate" value="2021-03-01" min="2021-03-01" max="2021-05-31"/>~
						<input type="date" name="searchDate2" value="2021-05-31" min="2021-03-01" max="2021-05-31"/>
					</div>
					<div class="productManagementLabelCenterDiv">
						<input type="hidden" name="kategorie" value="seller"/>
						<input type="hidden" name="searchKey" value="q_content"/>
						<input type="text" name="searchWord"/>
						<input type="button" value="검색" class="btn commBtn productManagementBtn"/>
					</div>				
				</div>	
				</form>			
			</div>
		</div>
		<div class="myInfoProductManagementBottom">
			<ul>
				<li><button class="btn commBtn myInfoProductManagementBottomBtn">QnA : 14건</button></li>
			</ul>
			<table class="myInfoProductManagementTable2" id="myInfoQnAManagementTable">

			</table>
			<div id="myInfoQnAManagementTablePagingArea" style="margin-top:10px;">
			
			</div>
		</div>
	</div>
	<div class="modal fade mdFnt" id="myInfoQnAManagementMd">
		<div class="modal-dialog modal-lg">
			<div class="modal-content ">
				<div class="modal-header ">
				<h4 class="modal-title">QnA</h4>

				</div>
				<div class="modal-body">
					<ul>
						
					
						<li>
							<textarea class=" mdFnt" name="shipNum" placeholder=" "></textarea>
						</li>
						<li><button class="btn btn-outline-dark btn-lg">답변완료</button>
							<button class="btn btn-outline-dark btn-lg" data-dismiss="modal">취소</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
