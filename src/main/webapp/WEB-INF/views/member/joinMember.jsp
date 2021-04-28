<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!-- 전화인증 api -->
<script src="https://www.gstatic.com/firebasejs/ui/4.8.0/firebase-ui-auth.js"></script>
<link type="text/css" rel="stylesheet" href="https://www.gstatic.com/firebasejs/ui/4.8.0/firebase-ui-auth.css" />
<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div id="joinMem">
	<form method="post" action="memJoinOk" id="memJoinFrm" enctype="multipart/form-data">
		<div>회원 가입</div>
		<div id="basicInfo">
			<ul>
				<li>아이디</li>
				<li><input type="text" name="userid" id="userid" tabindex="1"
					placeholder="아이디를 입력해주세요" />
				<button type="button" class="btn commBtn Mem_lgBtn" tabindex="2">중복검사</button>
					<span id="idOverlap">N</span> <br />
				<span id="checkid"></span></li>

				<li>비밀번호</li>
				<li><input type="password" name="userpwd" id="userpwd1"
					tabindex="3" placeholder="영문, 숫자, 특수문자 1개 필수 포함" /> <br />
				<span id="checkpwd"></span></li>

				<li>비밀번호 확인</li>
				<li><input type="password" name="userpwd2" id="userpwd2"
					tabindex="4" placeholder="비밀번호를 재입력 입력해주세요" /> <br />
				<span id="checkpwd2"></span></li>

				<li>이름</li>
				<li><input type="text" name="mem_name" id="mem_name"
					tabindex="5" placeholder="이름을 입력해주세요" /> <br />
				<span id="checkname"></span></li>

				<li>연락처</li>
				<li><input type="text" name="mem_tel" id="mem_tel" tabindex="6" maxlength="11"
					placeholder="예) 01012341234" />
				<button type="button" class="btn commBtn Mem_lgBtn" onclick="verifyPhoneNumber()">번호인증</button> <br />
				<span id="checktel"></span></li>

				<li>이메일</li>
				<li><input type="text" name="mem_email" id="mem_email"
					tabindex="7" placeholder="예) 1ocaler@1ocaler.com" />
				<button type="button" class="btn commBtn Mem_lgBtn">이메일 인증</button> <br />
				<span id="checkemail"></span></li>

				<li>주소</li>
				<li>
					<button type="button" tabindex="8" class="btn commBtn Mem_lgBtn findAddr" onclick="openKakaoPost()">
						<img src="common/search_fff.png" id="joinSearchAddrImg">우리동네 찾기
					</button>
					<ul id="addrInput">
						<li><input type="text" name="mem_zip" id="mem_zip"
							tabindex="9" />
						<button type="button" class="btn commBtn Mem_lgBtn" onclick="openKakaoPost()">재검색</button></li>
						<li><input type="text" name="mem_addr" id="mem_addr"
							tabindex="10" /></li>
						<li><input type="text" name="mem_detail" id="mem_detail"
							tabindex="11" />
						</li>
						<li>
							<div id="joinAddrWrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
							</div>
						</li>
					</ul>
				</li>
				<li>활동지역</li>
				<li>
					<input type="text" name="loc_gu" id="loc_gu" tabindex="12" placeholder="ㅇㅇ구로 입력해주세요" />
					<img src="img/indexImg/bo_pin.png" id="joinLocImg"/>
				</li>
			</ul>
			<button type="button" id="seeMore" class="btn commBtn Mem_lgBtn"
				style="width: 700px; height: 40px; display: block; margin: 0 auto;">더보기</button>
		</div>
		<div>추가정보</div>
		<div id="setProfile">
			<ul style="height: 360px;">
				<li>프로필 사진</li>
				<li style="height: auto">
					<div
						style="border: none; width: 110px; height: 110px; margin-right: 10px; float: left;">
						<img src="<%=request.getContextPath()%>/common/user.png"
							id="previewImg" class="profImg form-control-file border"
							alt="upload image" />
					</div> <label class="Mem_input-file-button" for="mem_prof"> 사진추가 </label> 
					<input type="file" name="profFile" accept="image/*" id="mem_prof" 
					style="display: none; margin-top: 70px; border: none;" />
				</li>

				<li>닉네임</li>
				<li><input type="text" name="mem_nick" id="mem_nick"
					placeholder="별명을 입력해주세요" />
				<button type="button" class="btn commBtn Mem_lgBtn">중복검사</button>
					<span id="nickOverlap">N</span></li>

				<li>인사말</li>
				<li><textarea name="mem_content" id="mem_content"
						maxlength="200" placeholder="최대 200자"></textarea> 
			</ul>
			<input type="submit" class="btn commBtn Mem_lgBtn" style="width: 320px; display: block; margin: 0 auto;" value="가입하기"/>
		</div>
	</form>

</div>
</body>
</html>

<script>
	document.title = "회원가입";

	$(function() {
//////////////////////////////////////////화면전환 이벤트		
		//주소찾기 눌렀을때 화면 전환
		$(".findAddr").click(function() {
			$(".findAddr").css("display", "none");
			$("#addrInput").css("display", "block");
			$("#addrInput").parent().css("height", "190px");
		});

		//더보기 눌렀을때 화면 전환
		$("#seeMore").on('click', function() {
			$("#setProfile").slideDown(800);
			$("#setProfile").prev().css("display", "block");
			// 			$("#setProfile").css("display", "block");
		});

		// 프로필 사진
		$("#mem_prof").on('change', function() {
			readURL(this);
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#previewImg').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		};

//////////////////////////////////////////유효성 검사
		$("#userid").on('keyup', function() {
			var regId = /^[a-zA-Z]{1}[a-zA-Z0-9]{5,12}$/;
			if (!regId.test($("#userid").val())) {
				$("#checkid").text("아이디는 영문과 숫자를 조합한 6~12자리여야 합니다.");
				$("#checkid").css({
					"color" : "pink",
					"fontSize" : "12"
				})
				$("#userid").focus();
			} else {
				$("#checkid").text("✔ ︎아이디는 영문과 숫자를 조합한 6~12자리여야 합니다.");
				$("#checkid").css({
					"color" : "green",
					"fontSize" : "12"
				})
			}
		});
		$("#userpwd1")
				.on('keyup', function() {
							$("#checkid").css("display", "none");
							var regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;
							if (!regPwd.test($("#userpwd1").val())) {
								$("#checkpwd")
										.text(
												"비밀번호는 영문과 숫자, 특수문자를 조합한 8~15자리여야 합니다.");
								$("#checkpwd").css({
									"color" : "pink",
									"fontSize" : "12"
								})
								$("#userpwd1").focus();
							} else {
								$("#checkpwd")
										.text(
												"✔ 비밀번호는 영문과 숫자, 특수문자를 조합한 8~15자리여야 합니다.");
								$("#checkpwd").css({
									"color" : "green",
									"fontSize" : "12"
								});
							}
						});
		$("#userpwd2").on('keyup', function() {
			$("#checkpwd").css("display", "none");
			if ($("#userpwd1").val() != $("#userpwd2").val()) {
				$("#checkpwd2").text("비밀번호가 일치하지 않습니다.");
				$("#checkpwd2").css({
					"color" : "pink",
					"fontSize" : "12"
				})
				$("#userpwd2").focus();
			} else {
				$("#checkpwd2").text("✔ 비밀번호가 일치합니다.");
				$("#checkpwd2").css({
					"color" : "green",
					"fontSize" : "12"
				});
			}
		});
////////////////////////////////////////////////////////////////////////////유효성검사안됨		
		$("#mem_name").on('keyup', function() {
			$("#checkpwd2").css("display", "none");
			var regName = /^[가-힣A-Z]{2,10}$/i;
			if (!regName.test($("#mem_name").val())) {
				$("#checkname").text("이름은 2자리 이상이여야 합니다.");
				$("#checkname").css({
					"color" : "pink",
					"fontSize" : "12"
				})
				$("#mem_name").focus();
			} else {
				$("#checkname").text("✔ 한글 2자리 이상이여야 합니다.");
				$("#checkname").css({
					"color" : "green",
					"fontSize" : "12"
				});
			}
		});
		$("#mem_tel").on('keyup', function() {
			$("#checkname").css("display", "none");
			var regTel = /(010|02)[0-9]{3,4}[0-9]{4}/;

			if (!regTel.test($("#mem_tel").val())) {
				$("#checktel").text("연락처는 9자리 이상이여야 합니다.");
				$("#checktel").css({
					"color" : "pink",
					"fontSize" : "12"
				})
				$("#mem_tel").focus();
			} else {
				$("#checktel").text("✔ 연락처는 9자리 이상이여야 합니다.");
				$("#checktel").css({
					"color" : "green",
					"fontSize" : "12"
				});
			}
		});
		$("#mem_email").on('keyup', function() {
			$("#checktel").css("display", "none");
			var regEmail = /^\w{8,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
			
			if (!regEmail.test($("#mem_tel").val())) {
				$("#checkemail").text("이메일을 잘못 입력하셨습니다.");
				$("#checkemail").css({
					"color" : "pink",
					"fontSize" : "12"
				});
				$("#mem_email").focus();
			} else {
				$("#checkemail").text("");
			}
		});
		//////////// 정규식 표현 ////////////
		function regExpCheck() {
			// 인증 번호
			//        var regEmailCheck=/[0-9]{6}$/;
			//        if(!regEmailCheck.test(document.getElementById("emailCheck").value)){
			//           alert("인증번호는 숫자 6자리를 입력해야 합니다.");
			//           return false;
			//        }
		}
	});
	
	//주소찾기 펑션
	var element_wrap = document.getElementById('joinAddrWrap'); //주소 찾기 화면
	function foldDaumPostcode() {// iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

	function openKakaoPost() {
		var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
		new daum.Postcode({
			oncomplete : function(addrData) {
				
				var addr = '';
				var detailAddr = '';
				
				//기본주소
				if(addrData.userSelectedType==='R'){ //도로명 주소일 경우
					addr = addrData.roadAddress;
				}else { //지번 일 경우
					addr = addrData.jibunAddress;
				}
				//추가주소
				if(addrData.userSelectedType==='R'){
					if(addrData.bname !== '' && /[동|로|가]$/g.test(addrData.bname)){
						detailAddr += addrData.bname;
                    }
					if(addrData.buildingName !== '' && addrData.apartment === 'Y'){
						detailAddr += (detailAddr !== '' ? ', ' + addrData.buildingName : addrData.buildingName);
                    }
					if(detailAddr !== ''){
						detailAddr = ' (' + detailAddr + ')';
                    }
					document.getElementById("mem_detail").value = detailAddr;
				}else{
					document.getElementById("mem_detail").value = '';
				}
				// 우편번호, 일반주소 입력
				document.getElementById("mem_zip").value = addrData.zonecode;
				document.getElementById("mem_addr").value = addr;
				document.getElementById("mem_detail").focus();
				element_wrap.style.display = 'none';
				document.body.scrollTop = currentScroll;
			},
			onresize : function(size){
				element_wrap.style.height = size.height+'px';
			},
			width : '100%',
            height : '100%'
		}).embed(element_wrap);
		
		// iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
	};
	
	function verifyPhoneNumber() {
		// Turn off phone auth app verification.
		firebase.auth().settings.appVerificationDisabledForTesting = true;

		var phoneNumber = "+16505554567";
		var testVerificationCode = "123456";

		// This will render a fake reCAPTCHA as appVerificationDisabledForTesting is true.
		// This will resolve after rendering without app verification.
		var appVerifier = new firebase.auth.RecaptchaVerifier('recaptcha-container');
		// signInWithPhoneNumber will call appVerifier.verify() which will resolve with a fake
		// reCAPTCHA response.
		firebase.auth().signInWithPhoneNumber(phoneNumber, appVerifier)
		    .then(function (confirmationResult) {
		      // confirmationResult can resolve with the fictional testVerificationCode above.
		      return confirmationResult.confirm(testVerificationCode)
		    }).catch(function (error) {
		      // Error; SMS not sent
		      // ...
		    });
	
	}
</script>