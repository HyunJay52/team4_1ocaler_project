<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<div id="searchMem">
	<div id="searchMemIndex">
		<div class="lgFnt">아이디 | 비밀번호 찾기</div>
		<ul>
			<li id="searchid">아이디 찾기</li>
			<li id="searchpwd">비밀번호 찾기</li>
		</ul>
	</div>
	
	<div id="searchMemId">
		<form method="post" action="searchId" id="searchId">
			<div>아이디 찾기</div>
			<ul>
				<li>이름</li>
				<li><input type="text" name="mem_name" id="searchMem_name1"/></li>
				<li>이메일</li>
				<li><input type="text" name="mem_email" id="searchMem_email1"/></li>
				<li><input type="submit" value="아이디 찾기"/></li>
			</ul>
			<div id="goSearchPwd">비밀번호 찾기</div>
		</form>
	</div>
	
	<div id="searchMemPwd">
		<form method="post" action="searchPwd" id="searchPwd">
			<div>비밀번호 찾기</div>
			<ul>
				<li>이름</li>
				<li><input type="text" name="mem_name" id="searchMem_name2"/></li>
				<li>아이디</li>
				<li><input type="text" name="userid" id="searchUserid"/></li>
				<li>이메일</li>
				<li><input type="text" name="mem_email" id="searchMem_email2"/></li>
				<li><input type="submit" value="비밀번호 찾기" id="searchPwdBtn"/></li>
			</ul>
			<div id="goSearchId">아이디 찾기</div>
		</form>
	</div>
	
	<div id="inputVerifiedNum">
		<form method="post" action="verifiedNumCheck" id="verifiedNumCheck">
		<ul id="verifiedUl">
			<li>인증번호를 입력해주세요</li>
			<li>
				<input type="password" name="verifiedNum" id="verifiedNum">
				<input type="hidden" name="mem_name" id="searchMem_name3"/>
				<input type="hidden" name="userid" id="vSearchUserid"/>
				<input type="hidden" name="mem_email" id="searchUserEmail"/>
			</li>
			<li><button id="verifiedBtn">확인</button></li>
		</ul>
		</form>
	</div>
</div>