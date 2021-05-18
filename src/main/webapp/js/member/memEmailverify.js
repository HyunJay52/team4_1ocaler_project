/*
 * 이메일 인증하기  
 */
 	
	$(function(){
		$(document).on('click', '#verifyEmail', function(){
			
			var param = "mem_email="+$("#mem_email").val()+"&whichpage='mem'";
			$.ajax({
				url: "sendVerifiedCode",
				data: param,
				success: function(result){
					console.log("성공!", result);
					
					if(result=='Y'){
						$("#verifyEmailPop").css("display", "block");
					}
					if(result=='N'){
						alert("이미 존재하는 이메일입니다. 다른 이메일로 시도해주세요.");
						$("#mem_email").focus();
					}
					return false;
				},
				error: function(error){
					alert("이메일 인증에 실패했습니다. 다시 시도해주세요.");
					$("#mem_email").focus();
					console.log("메일 인증 에러 > ",error);
					return false;
				}
			});
			return false;
		});
		
		$(document).on('click', '#verfiedNumChek', function(){
			
			var url = 'sendVerifiedNumCheck';
			var param = 'verifiedNum='+$("#verifiedNum").val();
			
			$.ajax({
				url: url,
				data: param,
				type: 'post',
				success: function(result){
					console.log("성공!", result);
					
					if(result=='Y'){
						alert("인증에 성공하였습니다.");
						$("#verifyEmailPop").css("display", "none");
					}
					if(result=='N'){
						alert("인증번호가 일치하지않습니다. 다시 시도해주세요.");
						$("#mem_email").focus();
					}
					return false;
				},
				error: function(error){
					alert("인증에 실패했습니다. 다시 시도해주세요.");
					$("#mem_email").focus();
					console.log("메일 인증 에러 > ",error);
					return false;
				}
			});
			return false;
		});
	});