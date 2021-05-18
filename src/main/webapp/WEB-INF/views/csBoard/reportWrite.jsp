<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/aboutCsBoard/csBoard.css"/>
<%@ include file="/inc/sideBar.jspf" %>

<div class="cs_main">
	<%@ include file="/inc/csSide.jspf" %>
	<div class="cs_wrap">
		<div class="lgFnt">신고하기<span class="cs_title">고객님의 빠른 불편사항 해소를 위해 노력하겠습니다.</span></div>
		
		<p class="p_repWrite">고객님의 소중한 의견을 들려주세요.</p>
		<br/>
		<form method="post" action="cs_repOk" id="repFrm">
			<input type="text" id="num" name="num" maxlength="100" value=${num } /> <!-- 나중에 hidden으로 변경 -->
			<input type="text" id="rep_subject" name="rep_subject" maxlength="100" placeholder="제목을 입력해주세요"/>
			<textarea id="rep_content" name="rep_content" placeholder="신고사유를 입력해주세요"></textarea>
			<button class="commBtn">신고하기</button>
		</form>	
	</div>
</div>

<script>
	document.title="신고하기"
	
	$(function(){
		//유효성 검사
		$("#repFrm").submit(function(){
			if($("#num").val()=='' || $("#num").val()==null){
				alert("신고글 번호가 없습니다.");
				return false;
			}
			if($("#rep_subject").val()=='' || $("#rep_subject").val()==null){
				alert("신고글 제목입력은 필수입니다.");
				$("#rep_subject").focus();
				return false;
			}
			if($("#rep_content").val()=='' || $("#rep_content").val()==null){
				$("#rep_content").attr('placeholder', '* * * * * 신고사유는 필수입니다 * * * * *');
				$("#rep_content").focus();
				return false;
			}
			alert("신고접수가 완료되었습니다, 빠른 시일내에 처리하도록 노력하겠습니다.");
			return true;
		})
	})
</script>