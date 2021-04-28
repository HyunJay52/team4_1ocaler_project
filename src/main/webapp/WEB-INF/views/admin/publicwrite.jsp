<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/publicwrite.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<script>
	$(function(){
		CKEDITOR.replace("content");		
	});
</script>
<div class="main">
	<div class="title">공지등록</div>
	<form>
		<select class="selectcomm"name="serchkey">
			<option value="우리직구">우리직구</option>
			<option value="가치가장">가치가장</option>
			<option value="커뮤니티">커뮤니티</option>
		</select>
		<input type="text" name="subject" placeholder="공지 제목을 입력하세요"/><br/>
		<textarea name="content"></textarea><br/>
		<input type="submit" class="searchbtn btnFrm" value="등록완료"/>
		<input type="reset" class="searchbtn btnFrm" value="다시쓰기"/>
	</form>	

</div>











