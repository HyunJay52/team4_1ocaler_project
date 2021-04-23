<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/m_sel.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<div id="main">
	<div class="one">
		<ul id="simply">
			<li>기본정보</li>
			<li>아이디</li>
			<li><input type="text" name="userid" value="abcd1234"></li>
			<li>사업자명</li>
			<li><input type="text" name="sel_name" value="김자바"></li>
			<li>상호명</li>
			<li><input type="text" name="company" value="단호박"></li>
			<li>사업자 번호</li>
			<li><input type="text" name="com_num" value="123-12-12345"></li>
			<li>셀러 설명</li>
			<li><textarea name="sel_content" cols="45" rows="5"></textarea></li>
			<li>대표이미지</li>
			<li><img src="<%=request.getContextPath() %>/common/won_000.png" width="200" height="200"></li>
		</ul>
		<input type="button" id="modi"value="수정"/>
		<input type="button" id="repl" value="되돌리기"/>
	</div>
	<div class="one">
	<ul>
		<li>고객상담번호</li>
		<li><input type="text"name="sel_tel1" value="031">-
			<input type="text"name="sel_tel2" value="2222">-
			<input type="text"name="sel_tel3" value="1111">
		</li>
		<li>주소</li>
		<li><input type="text" name="sel_zip" value="우편번호"><input type="button" value="주소찾기"/></li>
		<li><input type="text" name="sel_addr" value="서울시 뫄뫄구 뫄뫄로"/></li>
		<li><input type="text" name="sel_detail" value="뫄뫄동 11호"/></li>
		<li>은행명</li>
		<li><select name="bank">
		
		</select></li>
		<li>계좌주</li>
		<li><input type="text" name="acc_name" value="김자바"/></li>
		<li>계좌번호</li>
		<li><input type="text" name="account" value="123-12-1234"/></li>
	</ul>
	</div>
</div>
</body>
</html>