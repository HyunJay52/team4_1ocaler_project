<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/oftenQWrite.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<script>
	$(function(){
		CKEDITOR.replace("of_content");		
	});
</script>
<div class="main">
<div class="title">자주하는 질문 수정</div>
	<form id="oftenqFrm" method="post" action="oftenQWriteEditOk">
		<div class="selectcomm">${vo.of_cate}</div>
		<input type="text" name="of_subject" value="${vo.of_subject }"placeholder="제목을 입력하세요"/><br/>
		<textarea name="of_content">${vo.of_content }</textarea><br/>
		<input type="hidden" name="of_num" value="${vo.of_num }"/>
		<input type="submit" class="searchbtn btnFrm" value="수정"/>
	</form>	

</div>











