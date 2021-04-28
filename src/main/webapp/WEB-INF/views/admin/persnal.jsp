<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/persnal.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script>
	$(function(){
		$("#perFrm").submit(function(){
			if($("#peranswer").val()==''){
				alert('답변내용을 입력하세요,,');
				return false;
			}
			return true;
		});
	});
</script>
<div class="main">
	<div class="title">1:1 답변</div>
	<ul class="per_top">
		<li>${vo.cs_cate }</li>
		<li>${vo.cs_subject }</li>
		<li>${vo.userid }</li>
		<li>${vo.cs_writedate }</li>
		<li>
			<c:if test="${vo.cs_status==1 }">
				미처리
			</c:if>
			<c:if test="${vo.cs_status==2 }">
				처리완료
			</c:if>
		</li>
	</ul>
	<textarea class="persnalarea" readonly>${vo.cs_content }</textarea>
	<form method="post" id="perFrm" action="persnalOk">
		<input type="hidden" name="cs_num" value="${vo.cs_num }"/>
		답변등록일 : ${vo.cs_date }
		<textarea name="cs_answer" id="peranswer"class="persnalarea" placeholder="답변을 입력해주세요">${vo.cs_answer }</textarea>
		<input type="submit" class="puplebtn" id="psubmit" value="답변완료"/>
	</form>
</div>
























