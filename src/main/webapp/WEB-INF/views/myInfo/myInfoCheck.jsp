<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	//로그인 세션 저장하기

%>
<style>
	#login_section {
		width: 400px; height: auto;
		margin: 0 auto;
	}
	#login_section ul li {
		list-style-type: none;
		margin-bottom: 5px;
	}
	#login_section>div {
		text-align: center;
		margin-bottom: 10px;
	}
	#login_section ul li>button {
		width: 400px; height: 40px; 
	}
	#login_section ul li>button:hover {
		font-weight: bold;
	}
	#login_section ul li:nth-child(2)>button {
		background: #5f0080; color: #fff;
	}
	#login_section ul li:last-child>button {
		border: 1px solid #ddd;
	}
	.inputSize {
		width: 400px; height: 50px;
		padding: 5px;
		border: 1px solid #ddd;
		border-radius: 5px;
	}
</style>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			$("#passwordCheckForm").submit(function(){
				if($("#userpwd").val()==""){
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
<div class="myinfoBody"> 
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	
	<div class="myinfoContainer">
		<div id="login_section">
			<div>
				개인정보 보호를 위해서 비밀번호를 다시 입력해주세요
			</div>
			<form method="post" action="myInfo" id="passwordCheckForm"> <!-- loginConfrim -->
				<ul>
					<li><input type="password" name="userpwd" id="userpwd" tabindex="2" placeholder=" 비밀번호" class="inputSize"/></li>
					<li><button id="loginBtn" class="btn" tabindex="4" >확인</button></li>
					<li><button type="button" id="signupBtn" class="btn" tabindex="5" >취소</button></li>
				</ul>
			</form>
		</div>
	</div>
</div>