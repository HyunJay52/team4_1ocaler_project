<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/sellBuy.css"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 주소 api -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script><!-- 결제 api? -->
	<script>
//////////////////////////////////////////주소찾기 펑션
	function findAddr() {
		var width= 500; var height= 500;
		new daum.Postcode({
			width: width,
			height: height,
			oncomplete : function(addrData) {
				
				var addr = '';
				var detailAddr = '';
				
				//기본주소
				if(addrData.userSelectedType==='R'){ //도로명 주소일 경우
					addr = addrData.roadAddress;
				}else { //지번 일 경우
					addr = addrData.jibunAddress;
				}
				//추가주소
				if(addrData.userSelectedType==='R'){
					if(addrData.bname !== '' && /[동|로|가]$/g.test(addrData.bname)){
						detailAddr += addrData.bname;
	                }
					if(addrData.buildingName !== '' && addrData.apartment === 'Y'){
						detailAddr += (detailAddr !== '' ? ', ' + addrData.buildingName : addrData.buildingName);
	                }
					if(detailAddr !== ''){
						detailAddr = ' (' + detailAddr + ')';
	                }
					document.getElementById("ship_detail").value = detailAddr;
				}else{
					document.getElementById("ship_detail").value = '';
				}
				// 우편번호, 일반주소 입력
				document.getElementById("ship_zip").value = addrData.zonecode;
				document.getElementById("ship_addr").value = addr;
				document.getElementById("ship_detail").focus();
			}
		}).open({
	    	left: (window.screen.width / 2) - (width / 2),
	    	top: (window.screen.height / 2) - (height / 2)
		});
	};
	
		var msg ="";
		//결제 api 식별코드 세팅
		var IMP = window.IMP;
		IMP.init('imp45051525');
		
		function payment(){
			var userid = '${logId}';
			var username = '${logName}';
			var payStatus = "card"
			console.log(payStatus);
			IMP.request_pay({
			    pg : 'html5_inicis', // version 1.1.0부터 지원.
			    pay_method : payStatus,
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '카드 결제',
			    amount : '${orderVO.o_price+orderVO.o_ship }',
			    buyer_email : 'test@localer.com',
			    buyer_name : username,
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456'
			}, function(rsp) {
			    if ( rsp.success ) {
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        msg += '결제수단 : ' + rsp.pay_method;
				        msg += '결제상태 : ' + rsp.status;
				        msg += '결제시간 : ' + rsp.paid_at;
 				        var params = $("#orderFrm").serialize();				        
				        $.ajax({
				        	type : 'POST',				 	//post방식
				        	url : 'sendShowCompl',		//전송할 url
				        	data : params,					// 데이터
				        	success : function(result){
				        		console.log('성공 아작스');
				        		console.log(result,"<---o_num와넘어와라");
			        			location.href="ShowCompl?o_num="+result;  					        		
				        	}, error : function(e){
				        		console.log('실패',e)
				        	}
				        });  
				        alert("결제가 완료되었습니다.");
			    } else {
			        msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			    return rsp.success;			    
			});
		};
		$(()=>{
			
			
			$("select[name=o_mtd]").change(()=>{
				console.log("들어오냐..11");
				if($("#o_mtd option:selected").val()=="1"){
					console.log("들어오냐..22");
					$("#pointPay").css("display","none");
					$("#now_point").attr("disabled",true).val("");
					$("#sp_point").attr("disabled",true).val("");;
					$("#remaining_point").attr("disabled",true).val("");;
					
				}
				if($("#o_mtd option:selected").val()=="2"){
					console.log("들어오냐..22");
					$("#pointPay").css("display","block");
					$("#now_point").attr("disabled",false).val("");
					$("#sp_point").attr("disabled",false).val("");
					$("#remaining_point").attr("disabled",false).val("");
					
					
					var url = "findChaSpPoint";
					var params = 'userid=${orderVO.userid}';
					console.log(params,'<---금액 가져오는부분 변수 보냅니다')
					$.ajax({
						url : url,
						data : params,
						success:function(result){				
							$("#now_point").val(result.cha_point-result.sp_point);
							$("#sp_point").val(-${orderVO.o_price});
							$("#remaining_point").val((result.cha_point-result.sp_point)+(-${orderVO.o_price}));
							console.log((result.cha_point-result.sp_point),'이게 큰가요 0보다?');
							if((result.cha_point-result.sp_point)-${orderVO.o_price}<0){
								$("#EmptyMoney").text('(잔액이 부족합니다. 충전 후 이용해 주십시오.)');
							}
						},error:function(e){
							alert('실패@@@@@@@@@');
						}
					})
				}
			});

		
		$("#memAddr").click(function(){
			var url = 'userDetailFind';
			var params = 'userid=${orderVO.userid}';
			console.log(params,"<----유저 정보?가져옵니다.");
			$.ajax({
				url : url,
				data : params,
				success:function(result){
					console.log(result.mem_name,'왜안나오니');
					$("#getter").val(result.mem_name);
					$("#ship_tel").val(result.mem_tel);
					$("#ship_zip").val(result.mem_zip);
					$("#ship_addr").val(result.mem_addr);
					$("#ship_detail").val(result.mem_detail);
				},error:function(e){
					console.log('실패@@@@@@@@@');
				}
			})
		})
		$("#newAddr").click(function(){
			$("#getter").val("");
			$("#ship_tel").val("");
			$("#ship_zip").val("");
			$("#ship_addr").val("");
			$("#ship_detail").val("");
		})	
		
		
		
		$("#showSellerInfo").click(function(){
			location.href="sellerInfo?userid=${orderVO.i_userid }";
		});
		$(".sellItemShow").click(function(){
			location.href="sellView?i_num=${orderVO.num}";
		});
		$("#pointCharge").click(function(){
			location.href="myInfoLoad";
		});	
		

		//유효성검사		
		$(document).on('click','#orderBtns',function(){
			if($("#o_mtd option:selected").val()==1){
				if($("#newAddr").val()=="" && $("#memAddr").val()==""){
					alert('배송지를 선택해 주세요');
					return false;
				}
				if($("input[name=gener]:radio:checked").length == 0){
		            alert('배송지를 선택해 주세요');
		            return false;
				}
				if($("#getter").val()==null || $("#getter").val()==''){
					alert('수령인을 입력해 주세요');
			        return false;
				}
				if($("#ship_tel").val()==null || $("#ship_tel").val()==''){
					alert('연락처를 입력해 주세요');
			        return false;
				}
				if($("#ship_zip").val()=='' || $("#ship_addr").val()=='' || $("#ship_detail").val()==''){
					alert('우편번호 검색을 통해 배송지 주소를 입력해 주세요');
			        return false;
				}
	
				payment();
				return false;
			
				
			}else if($("#o_mtd option:selected").val()==2){
				if($("#remaining_point").val()<0){
					alert('현재 포인트가 부족합니다 충전후 이용해 주십시오.')
					return false;
				}
				if($("#newAddr").val()=="" && $("#memAddr").val()==""){
					alert('배송지를 선택해 주세요');
					return false;
				}
				if($("input[name=gener]:radio:checked").length == 0){
		            alert('배송지를 선택해 주세요');
		            return false;
				}
				if($("#getter").val()==null || $("#getter").val()==''){
					alert('수령인을 입력해 주세요');
			        return false;
				}
				if($("#ship_tel").val()==null || $("#ship_tel").val()==''){
					alert('연락처를 입력해 주세요');
			        return false;
				}
				if($("#ship_zip").val()=='' || $("#ship_addr").val()=='' || $("#ship_detail").val()==''){
					alert('우편번호 검색을 통해 배송지 주소를 입력해 주세요');
			        return false;
				}
				$("#orderFrm").submit();
			}else{
				alert('결제방법을 선택해 주세요')
				return false;
			}
		})
		
		
		
			$("#selbBackBtn").click(function(){
				history.back();
			});

			
			$("input[type=radio]").click(function(){
				if($("#memAddr").is(":checked")){
					$("#zipSearch").attr("disabled",true);
				}else{
					console.log($("#newAddr").val());
					$("#zipSearch").attr("disabled",false);
				}
			})
			
			
		
		
		
		
		});
	</script>

	<div id="main">
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		<div class='sellBuyTitle'>구매상품정보</div>
		<form id="orderFrm" method="post" action="orderShipCashInsert">
			<div id="center">
				<div>	
					<ul id="boardList">
					
						<li>상품정보</li>
						<li>수량</li>
						<li>배송비</li>
						<li>총 금액</li>	
	
						<li>
							<div><img class='sellItemShow' src="<%=request.getContextPath()%>/img/sellItemInsertPicture/${orderVO.i_img1}"></div>
							<div>
								<div style='height:238px; display:flex; flex-direction:column; justify-content: space-around;'>
									<div id="innerstyle">
										<span class='sellItemShow'>${orderVO.i_subject }</span><span id='showSellerInfo'>판매자:${orderVO.i_userid }</span><br/>
										<span> 기본가격 : ${orderVO.i_price }원</span><br/>
										<span>옵션 : ${orderVO.opt_str }</span>
									</div>
								</div>	
							</div>
						</li>
						<li>${orderVO.o_cnt }EA</li>
						<li>${orderVO.o_ship }원</li>
						<li>${orderVO.o_price+orderVO.o_ship }원</li>	
					</ul>
				</div>
				
				<div class='sellBuyTitle'>배송지 정보입력 및 결제방법 선택</div>
				
				<div id="pay">
					<div id="paySelect">
						<span style="font-size:24px; font-weight:bold; margin-right:20px;">결제 방법 &emsp;</span>
						<select name="o_mtd" id="o_mtd">
							<option selected disabled hidden>결제선택</option>
							<option value="1">카드결제</option>
							<option value="2">포인트결제</option>
						</select>
					</div>

					<div id="pointPay">
						<span class="spanSubtitle"> 현재 포인트 &emsp; &nbsp;:&ensp; &nbsp;</span>
						<input type="text" class="point" id ="now_point" readonly /><span style="font-size:16px; font-weight:bold">원</span><input type="button" id="pointCharge" class="btn ChargeBtn" style="margin-left:12px;" value="충전하기" ><br/>
						
						<span class="spanSubtitle"> 차감 포인트 &emsp; &nbsp;:&ensp; &nbsp;</span>
						<input type="text" class="point" id ="sp_point" name="sp_point" readonly /><span style="font-size:16px; font-weight:bold">원</span>		<br/>
						<span class="spanSubtitle"> 잔여 포인트 &emsp; &nbsp;:&ensp; &nbsp;</span>
						<input type="text" class="point" id ="remaining_point" readonly /><span style="font-size:16px; font-weight:bold">원</span><span id="EmptyMoney" style="color:red; margin-left:10px;"></span>	<br/>
					</div>
				</div>
				<hr/>
				<div id="DeliveryAddr">
					<div>
						<span style="font-size:24px; font-weight:bold; margin-right:20px;"> 배송지 선택 &ensp;</span>
						<span>기본 배송지&nbsp; :&nbsp;</span> <input type="radio" id="memAddr" name="gener" value="1" checked> &ensp;
						<span>신규 배송지&nbsp; : &nbsp;</span> <input type="radio" id="newAddr" name="gener" value="2">
						<br/>
						
						<ul id="shipSpot">		
							<li><span class=boldFont>수령인</span></li>
							<li><input type="text" id ="getter" name="getter" value="${memberVO.mem_name}" /></li>
							
							<li><span class="boldFont">연락처</span></li>
							<li><input type="text" id ="ship_tel" name="ship_tel" maxlength=11 placeholder='  " - " 없이 연락처를 입력해 주세요' value="${memberVO.mem_tel }" /></li>
							
							<li><span class="boldFont">배송지 주소</span> </li>
							<li>
								<div><input type="text" id ="ship_zip" name="ship_zip"  placeholder="우편번호"  value="${memberVO.mem_zip}" readonly/><input type="button" value="우편번호 검색" id="zipSearch" class="btn commBtn" onclick="findAddr()" disabled/></div>
								<div><input type="text" id ="ship_addr" name="ship_addr" placeholder="주소" value="${memberVO.mem_addr }" readonly /><br/></div>
								<div><input type="text" id ="ship_detail" name="ship_detail" placeholder="상세주소를 입력해주세요." value="${memberVO.mem_detail }"/><br/></div>
							</li>
							
							<li><span class="boldFont">요청사항</span></li>
							<li><input type="text" name="ship_msg" id="ship_msg" maxlength=100 placeholder="요청 사항을 입력해 주세요(100자이내)" /></li>
						</ul>  
					 </div>
				</div>
				
				<input type="hidden" id="seachUserid" name="userid" value="${orderVO.userid }"><!-- 구매자 -->
				<input type="hidden" name="opt_str" value="${orderVO.opt_str }"><!-- 옵션 str -->
				<input type="hidden" name="o_cnt" value="${orderVO.o_cnt }"><!-- 수량 -->
				<input type="hidden" name="o_price" value="${orderVO.o_price+orderVO.o_ship }"><!-- 총 가격 -->
				<input type="hidden" name="num" value="${orderVO.num }"><!-- 상품코드(판매글번호) -->
				<input type="hidden" name="o_ship" value="${orderVO.o_ship }"><!-- 배송비 -->
				<input type="hidden" name="sender" value="${orderVO.i_userid }"><!-- 판매자 -->
				
				
				
				<div id="finalBtn">
					<input id="selbBackBtn" type="button" value="주문취소" class="btn cancelBtn" /> &emsp; &emsp;
					<input type="button" id="orderBtns" value="주문하기" class="btn confBtn"/>
				</div>
			</div>
		</form>
	</div>

</body>
</html>