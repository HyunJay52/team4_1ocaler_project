<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commu/communityBoardStyle.css"/>


		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		<%@ include file="/inc/commuHeader.jspf" %> <!-- 사이드 메뉴 include -->

	<div id="coummuBoardMain">
		
						
		<h3 style="margin-top:50px;">#자유게시판 <span style="font-size:16px">| 자유롭게 의견을 나눠보세요 </span></h3>

		<div id="coummuBoardMaincenter">
				<div id ="coummuboardListTitle">
						<div style="width: 130px; text-align: center;">
							글번호
						</div>
						<div >
							<div style="width: 770px ; text-align: center;">제목 </div>
							<div id ="" style="width: 400px ;">
								<ul id ="commuSubTitle">
									<li>아이디</li>
									<li>작성일</li>
									<li>조회수</li>
									<li>좋아요</li>
								</ul>
							</div>
						</div>	 
					
				</div>
		
		
		
			
			<c:forEach var="vo" items="${commuList }">
				<div id ="coummuBoardMainboardList">
						<div>
								${vo.num }
						</div>
						
						<div id="commusubList">
							<div>${vo.b_subject} &emsp; [${vo.repcont}]</div>
							<div>
								<ul id ="commuSubTitle">
									<li>${vo.userid}</li>
									<li>${vo.b_writedate}</li>
									<li>${vo.b_hit}</li>
									<li>${vo.b_hit}</li>
								</ul>
							</div>
							<div id="tagList">
								<c:if test="${vo.b_tag == null }">
									
										&nbsp;
									
								</c:if>
								<c:if test="${vo.b_tag != '' }">
									
										${vo.b_tag }
								
								</c:if>
							</div>
						</div>	 
					
				</div>
				
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