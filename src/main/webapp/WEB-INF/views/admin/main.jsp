<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/main.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<div id="main">
	<div class="title">일일현황</div>
	<div>
		<div class="cir1">신규회원<br/><b>25</b></div>
		<div class="cir1">새 게시물<br/><b>10</b></div>
		<div class="cir1">방문자수<br/><b>3</b>/총</div>
		<div class="cir1">셀러신청<br/><b>1</b></div>
	</div>
	
	<div class="title">문의사항</div>
	<div id="more"><a class="searchbtn" href="cspage">더보기</a></div>
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
		<tr>
			<td>1</td>
			<td>1:1문의</td>
			<td>거래가 안되요</td>
			<td>사람1</td>
			<td>2021-01-01</td>
			<td><input type="button" value="처리완료" class="smallbtn"/></td>
		</tr>
		<tr>
			<td>1</td>
			<td>1:1문의</td>
			<td>거래가 안되요</td>
			<td>사람1</td>
			<td>2021-01-01</td>
			<td><input type="button" value="처리완료"/></td>
		</tr>
		<tr>
			<td>1</td>
			<td>1:1문의</td>
			<td>거래가 안되요</td>
			<td>사람1</td>
			<td>2021-01-01</td>
			<td><input type="button" value="처리완료"/></td>
		</tr>
		<tr>
			<td>1</td>
			<td>1:1문의</td>
			<td>거래가 안되요</td>
			<td>사람1</td>
			<td>2021-01-01</td>
			<td><input type="button" value="처리완료"/></td>
		</tr>
	</table>
</div>