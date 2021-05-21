<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commu/communityStyle.css"/>
	
	<script>
		$(".table tr:first-child>td:it(4)").css('color','blue');
	
	</script>
	
	<div id="commumain">
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
			<h3 style="margin-top:80px; margin-bottom:10px; text-align: left;">#커뮤니티 <span style="font-size:16px">| 지역구를 클릭하면 해당 지역 게시판으로 이동합니다.</span></h3>
			<div id="map">
				
				 <img src="img/commu/seoulMap.jpg" usemap="#seoulMap"/>
			</div>
			
			<hr style="background-color:#fff;"/>
			
			
			
			<div id="commuboard">
			
				<div id="localBoard">
					<h3>우리동네이야기</h3>
					<table class="table">
					  <tr>
					 	<th>&nbsp;</th>
					    <th>카테고리</th>
					    <th>지역</th>
					    <th>제목</th>
					    <th>작성자</th>
					    <th>작성일</th>
					    <th>조회수</th>
					    <th>추천수</th>
					  </tr>
					 <c:forEach var="vo" items="${commuBor}" varStatus="status">
					 			
							  <tr>
							  	<td>${status.count }</td>
							  	<c:if test="${vo.down_cate==1 }">
							    	<td>할인정보</td>
							    </c:if>
							    <c:if test="${vo.down_cate==2 }">
							    	<td>도움구해요</td>
							    </c:if>		
							    <td>${vo.b_gu }</td>
							    <td><a href="commuView?num=${vo.num}">${vo.b_subject }</a></td>
							    <td>${vo.userid }</td>
							    <td>${vo.b_writedate }</td>
							    <td>${vo.b_hit}</td>
							    <td> ${vo.numlike }</td>
							  </tr>
						  
					 </c:forEach>
					 
					</table>
				</div>	
				<div id="recipeBoard">
						<h3 style="display: inline;text-align: center;">쓱싹레시피</h3>
						<a href="commuRecipeBoard?up_cate=2" style="display:inline-block; float:right ;color:#808080;line-height: 60px; margin-bottom: -20px;"> 더보기 > </a>
					<table class="table">
						
						
						  <tr>
							<th>&nbsp;</th>
						    <th>제목</th>
						    <th>작성자</th>
						    <th>조회수</th>
						  </tr>
						  
						  <c:forEach var="vo" items="${recipe}" varStatus="status1">
							  <tr>
							  	<td>${status1.count }</td>
							    <td><a href="commuView?num=${vo.num}">${vo.b_subject }</a></td>
							    <td>${vo.userid }</td>
							    <td>${vo.b_hit }</td>
							  </tr>
						  
					 	</c:forEach>
					</table>
				</div>
				<div id="freeBoard">
					<h3 style="display: inline;text-align: center;">자유게시판</h3>
						<a href="commuFreeBoard?up_cate=3" style="display:inline-block; float:right ;color:#808080;line-height: 60px; margin-bottom: -20px;"> 더보기 > </a>
					<table class="table">
					
					  <tr>
					  	<th>&nbsp;</th>
					    <th>제목</th>
					    <th>작성자</th>
					    <th>조회수</th>
					  </tr>
					   <c:forEach var="vo" items="${free}" varStatus="status2">
							  <tr>
							  	<td>${status2.count }</td>
							    <td><a href="commuView?num=${vo.num}">${vo.b_subject }</a></td>
							    <td>${vo.userid }</td>
							    <td>${vo.b_hit }</td>
							  </tr>
						  
					 	</c:forEach>
					 
					</table>
				</div>
			
				
			
			</div>
		</div>




	<map name="seoulMap">
	
		<area shape="rect"  coords="185,305,260,345" href="commuBoard?b_gu=강서구&up_cate=1 "  title="강서구 | 게시글 : ${result[0] }  개"alt="강서구"/>
		<area shape="rect"  coords="235,400,310,440" href="commuBoard?b_gu=양천구&up_cate=1"  title="양천구 | 게시글 :  ${result[1] }개"alt="양천구"/>	
		<area shape="rect"  coords="330,408,405,448" href="commuBoard?b_gu=영등포구&up_cate=1"  title="영등포구 | 게시글 : ${result[2] } 개"alt="영등포구"/>
		<area shape="rect"  coords="412,445,487,485" href="commuBoard?b_gu=동작구&up_cate=1"  title="동작구 | 게시글 : ${result[3] } 개"alt="동작구"/>	
		<area shape="rect"  coords="405,530,480,570" href="commuBoard?b_gu=관악구&up_cate=1"  title="관악구 | 게시글 :  ${result[4] }개"alt="관악구"/>
		<area shape="rect"  coords="313,530,388,570" href="commuBoard?b_gu=금천구&up_cate=1"  title="금천구 | 게시글 : ${result[5] } 개"alt="금천구"/>
		<area shape="rect"  coords="230,460,305,500" href="commuBoard?b_gu=구로구&up_cate=1"  title="구로구 | 게시글 : ${result[6] } 개"alt="구로구"/>
		<area shape="rect"  coords="343,320,418,360" href="commuBoard?b_gu=마포구&up_cate=1"  title="마포구 | 게시글 : ${result[7] } 개"alt="마포구"/>
		<area shape="rect"  coords="390,270,465,310" href="commuBoard?b_gu=서대문구&up_cate=1"  title="서대문구 | 게시글 : ${result[8] } 개"alt="서대문구"/>
		<area shape="rect"  coords="382,177,457,217" href="commuBoard?b_gu=은평구&up_cate=1"  title="은평구 | 게시글 :  ${result[9] }개"alt="은평구"/>
		<area shape="rect"  coords="475,255,550,295" href="commuBoard?b_gu=종로구&up_cate=1"  title="종로구 | 게시글 :  ${result[10] }개" alt="종로구"/>
		<area shape="rect"  coords="470,375,545,415" href="commuBoard?b_gu=용산구&up_cate=1"  title="용산구 | 게시글 :  ${result[11] }개" alt="용산구"/>
		<area shape="rect"  coords="498,313,573,353" href="commuBoard?b_gu=중구&up_cate=1"  title="중구 | 게시글 : ${result[12] } 개" alt="중구"/>
		<area shape="rect"  coords="588,338,663,378" href="commuBoard?b_gu=성동구&up_cate=1"  title="성동구 | 게시글 :  ${result[13] }개" alt="성동구"/>
		<area shape="rect"  coords="608,268,683,308" href="commuBoard?b_gu=동대문구&up_cate=1"  title="동대문구 | 게시글 :${result[14] }  개" alt="동대문구"/>
		<area shape="rect"  coords="545,220,620,260" href="commuBoard?b_gu=성북구&up_cate=1"  title="성북구 | 게시글 : ${result[15] } 개" alt="성북구"/>
		<area shape="rect"  coords="535,130,610,170" href="commuBoard?b_gu=강북구&up_cate=1"  title="강북구 | 게시글 : ${result[16] } 개" alt="강북구"/>
		<area shape="rect"  coords="572 ,70,647,110" href="commuBoard?b_gu=도봉구&up_cate=1"  title="도봉구 | 게시글 :  ${result[17] }개" alt="도봉구"/>
		<area shape="rect"  coords="655,110,730,150" href="commuBoard?b_gu=노원구&up_cate=1"  title="노원구 | 게시글 :  ${result[18] }개" alt="노원구"/>
		<area shape="rect"  coords="684,235,759,275" href="commuBoard?b_gu=중랑구&up_cate=1"  title="중랑구 | 게시글 :  ${result[19] }개" alt="중랑구"/>
		<area shape="rect"  coords="670,345,745,385" href="commuBoard?b_gu=광진구&up_cate=1"  title="광진구 | 게시글 :  ${result[20] }개" alt="광진구"/>
		<area shape="rect"  coords="785,342,860,382" href="commuBoard?b_gu=강동구&up_cate=1"  title="강동구 | 게시글 :  ${result[21] }개" alt="강동구"/>
		<area shape="rect"  coords="525,500,600,540" href="commuBoard?b_gu=서초구&up_cate=1"  title="서초구 | 게시글 :  ${result[22] }개" alt="서초구"/>
		<area shape="rect"  coords="610,470,685,510" href="commuBoard?b_gu=강남구&up_cate=1"  title="강남구 | 게시글 :  ${result[23] }개" alt="강남구"/>
		<area shape="rect"  coords="720,440,795,480" href="commuBoard?b_gu=송파구&up_cate=1"  title="송파구 | 게시글 :  ${result[24] }개" alt="송파구"/>
	
	</map>
	
	
</body>
</html>