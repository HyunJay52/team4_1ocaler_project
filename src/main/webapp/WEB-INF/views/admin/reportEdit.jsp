<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/reportEdit.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script>
	$(document).on('click','.puplebtn',function(){
		var sub = $(this).val();
		var rep_status;
		if(sub=="처리"){
			$("#reportEditFrm").append("<input type='hidden' name='rep_status' value='3'/>");
		}else if(sub=="반려"){
			$("#reportEditFrm").append("<input type='hidden' name='rep_status' value='2'/>");
		}else{//미처리
			$("#reportEditFrm").append("<input type='hidden' name='rep_status' value='1'/>");
		}
		$("#reportEditFrm").submit();
	});
</script>
<div class="main">
	<div class="title">신고처리</div>
	<ul class="per_top">
		<li>${vo.rep_subject }</li>
		<li>신고자 : ${vo.userid }</li>
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
	<form method="post" id="reportEditFrm" action="reportEditOk">
		<input type="hidden" name="rep_num" value="${vo.rep_num }"/>
		<input type="hidden" name="num" value="${vo.num }"/>
		신고처리일 : ${vo.rep_ok }
		<p>
			<input type="button" class="puplebtn" value="처리"/>
			<input type="button" class="puplebtn" value="반려"/>
			<input type="button" class="puplebtn" value="미처리"/>
		</p>
	</form>
</div>
























