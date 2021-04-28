<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/publicwrite.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script src="//cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<script>
	$(function(){
		CKEDITOR.replace("of_content");		
	});
</script>
<div class="main">
<div class="title">자주하는 질문</div>
	<form method="post" action="oftenQWriteOk">
		<select class="selectcomm" name="of_cate">
			<option value="회원문의">회원문의</option>
			<option value="게시판문의">게시판문의</option>
			<option value="결제/충전문의">결제/충전문의</option>
			<option value="배송문의">배송문의</option>
			<option value="기타문의">기타문의</option>
		</select>
		<input type="text" name="of_subject" value=""placeholder="제목을 입력하세요"/><br/>
		<textarea name="of_content"></textarea><br/>
		<input type="submit" class="searchbtn btnFrm" value="등록완료"/>
	</form>	

</div>











