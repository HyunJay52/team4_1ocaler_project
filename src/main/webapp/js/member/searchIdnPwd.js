/**
 *  아이디 비밀번호 찾기 스크립트
 */
 
 	$(function(){
		//submit 공란검사 
		$("#searchId").submit(function(){
			if($("#searchMem_name1").val()==null && ("#searchMem_name1").val()==''){
				alert('이름을 입력해주세요');
				$("#searchMem_name1").focus();
				return false;
			}
			if($("#searchMem_email1").val()==null && ("#searchMem_email1").val()==''){
				alert('이름을 입력해주세요');
				$("#searchMem_email1").focus();
				return false;
			}
			alert("가입하신 이메일로 아이디를 전송해드립니다");
			return true;
		});
		
		//아이디, 비밀번호 찾기 화면전환 
		$("#searchid").click(function(){
			$("#searchMemIndex").css("display", 'none');
			$("#searchMemId").css("display", 'block');
		});
		$("#searchpwd").click(function(){
			$("#searchMemIndex").css("display", 'none');
			$("#searchMemPwd").css("display", 'block');
		});
		
		$("#goSearchId").click(function(){
			$("#searchMemPwd").css("display", 'none');
			$("#searchMemId").css("display", 'block');
		});
		$("#goSearchPwd").click(function(){
			$("#searchMemId").css("display", 'none');
			$("#searchMemPwd").css("display", 'block');
		});
		
		//비밀번호 - 인증번호 확인용 ajax
		$("#searchPwdBtn").click(function(){
			if($("#searchMem_name2").val()==null && ("#searchMem_name2").val()==''){
				alert('이름을 입력해주세요');
				$("#searchMem_name2").focus();
			}
			if($("#searchUserid").val()==null && ("#searchUserid").val()==''){
				alert('아이디를 입력해주세요');
				$("#searchUserid").focus();
			}
			if($("#searchMem_email2").val()==null && ("#searchMem_email2").val()==''){
				alert('이름을 입력해주세요');
				$("#searchMem_email2").focus();
			}
			
			var url = "searchPwd";
			var searchPwdStr = $("#searchPwd").serialize();
			
			$.ajax({
				type: 'post',
				url: url,
				data: searchPwdStr,
				success: function(result){
					if(result=='Y'){ //사용가능
						alert("회원가입한 이메일로 인증번호를 보내드렸습니다.");
						
						var searchUserNameStr = $("#searchMem_name2").val();
						var searchUseridStr = $("#searchUserid").val();
						var searchUseremailStr = $("#searchMem_email2").val();
						
						$("#searchMemPwd").css("display", 'none');
						$("#inputVerifiedNum").css("display", 'block');
						
						$("#searchMem_name3").val(searchUserNameStr);
						$("#vSearchUserid").val(searchUseridStr);
						$("#searchUserEmail").val(searchUseremailStr);
						
						return false;
					}
					if(result=='N'){
						alert("일치하는 회원정보가 없습니다.");
						return false;
					}
				},
				error: function(xhr, status, error){
					console.log("인증번호 보내기 에러",error);
					alert("인증번호 보내는 것을 실패했습니다, 다시 시도해주세요.");
					return false;
				}
			});
			return false;
		});
		
		$("#verifiedBtn").click(function(){
			var url = "verifiedNumCheck";
			var verifiedStr = $("#verifiedNumCheck").serialize();
			
			$.ajax({
				type: 'post',
				url: url,
				data: verifiedStr,
				success: function(result){
					if(result=='Y'){ //사용가능
						alert("회원가입한 이메일로 비밀번호를 보내드렸습니다.");
						location.href="login";
					}
					if(result=='N'){
						alert("일치하는 회원정보가 없습니다.");
					}
				},
				error: function(xhr, status, error){
					console.log("인증번호 확인 에러",error);
					alert("인증번호 확인을 실패했습니다, 다시 시도해주세요.");
				}
			
			});
			return false;
		});
		
		
	});