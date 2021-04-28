<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->
<script src="plugin/jquery.bxslider.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealBoardStyle.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugin/jquery.bxslider.css"/>


	<script>

	$(function(){
		$(".slider").bxSlider({
			auto:true,
			pagerCustom:"#bx-pager"
		});
	});
	
	
	
	</script>

	<div id="main">
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		<div>
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
		<form method="post"  action="sellBuy">
			<div id="sellInfo">
				
				<ul>	
					<li class="wordcut">D.I.Y 오르골 만들기<hr/></li>
					<li>
						<ul>
							<li>판매 개수</li>
							<li>
								<span class="cntJoin">1</span>
								/5개
							</li>
						</ul>
					</li>
					<li>
						<ul>
							<li>판매 기한</li>
							<li>2020  / 05 / 28 일 까지</li>
						</ul>
					</li>
					<li>
						<ul>
							<li>옵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;션</li>
							<li>
								<select>
									<option>옵션을 선택하세요</option>
									<option>이걸</option>
									<option>어떻게</option>
									<option>하라고</option>
								</select>
							</li>
						</ul>
					</li>
					<li>
						<ul>
							<li>택배배송</li>
							<li>
								<select>
									<option>배송비</option>
									<option>이걸</option>
									<option>어떻게</option>
									<option>하라고</option>
								</select>
							</li>
						</ul>
					</li>
					
					<li>
						<ul>
							<li>
								<img src="common/user.png">&nbsp;&nbsp;
								<a href="sellerInfo"> goguma1234</a>
							</li>
							<li style="font-size: 30px;">
								20,000원 &nbsp; &nbsp;	
							</li>				
						</ul>
					</li>
					
					<li class="wordcut">#오르골 #D.I.Y #장식 #인테리어</li>
					<li><hr/>
						<input type="submit" value="찜하기" class="btn commBtn" style="margin-left: 100px"/>
						<input type="submit" value="구매하기" class="btn commBtn"/>
					</li>
				</ul>
			</div>
		</form>
		<div class="sellFont" >리뷰수 : 40 개 &nbsp;  &nbsp;  &nbsp; 재구매율 : 20 %</div>
		<div id="sellReview">
			<c:forEach var="i" begin="1" end="4">
				<div id="oneReview">
					<ul>
						<li>
							<div id="titleinfo">
								<div style="float: left">거미</div>
								<div style="float: right;"> 2022.05.13</div>
							</div>
							<div id="info">
								너무 재밋고 좋앗습니다 .아하핳하ㅏ하하
							</div>
						</li>
						<li id="pic">
							<img src="img/deal/or.jpg"/>
						</li>
					</ul>
				</div>		
			</c:forEach>
		</div>
					
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
		
		<div id="sellDetail">
			상품 설명 웅앵ㄴㅇ머림ㄴ어랟ㅁ쟈ㅓ리ㅏ은리ㅓㅈ댜
		</div>

		<div id="sellQnA">
			<h3>Q&A</h3>
			<ul id ="sellQnAList">
				<li> 답변상태 </li>
				<li id ="point"> 제목 </li>
				<li> 작성자 </li>
				<li> 작성일 </li>
				
				<li> 미답변 </li>
				<li> 볼만하겠네 </li>
				<li> hqhq </li>
				<li> 21-03-29 </li>
								
				<li> 27 </li>
				<li> 레이아웃 연습 </li>
				<li> heyeon </li>
				<li> 21-03-23 </li>
								
				<li> 11 </li>
				<li> 색은 뭘로할까 </li>
				<li> yeon </li>
				<li> 21-03-25 </li>
										
			</ul>
		</div>
	</div>
</div>	
</body>
</html>