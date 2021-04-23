<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac851f467c13907926d8947cf1a053f4&libraries=services"></script><!-- 지도 -->

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealBoardStyle.css"/>


	<div id=body>
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		<div>
		<div id="dealImg">	
			이미지들어가는곳 
		</div>
		<form action="">
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
								<a href="#"> goguma1234</a>
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
			<div id="oneReview">
				<ul>
					<li>
						<div id="titleinfo">
							<div style="float: left">아이디</div>
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
			<div id="oneReview">
				<ul>
					<li>
						<div id="titleinfo">
							<div style="float: left">아이디</div>
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
			<div id="oneReview">
				<ul>
					<li>
						<div id="titleinfo">
							<div style="float: left">아이디</div>
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
			<div id="oneReview">
				<ul>
					<li>
						<div id="titleinfo">
							<div style="float: left">아이디</div>
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
			
		</div>
		
		
		
		<div id="sellQnA">
			
		</div>
	</div>
</body>
</html>