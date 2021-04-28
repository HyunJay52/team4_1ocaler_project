<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h2>판매관리 - 판매자 정보</h2>
		<div class="sellerBasicInfo">
			<h3 class="info-font-weight">기본정보</h3>
			<form method="post">
				<ul class="sellerInfoList">
					<li>아이디</li>
					<li>test</li>
					<li>사업자명</li>
					<li><input type="text" name="userid" value="김자바" class="sellerInputDisplay" disabled/></li>
					<li>회사명</li>
					<li><input type="text" name="userid" value="김자바의 스윗포테이토" class="sellerInputDisplay" disabled/></li>
					<li>사업자번호</li>
					<li><input type="text" name="userid" value="123-12-12345" class="sellerInputDisplay" disabled/></li>
					<li><h3>대표 이미지</h3><label class="btn btn-outline-dark sellerImgLabel" for="imgFile">사진 선택</label></li>
					<li><img src="<%=request.getContextPath()%>/img/myInfo/delivery/box.png" class="sellerInfoImg"></li>
					<li><input id="imgFile" name="file" type="file" class="editOn" style="display:none; border:none;"/></li>
				</ul>
				<hr/>
				<div class="sellerInfoEditBtnForm">
					<input type="reset" class="btn commBtn sellerBtn" style="float:left" value="취소"/>
					<button class="btn commBtn sellerBtn" value="EDIT">수정하기</button>			
				</div>
			</form>
		</div>
		<div class="sellerDetailInfo">
			<h3 class="info-font-weight">상세정보</h3>
			<form method="post">
				<ul class="sellerInfoList">
					<li>전화번호</li>
					<li>031-1234-1234</li>
					<li>고객상담 번호</li>
					<li>010-1234-0099</li>
					<li>회사명</li>
					<li>김자바의 스윗포테이토</li>
					<li>주소</li>
					<li><input type="text" name="ziocide" value="77001" class="sellerZipcodeForm sellerInputDisplay" maxlength='5' disabled/><button class="btn commBtn sellerBtnDisplay">주소찾기</button></li>
					<li><input type="text" name="ziocide" value="강원도 원주시" class="sellerInputDisplay" disabled/></li>					
					<li>반품지 주소<input type="checkbox" class="sellerBtnDisplay"/></li>
					<li><input type="text" name="ziocide" value="77001" class="sellerZipcodeForm sellerInputDisplay" maxlength='5' disabled/><button class="btn commBtn sellerBtnDisplay">주소찾기</button></li>
					<li><input type="text" name="ziocide" value="강원도 원주시" class="sellerInputDisplay" disabled/></li>					
				</ul>
				<button class="btn commBtn sellerBtn sellerBtnDisplay" style="float:right">수정</button>			
			</form>
		</div>
		<div class="sellerAccountInfo">
			<h3 class="info-font-weight">계좌정보</h3>
			<div class="sellerAccountInfoCenter">
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
				<input type="text" name="bank" class="sellerAccountInfoForm"/>
				<button class="btn btn-outline-dark sellerBtn" style="float:right; margin:10px;">계좌인증</button>
			</div>
		</div>
		<div class="sellerBtnForm">
			<button class="btn commBtn btn-lg sellerBtn">셀러활동 중단</button>
			<button class="btn commBtn btn-lg sellerBtn">셀러 탈퇴</button>
			
		</div>
	</div>
</div>