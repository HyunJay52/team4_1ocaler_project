<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<script>
	document.title = "about us";
	
	window.onscroll=function(){bannerMove()};
	   
	function bannerMove(){
	  	var scrollY = window.scrollY;
	      
// 		if(scrollY>=400 || scrollY<=500){ // 스크롤 높이가 400
// 			console.log("??????")
// 			$("#abtVideo").slideUp(1000, function(){
// 				$("#abtVideo").css("display", "block");
// 			})
// 			//$("#abtVideo").slideUp(1000);
// 		}
	}
      
</script>
<div class="aboutDiv">
	<div id="introDetail">
		<div>1ocal+er 프로젝트 시작</div>
		<div><img src="<%=request.getContextPath() %>/img/aboutImg/window1.jpg"/></div>
		<div id="abtIntro">
				???????
				?????????????
				1인가구 만얼;ㅣ
				
		</div>
		
		<div class="abtVideo">
			<video src="<%=request.getContextPath() %>/img/aboutImg/dining.mp4" width="800px" height="600px" class="abtVideo" preload="none" autoplay muted loop></video>
		</div>
		<div class="exHow">
			<span>HOW?</span><br/>
				지역기반 1인가구 플랫폼을 이웃사촌...
				ㅎㅎㅎ 
		</div>
	</div>

	<table id="introTbl">
		<tbody>
			<tr>
				<td colspan="5">TEAM "PURBLIC"</td>
			</tr>
			<tr>
				<td><img src="<%=request.getContextPath() %>/img/aboutImg/dragonw.png"/></td>
				<td><img src="<%=request.getContextPath() %>/img/aboutImg/hj.png"/></td>
				<td><img src="common/user.png"/></td>
				<td><img src="<%=request.getContextPath() %>/img/aboutImg/jisu.jpeg"/></td>
				<td><img src="<%=request.getContextPath() %>/img/aboutImg/heey.jpeg"/></td>
			</tr>
			<tr id="tblName">
				<td>김용우</td>
				<td>김현정</td>
				<td>이용섭</td>
				<td>이지수</td>
				<td>신희연</td>
			</tr>
			<tr>
				<td colspan="5" class="tblRole">ROLE</td>
			</tr>
			<tr id="tblRole">
				<td>가치가장</td> <!-- 리스트로? -->
				<td>메인</td>
				<td>내정보</td>
				<td>관리자</td>
				<td>게시판</td>
		</tbody>
	</table>

</div>


