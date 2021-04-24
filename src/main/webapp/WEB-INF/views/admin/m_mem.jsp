<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/m_mem.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script>
	$(function(){
		$('.memid').click(function(){
			alert("클릭이벤트 발생");
			var text = $(this).prev().text();
			meminfo(text);
		});
		
		function meminfo(num){
			$("#meminfo").css("display", "block");
		}
	});
</script>
<div class="main">
	<div class="title">일반회원관리</div>
	<ul class="statis">
		<li>
			총회원수
			<div>2500</div>
			<b>▲4% </b>지난주 대비
		</li>
		<li>
			신규회원
			<div>2500</div>
			<b>▼4% </b>지난주 대비
		</li>
		<li>
			셀러회원
			<div>2500</div>
			<b>4% </b>지난주 대비
		</li>
		<li>
			휴면계정
			<div>2500</div>
			<b>4% </b>지난주 대비
		</li>
		<li>
			탈퇴
			<div>2500</div>
			<b>4% </b>지난주 대비
		</li>
	</ul>
	
	<form id="memFrm">
		<select name="serchkey" class="selectcomm">
			<option value="회원아이디">회원아이디</option>
			<option value="회원번호">회원 번호</option>
			<option value="회원이름">회원 이름</option>
		</select>
		<input type="text" class="textcomm" name="serchword"/>
		<input type="submit" class="searchbtn" value="검색"/>
	</form>	
	<table class="tablea" >
		 <colgroup>
               <col width="5%" />
               <col width="5%" />
               <col width="6%" />
               <col width="5%" />
               <col />
               <col width="13%" />
               <col width="9%" />
               <col width="8%" />
               <col width="9%" />
               <col width="9%" />
            </colgroup>
		<tr>
			<td>번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>성별</td>
			<td>주소</td>
			<td>연락처</td>
			<td>글쓰기 권한</td>
			<td>휴면상태</td>
			<td>판매자 권한</td>
			<td>블랙리스트</td>
		</tr>
		<tr>
			<td>1</td>
			<td class="memid">goguma</td>
			<td>김길동</td>
			<td>남자</td>
			<td>서울시 강서구</td>
			<td>010-2222-3333</td>
			<td><input type="button" class="spuplebtn"value="Y"></td>
			<td><input type="button" class="spuplebtn"value="Y"></td>
			<td><input type="button" class="spuplebtn"value="Y"></td>
			<td><input type="button" class="redBtn"value="정지"></td>
		</tr>
	</table>
	<!-- 회원 정보 테이블 이름클릭시 보이도록 설정  -->
	<table id="meminfo" class="tablea">
		<colgroup>
               <col width="200" />
               <col width="200" />
               <col width="100" />
               <col width="250" />
               <col width="200" />
           </colgroup> 
		<tr>
			<td>게시물</td>
			<td>댓글</td>
			<td>등급</td>
			<td>가입날짜</td>
			<td>누적신고</td>
		</tr>
		<tr>
			<td>10</td>
			<td>40</td>
			<td>5</td>
			<td>2021.01.01</td>
			<td>88</td>
		</tr>
	</table>
	

		
</div>