<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(()=>{
		$(".myInfoReviewManagementTable>ul>li").click(function(){
			console.log("event");
			$(this).parent().next().toggle(
					function(){
						$(this).next().css('display', 'block');
					},
					function(){
						console.log("none event");
						$(this).next().css('display', 'none');
					}
				);
			
		});
	});

</script>
<%@ include file="/inc/sideBar.jspf" %>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h2>리뷰 관리</h2>
		<div class="myInfoProductManagementTop">
			<div class="productManagementLabelForm" style="height:120px">
				<ul class="productManagementLabel">
					<li><label>기간선택</label></li>
					<li><label>검색</label></li>					
				</ul>
				<div class="productManagementLabelCenter" style="height:0">
					<div class="productManagementLabelCenterDiv">
						<input type="date" value="2021-03-01"/>~
						<input type="date" value="2021-05-31"/>
					</div>
					<div class="productManagementLabelCenterDiv">
						<input type="text" name="search"/>
						<input type="button" value="검색" class="btn commBtn productManagementBtn"/>
					</div>				
				</div>				
			</div>
		</div>
		<div class="myInfoReviewManagementBottom">
			<ul class="myInfoReviewManagementTableHeader">
				<li>평가</li>
				<li>판매글</li>
				<li>전체구매자수</li>
				<li>리뷰남긴 회원 수</li>
				<li>판매종료일</li>
			</ul>
			<div class="myInfoReviewManagementTable">	
				<ul>
					<li class="mdFnt info-font-weight"><img src="img/myInfo/slider/heartBigsize.png"/><label class="myInfoReviewManagementLabel">89%</label></li>
					<li class="info-font-weight">청년농부 나주배</li>
					<li>123 명</li>
					<li>93 명</li>
					<li>2021.04.01</li>
				</ul>
				<div class="myInfoReviewManagementTableReview">
					<ul>
						<li><img src="img/myInfo/slider/heartBigsize.png"/></li>
						<li><span class="info-font-weight">user123</span></li>
						<li class="wordCut">상태 뿐만 아니라 맛도 최고여서 선물하고 보람이 있었습니다. 다음에 또 오픈 해주셨으면 좋겠습니다.</li>
						<li><input type="button" class="btn commBtn" value="답글달기"/></li>
							
						<li><img src="img/myInfo/slider/heartBigsize.png"/></li>
						<li><span class="info-font-weight">user123</span></li>
						<li class="wordCut">상태 뿐만 아니라 맛도 최고여서 선물하고 보람이 있었습니다. 다음에 또 오픈 해주셨으면 좋겠습니다.</li>
						<li><input type="button" class="btn commBtn" value="답글달기"/></li>	
														
						<li><img src="img/myInfo/slider/heartBigsize.png"/></li>
						<li><span class="info-font-weight">user123</span></li>
						<li class="wordCut">상태 뿐만 아니라 맛도 최고여서 선물하고 보람이 있었습니다. 다음에 또 오픈 해주셨으면 좋겠습니다.</li>
						<li><input type="button" class="btn commBtn" value="답글달기"/></li>					
					</ul>
				</div>
			</div>
			<div class="myInfoReviewManagementTable">
				<ul>
					<li class="mdFnt info-font-weight"><img src="img/myInfo/slider/heartLightBigsize.png"/><label class="myInfoReviewManagementLabel">59%</label></li>
					<li class="info-font-weight">청년농부 나주배</li>
					<li>123 명</li>
					<li>93 명</li>
					<li>2021.04.01</li>
				</ul>
				<div class="myInfoReviewManagementTableReview">
					<ul>
						<li><img src="img/myInfo/slider/heartBigsize.png"/></li>
						<li><span class=" info-font-weight">user123</span></li>
						<li class="wordCut">상태 뿐만 아니라 맛도 최고여서 선물하고 보람이 있었습니다. 다음에 또 오픈 해주셨으면 좋겠습니다.</li>
						<li><input type="button" class="btn commBtn" value="답글달기"/></li>
							
						<li><img src="img/myInfo/slider/heartBigsize.png"/></li>
						<li><span class=" info-font-weight">user123</span></li>
						<li class="wordCut">상태 뿐만 아니라 맛도 최고여서 선물하고 보람이 있었습니다. 다음에 또 오픈 해주셨으면 좋겠습니다.</li>
						<li><input type="button" class="btn commBtn" value="답글달기"/></li>	
														
						<li><img src="img/myInfo/slider/heartBigsize.png"/></li>
						<li><span class=" info-font-weight">user123</span></li>
						<li class="wordCut">상태 뿐만 아니라 맛도 최고여서 선물하고 보람이 있었습니다. 다음에 또 오픈 해주셨으면 좋겠습니다.</li>
						<li><input type="button" class="btn commBtn" value="답글달기"/></li>					
					</ul>
				</div>
			</div>				
			<div class="myInfoReviewManagementTable">
				<ul>
					<li class="mdFnt info-font-weight"><img src="img/myInfo/slider/heartBigsize.png"/><label class="myInfoReviewManagementLabel">89%</label></li>
					<li class="info-font-weight">청년농부 나주배</li>
					<li>123 명</li>
					<li>93 명</li>
					<li>2021.04.01</li>
				</ul>
				<div class="myInfoReviewManagementTableReview">
					<ul>
						<li><img src="img/myInfo/slider/heartBigsize.png"/></li>
						<li><span class=" info-font-weight">user123</span><br/>(2021.03.31)</li>
						<li class="wordCut">상태 뿐만 아니라 맛도 최고여서 선물하고 보람이 있었습니다. 다음에 또 오픈 해주셨으면 좋겠습니다.</li>
						<li><input type="button" class="btn commBtn" value="답글달기"/></li>
							
						<li><img src="img/myInfo/slider/heartBigsize.png"/></li>
						<li><span class=" info-font-weight">user123</span></li>
						<li class="wordCut">상태 뿐만 아니라 맛도 최고여서 선물하고 보람이 있었습니다. 다음에 또 오픈 해주셨으면 좋겠습니다.</li>
						<li><input type="button" class="btn commBtn" value="답글달기"/></li>	
														
						<li><img src="img/myInfo/slider/heartBigsize.png"/></li>
						<li><span class=" info-font-weight">user123</span></li>
						<li class="wordCut">상태 뿐만 아니라 맛도 최고여서 선물하고 보람이 있었습니다. 다음에 또 오픈 해주셨으면 좋겠습니다.</li>
						<li><input type="button" class="btn commBtn" value="답글달기"/></li>					
					</ul>
				</div>
			</div>			
		</div>
	</div>
</div>