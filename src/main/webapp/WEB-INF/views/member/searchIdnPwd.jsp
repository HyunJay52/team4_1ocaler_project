<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<script>
	$(function(){
		//아이디, 비밀번호 찾기 화면전환 
		$("#searchid").click(function(){
			$("#searchMemIndex").css("display", 'none');
			$("#searchMemId").css("display", 'block');
		});
		$("#searchpwd").click(function(){
			$("#searchMemIndex").css("display", 'none');
			$("#searchMemPwd").css("display", 'block');
		});
	});
</script>
<div id="searchMem">
	<div id="searchMemIndex">
		<div class="lgFnt">아이디 | 비밀번호 찾기</div>
		<ul>
			<li id="searchid">아이디 찾기</li>
			<li id="searchpwd">비밀번호 찾기</li>
		</ul>
	</div>
	
	<div id="searchMemId">
		<form method="post">
			<div>아이디 찾기</div>
			<ul>
				<li>이름</li>
				<li><input type="text" name="username"/></li>
				<li>이메일</li>
				<li><input type="text" name="mem_email"/></li>
				<li><input type="submit" value="찾기"/></li>
			</ul>
			<div>비밀번호 찾기</div>
		</form>
	</div>
	
	<div id="searchMemPwd">
		<form method="post">
			<div>비밀번호 찾기</div>
			<ul>
				<li>아이디</li>
				<li><input type="text" name="userid"/></li>
				<li>이름</li>
				<li><input type="text" name="username"/></li>
				<li>이메일</li>
				<li><input type="text" name="mem_email"/></li>
				<li><input type="submit" value="찾기"/></li>
			</ul>
			<div>아이디 찾기</div>
		</form>
	</div>
</div>