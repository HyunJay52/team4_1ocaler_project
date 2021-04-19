<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/m_mem.css"/>
<!-- 
	#3f1785 > #571fb8 > #705abf
 -->
<div id="main">
	<div style="width:100%;height:30px;"></div>
	<ul class="statis">
		<li>
			총회원수
			<div>2500</div>
			<b>▲4% </b>지난주 대비
		</li>
		<li>
			신규회원
			<div>2500</div>
			<b>▼4% </b>지난주 대비
		</li>
		<li>
			셀러회원
			<div>2500</div>
			<b>4% </b>지난주 대비
		</li>
		<li>
			휴먼계정
			<div>2500</div>
			<b>4% </b>지난주 대비
		</li>
		<li>
			탈퇴
			<div style="border:0;">2500</div>
			<b>4% </b>지난주 대비
		</li>
	</ul>
	<br/><br/><br/><br/><br/>

	<div style="width:100%;height:30px;"></div>
	<div class="frmcss">
		<form >
			<select name="serchkey">
				<option value="회원아이디">회원아이디</option>
				<option value="회원번호">회원 번호</option>
				<option value="회원이름">회원 이름</option>
			</select>
			<input type="text" name="serchword"/>
			<input type="submit" value="검색"/>
		</form>	
	</div>
	
	<table class="table">
		<tr>
			<td>번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>성별</td>
			<td>주소</td>
			<td>연락처</td>
			<td>글쓰기 권한</td>
			<td>휴먼상태</td>
			<td>판매자 권한</td>
			<td>블랙리스트</td>
		</tr>
		<tr>
			<td>1</td>
			<td>goguma</td>
			<td>김길동</td>
			<td>남자</td>
			<td>서울시 강서구</td>
			<td>010-2222-3333</td>
			<td><input type="button" value="Y"></td>
			<td><input type="button" value="Y"></td>
			<td><input type="button" value="Y"></td>
			<td><input type="button" value="정지"></td>
		</tr>
	</table>
	<div style="width:100%;height:30px;"></div>
	<table class="table">
		<tr>
			<td>게시물</td>
			<td>댓글</td>
			<td>등급</td>
			<td>가입날짜</td>
			<td>누적신고</td>
		</tr>
		<tr>
			<td>10</td>
			<td>40</td>
			<td>5</td>
			<td>2021.01.01</td>
			<td>88</td>
		</tr>
	</table>

		
</div>