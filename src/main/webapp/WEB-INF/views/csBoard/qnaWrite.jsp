<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/inc/sideBar.jspf" %>

<div class="cs_main">
	<%@ include file="/inc/csSide.jspf" %>
	<div class="cs_wrap">
		<div class="lgFnt">1:1 문의하기<span class="cs_title">고객님의 편의를 위해 빠른 답변을 남기도록 노력하겠습니다.</span></div>
		<ul class="listNone qnaSub">
			<li>▼&nbsp;잠깐, 질문하기 전에 혹시 찾아보셨나요?</li>
			<li><a href="oftenQna">자주하는 질문으로 가기</a>
		</ul>
		<p class="p_qnaWrite">고객님의 소중한 의견을 들려주세요.</p>
		<br/>
		<form method="post" action="cs_qnaOk" id="qnaFrm">
			<select id="csSearchKey" name="csSearchKey">
				<option>카테고리 선택</option>
				<option value="mem_qna">회원문의</option>
				<option value="bor_qna">게시판문의</option>
				<option value="pay_qna">결제/충전문의</option>
				<option value="pay_ship">배송문의</option>
				<option value="etc_qna">서비스이용 및 기타</option>
			</select><input type="text" id="cs_subject" name="cs_subject" maxlength="100" placeholder="제목을 입력해주세요(100자 이내)"/>
			<textarea id="cs_content" name="cs_content" placeholder="내용을 입력해주세요"></textarea>
			<button class="commBtn">문의 보내기</button>
		</form>	
	</div>
</div>

<script>
	document.title="1:1 문의하기"
	
	$(function(){
		//유효성 검사
		$("#qnaFrm").submit(function(){
			if($("#csSearchKey").val()=='' || $("#csSearchKey").val()==null){
				alert("카테고리를 선택해주세요");
				return false;
			}
			if($("#cs_subject").val()=='' || $("#cs_subject").val()==null){
				$("#cs_subject").attr('placeholder', '* * * * * 제목은 필수입니다 * * * * *');
				$("#cs_subject").focus();
				return false;
			}
			if($("#cs_content").val()==null || $("#cs_content").val()==''){
				$("#cs_content").attr('placeholder', '* * * * * 내용은 필수입니다 * * * * *');
				$("#cs_content").focus();
				return false;
			}
			return true;
		})
	})
</script>