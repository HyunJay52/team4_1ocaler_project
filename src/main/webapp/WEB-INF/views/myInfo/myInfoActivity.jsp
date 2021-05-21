<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		function setBoardList(num, kategorie){
			console.log($("#myBoardListForm").serialize());
			$.ajax({
				url : "selectMyBoard",
				data : $("#myBoardListForm").serialize()+"&nowNum="+num,
				success : function(result){
					console.log(result);
					var tag = "<tr><td><input type='checkbox' class='allCheckboxSelect'/></td>";
						if(kategorie == 'board'){
							tag += "<td>날짜</td><td>분류</td><td>제목</td><td>내용</td><td>조회수</td><td>댓글수</td></tr>";
						}else if(kategorie == 'reply'){
							tag += "<td>날짜</td><td>분류</td><td>글제목</td><td>댓글내용</td><td>조회수</td><td>댓글수</td></tr>";
						}else if(kategorie == 'qna'){
							tag += "<td>문의날짜</td><td>판매자</td><td>상품제목</td><td>문의내용</td><td>공개여부</td><td>상태</td></tr>";
						}
					var index = 0;
						result.list.forEach(function(data, idx){
							tag += "<tr><td><input type='checkbox'/></td>";
							if(kategorie == 'board'){
								tag += "<td>"+data.b_writedate+"</td>";
								if(data.up_cate == 1){//동내정보
									tag += "<td>동내정보</td>";
								}else if(data.up_cate == 2){//쓱싹레시피
									tag += "<td>쓱싹레시피</td>";
								}else{//자유자게
									tag += "<td>자유자게</td>";
								}
								tag += "<td><a href='commuView?num="+data.num+"'>"+data.b_subject+"</a></td>";
								tag += "<td>"+data.b_content+"</td>";
								tag += "<td>"+data.b_hit+"</td>";
								tag += "<td>"+data.reply+"</td>";
								
							}else if(kategorie == 'reply'){
								tag += "<td>"+data.rep_date+"</td>";
								if(data.up_cate == 1){//동내정보
									tag += "<td>동내정보</td>";
								}else if(data.up_cate == 2){//쓱싹레시피
									tag += "<td>쓱싹레시피</td>";
								}else{//자유자게
									tag += "<td>자유자게</td>";
								}
								tag += "<td><a href='commuView?num="+data.num+"'>"+data.b_subject+"</a></td>";
								tag += "<td>"+data.rep_content+"</td>";
								tag += "<td>"+data.b_hit+"</td>";
								tag += "<td>"+data.reply+"</td>";
								
							}else if(kategorie == 'qna'){
								tag += "<td>"+data.q_writedate+"</td>";
								tag += "<td>"+data.sellerid+"</td>";
								tag += "<td>"+data.i_subject+"</td>";
								tag += "<td>"+data.q_content+"</td>";
								if(data.q_status == 1){
									tag += "<td>공개</td>";									
								}else{
									tag += "<td>비공개</td>";									
								}
								if(data.q_answer != null){
									tag += "<td><button class='btn btn-primary'>답변완료</button></td>";									
								}else{
									tag += "<td>답변없음</td>";
								}
							
								
								
								
							}
							tag += "</tr>";
							index = idx;
						});
						
						if(index < 7){
							for(var i = index; i < 7; i++){
								tag += "<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>";
							}							
						}
						
					$("#activityTbl").html(tag);	
					setMyinfoBoardPaging(result.pVO);
				}, error : function(e){
					console.log("error");
				}
				
			});
			
		}
		setBoardList(1, 'board');
		
		//체크박스 이벤트
		var checkbox = false;
		$(document).on('click', ".allCheckboxSelect", function(){
			if(checkbox == false){
				$("input:checkbox").prop('checked', true);				
				checkbox = true;
			}else{
				$("input:checkbox").prop('checked', false);				
				checkbox = false;
			}
		});
		
		//검색버튼 이벤트
		$("#boardSearchBtn").click(function(){
			var kategorie = $("#activitySelectbox option:checked").val();
			console.log("kategorie="+kategorie);
			setBoardList(1, kategorie);
		});
		
		//페이징
		function setMyinfoBoardPaging(pVO){
			console.log(pVO);
			console.log("상품페이징 시작")
			$("#myinfoBoardPagingArea").html("");
			var tag = '<ul class="pagination justify-content-center">';
			if(pVO.nowNum > 1){
				tag += '<li class="page-item"><button value="'+(pVO.nowNum-1)+'" class="page-link">Prev</button></li>';					
			}else{
				tag += '<li class="page-item disabled"><button class="page-link">Prev</button></li>';				
			}
			for(var p = pVO.startPage; p < pVO.startPage + pVO.onePageSize; p++){
				if(p <= pVO.totalPage){
					if(p == pVO.nowNum){
						tag += '<li class="page-item active"><button class="page-link" value="'+p+'">'+p+'</button></li>';						
					}else{
						tag += '<li class="page-item"><button class="page-link" value="'+p+'">'+p+'</button></li>';						
					}
				}	
			}
			if(pVO.nowNum == pVO.totalPage){
				tag += '<li class="page-item disabled"><button class="page-link">Next</button></li>';				
			}else{
				tag += '<li class="page-item"><button value="'+(pVO.nowNum+1)+'" class="page-link">Next</button></li>';				
			}
			tag += "</ul>";
			$("#myinfoBoardPagingArea").append(tag);
		}
		
		//체크박스 변경이벤트
		$("#activitySelectbox").change(function(){
			var val = $(this).val();
			console.log(val);
			if(val == "reply"){
				var tag = "<option value='rep_content'>댓글내용</option>";				
				
			}else if(val == "board"){
				var tag = "<option value='b_subject'>제목</option>";
					tag += "<option value='b_content'>내용</option>";
					
			}else if(val == "qna"){
				var tag = "<option value='i_subject'>상품제목</option>";
					tag += "<option value='q_content'>질문내용</option>";
					tag += "<option value='q_answer'>답변</option>";
					
			}
			$("#boardSearchKey").html(tag);
		});
		
		//페이징 이벤트
		$(document).on('click', "#myinfoBoardPagingArea>ul>li>button", function(){
			console.log("페이지 번호="+$(this).val());
			var num = $(this).val();
			var kategorie = $("#activitySelectbox option:checked").val();

			setBoardList(num, kategorie);
		});
		
	});
</script>
	
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h3>나의 활동</h3>
		<div class="dealTop">
			<div class="dealInfo">
				<img src="img/myInfo/saver.gif"/>
				<div class="infoList">
					<div class="infoListHeader">
						<h3>${vo.mem_name}</h3>
						<input type="button" class="btn dealBtn btn-outline-dark" value="Send Message"/>
						<a href="myInfoCheck"><input type="button" class="btn dealBtn btn-outline-dark" value="Info"/></a>
					</div>
					<ul style="font-weight:bold;">
						<li>참여</li>
						<li>모집</li>
						<li>직거래</li>
						<li>방문</li>
						<li>내글</li>
						<li>댓글</li>
						<li>좋아요</li>
					</ul>
					<ul>
						<li>${vo.joinus}</li>						
						<li>${vo.grouplocal}</li>
						<li>${vo.mem_share }</li>
						<li>${vo.logcount}</li>
						<li>${vo.board}</li>
						<li>${vo.reply}</li>
						<li>${vo.likeit}</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="dealBottom">
		<form method="post" id="myBoardListForm" onsubmit="return false;">
			<div class="activityRight">
				<input type="button" id="myBoardDelete" class="btn btn-outline-danger" value="삭제"/>
				<div class="myActivityForm">
					<input type="date" name="searchDate" value="2021-03-01" min="2021-03-01" max="2021-05-31"/> ~ 
					<input type="date" name="searchDate2" value="2021-05-31" min="2021-03-01" max="2021-05-31"/>
					<div class="activitySelect">
						<select name="kategorie" id="activitySelectbox">
							<option value="board" selected>나의 작성글</option>
							<option value="reply">나의 댓글</option>
							<option value="qna">나의 Q&A</option>
						</select>
					</div>
				</div>
				
				<table class="myinfoTable2" id="activityTbl">
					<tr>
						<td><input type="checkbox" class="allCheckboxSelect"/></td>
						<td>날짜</td>
						<td>분류</td>
						<td>제목</td>
						<td>조회수</td>
						<td>댓글수</td>
					</tr>
					
				</table>
				<div id="myinfoBoardPagingArea">
					
				</div>
				<div class="searchArea">
					<select name="searchKey" id="boardSearchKey" style="height:30px;">
						<option value="b_subject">제목</option>
						<option value="b_content">내용</option>
					</select>
					<input type="text" name="searchWord"/>
					<input type="button" value="검색" id="boardSearchBtn"/>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>