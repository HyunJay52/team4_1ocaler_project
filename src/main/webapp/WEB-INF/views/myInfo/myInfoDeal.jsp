<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		//collape in
		//버튼선택 이벤트
		$(document).on('click', '#myDealTbl tr>td>button', function(){
			$('#myDealTbl tr>td>div').attr('class', 'myDealMem collapse');
			$(this).next().attr('class', 'collape in myDealMem');

		});
		
		//드롭박스 이벤트
		$(document).on('click', '#myDealTbl tr>td>div>ul>li>button', function(){
			$(this).parent().parent().parent().attr('class', 'collapse');
			$(this).parent().parent().parent().prev().text($(this).text());
		});

		//리스트 세팅
		function setList(){
			var item = ['김회원','박회원','최회원'];

			for(var i = 0; i < 10; i++){
				var tag = "<tr>"; 
				tag += "<td>2021.04.21</td>";
				tag += "<td>상수역에서 10kg 고구마 소분하실 분?</td>";
				tag += "<td><button class='btn btn-light btn-outline-dark btn-block myDealBtn' data-toggle='collapse'>선택&nbsp;&nbsp;</button>";
				
				tag += "<div class='myDealMem collapse'><ul>";			
				for(var j = 0; j < 3; j++){
					tag += "<li><button class='btn btn-light btn-block' data-target='#myDealMd' data-toggle='modal'>"+item[j]+"</button></li>";
					
				}
				tag += "</ul></div></td>";
				tag += "<td>리뷰완료</td>";
				tag += "</tr>";
				$("#myDealTbl").append(tag);
			}
			
		}
		setList();
		
		//다른곳 클릭시 드롭박스 닫기
		$("body").click(function(){
			$('#myDealTbl tr>td>div').attr('class', 'myDealMem collapse');
		});
		
		$("#myDealToggle>button").click(function(){
			$("#myDealToggle>button").css('background-color', '#fff').css('color', '#3f1785').attr('value', null);
			$(this).css('background-color', '#3f1785').css('color', '#fff').attr('value', 'select');
			
		});
		
		//리뷰버튼 클릭이벤트
		$("#myDealTbl button").click(function(){
			var title = $(this).text()+"님과의 거래가 어떠셨나요 ?";
			$(".modal-title").text(title);
			console.log($(this).text());
			
		});
		
		//모달 닫힘 이벤트
		$("#myDealMd").on('hidden.bs.modal', function(e){
			$(".reviewBody textarea").val("");
		});
		
		//리뷰 클릭이벤트
		$(".imgBtn").click(function(){
			$(".imgBtn").attr('value' , null);
			$(this).attr('value', '1');
		});
		
		//검색 이벤트 
		$(".searchArea>input[type=button]").click(function(){
			var searchWord = $(this).prev().val();
			$(this).prev().val("");
			console.log(searchWord);
		});
		
		//////////////////////
		
	});
</script>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h3>회원간거래</h3>
		<div class="dealTop">
			<div class="dealInfo">
				<img src="img/myInfo/saver.gif"/>
				<div class="infoList">
					<h3>김자바</h3>
					<ul>
						<li>참여(10)</li>
						<li>모집(5)</li>
						<li>직거래(3)</li>
						<li>방문(31)</li>
						<li>내글(5)</li>
						<li>댓글(21)</li>
						<li>좋아요(21)</li>
					</ul>
				</div>
				<input type="button" class="btn dealBtn btn-outline-dark" value="Send Message"/>
				<input type="button" class="btn dealBtn btn-outline-dark" value="Info"/>
			</div>
		</div>
		<div class="dealBottom">
			<div id="myDealToggle">
				<button class="btn commBtn btn-outline-dark">참여한</button>
				<button class="btn commBtn btn-outline-dark">개설한</button>
			</div>
			<div class="dealDateForm">
				<input type="date" min="2021-01-01" max="2021-05-31" class="date"/>
				<div class="myDealFrm"><button class="dayBtn prev">《</button><button class="dayBtn setMonth mdFnt"></button><button class="dayBtn next">》</button></div>
				<input type="date" min="2021-01-01" max="2021-05-31"/> ~ 
				<input type="date" min="2021-01-01" max="2021-05-31"/>
			</div>
			<table class="myinfoTable2" id="myDealTbl">
				<tr>
					<td>날짜</td>
					<td>제목</td>
					<td>회원선택</td>
					<td>리뷰상태</td>
				</tr>
				<tr>
					<td>2021.04.20</td>
					<td>마포역 3kg 세제2+1 같이 사실 분?</td>
					<td><button class="btn btn-block btn-outline-dark" data-target='#myDealMd' data-toggle='modal'>회원4</button></td>
					<td>1/3완료</td>
				</tr>
			</table>
			<div class="searchArea">
				<input type="text" name="searchWord"/>
				<input type="button" value="검색"/>
			</div>
		</div>
	</div>
		<div class="modal fade" id="myDealMd">
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