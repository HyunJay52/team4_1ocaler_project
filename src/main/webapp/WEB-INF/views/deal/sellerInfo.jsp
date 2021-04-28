<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/sellerInfo.css"/>

	<div id="infoMain">
		<div id="infoSeller">
			<ul>
				<li>
					<div>
						<img src="common/user.png">
					</div>
					<div>
						<h4>goguma1234</h4>
						&nbsp;게&nbsp;시&nbsp;글&nbsp;: 4 개 <br/>
						재구매율 : 5 %
					</div>
				</li>
				<li>
					<h4>판매자 정보</h4>
					<div>
						상호명 : 비트캠프 <br/>
						연락처 : 031-1111-2222 <br/>
						대표자 : 조현정  <br/>
						사업자번호 : 214-85-24928 <br/>
						사업장 소재지 : 서울시 서초구 강남대로 459 (서초동, 백암빌딩)
					</div>
				</li>
			</ul>
		</div>		
	
		<hr/>
	
		<div id="infoBoard" >
			<ul id="boardText">
				<c:forEach var="i" begin="1" end="5">
					<li id="selList">
						<div  OnClick="location.href ='sellView'">
							<div id="sellImgDiv">
								<img src="img/deal/div.jfif"/>
							</div>
							<ul>	
								<li class="wordcut">D.I.Y 오르골 엔틱소품</li>
								
								<li>
									<span class="cntJoin">&nbsp;&nbsp;5</span>
									/160개
								</li>
								<li>20,000원</li>
								<li class="wordcut">#오르골 #DIY #엔틱소품 #소품</li>
								<li>
									goguma1234 &nbsp;
									<img src="common/user.png">&nbsp;&nbsp;
								</li>
							</ul>
						</div>
					</li>
				</c:forEach>	
			</ul>
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
	</div>	
</body>
</html>