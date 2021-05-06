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
		$("#sel_name").on('keyup', function() {
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
		$("#sel_tel").on('keyup', function() {
			var regTel = /(010|02)[0-9]{3,4}[0-9]{4}/;
			if (!regTel.test($("#sel_tel").val())) {
				$("#checkSellTel").text("2자리 이상이여야 합니다.");
				$("#checkSellTel").css({
					"color" : "pink",
					"fontSize" : "12"
				})
				$("#sel_tel").focus();
			} else {
				$("#checkSellTel").text("✔ 2자리 이상이여야 합니다.");
				$("#checkSellTel").css({
					"color" : "green",
					"fontSize" : "12"
				});
			}
		});
		$("#sel_email").on('keyup', function() {
			var regEmail = /^\w{6,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
			if (!regEmail.test($("#mem_email").val())) {
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
		$("#account").on('keyup', function() {
			var regEmail = /^\w{6,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
			if (!regEmail.test($("#mem_email").val())) {
				$("#checkSellEmail").text("이메일을 잘못 입력하셨습니다.");
				$("#checkSellEmail").css({
					"color" : "pink",
					"fontSize" : "12"
				});
				$("#account").focus();
			} else {
				$("#checkSellEmail").text("✔ 사용가능한 이메일입니다.");
				$("#checkSellEmail").css({
					"color" : "green",
					"fontSize" : "12"
				});
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