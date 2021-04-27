<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ include file="/inc/sideBar.jspf"%>

<script>
	document.title = "자주하는 질문";
</script>

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
			<select id="oftenSearchKey" name="oftenSearchKey" class="cs_padding_left">
				<option>카테고리 선택</option>
				<option value="mem_qna">회원문의</option>
				<option value="bor_qna">게시판문의</option>
				<option value="pay_qna">결제/충전문의</option>
				<option value="pay_ship">배송문의</option>
				<option value="etc_qna">기타문의</option>
			</select>
			<input type="text" id="cs_subject" name="cs_subject" class="cs_padding_left" maxlength="100"
				placeholder="검색어를 입력해주세요" />
			<button class="commBtn often_btn">찾기</button>
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
				<tr class="question">
					<td class="number">1</td>
					<!--a href="javascript:showHideFaq()"  -->
					<td class="fa1_category">[회원문의]</td>
					<td class="faq_td"><strong>회원가입은 어떻게 하나요?</strong></td>
				</tr>
				<tr class="often_answer">
					<td class="answer_status">답변</td>
					<td class="answer_content" colspan="3">
						"친구들은 제가 상을 받는다고 했지만, 믿지 않았다. 인생을 오래 살아서, 배반을 많이 당해서 그런지 수상을 바라지 않았다"면서 여우조연상 후보에 함께 오른 '힐빌리의 노래' 글렌 클로스가 "진심으로 상을 타기를 바랐다"고 밝혔다.
						그는 "배우는 편안하게 좋아서 한 게 아니었다. 절실해서 연기를 했고, 정말 먹고 살려고 연기를 했다"며 "그냥 많이 노력했다"고 강조했다.
						그러면서 "민폐가 되지 않을 때까지 영화 일을 하면 좋겠다고 생각한다"고 계획을 전했다.
						윤여정은 아카데미를 비롯해 각종 시상식에서 수상할 때마다 좌중을 사로잡은 재치 있는 소감을 내놓은 것에 대해선 "제가 오래 살았고, 수다를 하다 보니 입담이 생겼다"고 말했다.
					</td>
				</tr>

				<!-- 임시로 넣은 정보 삭제예정-->
				<tr>
					<td>2</td>
					<td class="fa1_category">[배송문의]</td>
					<td class="faq_td"><strong>서울 이외의 지역에서 배송받을 수 있나요?</strong></td>

				</tr>
				<tr class="often_answer">
					<td class="answer_status">답변</td>
					<td class="answer_content" colspan="3">
						"친구들은 제가 상을 받는다고 했지만, 믿지 않았다. 인생을 오래 살아서, 배반을 많이 당해서 그런지 수상을 바라지 않았다"면서 여우조연상 후보에 함께 오른 '힐빌리의 노래' 글렌 클로스가 "진심으로 상을 타기를 바랐다"고 밝혔다.
						그는 "배우는 편안하게 좋아서 한 게 아니었다. 절실해서 연기를 했고, 정말 먹고 살려고 연기를 했다"며 "그냥 많이 노력했다"고 강조했다.
						그러면서 "민폐가 되지 않을 때까지 영화 일을 하면 좋겠다고 생각한다"고 계획을 전했다.
						윤여정은 아카데미를 비롯해 각종 시상식에서 수상할 때마다 좌중을 사로잡은 재치 있는 소감을 내놓은 것에 대해선 "제가 오래 살았고, 수다를 하다 보니 입담이 생겼다"고 말했다.					
					</td>
				</tr>

			</tbody>
		</table>
	</div>
</div>
<script>
	$(function() {
		//선택한 faq tr열고 닫히기    
		$("#oftenList .faq_td").click(function() {
			$(this).parent().next().toggle(
				function(){
					$(this).parent().next().addClass('show')
				},
				function(){
					$(this).parent().next().addClass('hide')
				}
			);
		});

	});
</script>