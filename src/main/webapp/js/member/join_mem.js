/*
 	회원가입 페이지 스크립트 모음
 */
 
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
		
		//아이디 & 별명 중복확인 
		$("#idOverlapBtn").on('click', function(){
			$("#idOverlap").text('Y');
			var url = "idOverlapCheck";
			var inputId = "userid="+$("#userid").val();
			$.ajax({
				url: url,
				data: inputId,
				success: function(result){
					if(result=='Y'){ //사용가능
						$('#checkid').text('사용가능한 아이디입니다.');
						$("#checkid").css({
							"color" : "green",
							"fontSize" : "12"
						});
						$("#idOverlap").text('Y');
					}
					if(result=='N'){
						$('#checkid').text('이미 존재하는 아이디입니다.');
						$('#userid').val('');
						$('#userid').focus();
						$("#checkid").css({
							"color" : "pink",
							"fontSize" : "12"
						});
						$("#idOverlap").text('N');
					}
				},
				error: function(){
					alert("아이디 중복검사를 실패했습니다. 다시 시도해주세요");
					$('#userid').focus();
				}
			});
		});
		$("#nickOverlapBtn").on('click', function(){
			$("#nickOverlap").text('Y');
			console.log($('#nickOverlap').text(), "dddd");
			var url = "nickOverlapCheck";
			var inputNick = "mem_nick="+$("#mem_nick").val();
			$.ajax({
				url: url,
				data: inputNick,
				success: function(result){
					if(result=='Y'){ //사용가능
						$('#checkNickname').text('사용가능한 별명입니다.');
						$("#checkNickname").css({
							"color" : "green",
							"fontSize" : "12"
						});
						$("#nickOverlap").text('Y');
					}
					if(result=='N'){
						$('#checkNickname').text('이미 존재하는 별명입니다.');
						$('#mem_nick').val('');
						$('#mem_nick').focus();
						$("#checkNickname").css({
							"color" : "pink",
							"fontSize" : "12"
						});
						$("#nickOverlap").text('N');
					}
				},
				error: function(){
					alert("아이디 중복검사를 실패했습니다. 다시 시도해주세요");
					$('#userid').focus();
				}
			});
		})
		//중복확인 후, 아이디 또는 별명 수정 할 경우 
		$("#userid").change(function(){ // 마우스로 잘라내기를 했을 경우를 대비
	         if(userid!=$("#userid")){
	            $("#idOverlap").text("N");
	         }
      	});
		$('#mem_nick').keydown(function(){ // 키 이벤트가 발생했을 때
	         $("#nickOverlap").text("N");
	         userid=$("#mem_nick").text();
	    });
		$("#mem_nick").change(function(){ // 마우스로 잘라내기를 했을 경우를 대비
	         if(mem_nick!=$("#mem_nick")){
	            $("#nickOverlap").text("N");
	         }
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
			$("#idOverlap").text('N');
	        userid=$("#userid").text();
	        
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
		$("#userpwd1").on('keyup', function() {
			$("#checkid").css("display", "none");
			var regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;
			if (!regPwd.test($("#userpwd1").val())) {
				$("#checkpwd").text("비밀번호는 영문과 숫자, 특수문자를 조합한 8~15자리여야 합니다.");
				$("#checkpwd").css({"color" : "pink", "fontSize" : "12"})
				$("#userpwd1").focus();
			} else {
				$("#checkpwd").text("✔ 비밀번호는 영문과 숫자, 특수문자를 조합한 8~15자리여야 합니다.");
				$("#checkpwd").css({"color" : "green", "fontSize" : "12"});
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
//////////////////////////////////////////유효성검사안됨 (이메일 부분 확인)	
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
			var regEmail = /^\w{6,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
			
			if (!regEmail.test($("#mem_email").val())) {
				$("#checkemail").text("이메일을 잘못 입력하셨습니다.");
				$("#checkemail").css({
					"color" : "pink",
					"fontSize" : "12"
				});
				$("#mem_email").focus();
			} else {
				$("#checkemail").text("✔ 사용가능한 이메일입니다.");
				$("#checkemail").css({
					"color" : "green",
					"fontSize" : "12"
				});
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
		
		//submit 이벤트 구현
		$('#memJoinFrm').submit(function(){
			if($('#userid').val()==null || $('#userid').val()==''){
				alert('아이디를 입력해주세요');
				$('#userid').focus();
				return false;
			}
			if($("#idOverlap").val()=='N'){
				alert('아이디 중복확인을 해주세요');
				return false;
			}
			if($('#userpwd1').val()==null || $('#userpwd1').val()==''){
				alert('비밀번호를 입력해주세요');
				$('#userpwd1').focus();
				return false;
			}
			if($('#mem_name').val()==null || $('#mem_name').val()==''){
				alert('이름을 입력해주세요');
				$('#mem_name').focus();
				return false;
			}
			if($('#mem_tel').val()==null || $('#mem_tel').val()==''){
				alert('연락처를 입력해주세요');
				$('#mem_tel').focus();
				return false;
			}
			if($('#mem_email').val()==null || $('#mem_email').val()==''){
				alert('이메일 주소를 입력해주세요');
				$('#mem_email').focus();
				return false;
			}
			if($('#mem_zip').val()==null || $('#mem_zip').val()==''){
				alert('주소입력을 확인해주세요');
				$('#mem_zip').focus();
				return false;
			}
			if($('#mem_addr').val()==null || $('#mem_addr').val()==''){
				alert('주소입력을 확인해주세요');
				$('#mem_addr').focus();
				return false;
			}
			if($('#mem_detail').val()==null || $('#mem_detail').val()==''){
				alert('주소입력을 확인해주세요');
				$('#mem_detail').focus();
				return false;
			}
			if($('#loc_gu').val()==null || $('#loc_gu').val()==''){
				alert('활동지역 입력은 필수입니다');
				$('#loc_gu').focus();
				return false;
			}
			if($('#mem_nick').val()==null || $('#mem_nick').val()==''){
				alert('별명을 입력하지 않으시면 아이디로 대체됩니다.');
				$('#mem_nick').val($('#userid'));
				$('#mem_nick').focus();
				return false;
			}
			if($("#nickOverlap").val()=='N'){
				alert('별명을 중복확인을 해주세요');
				return false;
			}
			return true;
		});
}); //function 끝	
	
//////////////////////////////////////////주소찾기 펑션
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
			console.log('? > ', size)
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
	
