<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--	cross origin	-->
<script type="text/javascript" src="<%=request.getContextPath() %>/plugin/jquery.ajax-cross-origin.min.js"></script>

<script>
	$(function(){
		//ajax 배송조회 실행
		function test(deliveryNo){

			$("#deliveryHeader").html("<h4 class='modal-title'>배 송 조 회<button class='close' data-dismiss='modal'>&times;</button></h4>");
			$("#deliveryList").html("");
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
		
		$("h2").click(function(){
			getData();
		})
		function getToken(){
			var key = "4568260847086151";
			var secret = "x6uPWEOnbqht7jlw1mpFvVQXsSvyrL7YSCNOhCbt2tW9MiGOF5ta0k7tcC2Eo9CgLq532gw4KsexLUlq";
			
			var access_token;
			$.ajax({
				url : 'https://api.iamport.kr/users/getToken'
				,method : "post"
				,dataType : 'json'
				,data : {
					imp_key : key
					,imp_secret : secret
				}
				,success : function(getToken){
					 access_token = getToken.data.response;
				},error : function(){
					console.log("error");
				}
			});
		}
		

	});
</script>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->

	<div class="myinfoContainer">
		<h2>배송내역</h2>
		<div id="deliveryTop">
			<ul>
				<li><img src="img/myInfo/delivery/box.png"/></li>
				<li><p class="lgFnt">배송준비</p><span class="lgFnt header">1</span></li>
				<li><img src="img/myInfo/delivery/delivery.png"/></li>
				<li><p class="lgFnt">배송 중</p><span class="lgFnt header">1</span></li>
				<li><img src="img/myInfo/delivery/home.png"/></li>
				<li><p class="lgFnt">배송완료</p><span class="lgFnt header">0</span></li>
			</ul>
			<ul>				
				<li><img src="img/myInfo/delivery/return.png"/></li>
				<li><p class="lgFnt">반품</p><span class="lgFnt header">1</span></li>
				<li><img src="img/myInfo/delivery/cancel.png"/></li>
				<li><p class="lgFnt">취소</p><span class="lgFnt header">0</span></li>
			</ul>
		</div>
		
		<div id="deliveryBottom">
			<div class="deliveryLine"></div>
			<div class="myDeliveryDateFrm"><button class="dayBtn prev">《</button><button class="dayBtn mdFnt setMonth"></button><button class="dayBtn next">》</button></div>
			<table class="myinfoTable2" id="myDeliveryTbl">
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
