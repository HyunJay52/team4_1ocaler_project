<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	document.title="셀러회원가입";
	
	$(function(){
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
</script>

<div id="joinSeller">
	<form method="post" action="sellerJoinOk" id="sellerJoinFrm"  enctype="multipart/form-data">
		<div>셀러 가입</div>
		<div id="basicInfo">
			<ul>
				<li>아이디</li>
				<li><input type="text" name="userid" id="userid" tabindex="1" value="${logId }" readonly="readonly"/>
				</li>
			
				<li>비밀번호</li><!-- 현재 로그인한 회원의 비밀번호와 동일 -->
				<li><input type="password" name="userpwd" id="sellerPwd" tabindex="3" placeholder="비밀번호를 재입력해주세요"/><button type="button" class="btn commBtn lgBtn" id="sellPwdBtn">비밀번호확인</button><span id="pwdDoubleCheck">N</span>
					<br/><span id="sellPwdCheck"></span>
				</li>
				
				<li>사업자명</li>
				<li><input type="text" name="sel_name" id="sel_name" tabindex="4" placeholder="등록된 사업자명 입력"/> 
					<br/><span id="sellNameCheck"></span>
				</li>
				
				<li>회사명</li>
				<li><input type="text" name="company" id="company" tabindex="5" placeholder="이름을 입력해주세요"/> 
				</li>
				
				<li>사업자번호</li>
				<li><input type="number" name="com_num" id="com_num" tabindex="6" placeholder="사업자등록번호를 입력해주세요"/>
					<br/><span id="checkCumNum"></span>
				</li>
				
				<li>대표번호</li>
				<li><input type="number" name="sel_tel" id="sel_tel" tabindex="6" placeholder="예) 01012341234"/><button type="button" class="btn commBtn lgBtn">번호인증</button>
					<br/><span id="checkSellTel"></span>
				</li>
				
				<li>이메일</li>
				<li><input type="text" name="sel_email" id="sel_email" tabindex="7" placeholder="예) 1ocaler@1ocaler.com"/><button type="button" class="btn commBtn lgBtn">이메일 인증</button>
					<br/><span id="checkSellEmail"></span>
				</li>
				
				<li>주소</li>
				<li>
					<button type="button" tabindex="8" class="btn commBtn lgBtn findAddr" onclick="javascript:sellOpenKakaoPost()"><img src="common/search_fff.png" style="width: 15px; height:15px;">우리동네 찾기</button>
					<ul id="addrInput">
						<li><input type="text" name="sel_zip" id="sel_zip" tabindex="10"/><button type="button" class="btn commBtn lgBtn">재검색</button></li>
						<li><input type="text" name="sel_addr" id="sel_addr" tabindex="11"/></li>
						<li><input type="text" name="sel_detail" id="sel_detail" tabindex="12"/></li>
						<li>
							<div id="joinSellAddrWrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
							</div>
						</li>
					</ul>
				</li>
				
				<li>계좌등록</li>
				<li>
					<button type="button" tabindex="9" class="btn commBtn lgBtn addBank">계좌등록</button>
					<ul id="bankInput">
						<li><input type="text" name="acc_name" id="acc_name" tabindex="13" placeholder="예금주명"/>
							<br/><span id="checkSellAccName"></span>
						</li>
						<li>
							<select id="bank" name="bank" tabindex="14">
								<option value="0">은행선택</option>
								<option value="신한은행">신한은행</option>
								<option value="기업은행">기업은행</option>
								<option value="하나은행">하나은행</option>
								<option value="국민은행">국민은행</option>
								<option value="카카오뱅크">카카오뱅크</option>
							</select>
							<input type="number" name="account" id="account" tabindex="15" placeholder="계좌번호(숫자만 입력해주세요)"/>
							<br/><span id="checkSellAcc"></span>
						</li>
					</ul>
				</li>
			</ul>
			<button type="button" id="seeMore" class="btn seeMoreClass">더보기</button>
		</div>
		<div>추가정보</div>		
		<div id="setProfile">
			<ul style="height: 300px;">
				<li>프로필 사진</li>
				<li style="height: auto">
					<div style="border:none; width:110px; height: 110px; margin-right: 10px; float:left;">
						<img src="<%=request.getContextPath() %>/common/user.png" id="sel_previewImg" class="profImg form-control-file border" alt="upload image"/>
					</div>
					<label class="input-file-button" for="sel_prof">
					  사진추가
					</label>
					<input type="file" name="sel_profFile" accept="image/*" id="sel_prof" style="display:none; margin-top: 70px; border: none;"/>
				</li>
			
				<li>인사말</li>
				<li><textarea name="sel_content" id="sel_content" maxlength="200" placeholder="최대 200자"></textarea>
<!-- 					<input type="text" name="mem_content" id="mem_content" maxlength="100" placeholder="최대 100자"/> </li> -->
			</ul>
			<button class="btn seeMoreClass" >가입하기</button>
		</div>
	</form>
	
	
</div>
