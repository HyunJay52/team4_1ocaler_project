<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commu/communityBoardStyle.css"/>




	<div id="body">
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		<%@ include file="/inc/commuHeader.jspf" %> <!-- 사이드 메뉴 include -->
						
		<h1>로컬커뮤니티</h1>

		<div id="center">
			<c:forEach var="i" begin="1" end="6">
				<ul id ="boardList">
					<li>
						<div>2021.04.25</div>
						<div><span>조회수 : </span> 192 &nbsp;&nbsp;  <span>좋아요 :</span> 11 &nbsp;&nbsp; <span> 댓글 :</span> 40 개</div>	 
					</li>
					<li>
						<div><a href="commuView">서대문구 혼밥하기 좋은 곳 아시나요?</a></div>
						<div>
							<div><img src="common/user.png"/><a href="#"> 서쪽마녀</a></div>
						</div>
					</li>
					<li>
						#서대문구 #혼밥 #식당 #음식 #맛있는거 #추천 #동네맛집	
					</li>
				</ul>
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
			
		<div style="width:1300px; height: 70px; padding:19px" >
			<a href="commuWrite"  class="btn commBtn"  style="float:right"> 글쓰기</a>
			<div id="commuSearch">
				<form method="post" action="" id="commuForm">
					<select>
						<option value="'">내용</option>	
						<option value="'">작성자</option>			
					</select>
						<input type="text"name ="search" placeholder=" &nbsp;검색.." id="search"/>
						<input type="image" id="btn" src="img/deal/icons8.png" style="display:block; float:left; border: 1px solid #000;" /> 
				</form>
			</div>	
		</div>	
			
	</div> <!-- body -->
</body>
</html>