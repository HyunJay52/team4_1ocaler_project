<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/sellBuy.css"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 주소 api -->
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
					$("#now_point").attr("disabled",false).val("");;
					$("#sp_point").attr("disabled",false).val("");;
					$("#remaining_point").attr("disabled",false).val("");;
					
				}
			});
			
			$("#showSellerInfo").click(function(){
				location.href="sellerInfo?userid=${orderVO.i_userid }";
			});
			$(".sellItemShow").click(function(){
				location.href="sellView?i_num=${orderVO.num}";
			});
			
			
			
		$("#memAddr").click(function(){
			var url = 'userDetailFind';
			var params = 'userid=${orderVO.userid}';
			console.log(params);
			$.ajax({
				url : url,
				data : params,
				success:function(result){
					$("#buyer").val(result.mem_name);
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
			$("#buyer").val("");
			$("#ship_tel").val("");
			$("#ship_zip").val("");
			$("#ship_addr").val("");
			$("#ship_detail").val("");
		})
			
			
			
			
			
		
		});
	</script>

	<div id="main">
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		<div class='sellBuyTitle'>구매상품정보</div>
		<form>
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
									<div class="sellItemShow" style="font-weight:bold; font-size:1.25em; text-align:center;">${orderVO.i_subject }
									<span id='showSellerInfo' style="border:1px solid gray; font-size:14.75px; border-radius:5px; padding:3px; color:yellow; background:#571fb8">판매자:${orderVO.i_userid }</span><br/>
									<span> 기본가격 : ${orderVO.i_price }원</span><br/>
									<span>옵션 : ${orderVO.opt_str }</span></div>
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
						<span style="font-size:18px; font-weight:bold; margin-right:20px;">결제 방법 &emsp;</span>
						<select style="height:20px;" name="o_mtd" id="o_mtd">
							<option selected disabled hidden>결제선택</option>
							<option value="1">카드결제</option>
							<option value="2">포인트결제</option>
						</select>
					</div>

					<div id="pointPay">
						<span class="spanSubtitle"> 현재 포인트 &emsp; &nbsp;:&ensp; &nbsp;</span>
						<input type="text" class="point" id ="now_point" readonly/>	<br/>
						
						<span class="spanSubtitle"> 차감 포인트 &emsp; &nbsp;:&ensp; &nbsp;</span>
						<input type="text" class="point" id ="sp_point" name="sp_point" readonly />		<br/>
						<span class="spanSubtitle"> 잔여 포인트 &emsp; &nbsp;:&ensp; &nbsp;</span>
						<input type="text" class="point" id ="remaining_point" readonly/>		<br/>
					</div>
				</div>
				<hr/>
				<div id="DeliveryAddr">
					<div>
						<span style="font-size:18px; font-weight:bold; margin-right:20px;"> 배송지 선택 &ensp;</span>
						<span>기본 배송지&nbsp; :&nbsp;</span> <input type="radio" id="memAddr" name="gener"> &ensp;
						<span>신규 배송지&nbsp; : &nbsp;</span> <input type="radio" id="newAddr" name="gener">
						<br/>
						
						<div id="addr">
							 <span class="spanSubtitle"> 수 &ensp; 령 &ensp; 인 &emsp; &nbsp;:&ensp; &nbsp;</span> <input type="text" id ="buyer" name="buyer" /><br/>
							 <span class="spanSubtitle"> 연 &ensp; 락 &ensp; 처 &emsp; &nbsp;:&ensp; &nbsp;</span> <input type="text" id ="ship_tel" name="ship_tel" /><br/>
							 <span class="spanSubtitle"> 배송지 주소 &nbsp; &ensp;  :&ensp; &nbsp;</span> 
							 <input type="text" id ="ship_zip" name="ship_zip"  placeholder="우편번호"/>
							 <input type="button" value="우편번호 검색" id="zipSearch" class="btn commBtn" onclick="findAddr()"/><br/>
							 <input type="text" id ="ship_addr" name="ship_addr" placeholder="주소" /><br/>
							 <input type="text" id ="ship_detail" name="ship_detail" placeholder="상세주소를 입력해주세요." /><br/>
						</div>	 
					 </div>
				</div>
				

				<div id="finalBtn">
					<input type="submit" value="주문취소" class="btn cancelBtn" /> &emsp; &emsp;
					<input type="submit" value="주문하기" class="btn confBtn"/>
				</div>
			</div>
		</form>
	</div>

</body>
</html>