/*
 	로그인 페이지 스크립트 모음
 */ 
	$(function(){
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
				if($("#userpwd").val()===""){
					alert("비밀번호를 입력해주세요.");
					$("#userpwd").focus();
					return false;
				}
				return true;
			});
		});
		
		$("#login_section").children('p').click(function(){
			$("#socialLogin").slideDown(500);
		});
		$("#signupBtn").click(function(){
			location.href="joinMember";
		});
	});
	
//	네이버아디디로로그인 초기화 Script 
			$("naverIdLogin_loginButton>img").attr("src", "common/naverLogin.PNG");
			var naverLogin = new naver.LoginWithNaverId(
					{
						clientId: "z8OW_3nHBQfN6ohXsT0H",
						callbackUrl: "http://localhost:9090/1ocaler/loginCallback",
						isPopup: false, /* 팝업을 통한 연동처리 여부 */
						loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
					}
			);
			/* 설정정보를 초기화하고 연동을 준비 */
			naverLogin.init();
//  네이버아이디로로그인 초기화 Script 

//	카카오아이디로로그인 초기화 Script 
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