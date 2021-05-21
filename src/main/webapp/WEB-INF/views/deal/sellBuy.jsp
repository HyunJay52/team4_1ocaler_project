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
					$("#pointPay").css("display","none");
					
				}
				if($("#o_mtd option:selected").val()=="2"){
					console.log("들어오냐..22");
					$("#cardPay").css("display","none");
					$("#pointPay").css("display","block");
				}
			});
			
			$("#showSellerInfo").click(function(){
				location.href="sellerInfo?userid=${orderVO.i_userid }";
			});
			$("#sellItemShow").click(function(){
				location.href="sellView?i_num=${orderVO.num}";
			});
	
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
							<div><img id='sellItemShow' src="<%=request.getContextPath()%>/img/sellItemInsertPicture/${orderVO.i_img1}"></div>
							<div>
								<div style='height:238px; display:flex; flex-direction:column; justify-content: space-around;'>
									<div style="font-weight:bold; font-size:1.25em; text-align:center;">${orderVO.i_subject }
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
				
				<div class='sellBuyTitle'>배송지 정보</div>
				
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
							<option selected disabled hidden>결제선택</option>
							<option value="1">카드결제</option>
							<option value="2">포인트결제</option>
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