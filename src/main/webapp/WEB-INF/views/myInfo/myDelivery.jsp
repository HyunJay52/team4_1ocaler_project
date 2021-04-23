<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commonStyle.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/info/infoStyle.css"/>
<style>
	#deliveryTop, #deliveryBottom{
		padding:30px 50px;
		overflow:auto;
	}
	#deliveryBottom{
		position:relative;
	}
	#deliveryTop>ul, #deliveryTop>ul>li{
		float:left; text-align:center; margin:10px 5px;
	}
	#deliveryTop>ul>li:nth-child(2n+1){
		width:140px; background-color:lightgray; border-radius:100px;
	}
	#deliveryTop>ul>li:nth-child(2n+2){
		width:130px;
	}
	.fntBold{
		font-weight:bold;
	}
	#deliveryTop>ul:nth-child(2)>li:nth-child(1){
		margin-left:150px;
	}
	#deliveryBottom>ul>li{
		float:left; border-bottom:1px solid gray; height:80px; line-height:80px;
		width:20%;
	}
	.modal-content{
		overflow:auto; height:800px;
	}
	.deliveryImg{
		width:90px;
		height:70px;
	}
	#deliveryHeader{
		height:300px; display:block; text-align:center;
	}
	#deliveryHeader>ul{width:100%}
	#deliveryHeader>ul>li{
		width:100%;
	}
	#deliveryHeader>ul>li>span{
		width:50%;
	}
	.deliveryListHead{
		color:gray; float:left; text-align:left; 
	}
	.deliveryName{
		text-align:right; float:right;
	}
	#deliveryList>ul>li{
		border-bottom:1px solid gray; margin:10px 0; height:80px; padding:5px 0;
	}
	#deliveryList>ul>li>span:nth-child(2n+1){
		width:30%; 
	}
	#deliveryList>ul>li>span:nth-child(2n){
		width:70%; 
	}
	.listLeft{
		text-align:left;
		float:left;
	}
	.listRight{
		text-align:right;
		float:right;
	}
   .table2 tr>td{width:20%}/*전체적인 열 폭조정*/
   .table2 tr>td:nth-child(1){width:10%;/*첫번째 열 선택*/}
   .table2 tr>td:nth-child(2){width:30%;/*세번째 열 선택 : 제목부분*/
      /* text-align:left; */
   }
	.dayBtn{height:36px; border-radius:100px;}
	.dateFrm{
		position:relative;
		margin:10px auto;
  	 	height:60px;
		width:120px;
		line-height:50px;
		border:2px solid #3f1785;
		border-radius:100px;
		padding:5px 10px;
	}
	.line{
	  	position:absolute; background-color:#3f1785; width:90%; height:4px; top:70px; border-radius:100px;
	}
</style>
<script>
	$(function(){
var date = new Date();
		
		var toYear = date.getFullYear();
		var toMonth = date.getMonth()+1;
		
		$(".setMonth").text(toMonth+"월");
		
		//월 세팅
		function setMonth(toYear, toMonth){
			$(".setMonth").text(toMonth+"월");
			
			console.log(toYear);
			console.log(toMonth);
			console.log($("#sel").val());

		}
		
		//이전날짜
		$(".prev").click(function(){
			toMonth--;
			if(toMonth == 0){
				toMonth = 12;
				toYear--;
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
			setMonth(toYear, toMonth);
		});
		
		//ajax 배송조회 실행
		function test(deliveryNo){  
			$.ajax({
				url : "https://apis.tracker.delivery/carriers/kr.epost/tracks/"+deliveryNo,
				dataType : 'json',
				success : function(result){
					var listHead = "<ul>";
					var listTag ="<ul>";
					
						listHead += "<li><span class='deliveryListHead'>신청인</span><span class='deliveryName'>";
						listHead += result['from']['name']+"</span></li>";
						listHead += "<li><span class='deliveryListHead'>수령인</span><span class='deliveryName'>";
						listHead += result['to']['name']+"</span></li>";
						listHead += "<li><span class='deliveryListHead'>송장번호</span><span class='deliveryName'>";
						listHead += deliveryNo+"</span></li>";
						
					$.each(result.progresses, function(idx, data){
						var time = data['time'].split("T");
						var min = time[1].split(":");
						var minute = min[0];

						listTag += "<li><span class='listLeft'>"+time[0]+" "+minute+":"+min[1]+"</span>";
						listTag += "<span class='listRight'>"+data['status']['text']+"</span>";
						listTag += "<span class='listLeft'>"+data['location']['name']+"</span>";
						listTag += "<span class='listRight'>"+data['description']+"</span></li>";
					});
					listTag += "</ul>";
					$("#deliveryHeader").append(listHead);
					$("#deliveryList").append(listTag);
				},error:function(request, status, error){
					console.log('전송실패');
					console.log('code=' + request.code);
					console.log('message=' + request.reponseText);
					console.log('status='+ status);
					console.log('error='+ error);
				}
				
			});
		}

		//데이터 세팅
		function setList(){
			for(var i = 0; i < 3; i++){
				var tag = "<tr>";
				tag += "<td><img src='img/myInfo/saver.gif' class='deliveryImg'/></td>";
				tag += "<td><a href='' data-target='#deliveryMd' data-toggle='modal'>나주 배 팝니다</a>";
				tag += "<input type='hidden' value='1111111111111'/></td>";
				tag += "<td>김농부</td>";
				tag += "<td>24,000원</td>";
				tag += "<td>배송준비</td>";
				tag += "</tr>";
				
				$("#myDeliveryTbl").append(tag);		
			}			
		}
		setList();
		
		//배송조회 번호 세팅
		$("#myDeliveryTbl a").click(function(){
			var no = $(this).next().val();
			test(no);
		});
	});
</script>
<div class="body">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->

	<div class="mainContainer">
		<h2>배송내역</h2>
		<div id="deliveryTop">
			<ul>
				<li><img src="img/myInfo/delivery/box.png"/></li>
				<li><p class="lgFnt">배송준비</p><span class="lgFnt fntBold">1</span></li>
				<li><img src="img/myInfo/delivery/delivery.png"/></li>
				<li><p class="lgFnt">배송 중</p><span class="lgFnt fntBold">1</span></li>
				<li><img src="img/myInfo/delivery/home.png"/></li>
				<li><p class="lgFnt">배송완료</p><span class="lgFnt fntBold">0</span></li>
			</ul>
			<ul>				
				<li><img src="img/myInfo/delivery/return.png"/></li>
				<li><p class="lgFnt">반품</p><span class="lgFnt fntBold">1</span></li>
				<li><img src="img/myInfo/delivery/cancel.png"/></li>
				<li><p class="lgFnt">취소</p><span class="lgFnt fntBold">0</span></li>
			</ul>
		</div>
		
		<div id="deliveryBottom">
			<div class="line"></div>
			<div class="dateFrm"><button class="dayBtn prev">《</button><button class="dayBtn mdFnt setMonth"></button><button class="dayBtn next">》</button></div>
			<table class="table2" id="myDeliveryTbl">
				<tr>
					<td>이미지</td>
					<td>제목</td>
					<td>판매자</td>
					<td>금액</td>
					<td>배송상태</td> 
				</tr>
				
			</table>
		</div>
	</div>
	<div class="modal fade" id="deliveryMd">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header" id="deliveryHeader">
				<h4 class="modal-title">배 송 조 회<button class="close" data-dismiss="modal">&times;</button></h4>
				
						
						
				</div>
				<div class="modal-body" id="deliveryList">
					
				</div>
				<div class="modal-footer">
					<button data-dismiss="modal" class="btn btn-secondary">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>