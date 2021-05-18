<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commu/communityBoardStyle.css"/>


	<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
	<%@ include file="/inc/commuHeader.jspf" %> <!-- 사이드 메뉴 include -->
	<div id="coummuBoardMain">
		
	
						
		<h3 style="margin-top:50px;">#우리동네이야기 <span style="font-size:16px">| 동네 주민들과 여러 정보를 나눠보아요</span></h3>
		

		<div id="coummuBoardMaincenter">
		
				<table cellpadding="0" cellspacing="0" style="width:1300px ;height: 300px;" class="table">
					<tbody>
						<tr height="41px">
							<th>카테고리</th>
							<th>제목</th>
							<th>아이디</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>좋아요</th>
						</tr>	
						
						<c:forEach var="vo" items="${commuList }">
						<tr>
							<c:if test="${vo.down_cate == 1 }">
								<td>
									할인정보
								</td>
							</c:if>
							<c:if test="${vo.down_cate == 2 }">
								<td>
									도움구해요
								</td>
							</c:if>
							
						
							<td style="float: left ;line-height: 14px;">
								<a href="commuView?num=${vo.num}">${vo.b_subject} 
									<span style="font-weight: bold;"> [${vo.repcont}]</span>
								</a> 
									&nbsp;
									
								<c:if test="${vo.newDate==0 }">	
									<div id="newImg">N</div>
								</c:if>
							</td>
							<td>${vo.userid}</td>
							<td>${vo.b_writedate}</td>
							<td>${vo.b_hit}</td>
							<td>${vo.numlike }</td>
						</tr>
						<tr style="text-align: left; padding-right: 20px;font-size: 12px;color:gray;">
							<td colspan="6" style="height: 10px;padding: 0px;padding-top: 0px;">${vo.b_tag }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			
			
		
			
		</div>
				
		<ul id="MBPaging">
               <li>이전</li>
               <li>1</li>
               <li>2</li>
               <li>3</li>
               <li>4</li>
               <li>5</li>
               <li>다음</li>
            </ul>	
		
			
		<div>
			<a href="commuWrite?up_cate=${vo.up_cate}"  class="btn wriBtn"  style="float:right;font-color: #181b46;"> 글쓰기</a>
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