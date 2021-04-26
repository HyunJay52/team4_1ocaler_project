<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/aboutCsBoard/csBoard.css"/>
<%@ include file="/inc/sideBar.jspf" %>

<script>
	document.title="자주하는 질문";

</script>

<div class="cs_main">
	<%@ include file="/inc/csSide.jspf" %>
	<div class="cs_wrap">
		<p class="m_title">문의하기</p>
		<p class="d_title">문의하기전에 FAQ에서 좀 찾아보지그래? <a href="qna" class="d_title faqATag">자주하는질문 보러가기</a></p>
		<br>
		<p class="d_title">고객님의 소중한 의견을 들려주세요.</p>
		<br>
		<form method="post" action="" id="contactForm">
			<select id="searchKey">
				<option value="totalCate">통합검색</option>
				<option value="findCate">착한발견</option>
				<option value="townCate">동네직구</option>
				<option value="martCate">가치가장</option>
				<option value="eatCate">한끼미식회</option>
				<option value="localCate">우리동네 이야기</option>
				<option value="ssgCate">쓱싹레시피</option>
				<option value="freeCate">자유자게</option>
			</select><input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력해주세요"/><input type="submit" id="goSearch" value="검색"/> <span id="close">✕️</span>
			<textarea id="" name=""></textarea>
			<button class="q_btn green">문의 보내기</button>
		</form>	
	</div>
</div>
