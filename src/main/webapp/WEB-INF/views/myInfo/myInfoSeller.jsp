<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	document.title = "내정보(판매자)";
	
	$(function(){
		
		//수정폼 오픈
		$("#moreSellerInfo").click(function(){
			$(this).css('display', 'none');
			$(".editOn").css('display', 'block');
			$(".inputDisabled").attr('disabled', false);
			//$("#sel_prof").attr('readyonly', false);
			
		});
		
		//수정취소
		$("#sellerEditCancelBtn").click(function(){
			$("#moreSellerInfo").css('display', 'block');
			$(".editOn").css('display', 'none');	
			$(".inputDisabled").attr('disabled', true);
		});
		
		//정보수정 버튼
		$("#sellerEditBtn").click(function(){
			if(confirm("판매자 정보를 수정하시겠습니까?")){
				
			}
		});
		
	});	
</script>
<%@ include file="/inc/sideBar.jspf" %>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<form method="post" action="myinfoSellerOk" id="myinfoSellerFrm" enctype="multipart/form-data">
		<div class="basicMyinfo">
		<div class="basicMyinfoHeader" style="margin-bottom: 30px;">판매자 정보</div>
			<ul>
				<li>대표 이미지</li>
				<li class="memheightAuto">
					<div style="border: none; width: 180px; height: 180px; margin-right: 10px; float: left;">
						<img src="<%=request.getContextPath()%>/img/sel_prof/${myVO.sel_prof}"
						id="sel_previewImg" class="profImg form-control-file border" alt="upload image"style="height:100%"/>

					</div> <label class="Mem_input-file-button" for="sel_prof"> 사진수정 </label> 
					<input type="file" name="profFile" accept="image/*" id="sel_prof" style="display: none; margin-top: 70px; border: none;" />
				</li>
				
				<li>아이디</li>
				<li><input type="text" name="userid" id="userid" tabindex="1" value="${myVO.userid }" disabled/></li>
				<li>사업자명</li>
				<li><input type="text" name="sel_name" id="sel_name"tabindex="5" value="${myVO.sel_name }" disabled/></li>
				<li>회사명</li>
				<li>
					<input type="text" class="inputDisabled" name="company" id="company" value="${myVO.company }" disabled="disabled" placeholder="회사명을 입력해주세요" />
				</li>
				<li>사업자 번호</li>
				<li>
					<input type="text" class="inputDisabled" name="com_num" id="com_num" tabindex="6" maxlength="11" value="${myVO.com_num }" disabled="disabled"/>
				</li>
				<li>고객상담번호</li>
				<li>
					<input type="text" class="inputDisabled" name="sel_tel" id="sel_tel" tabindex="6" maxlength="11" value="${myVO.sel_tel }" disabled="disabled"/>
				</li>
				<li>이메일</li>
				<li><input type="text" class="inputDisabled" name="sel_email" id="sel_email" tabindex="6" maxlength="11" value="${myVO.sel_email }" disabled="disabled"/>
				<button type="button" id="verifyEmail" class="btn commBtn Mem_lgBtn">이메일인증</button> <br />
				<span id="checktel"></span></li>
					
				<li>주소</li>
				<li style="height:200px">
					<ul class="myifoAddrInput">
						<li><input type="text" class="inputDisabled" name="sel_zip" id="sel_zip" value="${myVO.sel_zip }" disabled="disabled"
							tabindex="9" />
						<button type="button" class="btn commBtn Mem_lgBtn inputDisabled" onclick="javascript:openKakaoPost()">재검색</button></li>
						<li><input type="text" class="inputDisabled" name="sel_addr" id="sel_addr" value="${myVO.sel_addr }" disabled="disabled"
							tabindex="10" /></li>
						<li><input type="text" class="inputDisabled" name="sel_detail" id="sel_detail" value="${myVO.sel_detail }" disabled="disabled"
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

				<li style="height:120px">

				<li style="height: auto">

					<ul id="bankInput"  style="height: auto;">
						<li><input type="text" name="acc_name" id="acc_name" class="inputDisabled" value="${myVO.acc_name }"/>
							<br/><span id="checkSellAccName"></span>
						</li>
						<li><!-- bank -->
							<select id="bank" name="bank" class="inputDisabled">
								<option value="0">은행선택</option>
								<option value="신한은행">신한은행</option>
								<option value="기업은행">기업은행</option>
								<option value="하나은행">하나은행</option>
								<option value="국민은행">국민은행</option>
								<option value="카카오뱅크">카카오뱅크</option>
							</select>
							<input type="number" name="account" id="account" class="inputDisabled" value="${myVO.account }"/>
							<br/><span id="checkSellAcc"></span>
						</li>
					</ul>
				</li>
				<li>인사말</li>
				<li style="height: auto;"><textarea name="sel_content" id="mem_content" style="width:320px; height:150px; padding: 5px; resize:none; border: 1px solid #ddd"
						maxlength="200" class="inputDisabled" placeholder="최대 200자" disabled="disabled">${myVO.sel_content }</textarea>
				</li>
								
			</ul>
			
			<button type="button" id="moreSellerInfo" class="btn commBtn Mem_lgBtn"
				style="width: 320px; height: 40px; display: block; margin: 0 auto;">수정하기</button>
			<div class="editOn" id="sellerEditOn">

				<button id="sellerEditBtn" type="submit" class="btn commBtn Mem_lgBtn" style="width: 320px; display: block; margin: 0 auto;">수정</button>
				<button id="sellerEditCancelBtn" type="reset" class="btn cancelBtn Mem_lgBtn" style="width: 320px; display: block; margin: 0 auto;">취소</button>			

				<button type="submit" class="btn commBtn Mem_lgBtn" style="width: 320px; display: block; margin: 5px auto;">수정</button>
				<button type="reset" class="btn cancelBtn Mem_lgBtn" style="width: 320px; display: block; margin: 5px auto;">취소</button>			

			</div>
			<div style="text-align:center; margin-bottom:20px">
				<button type="button" class="btn commBtn" style="width:320px; height:45px; margin: 5px auto;">셀러활동 중단</button>
				<br/><button type="button" class="btn cancelBtn" style="width:320px;  height:45px; margin: 5px auto;" data-target="#myinfoMd" data-toggle="modal">셀러 탈퇴</button>
			</div>
		</div>
	</form>
</div>
<div id="verifyEmailPop">
	<div>이메일인증</div>
	<ul>
		<li>인증번호를 입력해주세요</li>
		<li><input type="password" id="verifiedNum"/></li>
		<li><input type="submit" id="verfiedNumChek" value="확인하기"/></li>
	</ul>	
</div>

<script src="<%=request.getContextPath() %>/js/member/selEmailverify.js"></script>