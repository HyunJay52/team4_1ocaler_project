<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){

		//리스트 세팅
		function setFarmerDealList(page){
			$.ajax({
				url : "myFarmerDealSelect",
				data : $("#myFarmerDealForm").serialize()+"&nowNum="+page,
				success : function(result){
					var tag = "<tr><td>날짜</td><td>제목</td><td>판매자</td><td>금액</td><td>리뷰상태</td><td>주문상태</td></tr>"; 
					console.log(result);
					result.list.forEach(function(data,idx){
						tag += "<tr><td>"+data.o_date+"</td>";
						console.log("reviewCount="+data.reviewCount);
						if(data.reviewCount == 0){
							tag += "<td><a href='sellView?i_num="+data.num+"'>"+data.i_subject+"</a></td>";
							tag += "<td>"+data.userid+"</td>";
							tag += "<td>"+data.o_price+"</td>";
							tag += "<td><button data-target='#farmerDealMd' data-toggle='modal' class='btn commBtn farmerMdOpen' value='"+data.num+"'>리뷰없음</td>";
						}else{
							tag += "<td><a href='sellView?i_num="+data.num+"'>"+data.i_subject+"</a></button></td>";
							tag += "<td>"+data.userid+"</td>";
							tag += "<td>"+data.o_price+"</td>";
							tag += "<td><button data-target='' data-toggle='modal' class='farmerMdOpen' value='"+data.num+"'>리뷰작성됨</button></td>";								
						}
						if(data.o_conf == 1){
							tag += "<td>주문대기</td>";
						}else{
							tag += "<td>주문확정</td>";							
						}			
						tag += "</tr>";
						
					});
					$("#farmerDealTbl").html(tag);
					setFarmerDealPaging(result.pVO)
				}, error : function(e){
					console.log("error")
				}
			});
		}
		setFarmerDealList(1);
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
		//파머리뷰 작성하기 버튼 클릭
		$("#farmerReviewWrite").click(function(){
			if($("#farmerDealReviewForm>div>ul>li>textarea").val() == null || $("#farmerDealReviewForm>div>ul>li>textarea").val() == ''){
				alert('내용을 입력해주세요.');
			}else{
				var rateCheck = $("#farmerDealReviewForm>div>ul>li>button[name=re_rate]").val();
				var num = $("#FarmerReviewNum").attr('value');
				console.log("re_rate="+rateCheck);
				if(rateCheck == null || rateCheck == ''){
					alert('리뷰점수를 선택해주세요.');				
				}else{
					if(confirm('리뷰를 작성하시겠습니까?')){
						console.log($("#farmerDealReviewForm").serialize());
						var data = $("#farmerDealReviewForm").serialize();
						writeFarmerReview(data, rateCheck);				
					}
				}
			}
			
		});
		//리뷰 점수 이벤트
		$(document).on('click', '.imgBtn', function(){
			$(".imgBtn").attr('name', null);
			$(this).attr('name', 're_rate');
		});
		
		//리뷰버튼 클릭이벤트
		$(document).on('click', ".farmerMdOpen", function(){
			console.log("val="+ $(this).val());
			$("#FarmerReviewNum").attr("value", $(this).val());
		});
		
		//모달 닫힘 이벤트
		$("#canselFarmerReview").on('click', function(e){
			$("#farmerDealReviewForm")[0].reset();
			$(".imgBtn").attr('name', null);
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
			setFarmerDealList(1);
			$(this).prev().val("");
		});
		
		//페이징 이벤트
		$(document).on('click', '#myinfoFarmerDealPaging>ul>li>button', function(){
			var nowNum = $(this).val(); //현제 페이지
			console.log("nownum="+nowNum)
			setFarmerDealList(nowNum);			
		});
		
		//파머리뷰 작성
		function writeFarmerReview(data, re_rate){
			$.ajax({				
				url : "writeReview",
				data : data+"&re_rate="+re_rate,
				success : function(result){
					alert("리뷰가 작성되었습니다.");
					$("#farmerDealMd").modal("hide");
					$('.modal-backdrop').hide();
					setFarmerDealList(1);
				}, error : function(e){
					console.log("error");
				}
			
			});
		}
	
	
	});
</script>
<%@ include file="/inc/sideBar.jspf" %>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h3>착한발견 거래</h3>
		<div class="dealTop">
			<div class="dealInfo">
				<img src="<%=request.getContextPath()%>/img/mem_prof/${logProf }"/>
				<div class="infoList">
					<div class="infoListHeader">
						<h3>${vo.mem_name}</h3>
						<input type="button" class="btn dealBtn btn-outline-dark" value="Send Message"/>
						<a href="myInfoCheck"><input type="button" class="btn dealBtn btn-outline-dark" value="Info"/></a>
					</div>
					<ul style="font-weight:bold;">
						<li>참여</li>
						<li>모집</li>
						<li>직거래</li>
						<li>방문</li>
						<li>내글</li>
						<li>댓글</li>
						<li>좋아요</li>
					</ul>
					<ul>
						<li>${vo.joinus}</li>						
						<li>${vo.grouplocal}</li>
						<li>${vo.mem_share }</li>
						<li>${vo.logcount}</li>
						<li>${vo.board}</li>
						<li>${vo.reply}</li>
						<li>${vo.likeit}</li>
					</ul>
				</div>
			</div>
		</div>
		<form method="post" id="myFarmerDealForm" onsubmit="return false;">
		   <div class="dealBottom">
			<div class="dealDateForm">
				<input type="date" name="searchDate" value="2021-03-01" min="2021-03-01" max="2021-05-31"/> ~ 
				<input type="date" name="searchDate2" value="2021-05-31" min="2021-03-01" max="2021-05-31"/>
			</div>
			<table class="myinfoTable2" id="farmerDealTbl">
				
			</table>
			<div id="myinfoFarmerDealPaging">
			
			</div>
			<div class="searchArea">
				<select name="searchKey" style="height: 30px">
					<option value="i_subject">제목</option>
					<option value="i_content">내용</option>
				</select>
				<input type="text" name="searchWord"/>
				<input type="button" value="검색" id="myFarmerDealSearch"/>
			</div>
		</div>
		<input type="hidden" name="dateContent" value="o_date"/>
		<input type="hidden" name="kategorie" value="ordertbl"/>
		</form>
	</div>
	<div class="modal fade" id="farmerDealMd" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header reviewHeader" data-backdrop="static">
				<h4 class="modal-title">직거래 리뷰작성 </h4>

				</div>
				<form id="farmerDealReviewForm" method="post" onsubmit="return false;">
				<div class="modal-body reviewBody" data-backdrop="static">
					<ul>
						<li><img src="img/myInfo/myDeal/reviewHeart.png"/></li>
						<li><img src="img/myInfo/myDeal/reviewHeart2.png"/></li>
						<li><button class="btn lgFnt btn-lg imgBtn btnYellow" value="1">또 참여할래요</button></li>
						<li><button class="btn lgFnt btn-lg imgBtn" value="2">음, 글쎄요</button></li>
						<li>
							<textarea class="dealTextarea mdFnt" name="re_content" placeholder="당신의 후기가 다른 사람에게 큰 도움이 됩니다"></textarea>
						</li>
						<!-- <li><input type="file" name="re_img"/></li> -->
						<li style="display:none"><input type="hidden" id="FarmerReviewNum" name="num" value=""/></li>
						<li><button class="btn btn-outline-dark btn-lg" id="canselFarmerReview" data-dismiss="modal">다음에 할게요</button>
							<button class="btn btn-outline-dark btn-lg" id="farmerReviewWrite">작성완료</button>
						</li>
					</ul>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>