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
	<div class="title">신고처리</div>
	<ul class="per_top">
		<li>신고자 : ${vo.userid }</li>
		<li>${vo.rep_subject }</li>
		<li>게시글번호 : ${vo.num }</li>
		<li>신고일 : ${vo.rep_writedate }</li>
		<li> 상태 : 
			<c:if test="${vo.rep_status==1 }">
				미처리
			</c:if>
			<c:if test="${vo.rep_status==2 }">
				반려
			</c:if>
			<c:if test="${vo.rep_status==3 }">
				처리
			</c:if>
		</li>
	</ul>
	<textarea class="persnalarea" readonly>${vo.rep_content }</textarea>
	<form method="post" id="perFrm" action="persnalOk">
		<input type="hidden" name="rep_num" value="${vo.rep_num }"/>
		신고처리일 : ${vo.rep_ok }
		<textarea  id="peranswer"class="persnalarea" placeholder="답변을 입력해주세요"></textarea>
		<input type="submit" class="puplebtn" id="psubmit" value="답변완료"/>
	</form>
</div>
























