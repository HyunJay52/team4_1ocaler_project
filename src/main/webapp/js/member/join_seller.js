/*
 * 셀러회원 가입페이지  
 */
$(function(){
//////////////////////////////////////////화면전환 이벤트		
		//계좌등록시 화면전환
		$(".addBank").click(function(){
			$(".addBank").css("display", "none");
			$("#bankInput").css("display", "block");
			$("#bankInput").parent().css("height", "190px");
		});
		// 프로필 사진
		$("#sel_prof").on('change', function() {
			readURL(this);
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#sel_previewImg').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		};
		
//////////////////////////////////////////유효성 검사 펑션
		//비밀번호
		var sellerPwd;
		$('#sellerPwd').keydown(function(){ // 키 이벤트가 발생했을 때
	         $("#pwdDoubleCheck").text("N");
	         sellerPwd = $("#sellerPwd").val();
	    });
		$("#sellerPwd").change(function(){ // 마우스로 잘라내기를 했을 경우를 대비
	         if(sellerPwd!=$("#sellerPwd")){
	            $("#pwdDoubleCheck").text("N");
	         }
     	});
		$("#sel_name").on('keyup', function() {
			$('#sellPwdCheck').text('');
			var regName = /^[가-힣A-Z]{2,10}$/i;
			if (!regName.test($("#sel_name").val())) {
				$("#sellNameCheck").text("2자리 이상이여야 합니다.");
				$("#sellNameCheck").css({
					"color" : "pink",
					"fontSize" : "12"
				})
				$("#sel_name").focus();
			} else {
				$("#sellNameCheck").text("✔ 2자리 이상이여야 합니다.");
				$("#sellNameCheck").css({
					"color" : "green",
					"fontSize" : "12"
				});
			}
		});
		$("#com_num").on('keyup', function() {
			$('#sellNameCheck').text('');
			var regComnum = /[0-9]{10,15}/;
			if (!regComnum.test($("#com_num").val())) {
				$("#checkCumNum").text("사업자번호가 부적합합니다.");
				$("#checkCumNum").css({
					"color" : "pink",
					"fontSize" : "12"
				})
				$("#com_num").focus();
			} else {
				$("#checkCumNum").text("✔ 사업자번호가 부적합합니다.");
				$("#checkCumNum").css({
					"color" : "green",
					"fontSize" : "12"
				});
			}
		});
		$("#sel_tel").on('keyup', function() {
			$("#checkCumNum").text('');
			var regTel = /[0-9]{2,3}[0-9]{3,4}[0-9]{4}/;
			if (!regTel.test($("#sel_tel").val())) {
				$("#checkSellTel").text("연락처는 9자리 이상이여야 합니다.");
				$("#checkSellTel").css({
					"color" : "pink",
					"fontSize" : "12"
				})
				$("#sel_tel").focus();
			} else {
				$("#checkSellTel").text("✔ 연락처는 9자리 이상이여야 합니다.");
				$("#checkSellTel").css({
					"color" : "green",
					"fontSize" : "12"
				});
			}
		});
		$("#sel_email").on('keyup', function() {
			$("#checkSellTel").text('');
			var regEmail = /^\w{6,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
			if (!regEmail.test($("#sel_email").val())) {
				$("#checkSellEmail").text("이메일을 잘못 입력하셨습니다.");
				$("#checkSellEmail").css({
					"color" : "pink",
					"fontSize" : "12"
				});
				$("#sel_email").focus();
			} else {
				$("#checkSellEmail").text("✔ 사용가능한 이메일입니다.");
				$("#checkSellEmail").css({
					"color" : "green",
					"fontSize" : "12"
				});
			}
		});
		$("#acc_name").on('keyup', function() {
			$("#checkSellEmail").text('');
			var regName = /^[가-힣A-Z]{2,10}$/i;
			if (!regName.test($("#acc_name").val())) {
				$("#checkSellAccName").text("2자리 이상 입력해주세요.");
				$("#checkSellAccName").css({
					"color" : "pink",
					"fontSize" : "12"
				});
				$("#acc_name").focus();
			} else {
				$("#checkSellAccName").text("✔ 2자리 이상 입력해주세요.");
				$("#checkSellAccName").css({
					"color" : "green",
					"fontSize" : "12"
				});
			}
		});
		$("#account").on('keyup', function() {
			$("#checkSellAccName").text('');
			var regAcc = /[0-9]{10,13}/;
			if (!regAcc.test($("#account").val())) {
				$("#checkSellAcc").text("계좌번호를 잘못 입력하셨습니다.");
				$("#checkSellAcc").css({
					"color" : "pink",
					"fontSize" : "12"
				});
				$("#account").focus();
			} else {
				$("#checkSellAcc").text("✔ 사용가능한 계좌입니다.");
				$("#checkSellAcc").css({
					"color" : "green",
					"fontSize" : "12"
				});
			}
		});
		
		//비밀번호 재확인
		$("#sellPwdBtn").click(function(){
			var url = "sellerPwdDoubleCheck";
			var userpwd = "userpwd="+$("#sellerPwd").val();
			
			$.ajax({
				url: url,
				data: userpwd,
				success: function(result){
					if(result=='Y'){ //사용가능
						$('#sellPwdCheck').text('비밀번호가 일치합니다.');
						$("#sellPwdCheck").css({
							"color" : "green",
							"fontSize" : "12"
						});
						$("#pwdDoubleCheck").text(result);
					}
					if(result=='N'){
						$('#sellPwdCheck').text('비밀번호가 일치하지 않습니다.');
						$('#sellerPwd').val('');
						$('#sellerPwd').focus();
						$("#sellPwdCheck").css({
							"color" : "pink",
							"fontSize" : "12"
						});
						$("#pwdDoubleCheck").text(result);
					}
				},
				error: function(error){
					$('#sellPwdCheck').text('다시 시도해주세요.');
					$("#sellPwdCheck").css({
						"color" : "red",
						"fontSize" : "12"
					});
					$("#sellerPwd").focus();
				}
			});
		});
		
		//submit 이벤트 구현
		$("#sellerJoinFrm").submit(function(){
			if($("#sellerPwd").val()==null || $("#sellerPwd").val()==''){
				alert("비밀번호를 다시 입력해주세요");
				$("#sellerPwd").focus();
				return false;
			}
			if($("#pwdDoubleCheck").text()=='N'){
				alert("비밀번호 확인은 필수입니다");
				return false;
			}
			if($("#sel_name").val()==null || $("#sel_name").val()==''){
				alert("사업자명은 필수입니다");
				$("#sel_name").focus();
				return false;
			}
			if($("#company").val()==null || $("#company").val()==''){
				alert("회사명은 필수입니다");
				$("#company").focus();
				return false;
			}
			if($("#com_num").val()==null || $("#company").val()==''){
				alert("사업자번호는 필수입니다");
				$("#com_num").focus();
				return false;
			}
			if($("#sel_tel").val()==null || $("#sel_tel").val()==''){
				alert("대표번호를 입력해주세요");
				$("#sel_tel").focus();
				return false;
			}
			if($("#sel_email").val()==null || $("#sel_email").val()==''){
				alert("이메일을 입력해주세요");
				$("#sel_email").focus();
				return false;
			}
			if($("#sel_zip").val()==null || $("#sel_zip").val()==''){
				alert("우편번호를 입력해주세요");
				$("#sel_zip").focus();
				return false;
			}
			if($("#sel_addr").val()==null || $("#sel_addr").val()==''){
				alert("주소를 입력해주세요");
				$("#sel_addr").focus();
				return false;
			}
			if($("#sel_detail").val()==null || $("#sel_detail").val()==''){
				alert("상세주소를 입력해주세요");
				$("#sel_detail").focus();
				return false;
			}
			if($("#acc_name").val()==null || $("#acc_name").val()==''){
				alert("계좌주의 이름을 입력해주세요");
				$("#acc_name").focus();
				return false;
			}
			if($("#bank").val()==null || $("#bank").val()==0){
				alert("거래은행을 선택해주세요");
				$("#bank").focus();
				return false;
			}
			if($("#account").val()==null || $("#account").val()==''){
				alert("계좌번호를 입력해주세요");
				$("#account").focus();
				return false;
			}
			if($("#sel_prof").val()==null || $("#sel_prof").val()==''){
				alert("프로필 사진을 선택하지 않으시면, 기본 이미지로 지정됩니다");
				$("#sel_prof").val('user.png');
				$("#sel_prof").focus();
				return false;
			}
			if($("#sel_content").val()==null || $("#sel_prof").val()==''){
				$("#sel_content").val("안녕하세요,"+$("#company").val()+"입니다");
				$("#sel_content").focus();
				return false;
			}
			return true;
		});
		
});
//////////////////////////////////////////주소찾기 펑션
function sellOpenKakaoPost() {
	var width = 500; var height =500;
	new daum.Postcode({
		width: width,
		heigth: height,
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
				document.getElementById("sel_detail").value = detailAddr;
			}else{
				document.getElementById("sel_detail").value = '';
			}
			// 우편번호, 일반주소 입력
			document.getElementById("sel_zip").value = addrData.zonecode;
			document.getElementById("sel_addr").value = addr;
			document.getElementById("sel_detail").focus();
		},
		
	}).open({
    	left: (window.screen.width / 2) - (width / 2),
    	top: (window.screen.height / 2) - (height / 2)
	});
};