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
		<div class="cir1">
			<div class="top">신규회원</div>
			<div class="btm">25</div>
		</div>
		<div class="cir1">
			<div class="top">새 게시물</div>
			<div class="btm">10</div>
		</div>
		<div class="cir1">
			<div class="top">방문자수</div>
			<div class="btm">3</div>
		</div>
		<div class="cir1">
			<div class="top">셀러신청</div>
			<div class="btm">1</div>
		</div>
	</div>
	
	<div class="title">문의사항</div>
	<a class="searchbtn more" href="cspage">더보기</a>
	<table class="tablea">
		<colgroup>
           <col width="5%" />
           <col width="8%" />
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