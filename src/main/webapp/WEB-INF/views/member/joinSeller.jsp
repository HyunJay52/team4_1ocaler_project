<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
	#joinSeller {
		width: 1300px; height: auto;
		margin: 100px auto;
	}
	#joinSeller div:nth-child(odd) {
		width: 700px; height: 50px; line-height: 50px;
		margin-top: 10px;
		font-size: 25px;
		text-align: center;
		border-bottom: 3px solid #3f1785;
	}
	#joinSeller>form ul {
		width: 700px; height: 600px;
		margin: 0;
	}
	
	form {
		width: 700px;
		margin: 0 auto;
	}
	form>#basicInfo {
		width: 700px; 
		margin: 20px auto;
	}
	form>#setProfile ul {
		height: 300px;
	}
	form>#basicInfo input, form>#setProfile input {
		width: 320px; height: 50px; padding: 0 15px; border-radius: 3px; border: 1px solid #ddd;
	}
	form #mem_content {
		width: 320px; height: 150px;
		border-radius: 3px; border: 1px solid #ddd;
	}
	#setProfile>button:first-child {
		width: 320px; display: block; argin: 0 auto;    font-size: 20px;
	}
	
	#joinSeller>form>div>ul>li {
		float: left;
		list-style-type: none;
		width: 27%; height: 75px;
	}
	
	#joinSeller>form>div>ul>li:nth-child(odd) {
		font-family: nsreb; font-size: 18px; padding-left: 70px; line-height: 50px;
		
	}
	#joinSeller>form>div>ul>li:nth-child(even) {
		width: 72%;
	}
	
	#addrInput {
		display: none;
		width: 100%; height: 200px;
	}
	#addrInput>li {
		list-style-type: none;
		margin-bottom: 10px;
	}
	#addrInput>li:first-child {
		float:left;
	}

	#setProfile, #joinSeller div:nth-child(3) {
		display: none;
	}
	/*      button     class       */
	.lgBtn {
		width: 120px; height: 50px;
		margin-left: 10px;
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
	.findAddr {
		width: 320px; margin: 0;
	}
	.profImg {
		width: 100px; height: 100px; border: none; border-radius: 70%;
	}
	.input-file-button{
		padding: 3px 15px;
		margin-top: 70px; border: none;
		font-size: 16px;
    	width: 95px;
		text-align: center;
		background-color: 3f1785;
		border-radius: 5px;
		color: white;
		cursor: pointer;
	}
</style>

<div id="joinSeller">
	<form method="post" action="backHome" id="memJoinFrm">
		<div>셀러 가입</div>
		<div id="basicInfo">
			<ul>
				<li>아이디</li>
				<li><input type="text" name="userid" id="userid" tabindex="1" value="abcd1234" readonly="readonly"/><button type="button" class="btn commBtn lgBtn" tabindex="2">중복검사</button><span id="idOverlap">N</span>
					<br/><span id="checkid"></span>
				</li>
			
				<li>비밀번호</li><!-- 현재 로그인한 회원의 비밀번호와 동일 -->
				<li><input type="text" name="userpwd" id="userpwd" tabindex="3" placeholder="비밀번호를 재입력해주세요"/>
					<br/><span id="checkpwd"></span>
				</li>
				
				<li>사업자명</li>
				<li><input type="text" name="company" id="company" tabindex="4" placeholder="등록된 사업자명 입력"/> 
					<br/><span id="checkpwd2"></span>
				</li>
				
				<li>회사명</li>
				<li><input type="text" name="mem_name" id="mem_name" tabindex="5" placeholder="이름을 입력해주세요"/> 
					<br/><span id="checkname"></span>
				</li>
				
				<li>사업자번호</li>
				<li><input type="text" name="com_num" id="com_num" tabindex="6" placeholder="사업자등록번호를 입력해주세요"/><button type="button" class="btn commBtn lgBtn">번호인증</button>
					<br/><span id="checktel"></span>
				</li>
				
				<li>대표번호</li>
				<li><input type="text" name="sel_tel" id="sel_tel" tabindex="6" placeholder="예) 01012341234"/><button type="button" class="btn commBtn lgBtn">번호인증</button>
					<br/><span id="checktel"></span>
				</li>
				
				<li>이메일</li>
				<li><input type="text" name="mem_email" id="mem_email" tabindex="7" placeholder="예) 1ocaler@1ocaler.com"/><button type="button" class="btn commBtn lgBtn">이메일 인증</button>
					<br/><span id="checkemail"></span>
				</li>
				
				<li>주소</li>
				<li>
					<button type="button" tabindex="8" class="btn commBtn lgBtn findAddr"><img src="common/search_fff.png" style="width: 15px; height:15px;">우리동네 찾기</button>
					<ul id="addrInput">
						<li><input type="text" name="sel_zip" id="sel_zip" tabindex="9"/><button type="button" class="btn commBtn lgBtn">재검색</button></li>
						<li><input type="text" name="sel_addr" id="sel_addr" tabindex="10"/></li>
						<li><input type="text" name="sel_detail" id="sel_detail" tabindex="11"/></li>
					</ul>
				</li>
				<li>계좌등록</li>
				<li><input type="text" name="mem_detail" id="mem_detail" tabindex="12" placeholder="ㅇㅇ구로 입력해주세요"/></li>
			</ul>
			<button type="button" id="seeMore" class="btn commBtn lgBtn" style="width: 700px; height: 40px; display: block; margin: 0 auto;">더보기</button>
		</div>
		<div>추가정보</div>		
		<div id="setProfile">
			<ul style="height: 360px;">
				<li>프로필 사진</li>
				<li style="height: auto">
					<div style="border:none; width:110px; height: 110px; margin-right: 10px; float:left;">
						<img src="<%=request.getContextPath() %>/common/user.png" id="previewImg" class="profImg form-control-file border" alt="upload image"/>
					</div>
					<label class="input-file-button" for="mem_prof">
					  사진추가
					</label>
					<input type="file" name="sel_content" accept="image/*" id="sel_content" style="display:none; margin-top: 70px; border: none;"/>
				</li>
			
				<li>닉네임</li>
				<li><input type="text" name="mem_nick" id="mem_nick" placeholder="별명을 입력해주세요"/><button type="button" class="btn commBtn lgBtn">중복검사</button><span id="nickOverlap">N</span> </li>
				
				<li>인사말</li>
				<li><textarea name="sel_content" id="sel_content" maxlength="200" placeholder="최대 200자"></textarea>
<!-- 					<input type="text" name="mem_content" id="mem_content" maxlength="100" placeholder="최대 100자"/> </li> -->
			</ul>
			<button class="btn commBtn lgBtn" style="width: 320px; display:block; margin: 0 auto;" >가입하기</button>
		</div>
	</form>
	
	
</div>
</body>
</html>

<script>
	document.title="셀러가입";
	
	$(function(){
//////////////////////////////////////////화면전환 이벤트		
		//주소찾기 눌렀을때 화면 전환
		$(".findAddr").click(function(){
			$(".findAddr").css("display", "none");
			$("#addrInput").css("display", "block");
			$("#addrInput").parent().css("height", "190px");
		});
		
		//더보기 눌렀을때 화면 전환
		$("#seeMore").on('click', function(){
			$("#setProfile").slideDown(800);
			$("#setProfile").prev().css("display", "block");
// 			$("#setProfile").css("display", "block");
		});

		// 프로필 사진
	      $("#mem_prof").on('change', function(){
	         readURL(this);
	      });
		
	    function readURL(input) {
	          if (input.files && input.files[0]) {
	             var reader = new FileReader();

	             reader.onload = function (e) {
	                $('#previewImg').attr('src', e.target.result);
	             }

	             reader.readAsDataURL(input.files[0]);
	          }
	      };

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
		$("#userid").on('keyup', function(){
			var regId=/^[a-zA-Z]{1}[a-zA-Z0-9]{5,12}$/;
			if(!regId.test($("#userid").val())){
				$("#checkid").text("아이디는 영문과 숫자를 조합한 6~12자리여야 합니다.");
				$("#checkid").css({
					"color":"pink",
					"fontSize":"12"
				})
				$("#userid").focus();
			}else{
				$("#checkid").text("✔ ︎아이디는 영문과 숫자를 조합한 6~12자리여야 합니다.");
				$("#checkid").css({
					"color":"green",
					"fontSize":"12"
				})
			}
		});
		$("#userpwd1").on('keyup', function(){
			$("#checkid").css("display", "none");
			var regPwd=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;
			if(!regPwd.test($("#userpwd1").val())){
				$("#checkpwd").text("비밀번호는 영문과 숫자, 특수문자를 조합한 8~15자리여야 합니다.");
				$("#checkpwd").css({
					"color":"pink",
					"fontSize":"12"
				})
				$("#userpwd1").focus();
			}else{
				$("#checkpwd").text("✔ 비밀번호는 영문과 숫자, 특수문자를 조합한 8~15자리여야 합니다.");
				$("#checkpwd").css({
					"color":"green",
					"fontSize":"12"
				});
			}
		});
		$("#userpwd2").on('keyup', function(){
			$("#checkpwd").css("display", "none");
			if($("#userpwd1").val()!=$("#userpwd2").val()){
				$("#checkpwd2").text("비밀번호가 일치하지 않습니다.");
				$("#checkpwd2").css({
					"color":"pink",
					"fontSize":"12"
				})
				$("#userpwd2").focus();
			}else{
				$("#checkpwd2").text("✔ 비밀번호가 일치합니다.");
				$("#checkpwd2").css({
					"color":"green",
					"fontSize":"12"
				});
			}
		});
		$("#mem_name").on('keyup', function(){
			$("#checkpwd2").css("display", "none");
			var regName=/^[가-힣]{2, 15}$/;
			if(!regName.test($("#mem_name").val())){
				$("#checkname").text("한글 2자리 이상이여야 합니다.");
				$("#checkname").css({
					"color":"pink",
					"fontSize":"12"
				})
				$("#mem_name").focus();
			}else{
				$("#checkname").text("✔ 한글 2자리 이상이여야 합니다.");
				$("#checkname").css({
					"color":"green",
					"fontSize":"12"
				});
			}
		});
////////////////////////////////////////////////////////////////////////////// 전화번호이메일유효성검사안됨		
		$("#mem_tel").on('keyup', function(){
			$("#checkname").css("display", "none");
			var regTel=/^[0-9]{9, 11}$/;
			var x =$("#mem_tel").length;
			console.log(",,,,", x);
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
		$("#mem_email").on('keyup', function(){
			$("#checktel").css("display", "none");
			var regEmail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			if(!regEmail.test($("#mem_tel").val())){
				$("#checkemail").text("이메일을 잘못 입력하셨습니다.");
				$("#checkemail").css({
					"color":"pink",
					"fontSize":"12"
				})
				$("#mem_email").focus();
			}else{
				$("#checkemail").text("");
			}
		});
		//////////// 정규식 표현 ////////////
	    function regExpCheck(){
	       // 인증 번호
	//        var regEmailCheck=/[0-9]{6}$/;
	//        if(!regEmailCheck.test(document.getElementById("emailCheck").value)){
	//           alert("인증번호는 숫자 6자리를 입력해야 합니다.");
	//           return false;
	//        }
	    }
	});

</script>