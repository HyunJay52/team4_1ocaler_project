<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commu/communityBoardStyle.css"/>




	<div id="coummuBoardMain">
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		<%@ include file="/inc/commuHeader.jspf" %> <!-- 사이드 메뉴 include -->
						
		<h3 style="margin-top:50px;">#우리동네이야기 <span style="font-size:20px">| 동네 주민들과 여러 정보를 나눠보아요!</span></h3>
		

		<div id="coummuBoardMaincenter">
			<c:forEach var="vo" items="${commuList }">
				<ul id ="coummuBoardMainboardList">
					<li>
						<div>${vo.b_writedate }</div>
						<div><span>조회수 : </span> ${vo.b_hit} &nbsp;&nbsp;  <span>좋아요 :</span> 11 &nbsp;&nbsp; <span> 댓글 :</span> ${vo.repcont }개</div>	 
					</li>
					<li>
						<div><a href="commuView?num=${vo.num}">${vo.b_subject }</a></div>
						<div>
							<div><img src="common/user.png"/><a href="#"> ${vo.userid }</a></div>
						</div>
					</li>
					
					<c:if test="${vo.b_tag == null }">
						<li>
							&nbsp;
						</li>
					</c:if>
					<c:if test="${vo.b_tag != '' }">
						<li>
							${vo.b_tag }
						</li>
					</c:if>
					
					
				</ul>
				
			</c:forEach>
			
		</div>
			
			
		<div id ="coummuBoardpageNum">
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
			
		<div>
			<a href="commuWrite?up_cate=${vo.up_cate}"  class="btn commBtn"  style="float:right"> 글쓰기</a>
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