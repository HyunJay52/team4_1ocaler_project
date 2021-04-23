<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commonStyle.css"/>

<style>
	.body{
		overflow:auto;
		width:1300px;
	}
	.mainContainer{
		width:1000px;
		margin:50px 185px;	
	}
	.lgFnt {
		font-size: 32px;	
	}
	.mdFnt {
		font-size: 22px;
	}
	.smlFnt {
		font-size: 13px;
	}
	.dealInfo{
		width:704px;
		height:202px;
		border:1px solid #ddd;
	}
	.dealTop{
		padding:50px;
	}
	.dealBottom{position:relative;}
	.dealTop, .dealBottom{
		width:900px;
	}
	.infoList>ul>li{
		float:left; width:20%; height:40px;
	}

	.dealInfo img{
		width:200px;
		height:200px;
		float:left;
	}
	.infoList{
		width:460px;
		height:150px;
		float:left;
		padding:20px;
		
	}
	.mainContainer ul, .mainContainer li{
		margin:0; padding:0;
	}
	.dealBtn{
		 width:250px; height:50px; float:right;
	}
	.dateFrm{
		position:absolute;
		top:5px;
  	  	left:62px;
  	  	background-color:#fff;
  	 	height:40px;
		width:110px;
		z-index:100;
		line-height:40px;
		text-align:center;
	} 
	.date{ 
		width:170px; height:50px; background-color:#fff; padding:0 10px; position:relative; margin:0px 30px 0px 50px; border:none;
	}
	.prev{float:left}
	.next{float:right}
	.dayBtn{font-weight:bold; font-size:26px; margin:0 2px; border:none; background-color:#fff;}

	.table2 {width:90%;margin:0 auto;padding:0}
    .table2 tr{/*테이블 목록*/
       border-bottom:1px solid rgb(227,227,227); 
       text-align:center;
       height:40px;
    }
   .table2 tr:first-child{/*첫번째 테이블 목차*/
      text-align:center;
      
      background-color:#3f1785;
      color:#fff; font-weight:bold;
   }
   .table2 tr:last-child{/*마지막 줄 tr 스타일*/
      border-bottom:2px solid #3f1785;
   }
   .table2 tr>td{}/*전체적인 열 폭조정*/
   .table2 tr>td:nth-child(1){/*첫번째 열 선택*/}
   .table2 tr>td:nth-child(3){/*세번째 열 선택 : 제목부분*/
      position:relative;/* text-align:left; */
   }
   	.modal-title{
		margin:0 auto;
	}
	.modal-body{
		text-align:center;
		padding:40px;
		background-color:#fff;
	}
	.dealTextarea{
		width:100%; height:300px; margin:20px 0;
	}
	.reviewBody>ul>li{
		float:left; width:50%; position:relative;
	}
	.reviewBody>ul>li:nth-child(3), .reviewBody>ul>li:nth-child(4){
		position:absolute;	
		color:#fff;
		top:82px;
		text-align:center;
		font-weight:bold;
		width:45%;
	}
	.reviewBody>ul>li:nth-child(4){
		left:380px; 
		width:50%;
		color:#3f1785;
	}
	.reviewBody>ul>li:nth-child(5), .reviewBody>ul>li:last-child{
		width:100%;
	}
	.reviewBody>ul>li:nth-child(6){
		width:100%; text-align:left;
	}
	.reviewBody>ul>li:last-child{
		text-align:right;
	}
	.imgBtn{
		color:black;
	}
	.searchArea{
		text-align:center;
		margin-top:10px;
	}
	.searchArea>input[type=text]{
		padding-left:8px;
		height:30px;
	}
	.searchArea>input[type=button]{
		height:30px;
		width:60px;
		background-color:#3f1785;
		color:#fff;

	}
</style>
<script>
	$(function(){
		var date = new Date();
		
		var toYear = date.getFullYear();
		var toMonth = date.getMonth()+1;
		
		$(".setMonth").text(toMonth+"월");
		
		//달력 날짜 선택시 이벤트
		$(".date").on('change', function(){
			var monthArr = $(this).val().split("-");
			
			toYear = monthArr[0];
			toMonth = monthArr[1].replace(/(^0+)/, "");

			setMonth(toYear, toMonth);
		});
		
		//월 세팅
		function setMonth(toYear, toMonth){
			$(".setMonth").text(toMonth+"월");
			
			console.log(toYear);
			console.log(toMonth);

		}
		
		//이전날짜
		$(".prev").click(function(){
			toMonth--;
			if(toMonth == 0){
				toMonth = 12;
				toYear--;
			}
			if(toYear == 2020){
				toYear = 2021;
			}
			setMonth(toYear, toMonth);
		});
		
		//다음날짜
		$(".next").click(function(){
			toMonth++;
			if(toMonth == 13){
				toMonth = 1;
				toYear++;
			}
			if(toYear == 2022){
				toYear = 2021;
			}
			setMonth(toYear, toMonth);
		});		
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
				<input type="button" class="btn dealBtn commBtn btn-outline-dark" value="Send Message"/>
				<input type="button" class="btn dealBtn commBtn btn-outline-dark" value="Info"/>
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
						<li><button class="btn lgFnt btn-outline-light btn-lg imgBtn">또 참여할래요</button></li>
						<li><button class="btn lgFnt btn-outline-light btn-lg imgBtn">음, 글쎄요</button></li>
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