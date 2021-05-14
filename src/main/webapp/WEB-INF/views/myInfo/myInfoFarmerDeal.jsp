<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){

		//리스트 세팅
		function setList(page){
			$.ajax({
				url : "myFarmerDealSelect",
				data : $("#myFarmerDealForm").serialize()+"&nowNum="+page,
				success : function(result){
					var tag = "<tr><td>날짜</td><td>제목</td><td>판매자</td><td>금액</td><td>주문확정</td><td>리뷰상태</td></tr>"; 
					console.log(result);
					result.list.forEach(function(data,idx){
						tag += "<tr><td>"+data.o_date+"</td>";
						tag += "<td><a href='' data-target='#farmerDealMd' data-toggle='modal'>"+data.i_subject+"</a></td>";
						tag += "<td>"+data.userid+"</td>";
						tag += "<td>"+data.o_price+"</td>";
						if(data.o_conf == 1){
							tag += "<td>주문대기</td>";
						}else{
							tag += "<td>주문확정</td>";							
						}
						tag += "<td>리뷰작성</td>";
						tag += "</tr>";
						
					});
					$("#farmerDealTbl").html(tag);
					setFarmerDealPaging(result.pVO)
				}, error : function(e){
					console.log("error")
				}
			});
		}
		setList(1);
		//페이징
		function setFarmerDealPaging(pVO){
			console.log(pVO);
			$("#myinfoFarmerDealPaging").html("");
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
			$("#myinfoFarmerDealPaging").append(tag);
		}
		//리뷰버튼 클릭이벤트
		$("#farmerDealTbl a").click(function(){
			var title = $(this).text()+"의 상품이 어떠셨나요 ?";
			$(".modal-title").text(title);
			console.log($(this).text());
			
		});
		
		//모달 닫힘 이벤트
		$("#farmerDealMd").on('hidden.bs.modal', function(e){
			$(".reviewBody textarea").val("");
		});
		
		//리뷰 클릭이벤트
		$(".imgBtn").click(function(){
			$(".imgBtn").attr('value' , null);
			$(this).attr('value', '1');
		});
		
		//검색 이벤트
		$("#myFarmerDealSearch").click(function(){
			var searchWord = $(this).prev().val();
			console.log(searchWord);
			setList(1);
			$(this).prev().val("");
		});
		
		//페이징 이벤트
		$(document).on('click', '#myinfoFarmerDealPaging>ul>li>button', function(){
			var nowNum = $(this).val(); //현제 페이지
			console.log("nownum="+nowNum)
			setList(nowNum);			
		});
	});
</script>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h3>파머 직거래</h3>
		<div class="dealTop">
			<div class="dealInfo">
				<img src="img/myInfo/saver.gif"/>
				<div class="infoList">
					<h3>김자바</h3>
					<ul>
						<li>참여(10)</li>
						<li>모집(5)</li>
						<li>직거래(3)</li>
						<li>방문(31)</li>
						<li>내글(5)</li>
						<li>댓글(21)</li>
						<li>좋아요(21)</li>
					</ul>
				</div>
				<div class="dealBtnForm">
					<input type="button" class="btn dealBtn btn-outline-dark" value="Send Message" style="float:left"/>
					<input type="button" class="btn dealBtn btn-outline-dark" value="Info"/>
				</div>
			</div>
		</div>
		<form method="post" id="myFarmerDealForm" onsubmit="return false;">
		   <div class="dealBottom">
			<div class="dealDateForm">
				<input type="date" name="searchDate" value="2021-05-01" min="2021-01-01" max="2021-05-31"/> ~ 
				<input type="date" name="searchDate2" value="2021-05-31" min="2021-01-01" max="2021-05-31"/>
			</div>
			<table class="myinfoTable2" id="farmerDealTbl">
				
			</table>
			<div class="searchArea">
				<select name="searchKey" style="height: 30px">
					<option value="i_subject">제목</option>
					<option value="i_content">내용</option>
				</select>
				<input type="text" name="searchWord"/>
				<input type="button" value="검색" id="myFarmerDealSearch"/>
			</div>
			<div id="myinfoFarmerDealPaging">
			
			</div>
		</div>
		<input type="hidden" name="dateContent" value="o_date"/>
		<input type="hidden" name="kategorie" value="ordertbl"/>
		</form>
	</div>
	<div class="modal fade" id="farmerDealMd">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header reviewHeader">
				<h4 class="modal-title"></h4>

				</div>
				<div class="modal-body reviewBody">
					<ul>
						<li><img src="img/myInfo/myDeal/reviewHeart.png"/></li>
						<li><img src="img/myInfo/myDeal/reviewHeart2.png"/></li>
						<li><button class="btn lgFnt btn-outline-light btn-lg imgBtn" title="like">또 참여할래요</button></li>
						<li><button class="btn lgFnt btn-outline-light btn-lg imgBtn" title="hate">음, 글쎄요</button></li>
						<li>
							<textarea class="dealTextarea mdFnt" name="review" placeholder="당신의 후기가 다른 사람에게 큰 도움이 됩니다"></textarea>
						</li>
						<li><input type="file" name="file"/></li>
						<li><button class="btn btn-outline-dark btn-lg" data-dismiss="modal">다음에 할게요</button>
							<button class="btn btn-outline-dark btn-lg">작성완료</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>