<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->
<script src="plugin/jquery.bxslider.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugin/jquery.bxslider.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealSellViewStyle.css"/>
<style>

	.facker[type=checkbox]{ display:none; }
	#sellInfo>div:first-child>input[type=checkbox] + label { display: inline-block; cursor: pointer; line-height: 22px; padding-left: 22px; background: url("<%=request.getContextPath()%>/img/deal/sellLikeE.png") left/22px no-repeat; }
	#sellInfo>div:first-child>input[type=checkbox]:checked + label { background-image: url("<%=request.getContextPath()%>/img/deal/sellLikeF.png"); }
	#sellInfo>div:first-child>label{height: 29px; margin:0px; float:right; margin-right:7px;}
</style>


	<script>

	$(function(){
		$(".slider").bxSlider({
			auto:true,
			pagerCustom:"#bx-pager"
		});
		

		var popup;
	
	
		//검색창 팝업 이벤트
		$("#qaBtn").click(function(){
			$("#popup").css('display', 'block');
		
		});
    	$("#popup").on('click', function(){
        	$("#searchDiv").css('display', 'none');

    	})
		
		$('.cbBtn').on('change',function(){
			console.log("들어오는지 체크합니다.");
			$('.cbBtn').not(this).prop('checked',false);
		})
		
		
		
		// 금액 카운트 및 계산
		var moneyCollect = [];
    	var total = 0;
    	//수량 카운트 및 계산
    	var count = [];
    	var counts = 0;
    	//옵션 배열 및 옵션 내용추가
    	var optionStrArray = []
    	var optionStr = '';
		//변수명
    	var cnt = 1000;
		var spans = 999
    	
    	
    	//트리거 형식으로 값을 변환시키고 해당 값에 대해서 예외로 두어 실행 시키지 않는방식
    	var optionCheck = 0;
    	$("#option_content").click(function(){
    		if(optionCheck==2){
    			optionCheck=0;
    		}else if(optionCheck==0){
    			if($("#option_title>option:selected").val()=='first'){
        			alert('옵션1을 먼저 선택해 주세요');	
    			}
    		}
    	}); 
   
    	
    	
		// 옵션 선택시 div추가	
   		$("#option_content").change(function(){	
   			optionCheck = 2;
   			var charge = parseInt(${itemVO.i_price})+parseInt($('#option_content').val());//원래가격 + 옵션가격
 			$("#sellItemList").append("<div class='itemElement' style='overflow:auto'><div><span class='OptionStyle' id="+spans+">"+$('#option_title>option:selected').text()+"/"+$('#option_content>option:selected').text()+"</span></div><div><input type='number' class='choice' min='1' max='5' value='1'/></div><div id="+cnt+">"+charge+"</div><div><img class='itemElementDel' src='img/deal/close.png'/></div></div>");
 			
 			// 가격, 수량 배열추가
 			moneyCollect.push($("#"+cnt).text());
 			count.push(1);
 			
 			// 가격, 수량 계산 
 			total += parseInt(($("#"+cnt).text()));
 			counts++;
 			
 			// 옵션 배열 및 문자열저장
 			optionStrArray.push(($("#"+spans).text()));
 			optionStr = optionStrArray.join();
 			//로그찍어보기
 			console.log('============ 엘리먼트 추가시 =============');
 			console.log(counts+"<--수량 계산중");
 			console.log(count+"<-- 수량 배열");
 			console.log(total,'<-- 돈 계산중');
 			console.log(moneyCollect+"<--돈 배열");
 			console.log(optionStr+"<--옵션 ")
 			console.log(optionStrArray+"<--옵션 배열")

 			
 			//수량기, 금액 id
 			cnt++;
			spans--;
 			//총가격수정 수량 수정
 			$("#i_price").val(total);
 			$("#i_cnt").val(counts);
 			$("#opt_str").val(optionStr);
 			//선택 후 원상복귀
 			$("#option_title").focus();
 			$("#option_title>option:eq(0)").prop("selected",true);	
 			$("#option_content").html("<option selected disabled hidden>-[필수]- 옵션2 - </option>");
	
 		});  

		//옵션 엘리먼트 삭제
    	$(document).on('click','.itemElementDel',function(){
    		
    	   	//총가격 및 총수량 계산
			total -= parseInt($(this).parent().prev().text());//삭제를 누르면 총가격에서 삭제된 가격을 뺴준다.
			counts -= $(this).parent().prev().prev().children("input").val();	
			
			// 가격 배열과 수량 배열에서 제거한 부분을 삭제시켜준다.
			moneyCollect.splice($('.itemElementDel').index(this),1);
			count.splice($('.itemElementDel').index(this),1);
			
			
			//옵션배열 및 옵션 문자열
			optionStrArray.splice($('.itemElementDel').index(this),1);
 			optionStr = optionStrArray.join();
			
			
			
			
			//로그찍어보기
			console.log('============ 엘리먼트 삭제시 =============');
			console.log($(".itemElementDel").index(this),'<--삭제를 누른 버튼의 숫자');//삭제를 누른 인덱스
			console.log(counts,"<--총수량 계산중");
			console.log(count,"<-- 수량 배열");
			console.log(total,"<-- 총가격 계산중");
			console.log(moneyCollect,"<--가격 배열");
			console.log(optionStr+"<--옵션 ")
 			console.log(optionStrArray+"<--옵션 배열")

			
			
	
			//총가격 및 수량 수정
    		$("#i_price").val(total);
    		$("#i_cnt").val(counts);
    		$("#opt_str").val(optionStr);   		
    		//삭제한 div를 제거한다.
			$(this).parent().parent().remove();
		});
 
    	//옵션 엘리먼트 수량변경
   		$(document).on('change','.choice',function(){   			
   			
		
       		var numbers = parseInt($(this).val());	// 현재 적혀있는 숫자[up 또는 down되어 있는 숫자]  
       		var price = parseInt($(this).parent().next().text());// 현재 적혀있는 가격 [ 클릭하기전에 기존에 적혀있는 가격]
       		var result = numbers*moneyCollect[$(".choice").index(this)];//수량변동 후 1개의 가격 * 수량 값

       		//줄어들떈 [ 원래 적혀있던 가격보다 > 변동된 수량 * 1개 가격이 적으면 수량이 줄어들었단의미로 가격을 줄여줌]
       		if(price>result){
       			total = total - moneyCollect[$(".choice").index(this)];
       			
       		}else{//늘어날때 원래 적혀있던 가격보다 < 변동된 수량 * 1개의 가격이 크므로 가격을 증가시켜줘야함
       			total = total + result - price;   			
       		}
       		
       		
       		
			//수량 및 총수량 계산시 --> 누르고난 다음의 수량과 , 원래 저장되있던 수량을 비교하여 배열 및 총수량 계산  		
       		if(count[$(".choice").index(this)]<numbers){
       			count[$(".choice").index(this)] = count[$(".choice").index(this)]+1
       			counts++;
       		}else{
       			count[$(".choice").index(this)] = count[$(".choice").index(this)]-1
       			counts--;
       		}
			
			//console 찍어보기
       		console.log($(".choice").index(this),"<--수량조절기 선택했을떄 몇번째꺼를 수정했니?");//클릭했을때 그 클릭한 input number의 순서
       		console.log(price,'<--원래 적혀있던 금액');
       		console.log(result,'변경된 수량 곱하기 값 얼마니');
       		console.log(counts,"<-- 총수량 계산중");
       		console.log(count,"<-- 수량 배열");
       		console.log(total,"<--총가격 계산");
       		

       		
       		
       		
       		
       			
       		
       		
       		
       		//총 변경되는 값을 변경해줘야함
       		$("#i_price").val(total);
       		$("#i_cnt").val(counts);
       		$(this).parent().next().text(result);//result값으로 적혀있는 가격 셋팅해줘야함 -> result 값은 변경된 수량 * 1개의 값이므로 가격란에 변경
       	
    	}); 
		
    	
     	$(document).on('change','#option_title',function(){
     		optionCheck = 1;
     		var url = "changeOptions";
    		var params ='option_title='+$("#option_title").val()+'&i_num=${itemVO.i_num}';
    		console.log(params);
    		$.ajax({
    			url : url,
    			data : params,
    			success:function(result){
    				var $result = $(result);
    				var tag = "<option selected disabled hidden>-[필수]- 옵션2 - </option>"
    				$result.each(function(idx,obj){
    					tag += '<option value='+obj.o_price+'>'+obj.option_content+'(+'+obj.o_price+'원)</option>';
    				});
    				$("#option_content").html(tag);
    			},error:function(e){
    				alert('실패')
    			}
    		})//ajax end   		
    	})  	
    	
    	
    	$("#sellBuyFrm").submit(function(){
    		if($("#o_price").val()==0 || $("#i_cnt").val()==0){
    			alert('제품을 선택하고 구매하기를 눌러주세요');
    			return false;
    		}
    	});
    	
    	
	});

	</script>
	<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
	<div id="dealViewMain">
		<div style="overflow:auto;">
			<div id="sellImg">	
				<section class="section1">
					<ul class="slider">
						<li><a href="#"><img src="<%=request.getContextPath()%>/img/sellItemInsertPicture/${itemVO.i_img1}"/></a></li>
						<c:if test="${itemVO.i_img2!=null && itemVO.i_img2!='' }">
							<li><a href="#"><img src="<%=request.getContextPath()%>/img/sellItemInsertPicture/${itemVO.i_img2}"/></a></li>
						</c:if>
						<c:if test="${itemVO.i_img3!=null && itemVO.i_img3!='' }">
							<li><a href="#"><img src="<%=request.getContextPath()%>/img/sellItemInsertPicture/${itemVO.i_img3}"/></a></li>
						</c:if>
						
					</ul>
					
					<div id="bx-pager" style="text-align:center">
						
						<a data-slide-index="0" href="#"><img src="<%=request.getContextPath()%>/img/sellItemInsertPicture/${itemVO.i_img1}"/></a>
						<c:if test="${itemVO.i_img2!=null && itemVO.i_img2!='' }">
							<a data-slide-index="1" href=""><img src="<%=request.getContextPath()%>/img/sellItemInsertPicture/${itemVO.i_img2}"/></a>
						</c:if>
						<c:if test="${itemVO.i_img3!=null && itemVO.i_img3!='' }">
							<a data-slide-index="2" href=""><img src="<%=request.getContextPath()%>/img/sellItemInsertPicture/${itemVO.i_img3}"/></a>
						</c:if>		
					</div>
				</section>
			</div>
			
			
			<div>
				<form id="sellBuyFrm" method="post"  action="sellBuy">
					<div id="sellInfo">	
						<div> 
							<input type="text" id="i_subject" name="i_subject" value="${itemVO.i_subject }" readonly>
							<input class="facker" type="checkbox" name="numLike" id="sellLike" value="" /><label for="sellLike"></label>
						</div>
						<div>
						
							<ul>
								<li> 판매수량</li>
								<li><span style="color:blue; font-weight: bold; font-size:18px;">${itemVO.i_cnt } EA</span></li>
								<li> 판매가</li>
								<li><span style="color:red; font-size:18px; font-weight:bold">${itemVO.i_price }원</span></li>
								<li> 판매기간</li>
								<li><span style="font-weight:bold; font-size:18px;">${itemVO.i_writedate } ~ ${itemVO.i_period }</span></li>
								<li> 판매자</li>
								<li>
									<a href="sellerInfo?userid=${itemVO.userid }"><span style="font-size:16px;">${itemVO.userid }</span><img style="width:35px; height:35px; margin-left:10px;" src="<%=request.getContextPath() %>/img/sel_prof/${itemVO.sel_prof}"/></a>
								</li>
							</ul>
								<hr style="margin-top: -9px;"/>
								
							<ul>
								<li><span style="font-size:16px;"> ＞&nbsp;옵션</span></li>
								<li>									
									<select id="option_title">									
										<option value='first' selected disabled hidden>-[필수]- 옵션1 - </option>
										<c:forEach var="NotOverlap" items="${NOTitle }">
											<option>${NotOverlap.option_title }</option>
										</c:forEach>
									</select><br/>
									<select id="option_content">
										<option selected disabled hidden>-[필수]- 옵션2 - </option>										
									</select>
								</li>
							</ul>
							
							<div style="padding-left:30px;">
								<span style="color:gray;">(최소주문수량 1개 이상) 위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.</span><br/>
								<span style="color:gray;">배송비 <c:if test="${itemVO.i_ship==0 }">무료</c:if><c:if test="${itemVO.i_ship>0 }"><input type='number' id='i_ship' name='o_ship' value='${itemVO.i_ship }' readonly>원</c:if> 입니다.</span>
							</div>
							
							<hr/>
							
							<div style="overflow:auto;" id="sellItemList">
								<div style="background-color:#f0f0f0; text-align:center; line-height:30px; height:30px;"> 선택한 상품 리스트 <span style="font-size:12px;">(Selected product list)</span></div>
							</div>
							<hr/>
							
							<div style="float:left; width:350px;">
								<span style="font-size:1.75em; color:gray; font-weight:bold; padding-left:20px;">총상품 금액(</span>
								<input type='number'  id='i_cnt' name='o_cnt' value=0 readonly>
								<span style="font-size:1.75em; color:gray; font-weight:bold;">EA)</span>
							</div>
							<div style="float:left; width:250px; height:36px;">
								<input type="number" id="i_price" name="o_price" value="0" readonly/>
							</div>
							
							<div style="float:left; width:40px;">
								<span style="font-size:1.75em;  color:gray; font-weight:bold; float:right; padding-right:10px;">원</span>
							</div>
							
						</div>
						
						<div id="submitCancleBtn">
							<input type="button" value="취소" class="btn commBtnSell"/>
							<input type="submit" value="구매하기" class="btn commBtnSell"/>
						</div>
						<input type='hidden' name="num" value="${itemVO.i_num }">
						<input type='hidden' id="opt_str" name='opt_str' value=''>
						<input type='hidden' name='i_userid' value="${itemVO.userid }">
						<input type='hidden' name='i_price' value="${itemVO.i_price }">
						<input type='hidden' name='i_img1' value="${itemVO.i_img1 }">
					</div> 
				</form>		
			</div>		
		</div>			
				
		<!-- 1 -->
		<div class="locationBar" id="locationBar">
			<div id="sellDetailShow" style="border-bottom: 3px solid gray;">
				<a href="#sellDetailShow">상세정보</a>	
			</div>
			<div>
				<a href="#sellReviewChk">리뷰수 : 40 개 &nbsp;  &nbsp;  &nbsp; 재구매율 : 20 %</a>
			</div>
			<div>
				<a href="#sellQusetion">Q&A (4)</a>	
			</div>
		</div>
		<br/>
		<h3 class="sellShortDescription">상품 상세정보<span> | 상품의 상세한 내용을 확인하세요. </span></h3> 		
		
		<div id="sellDetail">
			${itemVO.i_content }
		</div>
		
		
		<!-- 2 -->
		<div class="locationBar" id="locationBar">
			<div>
				<a href="#sellDetailShow">상세정보</a>	
			</div>
			<div id="sellReviewChk" style="border-bottom: 3px solid gray;">
				<a href="#sellReviewChk">리뷰수 : 40 개 &nbsp;  &nbsp;  &nbsp; 재구매율 : 20 %</a>
			</div>
			<div>
				<a href="#sellQusetion">Q&A (4)</a>	
			</div>
		</div>
		<h3 class="sellShortDescription">구매후기<span> | 사용 후기를 남겨보아요 </span></h3> 
			
		<div id="sellReview">
			<c:forEach var="i" begin="1" end="4">
			<!-- ul안에 li한개에 안에 div를 for로 돌려야함 -->
				<div id="oneReview">
					<ul>
						<li>
							<div> 작성자 : 거미 (2022.05.13) <img src="<%=request.getContextPath()%>/img/groupImg/likeF.png"></div>
							<hr style=" width: 450px; margin:0px auto;"/>						
							<div> 너무 재밋고 좋앗습니다 .아하핳하ㅏ하하	</div>
						</li>
						<li id="pic">
							<img src="img/deal/or.jpg"/>
						</li>
					</ul>
				</div>		
			</c:forEach>
		</div>
		<!-- 리뷰달기 페이징 -->			
		<div id ="pageNum">
				<ul class="pagination pagination-sm" >
				 	<li class="page-item"><a href="#" class="page-link"> << </a></li>
				 	<li class="page-item"><a href="#" class="page-link">1</a></li>
				 	<li class="page-item"><a href="#" class="page-link">2</a></li>
				 	<li class="page-item "><a href="#" class="page-link">3</a></li>
				 	<li class="page-item"><a href="#" class="page-link">4</a></li>
				 	<li class="page-item"><a href="#" class="page-link">5</a></li>
				 	<li class="page-item "><a href="#" class="page-link"> >> </a></li>
				</ul>
		</div>
		
		<!-- 3 -->
		<div class="locationBar" id="locationBar">
			<div>
				<a href="#sellDetailShow">상세정보</a>	
			</div>
			<div>
				<a href="#sellReviewChk">리뷰수 : 40 개 &nbsp;  &nbsp;  &nbsp; 재구매율 : 20 %</a>
			</div>
			<div id="sellQusetion" style="border-bottom: 3px solid gray;">
				<a href="#sellQusetion">Q&A (4)</a>	
			</div>
		</div>
		
		<div id="sellQnA">
			<h3 class="sellShortDescription">Q&A<span> | 궁굼한 사항을 물어보세요</span></h3> 		
			<ul id ="sellQnAList">
				<li>&nbsp;&nbsp; </li>
				<li> 답변상태 </li>
				<li id ="point"> 제목 </li>
				<li> 작성자 </li>
				<li> 작성일 </li>
				
				<c:forEach var="i" begin="1" end="5">
					<li> ${i } </li>
					<li> 미답변 </li>
					<li> 볼만하겠네 </li>
					<li> hqhq </li>
					<li> 21-03-29 </li>
				</c:forEach>						
			</ul>
			<!-- Q&A 페이징 -->
			<div id ="pageNum" style="margin-top: 20px;">
				<ul class="pagination pagination-sm" >
				 	<li class="page-item"><a href="#" class="page-link"> << </a></li>
				 	<li class="page-item"><a href="#" class="page-link">1</a></li>
				 	<li class="page-item"><a href="#" class="page-link">2</a></li>
				 	<li class="page-item "><a href="#" class="page-link">3</a></li>
				 	<li class="page-item"><a href="#" class="page-link">4</a></li>
				 	<li class="page-item"><a href="#" class="page-link">5</a></li>
				 	<li class="page-item "><a href="#" class="page-link"> >> </a></li>
					<li><button class="btn commBtn_sm" id ="qaBtn">질문하기</button></li>
				</ul>
			</div>	
		</div>
		
		
		
		<!-- Q&A 팝업 div -->	
		<div id="popup" style="z-index: 99;">
			<form method="post" action ="">
				<div class="checks etrans">
					<h4 style="color:#000">질문을 등록해주세요.</h4> &emsp;
					<input type="checkbox" name="q_status" value="1" id="ex_chk3" class="cbBtn">
					<label for="ex_chk3" > 공개 </label> &emsp;
	     			<input type="checkbox" name="q_status" value="2" id="ex_chk4" class="cbBtn">
					<label for="ex_chk4"> 비공개 </label>
	     		</div>
				<div>
					<textarea name="q_content" id="content" placeholder="질문을 등록해주세요."></textarea>
				</div>
				<div>	
					<button class="btn cancelBtn"  id="btnClose">취소</button>
					<input type="submit" value="질문등록 " class="btn confBtn" style="margin-right:40px" >
				</div>
			</form>
		</div>
		
		
	</div>
</body>
</html>