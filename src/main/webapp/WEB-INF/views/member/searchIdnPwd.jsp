<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<script>
	$(function(){
		//submit 공란검사 
		$("#searchId").submit(function(){
			if($("#searchMem_name1").val()==null && ("#searchMem_name1").val()==''){
				alert('이름을 입력해주세요');
				$("#searchMem_name1").focus();
				return false;
			}
			if($("#searchMem_email1").val()==null && ("#searchMem_email1").val()==''){
				alert('이름을 입력해주세요');
				$("#searchMem_email1").focus();
				return false;
			}
			alert("가입하신 이메일로 아이디를 전송해드립니다");
			return true;
		});
		$("#searchPwd").submit(function(){
			if($("#searchMem_name2").val()==null && ("#searchMem_name2").val()==''){
				alert('이름을 입력해주세요');
				$("#searchMem_name2").focus();
				return false;
			}
			if($("#searchUserid").val()==null && ("#searchUserid").val()==''){
				alert('이름을 입력해주세요');
				$("#searchUserid").focus();
				return false;
			}
			if($("#searchMem_email2").val()==null && ("#searchMem_email2").val()==''){
				alert('이름을 입력해주세요');
				$("#searchMem_email2").focus();
				return false;
			}
			alert("가입하신 이메일로 비밀번호를 전송했습니다");
			return true;
		});
		
		//아이디, 비밀번호 찾기 화면전환 
		$("#searchid").click(function(){
			$("#searchMemIndex").css("display", 'none');
			$("#searchMemId").css("display", 'block');
		});
		$("#searchpwd").click(function(){
			$("#searchMemIndex").css("display", 'none');
			$("#searchMemPwd").css("display", 'block');
		});
		
		$("#goSearchId").click(function(){
			$("#searchMemPwd").css("display", 'none');
			$("#searchMemId").css("display", 'block');
		});
		$("#goSearchPwd").click(function(){
			$("#searchMemId").css("display", 'none');
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
				<li><input type="submit" value="비밀번호 찾기"/></li>
			</ul>
			<div id="goSearchId">아이디 찾기</div>
		</form>
	</div>
</div>