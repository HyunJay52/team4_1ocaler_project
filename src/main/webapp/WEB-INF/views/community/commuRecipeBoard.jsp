<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commu/communityBoardStyle.css"/>


		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		<%@ include file="/inc/commuHeader.jspf" %> <!-- 사이드 메뉴 include -->
 
	<div id="coummuBoardMain">
		
						
		<h3 style="margin-top:50px;">#쓱싹레시피 <span style="font-size:16px">| 쉽고 간편한 요리를 공유해보세요 </span></h3>

		<div id="coummuBoardMaincenter">
			<table cellpadding="0" cellspacing="0" style="width:1300px ;" class="table">
					<tbody>
						<tr height="41px">
							<th>글번호</th>
							<th>제목</th>
							<th>아이디</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>좋아요</th>
						</tr>	
						
						<c:forEach var="vo" items="${commuList }">
						<tr>
							<td>
								${vo.num }
							</td>
													
							<td style="float: left ;line-height: 14px;">
								<a href="commuView?num=${vo.num}&up_cate=2">${vo.b_subject} 
									<span style="font-weight: bold;"> [${vo.repcont}]</span>
								</a> 
									&nbsp;
								<c:if test="${vo.newDate == 0 }">	
									<div id="newImg">N</div>
								</c:if>
								<div style="clear:left; color:orange;font-size: 12px;"><br/>${vo.b_tag }</div>
							</td>
							<td>${vo.userid}</td>
							<td>${vo.b_writedate}</td>
							<td>${vo.b_hit}</td>
							<td> ${vo.numlike }</td>
						</tr>
						<%-- <tr style="text-align: left; padding-right: 20px;font-size: 12px;color:gray;">
							<td id ="tag" colspan="6">${vo.b_tag }</td>
						</tr> --%>
						</c:forEach>
					</tbody>
				</table>
			
		</div>
			
		<ul id="MBPaging">
               <c:if test="${pageVO.pageNum>1}">
					<li>
						<a href='commuRecipeBoard?pageNum=${pageVO.pageNum-1}&up_cate=2<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord }</c:if>'>이전</a></li>
				</c:if>
				<c:if test="${pageVO.pageNum<=1}">
					<li>이전</li>
				</c:if>
				<c:forEach var="p" begin="${pageVO.startPageNum }" end="${pageVO.startPageNum+pageVO.onePageNum-1 }">
					<c:if test="${p<=pageVO.totalPage }">
						<c:if test="${p==pageVO.pageNum }">
						<!-- 현재페이지일떄 -->
							<li style="background-color:#d9d9d9"><a href="commuRecipeBoard?pageNum=${p}&up_cate=2<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
						</c:if>
						<c:if test="${p!=pageVO.pageNum }">
						<!-- 현재페이지가 아닐때 -->
							<li><a href="commuRecipeBoard?pageNum=${p}&up_cate=2<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord }</c:if>">${p }</a></li>
						</c:if>
					</c:if>		
				</c:forEach>			
				<c:if test="${pageVO.pageNum<pageVO.totalPage}">
					<li>
						<a href="commuRecipeBoard?pageNum=${pageVO.pageNum+1}&up_cate=2<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!='' }">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord }</c:if>">다음</a></li>
				</c:if>	
				<c:if test="${pageVO.pageNum==pageVO.totalPage || pageVO.totalPage==0}">
					<li>다음</li>
				</c:if>	
            </ul>	
		
			
		<div>
			<c:if test="${logId != null }">
				<a href="commuWrite?up_cate=${pageVO.up_cate}"  class="btn wriBtn"  style="float:right;font-color: #181b46;"> 글쓰기</a>
			</c:if>
			<div id="commuSearch">
				<form method="get" action="commuRecipeBoard" id="commuForm">
					<input type="hidden" name="up_cate" value="${pageVO.up_cate }"/>
					<select name="searchKey">
						<option value="b_content">내용</option>
						<option value="b_subject">제목</option>		
						<option value="userid">작성자</option>			
					</select>
						<input type="text"name ="searchWord" placeholder=" &nbsp;검색.." id="search"/>
						<input type="image" id="btn" src="img/deal/icons8.png" style="display:block; float:left; border: 1px solid #000;" /> 
				</form>
			</div>	
		</div>	
			
	</div> <!-- body -->
</body>
</html>