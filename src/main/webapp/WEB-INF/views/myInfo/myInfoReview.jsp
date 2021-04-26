<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		//리뷰버튼 클릭이벤트
		$(".mainContainer a").click(function(){
			var title = $(this).text()+"의 상품이 어떠셨나요 ?";
			$(".modal-title").text(title);
			console.log($(this).text());
			
		});
	});
</script>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h3>리뷰 관리<span class="smlFnt"> 리뷰작성은 구매 확정 후 한달 내로 작성하실 수 있습니다.</span></h3>
		<div class="reviewTop">
			<div class="reviewLeft">
			<h5>회원리뷰</h5>
			<table class="myinfoTable2">
				<tr>
					<td class="wordCut">제목<br/>(아이디)</td>
					<td>날짜</td>
					<td>리뷰</td>
				</tr>
				<tr>
					<td class="wordCut"><a href="" data-target='#reviewMd' data-toggle='modal'>송정역 배추 나눔하실분</a><br/>test</td>
					<td>2021.04.25</td>
					<td><button class="btn btn-light">리뷰쓰기</button></td>
				</tr>
				</table>
			</div>
				<div class="reviewRight">
				<h5>상품리뷰</h5>
				<table class="myinfoTable2">
					<tr>
						<td class="wordCut">제목<br/>(아이디)</td>
						<td>날짜</td>
						<td>리뷰</td>
					</tr>
					<tr>
						<td class="wordCut"><a href="">송정역 배추 나눔하실분</a><br/>test</td>
						<td>2021.04.25</td>
						<td><button class="btn btn-light">리뷰쓰기</button></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="reviewBottom">
			<div class="dealDateForm">
				<input type="date" min="2021-01-01" max="2021-05-31" class="date"/>
				<div class="dateFrm"><button class="dayBtn prev">《</button><button class="setMonth dayBtn mdFnt"></button><button class="dayBtn next">》</button></div>
				<input type="date" min="2021-01-01" max="2021-05-31"/> ~ 
				<input type="date" min="2021-01-01" max="2021-05-31"/>
			</div>
			<div class="reviewSearchArea">
				<input type="text" name="searchWord"/>
				<input type="button" value="검색"/>
			</div>
			<div class="reviewList">
			<table class="myinfoTable2">
					<tr>
						<td>구분</td>
						<td>상태</td>					
						<td class="wordCut">제목<br/>아이디</td>
						<td class="wordCut">내용</td>
						<td>날짜</td>
						<td>수정</td>
					</tr>
					<tr>
						<td>직거래</td>
						<td><img src="img/myInfo/myDeal/reviewHeart2.png"/></td>
						<td class="wordCut"><a href="">청년농장 콜라비 3kg</a><br/>test</td>
						<td class="wordCut">저렴하게 잘 구매했습니다</td>
						<td>2021-04-25</td>
						<td><button class="btn">수정</button></td>
					</tr>
					<tr>
						<td>직거래</td>
						<td><img src="img/myInfo/myDeal/reviewHeart2.png"/></td>
						<td class="wordCut"><a href="">청년농장 콜라비 3kg</a><br/>test</td>
						<td class="wordCut">저렴하게 잘 구매했습니다</td>
						<td>2021-04-25</td>
						<td><button class="btn">수정</button></td>
					</tr>
					<tr>
						<td>직거래</td>
						<td><img src="img/myInfo/myDeal/reviewHeart2.png"/></td>
						<td class="wordCut"><a href="">청년농장 콜라비 3kg</a><br/>test</td>
						<td class="wordCut">저렴하게 잘 구매했습니다</td>
						<td>2021-04-25</td>
						<td><button class="btn">수정</button></td>
					</tr>
			</table>
			</div>
		</div>
	</div>
	<div class="modal fade" id="reviewMd">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header reviewHeader">
				<h4 class="modal-title"></h4>

				</div>
				<div class="modal-body reviewBody">
					<ul>
						<li><img src="img/myInfo/myDeal/reviewHeart.png"/></li>
						<li><img src="img/myInfo/myDeal/reviewHeart2.png"/></li>
						<li><button class="btn lgFnt btn-outline-light btn-lg imgBtn" title="like">또 참여할래요</button></li>
						<li><button class="btn lgFnt btn-outline-light btn-lg imgBtn" title="hate">음, 글쎄요</button></li>
						<li>
							<textarea class="dealTextarea mdFnt" name="review" placeholder="당신의 후기가 다른 사람에게 큰 도움이 됩니다"></textarea>
						</li>
						<li><input type="file" name="file"/></li>
						<li><button class="btn btn-outline-dark btn-lg" data-dismiss="modal">다음에 할게요</button>
							<button class="btn btn-outline-dark btn-lg">작성완료</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>