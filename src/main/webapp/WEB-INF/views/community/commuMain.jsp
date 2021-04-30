<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commu/communityStyle.css"/>
	
	<div id="main">
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
	
			<div id="map">
				 <img src="img/commu/seoulMap.jpg" usemap="#seoulMap"/>
			</div>
			
			<hr style="background-color:#fff;"/>
			
			<div id="board">
				<div id="localBoard">
					<p>우리동네이야기</p>
					<table class="table">
					  <tr>
					    <th>제목</th>
					    <th>작성자</th>
					    <th>조회수</th>
					  </tr>
					 <tr>
					    <td>신규회원</td>
					    <td>조장님</td>
					    <td>90</td>
					  </tr>
					  <tr>
					    <td>조장님 최고!</td>
					    <td>이민주</td>
					    <td>39</td>
					  </tr>
					  <tr>
					    <td>스타워보고싶다</td>
					    <td>사랑</td>
					    <td>80</td>
					  </tr>
					 
					</table>
				</div>
				
				<div id="recipeBoard">
					<p>쓱싹레시피</p>
					<table class="table">
					  <tr>
					    <th>제목</th>
					    <th>작성자</th>
					    <th>조회수</th>
					  </tr>
					  <tr>
					    <td>내용</td>
					    <td>내용</td>
					    <td>내용</td>
					  </tr>
					  <tr>
					    <td>고구마팝니다</td>
					    <td>고구마</td>
					    <td>1</td>
					  </tr>
					  <tr>
					    <td>내용</td>
					    <td>내용</td>
					    <td>내용</td>
					  </tr>
					 
					</table>
				</div>
				<div id="freeBoard">
					<p>자유게시판</p>
					<table class="table">
					  <tr>
					    <th>제목</th>
					    <th>작성자</th>
					    <th>조회수</th>
					  </tr>
					  <tr>
					    <td>내용</td>
					    <td>내용</td>
					    <td>내용</td>
					  </tr>
					  <tr>
					    <td>내용</td>
					    <td>내용</td>
					    <td>내용</td>
					  </tr>
					  <tr>
					    <td>내용</td>
					    <td>내용</td>
					    <td>내용</td>
					  </tr>
					 
					</table>
				</div>
			
			</div>
		</div>








	<map name="seoulMap">
<!-- 			<area shape="rect"  coords="235,404,297,444" href="#"  title="양천구"alt="양천구">	
			<area shape="rect"  coords="292,531,356,562" href="#"  title="양천구"alt="양천구">  -->
	
		<area shape="rect"  coords="185,305,260,345" href="commuBoard?b_gu=강서구 "  title="강서구"alt="강서구"/>
		<area shape="rect"  coords="235,400,310,440" href="commuBoard?b_gu=양천구"  title="양천구"alt="양천구"/>	
		<area shape="rect"  coords="330,408,405,448" href="commuBoard?b_gu=영등포구"  title="영등포구"alt="영등포구"/>
		<area shape="rect"  coords="412,445,487,485" href="commuBoard?b_gu=동작구"  title="동작구"alt="동작구"/>	
		<area shape="rect"  coords="405,530,480,570" href="commuBoard?b_gu=관악구"  title="관악구"alt="관악구"/>
		<area shape="rect"  coords="313,530,388,570" href="commuBoard?b_gu=금천구"  title="금천구"alt="금천구"/>
		<area shape="rect"  coords="230,460,305,500" href="commuBoard?b_gu=구로구"  title="구로구"alt="구로구"/>
		<area shape="rect"  coords="343,320,418,360" href="commuBoard?b_gu=마포구"  title="마포구"alt="마포구"/>
		<area shape="rect"  coords="390,270,465,310" href="commuBoard?b_gu=서대문구"  title="서대문구"alt="서대문구"/>
		<area shape="rect"  coords="382,177,457,217" href="commuBoard?b_gu=은평구"  title="은평구"alt="은평구"/>
		<area shape="rect"  coords="475,255,550,295" href="commuBoard?b_gu=종로구"  title="종로구" alt="종로구"/>
		<area shape="rect"  coords="470,375,545,415" href="commuBoard?b_gu=용산구"  title="용산구" alt="용산구"/>
		<area shape="rect"  coords="498,313,573,353" href="commuBoard?b_gu=중구"  title="중구" alt="중구"/>
		<area shape="rect"  coords="588,338,663,378" href="commuBoard?b_gu=성동구"  title="성동구" alt="성동구"/>
		<area shape="rect"  coords="608,268,683,308" href="commuBoard?b_gu=동대문구"  title="동대문구" alt="동대문구"/>
		<area shape="rect"  coords="545,220,620,260" href="commuBoard?b_gu=성북구"  title="성북구" alt="성북구"/>
		<area shape="rect"  coords="535,130,610,170" href="commuBoard?b_gu=강북구"  title="강북구" alt="강북구"/>
		<area shape="rect"  coords="572 ,70,647,110" href="commuBoard?b_gu=도봉구"  title="도봉구" alt="도봉구"/>
		<area shape="rect"  coords="655,110,730,150" href="commuBoard?b_gu=노원구"  title="노원구" alt="노원구"/>
		<area shape="rect"  coords="684,235,759,275" href="commuBoard?b_gu=중랑구"  title="중랑구" alt="중랑구"/>
		<area shape="rect"  coords="670,345,745,385" href="commuBoard?b_gu=광진구"  title="광진구" alt="광진구"/>
		<area shape="rect"  coords="785,342,860,382" href="commuBoard?b_gu=강동구"  title="강동구" alt="강동구"/>
		<area shape="rect"  coords="525,500,600,540" href="commuBoard?b_gu=서초구"  title="서초구" alt="서초구"/>
		<area shape="rect"  coords="610,470,685,510" href="commuBoard?b_gu=강남구"  title="강남구" alt="강남구"/>
		<area shape="rect"  coords="720,440,795,480" href="commuBoard?b_gu=송파구"  title="송파구" alt="송파구"/>
	
	</map>
	
	
</body>
</html>