<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commonStyle.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/info/infoStyle.css"/>
<style>
	#basicInfo, #detailInfo{
		background-color:#fff;
		width:480px;
		height:920px;
		margin-bottom:20px;
		padding:20px 30px;
		border:1px solid gray;
	}
	#basicInfo{
		float:left; 
	}
	#detailInfo{
		float:right;
	}
	#basicInfo>form>ul>li, #detailInfo>form>ul>li{	
		margin-bottom:20px;
	}
	#basicInfo>form>ul>li:nth-child(2n+1){
		font-size:14px; color:gray;
	}
	#basicInfo>form>ul>li:nth-child(9){
		color:black;
	}
	#basicInfo>form>ul>li:nth-child(10){
		padding:0 40px;
	}
	#basicInfo>form>ul>li>img{
		width:370px;
		height:280px;
		border-radius:20%;
		
	}
	#basicInfo>form>input{
		width:100px;	
	}
	#detailInfo>form>ul>li:nth-child(4)>input{
		width:50%;
	}
	#detailInfo>form>ul>li:nth-child(7)>input, #detailInfo>input[value='수정']{
		width:20%;
	}
	
	#basicInfo input, #detailInfo input{
		border:none; background-color:#fff; border-bottom:1px solid #ddd; height:40px; padding-left:10px; width:100%;
	}
	#basicInfo button, #detailInfo button{height:40px;}
	hr{
		border:1px solid #f1785;
	}
	#imgFile{
		padding:6px;
	}
	.header{font-weight:bold; font-size:24px;}
	.editOn{display:none;}
	.commBtn {
		width: 90px;
		color: #3f1785;
		border: 1px solid #3f1785;
	}
	.commBtn:hover {
		border: 1px solid #3f1785;
		background-color: #3f1785;
		font-weight: bold;
		color: #fff;
		font-weight: bold;
	}
	.cancelBtn {
		border: 1px solid #ddd;
		color: #ddd;
		width: 90px;
	}
	.cancelBtn:hover {
		background-color: #fff;
		color: gray;
	}
		
	.confBtn {
		background: #3f1785;
		color: #fff;
		width: 90px;
	}
	.confBtn:hover {
		color: #fff;
		background: #B8B2F4;
	}
	.modal-dialog{
		margin-top:20%;
	}
	.modal-content{
		height:240px;
	}
	.modal-body{
		text-align:center;
		padding:40px;
	}
	.selectBox{
		width:400px; height:40px; margin-bottom:10px;
	}
	.textBox{
		width:300px; height:30px; margin-bottom:10px; padding-left:5px;
	}
</style>
<script>
	$(function(){
		$("#basicInfo>form>button").click(function(){
			$(".mainContainer>div>button").attr('disabled', false);
			$(".mainContainer>div>form>input").css('display', 'block');
			$(".mainContainer>div>form>ul>li").css('display', 'block');			
			$(this).attr('disabled', 'block');
			$(".mainContainer>div>form input").attr('disabled', false).css('border', '1px solid black');
			$(".editOn").css('display', 'block');
			$("#imgFile").css('border', 'none');
			$("#detailInfo>form>ul>li select").attr('disabled', false);
	
		});
		$("#cancel").click(function(){
			$(".mainContainer>div>button").attr('disabled', 'true');
			$(".mainContainer>div>form>button[value='EDIT']").attr('disabled', false);
			$(".editOn").css('display', 'none');
			$(".mainContainer>div>form input").attr('disabled', true).css('border', 'none');
			$("#detailInfo>form>ul>li select").attr('disabled', 'true'); 
			$("#cancel").css('border', '1px solid'); 
			
		});
		
		//폼 초기화
		$(document).ready(function() {
			$("#cancel").click(function() {
			$("#basicInfo>form")[0].reset();
			$("#detailfrm")[0].reset();
			
			});
		});
		
		//모달 닫기
		$("#modalClose").click(function(){
			$("#md").modal("hide");
		});
		
		//탈퇴 조사 폼
		$("input[value='네']").click(function(){			
			$(this).parent().css('display', 'none');
			$(this).parent().next().css('display', 'block');
		});
		
		//탈퇴 조사 취소
		$("#secession").click(function(){
			$("#md").modal("hide");
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
		
		//지역 세팅
		function setGu(){
			var gu = ['강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구', 
				'노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구'];
			var tag = "";
			gu.map(function(value, index){
				tag += "<option value="+value+">"+value+"</option>";
			});
			$("#addr1").html(tag);
			$("#addr2").html(tag);
		}
	setGu();
	});
</script>
<div class="body">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="mainContainer">
	
		<h2>내 정보</h2>
		<div id="basicInfo">
			<span class="header">기본정보</span>
			<form method="post">
				<ul>
					<li>아이디</li>
					<li>test</li>
					<li>회원명</li>
					<li>테스트</li>
					<li>별명</li>
					<li><input type="text" name="nickname" value="자바칩프라푸치노" disabled/></li>
					<li>소개</li>
					<li><input type="text" name="#" value="마포구 동대" disabled/><hr/></li>
					<li><h4>대표 이미지</h4></li>
					<li><img src="<%=request.getContextPath()%>/img/myInfo/saver.gif"></li>
					<li><input id="imgFile" name="file" type="file" class="editOn"/></li>
				</ul>
				<hr/>
				<input id="cancel" type="reset" class="btn cancelBtn" disabled="disabled" style="float:left" value="취소"/>
				<button class="btn commBtn" value="EDIT">수정하기</button>
			</form>
		</div>
		<div id="detailInfo">
			<span class="header">상세정보</span>
			<form id="detailfrm" method="post">
				<ul>
					<li>연락처</li>
					<li><input type="text" name="tel" value="010-0000-0000" disabled/></li>
					<li>이메일</li>
					<li><input type="text" name="email" value="test" disabled/>@
						<select name="emaildomain" disabled>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
						</select>
					</li>
					<li style="overflow:auto; display:none"><input type="button" value="메일변경" class="btn commBtn editOn" style="float:right"/></li>
					<li>주소</li>
					<li><input type="text" name="zipcode" value="12345" disabled/><input type="button" style="float:right; margin-right:60%;" value="주소찾기" class="btn commBtn editOn"></li>
					<li><span>서울특별시</span>
						<select id="addr1" name="addr" disabled>

						</select>
					</li>
					<li><input type="text" name="detailaddr" value="특별한13길	13-7 103동 202호" disabled/></li>
					<li>선호지역</li>
					<li><span>서울특별시</span>
						<select id="addr2" name="#" disabled>

						</select>
					</li>
				</ul>
			<hr/>
			<input type="submit" class="btn commBtn editOn" style="float:right;" value="수정"/>
			</form>
			<input type="button" class="btn commBtn btn-sm btn-primary" data-target="#md" data-toggle="modal" value="탈퇴하기"/>
		</div>
	</div>
	<div class="modal fade" id="md" data-backdrop="static">
		<div class="modal-dialog" data-backdrop="static">
			<div class="modal-content" data-backdrop="static">
				<div class="modal-body" data-backdrop="static">
					<p class="mdFnt">탈퇴하시겠습니까?</p><br/>
					<input id="modalClose" type="button" class="btn commBtn" value="아니오"/><input type="button" class="btn cancelBtn" value="네"/>
				</div>
				<div class="modal-body" style="display:none" data-backdrop="static">
					<p class="mdFnt">탈퇴사유 조사</p>
					<form id="secessionForm" method="post">
						<select id="selBox" class="selectBox" name="why">
							<option value="탈퇴 사유">탈퇴 사유</option>
							<option value="디자인이 마음에 안들어요">디자인이 마음에 안들어요</option>
							<option value="사용하기 불편해요">사용하기 불편해요</option>
							<option value="다른 사이트 이용">다른 사이트 이용</option>
							<option value="비매너 사용자로 인하여">비매너 사용자로 인하여</option>
							<option value="기타">기타</option>
						</select>
						<div style="display:none">
							<span class="smlFnt">기타 내용 : </span><input type="text" id="detailwhy" class="textBox" name="detailwhy"/>
						</div>
						<input id="secession" type="button" class="btn commBtn" value="취소"/>
						<input id="secessionOk" type="button" class="btn cancelBtn" value="등록"/>
					</form>
				</div>
			</div>
		</div>
	
	</div>
</div>
</body>
</html>