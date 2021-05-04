<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/main.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script>
	$(function(){
		$(".smallbtn").click(function(){
			var cs_num = $(this).attr('title');
			location.href="persnal?cs_num="+cs_num;
		});
	});
</script>
<div class="main">
	<div class="title">일일현황</div>
	<div id="cirdiv">
		<div class="cir1">신규회원<br/><b>25</b></div>
		<div class="cir1">새 게시물<br/><b>10</b></div>
		<div class="cir1">방문자수<br/><b>3</b>/총</div>
		<div class="cir1">셀러신청<br/><b>1</b></div>
	</div>
	
	<div class="title">문의사항</div>
	<a class="searchbtn more" href="cspage">더보기</a>
	<table class="tablea">
		<colgroup>
           <col width="5%" />
           <col width="5%" />
           <col />
           <col width="5%" />
           <col width="10%" />
           <col width="10%" />
        </colgroup>
		<tr>
			<td>번호</td>
			<td>분류</td>
			<td>제목</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>게시글관리</td>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.cs_num }</td>
				<td>${vo.cs_cate }</td>
				<td class="wordcut"><a href="persnal?cs_num=${vo.cs_num }">${vo.cs_subject }</a></td>
				<td>${vo.userid }</td>
				<td>${vo.cs_writedate }</td>
				<td><input type="button" value="미처리" title="${vo.cs_num }"class="smallbtn"/></td>
			</tr>
		</c:forEach>
		<c:if test="${empty list }">
		 	<tr>
				<td colspan=6>모든 문의 답변완료</td>
			</tr>
		</c:if>
	</table>
</div>