<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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
	#userid {
		margin-bottom: 3px; 
	}
	#naverIdLogin img, #kakao-login-btn img {
		width: 220px; height: 50px;
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
</style>
<script type="text/javascript">
	document.title = "로그인";
	
	$(function(){
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); 
		var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/); 
		var regId=/^[a-zA-Z]{1}[a-zA-Z0-9]{5,11}$/;
		var getName= RegExp(/^[가-힣]+$/); 
		var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
		
		$("#loginBtn").click(function(){
			$("#login_section").submit(function(){
				//로그인 상태 유지 확인
				if($("checkbox").val()=='stay'){
					alert("로그인 상태 유지합니다 ~");
				}
				if($("#userid").val()===""){
					alert("아이디를 입력해주세요.");
					$("#userid").focus();
					return false;
				}
				if(!regId.test($("#userid").val())){
					alert("아이디 형식이 올바르지 않습니다.");
					$("#userid").val("");
					$("#userid").focus();
					return false;
				}
				
				if($("#userpwd").val()===""){
					alert("비밀번호를 입력해주세요.");
					$("#userpwd").focus();
					return false;
				}
				
				//로그인 하게 만들기 
				if($("#userid").val()==="1234" && $("#userpwd").val()==="1234"){
					alert("???")
					return true;
				}
			});
		});
		
		$("#signupBtn").click(function(){
			location.href="joinMember";
		});
	});
	
	
</script>

<div id="loginContainer">
	<div id="login_section">
		<span class="lgFnt" >로그인</span>
		<form method="post" action="backHome"> <!-- loginConfrim -->
			<ul>
				<li><input type="text" name="userid" id="userid" tabindex="1" placeholder=" 아이디" class="inputSize"/></li>
				<li><input type="password" name="userpwd" id="userpwd" tabindex="2" placeholder=" 비밀번호" class="inputSize"/></li>
				<li class="cbSize"><input type="checkbox" value="stay" tabindex="3"/>&nbsp;<span class="smlFnt">로그인 상태 유지</span></li>
				<li><button id="loginBtn" class="btn commBtn lgBtn" tabindex="4" >로그인</button></li>
				<li><button type="button" id="signupBtn" class="btn commBtn lgBtn" tabindex="5" >회원가입</button></li>
				<li><a href="#" class="smlFnt lgA">아이디 | 비밀번호찾기</a></li>
			</ul>
		</form>
		<!-- 네이버아이디로로그인 버튼 노출 영역 -->
		<div id="naverIdLogin"></div>
		<!-- //네이버아이디로로그인 버튼 노출 영역 -->
		
		<!-- 네이버아디디로로그인 초기화 Script -->
		<script type="text/javascript">
			$("naverIdLogin_loginButton>img").attr("src", "common/naverLogin.PNG");
			var naverLogin = new naver.LoginWithNaverId(
					{
						clientId: "z8OW_3nHBQfN6ohXsT0H",
						callbackUrl: "http://localhost:9090/1ocaler/loginCallback",
						isPopup: false, /* 팝업을 통한 연동처리 여부 */
						loginButton: {color: "green", type: 1, height: 60} /* 로그인 버튼의 타입을 지정 */
					}
			);
			/* 설정정보를 초기화하고 연동을 준비 */
			naverLogin.init();
		
		</script>
		<!-- // 네이버아이디로로그인 초기화 Script -->
		
	<a id="kakao-login-btn"></a>
<!--     <a href="http://developers.kakao.com/logout">Logout</a> -->
    <script type='text/javascript'>
        //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('d4ac434ad90579b218d8e00cf709e965');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
            container: '#kakao-login-btn',
            success: function (authObj) {
                alert(JSON.stringify(authObj));
            },
            fail: function (err) {
                alert(JSON.stringify(err));
            }
        });
      //]]>
    </script>
	</div>
</div>
	
<%@ include file="/inc/footer.jspf" %>