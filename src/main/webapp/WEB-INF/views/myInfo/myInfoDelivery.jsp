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

					//데이터 날짜 기준으로 내림차순 정렬
					result.progresses.sort(function(a, b){
						var dateA = new Date(a['time']).getTime();
						var dateB = new Date(b['time']).getTime();
						
						return dateA < dateB ? 1 : -1;
					});
					
					var listHead = "<table class='myinfoDeliveryTable'><tr>";
					var listTag ="<table class='myinfoDeliveryTable'><tr>";
					
						listHead += "<td>신청인</td>";
						listHead += "<td>수령인</td>";
						listHead += "<td>송장번호</td></tr>";
						listHead += "<tr><td>"+result['from']['name']+"</td>";
						listHead += "<td>"+result['to']['name']+"</td>";
						listHead += "<td>"+deliveryNo+"</td></tr></table>";
						
						listTag += "<td>날짜</td>";
						listTag += "<td>상태</td>";
						listTag += "<td>발생국</td>";
						listTag += "<td>현황</td></tr>";
					$.each(result.progresses, function(idx, data){
						var time = data['time'].split("T");
						var min = time[1].split(":");
						var minute = min[0];
						
						listTag += "<tr><td style='width:15%'>"+time[0]+"<br/>"+minute+":"+min[1]+"</td>";
						listTag += "<td>"+data['status']['text']+"</td>";
						listTag += "<td>"+data['location']['name']+"</td>";
						listTag += "<td>"+data['description']+"</td></tr>";
					});
					listTag += "</table>";
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
			var subject = ['여름나기 차렵이불','수공예 매듭팔찌','욕실을 더 모던하게','옻칠 수저세트 4인용','신선한 꿀배10kg','감자농장 특산','함박고구마5kg','뜨거운양파']
			var name = ['차렵사','매듭맺음','모던','옻','꿀먹은배','감자농장','함박','양파천국']
			var money = ['32,000원','8,000원','10,000원','20,000원','37,000원','41,000원','32,000원','17,000원']
			for(var i = 0; i < 8; i++){
				var tag = "<tr>";
				if(i > 3){
					if(i == 7){
						tag += "<td><img src='img/myInfo/delivery/shipImg"+8+".jpg' class='deliveryImg'/></td>";
							
					}else{
						tag += "<td><img src='img/myInfo/delivery/shipImg"+(i-3)+".jpg' class='deliveryImg'/></td>";

					}
					tag += "<td><a href='' data-target='#deliveryMd' data-toggle='modal'>"+subject[i]+"</a>";
					tag += "<input type='hidden' value='1111111111111'/></td>";
					tag += "<td>"+name[i]+"</td>";
					tag += "<td>"+money[i]+"</td>";
					if(i == 4){
						tag += "<td>배송준비</td>";
					}else if(i == 7){
						tag += "<td>반품처리</td>"
					}else{
						tag += "<td>배송완료</td>";
					}	
					tag += "</tr>";
				}else{		
					tag += "<td><img src='img/myInfo/delivery/shipImg"+(i+4)+".jpg' class='deliveryImg'/></td>";
					tag += "<td><a href='' data-target='#deliveryMd' data-toggle='modal'>"+subject[i]+"</a>";
					tag += "<input type='hidden' value='1111111111111'/></td>";
					tag += "<td>"+name[i]+"</td>";
					tag += "<td>"+money[i]+"</td>";
					tag += "<td>배송중</td>";					
					tag += "</tr>";
				}				
				
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
<%@ include file="/inc/sideBar.jspf" %>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->

	<div class="myinfoContainer">
		<h2>배송내역</h2>
		<div id="deliveryTop">
			<ul>
				<li><img src="img/myInfo/delivery/box.png"/></li>
				<li><p class="mdFnt">배송준비</p><span class="lgFnt">1</span></li>
				<li><img src="img/myInfo/delivery/delivery.png"/></li>
				<li><p class="mdFnt">배송 중</p><span class="lgFnt">4</span></li>
				<li><img src="img/myInfo/delivery/home.png"/></li>
				<li><p class="mdFnt">배송완료</p><span class="lgFnt">2</span></li>						
				<li><img src="img/myInfo/delivery/return.png"/></li>
				<li><p class="mdFnt">반품</p><span class="lgFnt">1</span></li>
			</ul>			 
		</div>
		
		<div id="deliveryBottom">
			<div class="deliveryLine"></div>
			<div class="myDeliveryDateFrm"><button class="dayBtn prev">《</button><button class="dayBtn mdFnt setMonth"></button></div>
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
				<h3 class="modal-title" style="height:50px; font-size:24px; font-weight:bold; margin-bottom:20px;">배 송 조 회<button class="close" data-dismiss="modal" style="position:absolute">&times;</button></h3>
				
						
						
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
