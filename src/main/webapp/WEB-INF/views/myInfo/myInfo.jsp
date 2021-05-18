<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 전화인증 api -->
<script src="https://www.gstatic.com/firebasejs/ui/4.8.0/firebase-ui-auth.js"></script>
<link type="text/css" rel="stylesheet" href="https://www.gstatic.com/firebasejs/ui/4.8.0/firebase-ui-auth.css" />
<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	document.title = "내 정보";

	$(function(){
		//myinfo 더보기 이벤트
		var moreInfoOn = false;
		$("#moreInfo").click(function(){
			if(moreInfoOn == false){
				$(this).css('display', 'none');
				$(".editOn").css('display', 'block');
				$(".inputDisabled").attr('disabled', false);
				//$("#mem_prof").attr('readyonly', false);
				moreInfoOn = true;
			}else{
				if(confirm("수정을 취소하시겠습니까?")){
						
				}else{
					return false;
				}
				
				$(".editOn").css('display', 'none');	
				$(".inputDisabled").attr('disabled', true);
				moreInfoOn = false;								
			}
		});
		
		//수정버튼 이벤트
		var editOn = false;
		$("#myinfoEditBtn").click(function(){
			if(moreInfoOn == true){
				$(this).css('display', 'none');
				$(".editOn").css('display', 'block');
				$(".inputDisabled").attr('disabled', false);
				editOn = true;
			}else{	
				$(".editOn").css('display', 'none');			
				editOn = false;	
			}
		});
		
		//리셋 이벤트
		$("#myinfoFrm").on('reset', function(){
			$(".editOn").css('display', 'none');
			$("#moreInfo").css('display', 'block');
			$(".inputDisabled").attr('disabled', true);
			moreInfoOn = false;
		});
		
		//탈퇴 조사 폼
		$("input[value='네']").click(function(){			
			$(this).parent().css('display', 'none');
			$(this).parent().next().css('display', 'block');
		});
		
		//탈퇴 조사 취소
		$("#secession").click(function(){
			$(this).parent().parent().css('display', 'none');
			$(this).parent().parent().prev().css('display', 'block');
		
		});
		
		//기타 폼 표시
		var selCheck = false;
		$("#selBox").change(function(){
			if($(this).val() == '기타'){
				$(this).next().css('display', 'block');
				selCheck = true;
			}else{//기타 폼 none
				$(this).next().css('display', 'none');
				selCheck = false;
			}
		});
		
		//탈퇴조사 등록시
		$("#secessionOk").click(function(){
			if($("#selBox").val() == '탈퇴 사유' || ($("#detailwhy").val() == '' && selCheck == true)){
				alert("탈퇴 사유를 선택해주세요");
			}else{
				$("#secessionForm").submit();
			}
		});
		//이메일 세팅
		function setEmail(){
			var emailAll = '${myVO.mem_email}';
			var email = emailAll.split("@");
			
			var domain = ['naver.com','gmail.com','daum.net','nate.com'];
			var tag = "<input type='text' name='mem_email' value='"+email[0]+"' disabled/>@";
			tag += "<select name='emaildomain' disabled>";
			
			for(var i = 0; i < domain.length; i++){
				if(domain[i] == email[1]){
					tag += "<option value='"+domain[i]+"' selected>"+domain[i]+"</option>";
				}else{
					tag += "<option value='"+domain[i]+"'>"+domain[i]+"</option>";
				}	
			}
			tag += "</select>";
			
			$("#emailForm").html(tag);
		}
		
		//지역 세팅
		var gu = ['강서구','양천구','구로구','영등포구','금천구','동작구','관악구','서초구', 
				'강남구','송파구','강동구','마포구','용산구','서대문구','중구','성동구',
				'광진구','종로구','동대문구','성북구','중랑구','은평구','강북구','노원구','도봉구'];
		var tag = "<option value='0'> = = = = = = = = 지역선택 = = = = = = = = </option>";
		for(var i = 0; i < gu.length; i++){
			if(gu[i] == '${myVO.loc_gu}'){
				tag += "<option value="+gu[i]+" selected>"+gu[i]+"</option>";
			}else{
				tag += "<option value="+gu[i]+">"+gu[i]+"</option>";
			}
		}
		$("#myinfoLoc_gu").append(tag);

	});
</script>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<form method="post" action="myinfoUpdate" id="myinfoFrm" enctype="multipart/form-data">
		<div class="basicMyinfoHeader">내 정보</div>
		<div class="basicMyinfo">
			<ul>
				<li>프로필 사진</li>
				<li class="memheightAuto">
					<div style="border: none; width: 110px; height: 110px; margin-right: 10px; float: left;">
						<img src="<%=request.getContextPath()%>/img/mem_prof/${myVO.mem_prof}"
							id="previewImg" class="profImg form-control-file border"
							alt="upload image" />
					</div> <label class="Mem_input-file-button" for="mem_prof"> 사진수정 </label> 
					<input type="file" name="profFile" accept="image/*" id="mem_prof" 
					style="display: none; margin-top: 70px; border: none;" />
					<!-- 수정 전의 프로필 사진 저장 -->
					<input type="hidden" id="getMem_prof" name="getMem_prof" value="${myVO.mem_prof}"/>
				</li>
				
				<li>아이디</li>
				<li><input type="text" name="userid" id="userid" tabindex="1" value="${myVO.userid }" disabled/></li>
				<li>이름</li>
				<li><input type="text" name="mem_name" id="mem_name"tabindex="5" value="${myVO.mem_name }" disabled/></li>
				<li>닉네임</li>
				<li><input type="text" class="inputDisabled" name="mem_nick" id="mem_nick" value="${myVO.mem_nick }" disabled="disabled"
					placeholder="별명을 입력해주세요" />
				<button type="button" class="btn commBtn Mem_lgBtn" id="nickOverlapBtn">중복검사</button>
					<span id="nickOverlap">N</span><br/>
					<span id="checkNickname"></span>	
				</li>

				<li>인사말</li>
				<li><textarea name="mem_content" id="mem_content" style="width:318px; height:62px; padding: 5px; resize:none"
						maxlength="200" class="inputDisabled" placeholder="최대 200자" disabled="disabled">${myVO.mem_content }</textarea>
				</li>
				<li>연락처</li>
				<li><input type="text" class="inputDisabled" name="mem_tel" id="mem_tel" tabindex="6" maxlength="11" value="${myVO.mem_tel }" disabled="disabled"/>
				<button type="button" class="btn commBtn Mem_lgBtn" onclick="javascript:verifyPhoneNumber()">번호인증</button> <br />
				<span id="checktel"></span></li>
					
				<li>이메일</li>
				<li><input type="text" name="mem_email" id="mem_email" class="inputDisabled"
					tabindex="7" value="${myVO.mem_email }" disabled="disabled" placeholder="예) 1ocaler@1ocaler.com" />
				<button type="button"  id="verifyEmail" class="btn commBtn Mem_lgBtn">이메일 인증</button> <br />
				<span id="checkemail"></span></li>

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
				<li>활동지역</li>
				<li>
					<select id="myinfoLoc_gu" name="loc_gu" tabindex="12" class="inputDisabled" disabled="disabled">

					</select>			
				</li>
			</ul>
			
			<button type="button" id="moreInfo" class="btn commBtn Mem_lgBtn"
				style="width: 320px; height: 40px; display: block; margin: 0 auto;">수정하기</button>
			<div class="editOn" id="editOn">
				<button type="submit" class="btn commBtn Mem_lgBtn" style="width: 320px; color: #fff; font-family:nsreb; background:#5f0080; display: block; margin: 5 auto;">수정</button>
				<button type="reset" class="btn cancelBtn " style="width: 320px; display: block; margin: 5 auto;">취소</button>			
			</div>
		</div>
	</form>
		<div class="myinfoOtherBtn">
			<a href="joinSeller" class="btn commBtn">셀러등록하기</a>
		</div>
		<button style="float:right" type="button" class="btn cancelBtn " data-target="#myinfoMd" data-toggle="modal">탈퇴하기</button>
	</div>
	<div class="modal fade" id="myinfoMd" data-backdrop="static">
		<div class="modal-dialog" data-backdrop="static" style="margin-top:20%">
			<div class="modal-content" data-backdrop="static" style="height:240px">
				<div class="modal-body" data-backdrop="static" style="text-align:center; padding:40px;">
					<p>아직 놓치신 동네정보가 많으신데,<br/>정말 탈퇴를 원하시나요?</p><br/>
					<input id="modalClose" type="button" class="btn commBtn" data-dismiss="modal" value="아니오"/>&nbsp;&nbsp;&nbsp;<input type="button" class="btn cancelBtn" value="네"/>
				</div>
				<div class="modal-body" style="display:none" data-backdrop="static">
					<p class="mdFnt">탈퇴사유 조사</p>
					<form id="secessionForm" method="post" action="deletMember">
						<select id="selBox" class="selectBox" name="del_why">
							<option value="탈퇴 사유">탈퇴 사유</option>
							<option value="디자인이 마음에 안들어요">디자인이 마음에 안들어요</option>
							<option value="사용하기 불편해요">사용하기 불편해요</option>
							<option value="다른 사이트 이용">다른 사이트 이용</option>
							<option value="비매너 사용자로 인하여">비매너 사용자로 인하여</option>
							<option value="기타">기타</option>
						</select>
						<div style="display:none">
							<span class="smlFnt">기타 내용 : </span><input type="text" id="detailwhy" class="textBox" name="del_why"/>
						</div>
						<input id="secession" type="button" class="btn commBtn" value="취소"/>
						<input id="secessionOk" type="button" class="btn cancelBtn" value="등록"/>
					</form>
				</div>
			</div>
		</div>
	
	</div>
</div>

<div id="verifyEmailPop">
	<div>이메일인증</div>
	<ul>
		<li>인증번호를 입력해주세요</li>
		<li><input type="password" id="verifiedNum"/></li>
		<li><input type="submit" id="verfiedNumChek" value="확인하기"/></li>
	</ul>	
</div>

<script src="<%=request.getContextPath() %>/js/member/memEmailverify.js"></script>