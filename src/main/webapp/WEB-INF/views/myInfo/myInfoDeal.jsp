<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		//collape in
		//버튼선택 이벤트
		$(document).on('click', '#myDealTbl tr>td>button', function(){
			$('#myDealTbl tr>td>div').attr('class', 'myDealMem collapse');
			$(this).next().attr('class', 'collape in myDealMem');

		});
		
		//드롭박스 이벤트
		$(document).on('click', '#myDealTbl tr>td>div>ul>li>button', function(){
			$(this).parent().parent().parent().attr('class', 'collapse');
			$(this).parent().parent().parent().prev().text($(this).text());
		});

		
		//다른곳 클릭시 드롭박스 닫기
		$("body").click(function(){
			$('#myDealTbl tr>td>div').attr('class', 'myDealMem collapse');
		});
		
		$("#myDealToggle>input").click(function(){
			$("#myDealToggle>input").css('background-color', '#fff').css('color', '#3f1785').attr('name', null);
			$(this).css('background-color', '#3f1785').css('color', '#fff').attr('name', 'kategorie');
			setDealList(1);
		});
		
		//리뷰버튼 클릭이벤트
		$("#myDealTbl button").click(function(){
			var title = $(this).text()+"님과의 거래가 어떠셨나요 ?";
			$(".modal-title").text(title);
			console.log($(this).text());
			
		});
		
		//모달 닫힘 이벤트
		$("#myDealMd").on('hidden.bs.modal', function(e){
			$(".reviewBody textarea").val("");
		});
		
		//리뷰 클릭이벤트
		$(".imgBtn").click(function(){
			$(".imgBtn").attr('value' , null);
			$(this).attr('value', '1');
		});
		
		//검색 이벤트
		$("#myDealSearch").click(function(){
			var kategorie = $("#myDealToggle>input[name='kategorie']").attr('title');
			console.log($("#myDealForm").serialize()+"&kategorie="+kategorie);
			setDealList(1);
			$(this).prev().val("");
		});
		//////////////////////
		//리스트 불러오기
		function setDealList(page){
			var kategorie = $("#myDealToggle>input[name='kategorie']").attr('title');
			$.ajax({
				url : "myDealList",
				data : $("#myDealForm").serialize()+"&kategorie="+kategorie+"&nowNum="+page,
				type : 'POST',
				success: function(result){
					console.log(result);
					var tag = "<tr><td>작성자</td><td>날짜</td><td>제목</td><td>위치</td><td>상태</td><td>비고</td></tr>";
					result.list.forEach(function(data,idx){
						if(data.j_num != null && data.j_num > 0){
							tag += "<tr>";
							tag += "<td>"+data.userid+"</td>";
							tag += "<td>"+data.j_writedate+"</td>";
							tag += "<td>"+data.s_subject+"</td>";
							tag += "<td>"+data.s_gu+"</td>";
							tag += "<td><button class='btn btn-block btn-outline-dark'>"+data.j_status+"</button></td>";
							tag += "<td><button class='btn btn-block btn-outline-danger'>취소</button></td>";
							tag += "</tr>";
						}else if(data.j_num == 0){
							tag += "<tr>";
							tag += "<td>"+data.userid+"</td>";
							tag += "<td>"+data.s_writedate+"</td>";
							tag += "<td>"+data.s_subject+"</td>";
							tag += "<td>"+data.s_gu+"</td>";
							tag += "<td><button class='btn btn-block btn-outline-dark dealModalOpen' data-target='#myDealMd' data-toggle='modal' value='"+data.num+"'>참여회원</button></td>";
							tag += "<td>1/3완료</td>";
							tag += "</tr>";
						}
						
					});
					$("#myDealTbl").html(tag);
					setDealPaging(result.pVO);
			
				},error : function(e){
					console.log(e);
				}
			
			});
		}
		setDealList(1);
		//페이징
		function setDealPaging(pVO){
			console.log(pVO);
			$("#myinfoDealPaging").html("");
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
			$("#myinfoDealPaging").append(tag);
		}
		//페이징 이벤트
		$(document).on('click', '#myinfoDealPaging>ul>li>button', function(){
			var nowNum = $(this).val(); //현제 페이지
			console.log("nownum="+nowNum)
			setDealList(nowNum);			
		});
			
		
		$(document).on('click', '.dealModalOpen', function(){
			var num = $(this).val();
			console.log(num);
			$.ajax({
				url : "selectJoinUs",
				data : {'numJoin':num},
				success : function(result){
					var tag = "";
					result.forEach(function(data,idx){
					tag += "<ul><li>"+data.userid+"</li>";
					if(data.j_status == '참여신청'){
						tag += "<li><button class='btn btn-outline-danger'>";					
					}else if(data.j_status == '참여승인'){
						tag += "<li><button class='btn btn-outline-primary'>";
					}else if(data.j_status == '참여취소'){
						tag += "<li><button class='btn btn-outline-Secondary'>";
					}else if(data.j_status == '참여완료'){
						tag += "<li><button class='btn btn-outline-Success'>";
					}
					tag += data.j_status+"</button></li>";
					tag += "<li>"+data.mem_post+"</li>";
					tag += "<li>"+data.mem_rev+"</li>";
					tag += "<li><p>"+data.j_writedate+"</p></li>";
					tag += "</ul>";											
					});
					$("#reviewList").html(tag);
				}, error : function(e){
					console.log("error");
				}
				
			});
		});
	});
</script>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h3>회원간거래</h3>
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
				<div>
					<input type="button" class="btn dealBtn btn-outline-dark" value="Send Message" style="float:left"/>
					<input type="button" class="btn dealBtn btn-outline-dark" value="Info" />
				</div>
			</div>
		</div>
		<form method="post" id="myDealForm" onsubmit="return false;">
		<div class="dealBottom">
			<div id="myDealToggle">
				<input type="button" class="btn commBtn btn-outline-dark" title="joinus" value="참여한"/>
				<input type="button" style="background-color:#3f1785; color:#fff;" class="btn commBtn btn-outline-dark" title="mem_share" name="kategorie" value="개설한"/>
			</div>
			<div class="dealDateForm">
				<input type="date" value="2021-05-01" id="dealDate" name="searchDate" min="2021-03-01" max="2021-05-31"/> ~ 
				<input type="date" value="2021-05-31" id="dealDate2" name="searchDate2" min="2021-03-01" max="2021-05-31"/>
			</div>
			
			<table class="myinfoTable2" id="myDealTbl">
		
			</table>
			<div class="searchArea">
				<select id="dealSearchKey" name="searchKey">
					<option value="s_subject">제목</option>
					<option value="s_content">내용</option>
					<option value="s_loc">위치</option>
					<option value="s_tag">태그</option>	
				</select>
				<input type="text" name="searchWord"/>
				<input type="button" value="검색" id="myDealSearch"/>
			</div>
			<div id="myinfoDealPaging">
				
			</div>
		</div>
		</form>
	</div>
		<div class="modal fade" id="myDealMd">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header reviewHeader">
				<h4 class="modal-title">참여자 목록</h4>

				</div>
				<div class="model-body reviewList">
						
					<div class="reviewListHearder">
						<ul>
							<li>신청자</li>
							<li>상태</li>
							<li>작성글 수</li>
							<li>받은 평가</li>	
							<li>신청 날짜</li>	
						</ul>
					</div>
					<div id="reviewList">
						
					</div>
				</div>
				<div class="modal-body reviewBody" style='display:none'>
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