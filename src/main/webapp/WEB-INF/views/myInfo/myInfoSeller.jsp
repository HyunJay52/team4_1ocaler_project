<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="myinfoBody">

	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<form method="post" action="myinfoSellerOk" id="myinfoSellerFrm" enctype="multipart/form-data">
		<div class="basicMyinfoHeader">판매자 정보</div>
		<div class="basicMyinfo">
			<ul>
				<li>대표 이미지</li>
				<li class="memheightAuto">
					<div style="border: none; width: 110px; height: 110px; margin-right: 10px; float: left;">
						<img src="<%=request.getContextPath()%>/common/user.png"
							id="previewImg" class="profImg form-control-file border"
							alt="upload image" />
					</div> <label class="Mem_input-file-button" for="mem_prof"> 사진수정 </label> 
					<input type="file" name="profFile" accept="image/*" id="mem_prof" 
					style="display: none; margin-top: 70px; border: none;" />
				</li>
				
				<li>아이디</li>
				<li><input type="text" name="userid" id="userid" tabindex="1" value="${myVO.userid }" disabled/></li>
				<li>사업자명</li>
				<li><input type="text" name="mem_name" id="mem_name"tabindex="5" value="${myVO.mem_name }" disabled/></li>
				<li>회사명</li>
				<li><input type="text" class="inputDisabled" name="mem_nick" id="mem_nick" value="${myVO.mem_nick }" disabled="disabled"
					placeholder="회사명을 입력해주세요" />
				<button type="button" class="btn commBtn Mem_lgBtn" id="nickOverlapBtn">중복검사</button>
					<span id="nickOverlap">N</span><br/>
					<span id="checkNickname"></span>	
				</li>
				<li>사업자 번호</li>
				<li><input type="text" class="inputDisabled" name="mem_tel" id="mem_tel" tabindex="6" maxlength="11" value="${myVO.mem_tel }" disabled="disabled"/>
				<button type="button" class="btn commBtn Mem_lgBtn" onclick="javascript:verifyPhoneNumber()">번호인증</button> <br />
				<span id="checktel"></span></li>
					
				<li>전화번호</li>
				<li><input type="text" class="inputDisabled" name="mem_tel" id="mem_tel" tabindex="6" maxlength="11" value="${myVO.mem_tel }" disabled="disabled"/>
				<button type="button" class="btn commBtn Mem_lgBtn" onclick="javascript:verifyPhoneNumber()">번호인증</button> <br />
				<span id="checktel"></span></li>
					
				<li>고객상담 번호</li>
				<li><input type="text" class="inputDisabled" name="mem_tel" id="mem_tel" tabindex="6" maxlength="11" value="${myVO.mem_tel }" disabled="disabled"/>
				<button type="button" class="btn commBtn Mem_lgBtn" onclick="javascript:verifyPhoneNumber()">번호인증</button> <br />
				<span id="checktel"></span></li>
					
				<li>주소</li>
				<li style="height:200px">
					<ul class="myifoAddrInput">
						<li><input type="text" class="inputDisabled" name="mem_zip" id="mem_zip" value="${myVO.mem_zip }" disabled="disabled"
							tabindex="9" />
						<button type="button" class="btn commBtn Mem_lgBtn" onclick="javascript:openKakaoPost()">재검색</button></li>
						<li><input type="text" class="inputDisabled" name="mem_addr" id="mem_addr" value="${myVO.mem_addr }" disabled="disabled"
							tabindex="10" /></li>
						<li><input type="text" class="inputDisabled" name="mem_detail" id="mem_detail" value="${myVO.mem_detail }" disabled="disabled"
							tabindex="11" />
						</li>
						<li>
							<div id="joinAddrWrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:absolute">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
							</div>
						</li>
					</ul>
				</li>
				<li>반품지 주소</li>
				<li style="height:200px">
					<ul class="myifoAddrInput">
						<li><input type="text" class="inputDisabled" name="mem_zip" id="mem_zip" value="${myVO.mem_zip }" disabled="disabled"
							tabindex="9" />
						<button type="button" class="btn commBtn Mem_lgBtn" onclick="javascript:openKakaoPost()">재검색</button></li>
						<li><input type="text" class="inputDisabled" name="mem_addr" id="mem_addr" value="${myVO.mem_addr }" disabled="disabled"
							tabindex="10" /></li>
						<li><input type="text" class="inputDisabled" name="mem_detail" id="mem_detail" value="${myVO.mem_detail }" disabled="disabled"
							tabindex="11" />
						</li>
						<li>
							<div id="joinAddrWrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:absolute">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
							</div>
						</li>
					</ul>
				</li>				
				<li>계좌정보</li>
				<li style="height:110px"><input type="text" name="bank" class="sellerAccountInfoForm"/>
					<select class="sellerAccountInfoForm">
							<option value="기업은행">기업은행</option>
							<option value="우리은행">우리은행</option>
							<option value="국민은행">국민은행</option>
							<option value="하나은행">하나은행</option>
							<option value="신한은행">신한은행</option>
							<option value="SC제일은행">SC제일은행</option>
							<option value="한국씨티은행">한국씨티은행</option>
							<option value="농협은행">농협은행</option>
						</select>
					<button class="btn btn-outline-dark sellerBtn" style="float:left; margin:2px 0; width:90px">계좌인증</button>
				</li>
			</ul>
			
			<button type="button" id="moreSellerInfo" class="btn commBtn Mem_lgBtn"
				style="width: 320px; height: 40px; display: block; margin: 0 auto;">수정하기</button>
			<div class="editOn" id="sellerEditOn">
				<button type="submit" class="btn commBtn Mem_lgBtn" style="width: 320px; display: block; margin: 0 auto;">수정</button>
				<button type="reset" class="btn cancelBtn Mem_lgBtn" style="width: 320px; display: block; margin: 0 auto;">취소</button>			
			</div>
			<div style="text-align:center; margin-bottom:20px">
				<button type="button" class="btn commBtn" style="width:320px">셀러활동 중단</button>
				<br/><button type="button" class="btn cancelBtn" style="width:320px" data-target="#myinfoMd" data-toggle="modal">셀러 탈퇴</button>
			</div>
		</div>
	</form>
</div>
<script>
	$(()=>{
		$("#moreSellerInfo").click(function(){
			$(this).css('display', 'none');
			$("#sellerEditOn").css('display', 'block');
		});
	});
</script>