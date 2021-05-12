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
	});
	
	</script>
	<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
	<div id="dealViewMain">
		
		<div id="sellImg">	
			<section class="section1">
				<ul class="slider">
					<li><a href="#"><img src="img/deal/div.jfif"/></a></li>
					<li><a href="#"><img src="img/deal/div.jfif"/></a></li>
					<li><a href="#"><img src="img/deal/div.jfif"/></a></li>
				</ul>
				
				<div id="bx-pager" style="text-align:center">
					<a data-slide-index="0" href="#"><img src="img/deal/div.jfif"/></a>
					<a data-slide-index="1" href=""><img src="img/deal/div.jfif"/></a>
					<a data-slide-index="2" href=""><img src="img/deal/div.jfif"/></a>
				</div>
			</section>
		</div>
		
		
		<div>
			<form method="post"  action="sellBuy">
				<div id="sellInfo">	
					<div> 
						<h3 style="margin:0px; float:left;">D.I.Y 오르골 만들기 </h3>
						<input class="facker" type="checkbox" name="numLike" id="sellLike" value="" /><label for="sellLike"></label>
					</div>
					<div>
						<ul>
							<li> 판매수량</li>
							<li><span style="color:blue; font-weight: bold; font-size:18px;">50개</span></li>
							<li> 판매가</li>
							<li><span style="color:red; font-size:18px; font-weight:bold">250,000원</span></li>
							<li> 판매기간</li>
							<li><span style="font-weight:bold; font-size:18px;">2021-05-01 ~ 2021-05-20</span></li>
							<li> 판매자</li>
							<li>
								<span style="font-size:16px;">goguma1234</span><img style="width:35px; height:35px; margin-left:10px;" src="<%=request.getContextPath() %>/img/mem_prof/user.png"/>
							</li>
						</ul>
							<hr style="margin-top: -9px;"/>
						<ul>
							<li><span style="font-size:16px;"> ＞&nbsp;옵션</span></li>
							<li>
								<select id="option_content" name="option_content">
									<option selected disabled hidden>-[필수]- 옵션선택 - </option>
									<option>12</option>
									<option>23</option>
									<option>34</option>
									<option>45</option>
								</select>
							</li>
						</ul>
						<div style="padding-left:30px;">
							<span style="color:#d9d9d9;">(최소주문수량 1개 이상) 위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.</span><br/>
							<span style="color:#d9d9d9;">배송비 3000원 입니다.</span>
						</div>
							<hr/>
						<div id="sellItemList">
							<div style="background-color:#f0f0f0; text-align:center; line-height:30px; height:30px;"> 선택한 상품 리스트 <span style="font-size:12px;">(Selected product list)</span></div>
						</div>
						<hr/>
						<div><span style="font-size:1.75em; color:red; padding-left:20px;">총상품 금액</span><span style="font-size:1.75em; color:red; float:right; padding-right:10px;">원</span></div>
					</div>
					<div>
						<input type="button" value="취소" class="btn commBtnSell"/>
						<input type="submit" value="구매하기" class="btn commBtnSell"/>
					</div>
				</div> 
			</form>		
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
		
		<h3 class="sellShortDescription">상품 상세정보<span> | 상품의 상세한 내용을 확인하세요. </span></h3> 		
		
		<div id="sellDetail">
			상품 설명 웅앵ㄴㅇ머림ㄴ어랟ㅁ쟈ㅓ리ㅏ은리ㅓㅈ댜
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