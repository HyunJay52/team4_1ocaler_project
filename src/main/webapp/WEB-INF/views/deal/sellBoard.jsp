<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealStyle.css"/>


	<div id="main">
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		<%@ include file="/inc/dealHeader.jspf" %> <!-- 사이드 메뉴 include -->
						
			<div id="selBoard" >
				<ul id="boardText">
					<c:forEach var="i" begin="1" end="10">
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
	</div> <!-- body -->
</body>
</html>