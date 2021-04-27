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
<div class="title">자주하는 질문</div>
	<form>
		<input type="text" name="subject" value=""placeholder="제목을 입력하세요"/><br/>
		<textarea name="content"></textarea><br/>
		<input type="submit" class="searchbtn btnFrm" value="등록완료"/>
		<input type="reset" class="searchbtn btnFrm" value="다시쓰기"/>
	</form>	

</div>











