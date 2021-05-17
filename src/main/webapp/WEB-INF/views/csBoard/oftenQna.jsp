<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ include file="/inc/sideBar.jspf"%>


<div class="cs_main">
	<%@ include file="/inc/csSide.jspf"%>
	<!-- 가운데 메인 div -->
	<div id="oftenCenter" class="cs_wrap">
		<div class="lgFnt">
			자주하는 질문<span class="cs_title">고객님들께서 가장 자주하는 질문을 모았습니다.</span>
		</div>
		<ul class="listNone qnaSub">
			<li>▼&nbsp;원하시는 답변을 찾지 못하셨나요?</li>
			<li><a href="qnaWrite">1:1 문의하기로 가기</a>
		</ul>
		<!-- 검색하기 -->
		<div id="often_searchDiv">
			<select id="oftenSearchKey" name="oftenSearchKey" id="ofKey" class="cs_padding_left">
				<option value="none">카테고리 선택</option>
				<option value="회원문의">회원문의</option>
				<option value="게시판문의">게시판문의</option>
				<option value="충전문의">결제/충전문의</option>
				<option value="배송문의">배송문의</option>
				<option value="기타문의">기타문의</option>
			</select>
			<input type="text" id="cs_subject" name="ofWord" class="cs_padding_left" maxlength="100"
				placeholder="검색어를 입력해주세요" />
			<button class="commBtn often_btn" id="often_btn">찾기</button>
		</div>
		<table id="oftenTbl">
			<!-- 테이블 헤더-->
			<thead>
				<tr>
					<th>번호</th>
					<th>문의사항</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody id="oftenList">
			<!-- 반복물 실행하기 -->
				<c:forEach var="list" items="${ofq }" varStatus="status">
					<tr class="question">
						<td class="number">${status.count }</td>
						<!--a href="javascript:showHideFaq()"  -->
						<td class="fa1_category">${list.of_cate }</td>
						<td class="faq_td"><strong>${list.of_subject }</strong></td>
						<td><input type="hidden" name="of_num" value="${list.of_num }"/></td>
					</tr>
					<tr class="often_answer">
						<td class="answer_status">답변</td>
						<td class="answer_content" colspan="3">${list.of_content }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>


<script>
	document.title = "자주하는 질문";
	
	$(function() {
		$(document).on('click', '#often_btn', function(){
			var key = $('select[name=oftenSearchKey]').val();
			var word = $('#cs_subject').val();
			
			console.log(key, "----", word)
			
			if($("#oftenSearchKey").val()=='none' || $("#oftenSearchKey")==null){
				alert("카테고리 선택은 필수입니다.");
				$("#oftenSearchKey").focus();
				return false;
			}
			
			if($("#cs_subject").val()==null || $("#cs_subject")==''){
				alert("검색어 입력은 필수입니다.");
				$("#cs_subject").focus();
				return false;
			}
			
			var url = "csBoard/searchofteqna";
			var param = "key="+key+"&word="+word;
			$.ajax({
				url: url,
				data: param,
				success: function(list){
					var $list = $(list);
					console.log(list);
					var tag='';
					var cnt = 1;
					$list.each(function(idx, list){
							tag += '<tr class="question">'+
								'<td class="number">'+ cnt++ +'</td>'+
								'<td class="fa1_category">'+list.cs_cate +'</td>'+
								'<td class="faq_td"><strong>'+list.cs_subject +'</strong></td>'+
								'<td><input type="hidden" name="of_num" value="'+list.cs_num +'"/></td>'+
							'</tr>'	+
						
							'<tr class="often_answer">'+
								'<td class="answer_status">답변</td>'+
								'<td class="answer_content" colspan="3">'+list.cs_content +'</td>'+
							'</tr>';
						
					})
					$("#oftenList").html(tag); //html으로 반복문을 찍으면 제일 마지막꺼만 찍히니까, tag에 추가하고 한 번에 추가해주기
				},
				error: function(error){
					console.log(error)
					alert("검색이 실행되지 않았습니다. 다시 검색해주세요.")
				}
			});
		});
		
		//선택한 faq tr열고 닫히기
		$(document).on('click', '#oftenList .faq_td', function() {
			var data = $(this).next().children('input').val();
			
			$(this).parent().next().toggle(
				'fast',
				function(){
					var url = 'csBoard/oftenqnacnt';
					var param = 'of_num='+data;
					$.ajax({
						url: url,
						data: param,
						success: function(result){
							//조회수 올리기 용
						}, 
						error: function(error){
							console.log(error)	
						}
					});
					
					$(this).parent().next().addClass('hide')
				}
			);
		});
		
	});
</script>
