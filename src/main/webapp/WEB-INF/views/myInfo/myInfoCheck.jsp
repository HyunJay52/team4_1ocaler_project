<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commonStyle.css"/>

<style>
	.body{
		overflow:auto;
		width:1300px;
	}
	#pwdCheck{
		position:absolute;
		top:50%;
		left:50%;
		margin:-90 0 0 -200;
		width:500px;
		height:500px;
		text-align:center;
	}
	#pwdCheck>form>ul, #pwdCheck>form>ul>li{
		list-style-type:none;
	}
	#pwdCheck>form>ul>li:nth-child(1)>input{
		padding:0 10px;
		height:50px;
		width:250px;
		background-color:rgb(245,245,245);
	}
	#pwdCheck>form>ul>li:nth-child(2)>input{
		width:125px;
		height:50px;
	}
</style>
<script>
	$(function(){
		$("#cancel").click(function(){
			location.href="info";
		});
		
	});
</script>
<div class="body">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div id="pwdCheck">
	
	<form method="post" action="pwdCheck">
		<ul>
			<li><input type="password" name="userpwd" placeholder="비밀번호를 입력해주세요"/></li>
			<li><input id="cancel" class="btn cancelBtn" type="button" value="CANCEL"/><input type="submit" class="btn commBtn" value="OK"/></li>
		</ul>
	</form>
	</div>
</div>
</body>
</html>