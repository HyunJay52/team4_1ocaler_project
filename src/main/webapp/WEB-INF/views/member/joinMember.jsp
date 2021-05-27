<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<!-- 전화인증 api -->
<script src="https://www.gstatic.com/firebasejs/ui/4.8.0/firebase-ui-auth.js"></script>
<link type="text/css" rel="stylesheet" href="https://www.gstatic.com/firebasejs/ui/4.8.0/firebase-ui-auth.css" />
<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	document.title = "회원가입";
</script>
<div id="joinMem">
	<form method="post" action="memJoinOk" id="memJoinFrm" enctype="multipart/form-data">
		<div>회원 가입</div>
		<div id="basicInfo">
			<ul>
				<li>아이디</li>
				<li><input type="text" name="userid" id="userid" tabindex="1"
					placeholder="아이디를 입력해주세요" />
				<button type="button" class="btn commBtn Mem_lgBtn" tabindex="2" id="idOverlapBtn">중복검사</button>
					<span id="idOverlap">N</span> <br/>
				<span id="checkid"></span></li>

				<li>비밀번호</li>
				<li><input type="password" name="userpwd" id="userpwd1"
					tabindex="3" placeholder="영문, 숫자, 특수문자 1개 필수 포함" /> <br />
				<span id="checkpwd"></span></li>

				<li>비밀번호 확인</li>
				<li><input type="password" name="userpwd2" id="userpwd2"
					tabindex="4" placeholder="비밀번호를 재입력 입력해주세요" /> <br />
				<span id="checkpwd2"></span></li>

				<li>이름</li>
				<li><input type="text" name="mem_name" id="mem_name"
					tabindex="5" placeholder="이름을 입력해주세요" /> <br />
				<span id="checkname"></span></li>

				<li>연락처</li>
				<li><input type="number" name="mem_tel" id="mem_tel" tabindex="6" maxlength="11"
					placeholder="예) 01012341234" />
				<br />
				<span id="checktel"></span></li>

				<li>이메일</li>
				<li><input type="text" name="mem_email" id="mem_email"
					tabindex="7" placeholder="예) 1ocaler@1ocaler.com" />
				<button type="button" id="verifyEmail" class="btn commBtn Mem_lgBtn">이메일 인증</button> <br />
				<span id="checkemail"></span></li>

				<li>주소</li>
				<li>
					<button type="button" tabindex="8" class="btn commBtn Mem_lgBtn findAddr" onclick="javascript:openKakaoPost()">
						<img src="common/search_000.png" id="joinSearchAddrImg">우리동네 찾기
					</button>
					<ul id="addrInput">
						<li><input type="text" name="mem_zip" id="mem_zip"
							tabindex="9" />
						<button type="button" class="btn commBtn Mem_lgBtn" onclick="javascript:openKakaoPost()">재검색</button></li>
						<li><input type="text" name="mem_addr" id="mem_addr"
							tabindex="10" /></li>
						<li><input type="text" name="mem_detail" id="mem_detail"
							tabindex="11" />
						</li>
						<li>
							<div id="joinAddrWrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
							</div>
						</li>
					</ul>
				</li>
				<li>활동지역</li>
				<li>
					<select id="loc_gu" name="loc_gu" tabindex="12">
								<option value="0"> = = = = = = = = 지역선택 = = = = = = = = </option>
								<option value="강서구">강서구</option>
								<option value="양천구">양천구</option>
								<option value="구로구">구로구</option>
								<option value="영등포구">영등포구</option>
								<option value="금천구">금천구</option>
								<option value="동작구">동작구</option>
								<option value="관악구">관악구</option>
								<option value="서초구">서초구</option>
								<option value="강남구">강남구</option>
								<option value="송파구">송파구</option>
								<option value="강동구">강동구</option>
								<option value="마포구">마포구</option>
								<option value="용산구">용산구</option>
								<option value="서대문구">서대문구</option>
								<option value="중구">중구</option>
								<option value="성동구">성동구</option>
								<option value="광진구">광진구</option>
								<option value="종로구">종로구</option>
								<option value="동대문구">동대문구</option>
								<option value="성북구">성북구</option>
								<option value="중랑구">중랑구</option>
								<option value="은평구">은평구</option>
								<option value="강북구">강북구</option>
								<option value="노원구">노원구</option>
								<option value="도봉구">도봉구</option>
					</select>
<!-- 					<img src="img/indexImg/bo_pin.png" id="join_locImg"/> -->
				</li>
			</ul>
			<button type="button" id="seeMore" class="btn seeMoreClass" >더보기</button>
		</div>
		<div>추가정보</div>
		<div id="setProfile">
			<ul id="prof_ul">
				<li>프로필 사진</li>
				<li class="memheightAuto">
					<div style="border: none; width: 110px; height: 110px; margin-right: 10px; float: left;">
						<img src="<%=request.getContextPath()%>/common/user.png"
							id="previewImg" class="profImg form-control-file border"
							alt="upload image" />
					</div> <label class="Mem_input-file-button" for="mem_prof"> 사진추가 </label> 
					<input type="file" name="profFile" accept="image/*" id="mem_prof" 
					style="display: none; margin-top: 70px; border: none;" />
				</li>

				<li>닉네임</li>
				<li><input type="text" name="mem_nick" id="mem_nick"
					placeholder="별명을 입력해주세요" />
				<button type="button" class="btn commBtn Mem_lgBtn" id="nickOverlapBtn">중복검사</button>
					<span id="nickOverlap">N</span><br/>
					<span id="checkNickname"></span>	
				</li>

				<li>인사말</li>
				<li><textarea name="mem_content" id="mem_content"
						maxlength="200" placeholder="최대 200자"></textarea> 
			</ul>
			<button type="submit" class="btn seeMoreClass">가입하기</button>
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

<script src="<%=request.getContextPath() %>/js/member/memEmailverify.js"></script>