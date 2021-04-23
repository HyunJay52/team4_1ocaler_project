<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/persnal.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<div id="main">
	<a>1:1 답변</a>
	<input type="text" class="persnaltxt"value="[카테고리] 문의드립니다~~" readonly />
	<textarea class="persnalarea" readonly>문의 드립니다.~~</textarea>
	<input type="text" class="persnaltxt" name="subject"/>
	<textarea name="content" class="persnalarea" placeholder="내용을 입력해주세요"></textarea>
	<input type="submit" class="puplebtn" id="psubmit" value="답변완료"/>
</div>
























