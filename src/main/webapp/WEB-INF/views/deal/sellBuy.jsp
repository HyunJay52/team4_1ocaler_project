<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/sellBuy.css"/>
	<script>
		$(()=>{
			$("select[name=o_mtd]").change(()=>{
				console.log("들어오냐..11");
				if($("#o_mtd option:selected").val()=="1"){
					console.log("들어오냐..22");
					$("#cardPay").css("display","block");
					$("#cashPay").css("display","none");
					$("#pointPay").css("display","none");
					
				}
				if($("#o_mtd option:selected").val()=="2"){
					console.log("들어오냐..33");
					$("#cashPay").css("display","block");
					$("#cardPay").css("display","none");
					$("#pointPay").css("display","none");
				}
				if($("#o_mtd option:selected").val()=="3"){
					console.log("들어오냐..44");
					$("#cashPay").css("display","none");
					$("#cardPay").css("display","none");
					$("#pointPay").css("display","block");
				}
				if($("#o_mtd option:selected").val()=="0"){
					console.log("들어오냐..55");
					$("#cardPay").css("display","none");
					$("#cashPay").css("display","none");
					$("#pointPay").css("display","none");
				}
			});
		});
	</script>

	<div id="main">
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		<form>
			<div id="center">
				<div>	
					<h4 style="width: 1100px;">구매 상품 정보</h4>
					<ul id="boardList">
					
						<li>상품정보</li>
						<li>판매자</li>
						<li>배송비</li>
						<li>상품금액</li>	
	
						<li>
							<div>D.I.Y 오르골 만들기</div>
							<div> 옵션 : 혼자 만들기...</div>
						</li>
						<li>goguma1234</li>
						<li>무료 배송</li>
						<li>20,000</li>	
					</ul>
				</div>
				<div id="DeliveryAddr">
					<div>
						<h4 style="display: inline;">배송지 정보 &ensp;  </h4>
						기본 배송지&nbsp; :&nbsp; <input type="radio" id="memAddr" name="gener" > &ensp;
						신규 배송지&nbsp; : &nbsp;<input type="radio" id="newAddr" name="gener" >
						<br/>
						
						<div id="addr">
							 <span> 수 &ensp; 령 &ensp; 인 &emsp; &nbsp;:&ensp; &nbsp;</span> <input type="text" id ="buyer" name="buyer" /><br/>
							 <span> 연 &ensp; 락 &ensp; 처 &emsp; &nbsp;:&ensp; &nbsp;</span> <input type="text" id ="ship_tel" name="ship_tel" /><br/>
							 <span> 배송지 주소 &nbsp; &ensp;  :&ensp; &nbsp;</span> 
							 <input type="text" id ="ship_zip" name="ship_zip"  placeholder="우편번호"/>&ensp;&nbsp;
							 <input type="button" value="우편번호 검색" id="zipSearch" class="btn commBtn" /><br/>
							 <input type="text" id ="ship_addr" name="ship_addr" placeholder="주소" /><br/>
							 <input type="text" id ="ship_detail" name="ship_detail" placeholder="상세주소를 입력해주세요." /><br/>
						</div>	 
					 </div>
				</div>
				<div id="pay">
					<div id="paySelect">
						<h4 style="display: inline;">결제 방법 &emsp;   </h4>
						<select name="o_mtd" id="o_mtd">
							<option value="0">결제선택</option>
							<option value="1">카드결제</option>
							<option value="2">무통장입금</option>
							<option value="3">포인트결제</option>
						</select>
					</div>
					
					<div id="cardPay" >
						<h5>카드선택</h5> &emsp;&emsp;
						<select name="card_com" >
							<option>BC카드</option>
							<option>신한카드</option>
							<option>삼성카드</option>
							<option>현대카드</option>
						</select>
						<br/>
						<h5>카드번호</h5> &emsp;&emsp;
						<input type="text" id="card_num" name="card_num"/> &nbsp;- &nbsp;
						<input type="text" id="card_num" name="card_num"/> &nbsp;- &nbsp;
						<input type="text" id="card_num" name="card_num"/> &nbsp;- &nbsp;
						<input type="text" id="card_num" name="card_num"/>
						<br/>
						<h5>&nbsp;C&ensp;V&ensp;C&nbsp;&nbsp;</h5> &emsp;&emsp;
						<input type ="text" id = "cvc" name="cvc"/>
						
					</div>
					
					<div id="cashPay">

						<h5 style="display: inline;">신한은행</h5> &ensp;
							<h6 style="display: inline;">1004-127-000000</h6>
						<br/>
						<h5 style="padding-left:2px;">예&nbsp;금&nbsp;주&ensp;</h5> &ensp;1ocaler
						<br/>
						<br/>
						<span style="color:gray; font-size: 14px; padding: 0px">입금 후 입금 확인 및 주문 완료까지는 5 ~ 10 분 정도 소요됩니다.<br/>
						확인이 되지 않은 경우에는 판매자나, 고객센터로 연락부탁드립니다.</span>
					
					</div>
					
					<div id="pointPay">
						<h5>현재 포인트</h5> &emsp;&emsp;
						<input type="text" name="sp_point" id ="point" readonly="readonly"/>	<br/>
						
						<h5>차감 포인트</h5> &emsp;&emsp;
						<input type="text" id ="point" />		<br/>
						<h5>잔여 포인트</h5> &emsp;&emsp;
						<input type="text" name="sp_point" id ="point" readonly="readonly"/>		<br/>
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