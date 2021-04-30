<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<%request.setCharacterEncoding("utf-8"); %>
<%
//로그인 상태 유지를 선택했는지 확인 > 쿠키 저장
// String stayinLogin = request.getParameter("stay");
// if(stayinLogin.equals("stay")){
// 	String userid = request.getParameter("userid");
// 	Cookie stayCookie = new Cookie("logCookieId", userid);
// 	response.addCookie(stayCookie);
// }else{
// 	Cookie[] cookies = request.getCookies(); //등록된 쿠키삭제 작업
// 	for(int i=0; i<cookies.length; i++){
// 		Cookie cookie = cookies[i];
// 		if(cookie.getName().equals("logCookieId")){
// 			cookie.setMaxAge(0);
// 			response.addCookie(cookie);
// 		}
// 	}
// }
//쿠키 유무 확인해서 페이지 이동
// if(cookies!=null){ //쿠키가 있음
// 	for(Cookie userCookie : cookies){
// 		if(userCookie.getName().equals("logId")){
// 			response.sendRedirect("home.jsp");
// 		}
// 	}
// }
%>

<script type="text/javascript">
	document.title = "로그인";
</script>

<div id="loginContainer">
	<div id="login_section">
		<span class="lgFnt" >로그인</span>
		<form method="post" action="loginConfrim"> <!-- loginConfrim -->
			<ul>
				<li><input type="text" name="userid" id="userid" tabindex="1" placeholder=" 아이디" class="mem_inputSize"/></li>
				<li><input type="password" name="userpwd" id="userpwd" tabindex="2" placeholder=" 비밀번호" class="mem_inputSize"/></li>
				<li class="mem_cbSize"><input type="checkbox" id="stayinLogin" name="stay" value="stay" tabindex="3"/>&nbsp;<span class="smlFnt">로그인 상태 유지</span></li>
				<li><button id="loginBtn" class="btn commBtn lgBtn mem_lgBtn" tabindex="4" >로그인</button></li>
				<li><button type="button" id="signupBtn" class="btn commBtn lgBtn mem_lgBtn" tabindex="5" >회원가입</button></li>
				<li><a href="#" class="smlFnt lgA mem_lgA">아이디 | 비밀번호찾기</a></li>
			</ul>
		</form>
		<p>▽ 소셜계정으로 로그인하기</p>
		<div id="socialLogin">
			<!-- 네이버아이디로로그인 버튼 노출 영역 -->
			<div id="naverIdLogin"></div>
			<!-- 카카오로그인 버튼 노출 영역 -->
			<div id="kakao-login-btn"></div>
<!--     	<a href="http://developers.kakao.com/logout">Logout</a> -->
		</div>
	</div>
</div>