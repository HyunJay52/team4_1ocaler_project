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

	    //주소찾기 펑션
		function openKakaoPost() {
			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		        }
		    }).open();
		}
//////////////////////////////////////////유효성 검사 펑션
		$("#userpwd").on('keyup', function(){
			$("#checkid").css("display", "none");
			var regPwd=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;
			if(!regPwd.test($("#userpwd").val())){
				$("#checkpwd").text("비밀번호는 영문과 숫자, 특수문자를 조합한 8~15자리여야 합니다.");
				$("#checkpwd").css({
					"color":"pink",
					"fontSize":"12"
				})
				$("#userpwd").focus();
			}else{
				$("#checkpwd").text("✔ 비밀번호는 영문과 숫자, 특수문자를 조합한 8~15자리여야 합니다.");
				$("#checkpwd").css({
					"color":"green",
					"fontSize":"12"
				});
			}
		});
		$("#sel_name").on('keyup', function(){
			$("#checkpwd2").css("display", "none");
			var regName=/^[가-힣]{2, 15}$/;
			if(!regName.test($("#sel_name").val())){
				$("#checkname").text("한글 2자리 이상이여야 합니다.");
				$("#checkname").css({
					"color":"pink",
					"fontSize":"12"
				})
				$("#sel_name").focus();
			}else{
				$("#checkname").text("✔ 한글 2자리 이상이여야 합니다.");
				$("#checkname").css({
					"color":"green",
					"fontSize":"12"
				});
			}
		});
////////////////////////////////////////////////////////////////////////////// 전화번호이메일유효성검사안됨		
		$("#sel_tel").on('keyup', function(){
			$("#checkname").css("display", "none");
			var regTel=/^[0-9]{9, 11}$/;
			var x =$("#sel_tel").length;
			if(!regTel.test($("#mem_tel").val())){
				$("#checktel").text("연락처는 9자리 이상이여야 합니다.");
				$("#checktel").css({
					"color":"pink",
					"fontSize":"12"
				})
				$("#mem_tel").focus();
			}else{
				$("#checktel").text("✔ 연락처는 9자리 이상이여야 합니다.");
				$("#checktel").css({
					"color":"green",
					"fontSize":"12"
				});
			}
		});
		$("#sel_email").on('keyup', function(){
			$("#checktel").css("display", "none");
			var regEmail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			if(!regEmail.test($("#mem_tel").val())){
				$("#checkemail").text("이메일을 잘못 입력하셨습니다.");
				$("#checkemail").css({
					"color":"pink",
					"fontSize":"12"
				})
				$("#sel_email").focus();
			}else{
				$("#checkemail").text("");
			}
		});
});
//////////////////////////////////////////주소찾기 펑션
var element_wrap = document.getElementById('joinSellAddrWrap'); //주소 찾기 화면
function foldDaumPostcode() {// iframe을 넣은 element를 안보이게 한다.
    element_wrap.style.display = 'none';
}

function sellOpenKakaoPost() {
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
				document.getElementById("sel_detail").value = detailAddr;
			}else{
				document.getElementById("sel_detail").value = '';
			}
			// 우편번호, 일반주소 입력
			document.getElementById("sel_zip").value = addrData.zonecode;
			document.getElementById("sel_addr").value = addr;
			document.getElementById("sel_detail").focus();
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