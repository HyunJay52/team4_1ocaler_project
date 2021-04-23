<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/question.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<script>
	$(function(){
		CKEDITOR.replace("content");		
	});
</script>
<div id="main">
	<a>자주하는 질문 상세</a>
	<form id="quesFrm">
		<input type="text" class="persnaltxt" name="subject" placeholder="공지 제목을 입력하세요"/><br/>
		<textarea name="content" class="persnalarea"></textarea><br/>
		<input type="submit" class="searchbtn alignright" value="수정하기"/>
		<input type="reset" class="searchbtn alignright" value="취소"/>
	</form>	

</div>











