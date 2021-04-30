<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	//로그인 세션 저장하기

%>
<style>
	#loginContainer {
		width: 1300px; height: auto;
		text-align: center;
		margin: 0 auto;
	}
	#login_section {
		width: 400px; height: auto;
		padding-top: 110px; padding-bottom: 110px;
		margin: 0 auto;
	}
	#login_section ul li {
		list-style-type: none;
		
	}
	.btnSize {
		width: 100px;
		height: 50px;
	}
	.inputSize {
		width: 320px; height: 50px;
		padding: 10px;
		border: 1px solid #ddd;
		border-radius: 5px;
	}
	.cbSize {
		margin-bottom: 10px;
		padding-left: 200px;
	}
	.lgBtn {
		width: 320px; height: 50px;
		margin-top: 5px;
		border: 1px solid #3f1785;
		color: #3f1785;
	}
	.lgBtn:hover {
		color: #fff;
		font-weight: bold;
	}
	.lgA:hover{
		margin-top: 20px;
		color: #000;
		text-decoration: none;
	}
	#mainFooter, .footerLine{
		display:none;
	}
</style>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			$("#passwordCheckForm").submit(function(){
				if($("#userpwd").val()===""){
					alert("비밀번호를 입력해주세요.");
					$("#userpwd").focus();
					return false;
				}
			});
		});
		
		$("#signupBtn").click(function(){
			location.href="myInfoMain";
		});
	});
</script>
<div id="loginContainer">
	<div id="login_section">
		<span class="lgFnt" >비밀번호 확인</span>
		<form method="post" action="myInfo" id="passwordCheckForm"> <!-- loginConfrim -->
			<ul>
				<li><input type="password" name="userpwd" id="userpwd" tabindex="2" placeholder=" 비밀번호" class="inputSize"/></li>
				<li><button id="loginBtn" class="btn commBtn lgBtn" tabindex="4" >확인</button></li>
				<li><button type="button" id="signupBtn" class="btn commBtn lgBtn" tabindex="5" >취소</button></li>
				<li><a href="#" class="smlFnt lgA">비밀번호찾기</a></li>
			</ul>
		</form>
	</div>
</div>