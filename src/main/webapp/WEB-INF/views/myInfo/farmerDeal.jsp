<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commonStyle.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/info/infoStyle.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/info/infoFarmerDealStyle.css"/>
<script src="<%=request.getContextPath()%>/js/myInfo/myInfoScript.js"></script>
<script>
	$(function(){

		//리스트 세팅
		function setList(){

			for(var i = 0; i < 3; i++){
				var tag = "<tr>"; 
				tag += "<td>2021.04.04</td>";
				tag += "<td><a href='' data-target='#farmerDealMd' data-toggle='modal'>청년농장 나주 왕크니까 왕맛있는 배</a></td>";
				tag += "<td>tset</td>";
				tag += "<td>20,000원</td>";
				tag += "<td>주문확정</td>";
				tag += "<td>리뷰작성</td>";
				tag += "</tr>";
				$("#farmerDealTbl").append(tag);
			}
			
		}
		setList();
		
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
		$(".searchArea>input[type=button]").click(function(){
			var searchWord = $(this).prev().val();
			$(this).prev().val("");
			console.log(searchWord);
		});
	});
</script>
<div class="body">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="mainContainer">
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
				<input type="button" class="btn dealBtn btn-outline-dark" value="Send Message"/>
				<input type="button" class="btn dealBtn btn-outline-dark" value="Info"/>
			</div>
		</div>
		   <div class="dealBottom">
			<div class="dealDateForm">
				<input type="date" min="2021-01-01" max="2021-05-31" class="date"/>
				<div class="dateFrm"><button class="dayBtn prev">《</button><button class="setMonth dayBtn mdFnt"></button><button class="dayBtn next">》</button></div>
				<input type="date" min="2021-01-01" max="2021-05-31"/> ~ 
				<input type="date" min="2021-01-01" max="2021-05-31"/>
				
			</div>
			<table class="table2" id="farmerDealTbl">
				<tr>
					<td>날짜</td>
					<td>제목</td>
					<td>판매자</td>
					<td>금액</td>
					<td>주문확정</td>
					<td>리뷰상태</td>
					
				</tr>
			</table>
			<div class="searchArea">
				<input type="text" name="searchWord"/>
				<input type="button" value="검색"/>
			</div>
		</div>
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
</body>
</html>