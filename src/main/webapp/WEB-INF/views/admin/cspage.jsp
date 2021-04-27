<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/cspage.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script>
$(function(){
	//자주하는 질문 클릭시
	$("#oftenBtn").click(function(){
		//다른 버튼 색상 변경 
		$("#csBtn").removeClass("puplebtn");
		$("#reportBtn").removeClass("puplebtn");
		$("#csBtn").addClass("searchbtn");
		$("#reportBtn").addClass("searchbtn");
		//현재버튼의 색상 변경
		$(this).removeClass("searchbtn");
		$(this).addClass("puplebtn");
		var params ="cate=oftenq";
		var url = "/localer/oftenAndCs"
		$.ajax({
			type : "POST",
			url : url,
			data : params,
			success : function(result){
				var $result = $(result);
				$(".reset").remove();//테이블 내용 지우기 
				var txt = "";
				$result.each(function(idx,vo){//테이블 내용 추가
					txt += "<tr class='reset'>";
					txt += 		"<td>"+vo.cs_num+"</td>";
					txt += 		"<td>"+vo.cs_cate+" "+vo.cs_subject+"</td>";
					txt += 		"<td>관리자</td>";
					txt += 		"<td></td>";
					txt += 		"<td><input type='button' class='redBtn' name='"+vo.cs_num+"' value='삭제'/>";
					txt +=		"<input type='button' class='smallbtn' name='"+vo.cs_num+"'title='oftenqBtn' value='수정'/></td>";
					txt += "</tr>";
				});
				$("#resultTbl").append(txt);
				
			},error:function(){
				$(".reset").remove();//테이블 내용 지우기 
				$("#resultTbl").append("전송받기 실패ㅜㅜ");
			}
		});
	});
	//================================
		
	//1:1 질문 클릭시
	$("#csBtn").click(function(){
		//다른 버튼 색상 변경 
		$("#oftenBtn").removeClass("puplebtn");
		$("#reportBtn").removeClass("puplebtn");
		$("#oftenBtn").addClass("searchbtn");
		$("#reportBtn").addClass("searchbtn");
		//현재버튼의 색상 변경
		$(this).removeClass("searchbtn");
		$(this).addClass("puplebtn");
		var params ="cate=cs";
		var url = "/localer/oftenAndCs"
		$.ajax({
			type : "POST",
			url : url,
			data : params,
			success : function(result){
				var $result = $(result);
				$(".reset").remove();//테이블 내용 지우기 
				var txt = "";
				$result.each(function(idx,vo){//테이블 내용 추가
					txt += "<tr class='reset'>";
					txt += 		"<td>"+vo.cs_num+"</td>";
					txt += 		"<td>"+vo.cs_subject+"</td>";
					txt += 		"<td>"+vo.userid+"</td>";
					txt += 		"<td>"+vo.cs_writedate+"</td>";
					txt += 		"<td><input type='button' ";
					if(vo.cs_status==1){
						txt += " class='smallbtn' value='처리요청'</td></tr>";
					}else{
						txt += " class='spuplebtn' value='처리완료'</td></tr>";
					}
				});
				$("#resultTbl").append(txt);
			},error:function(){
				$(".reset").remove();//테이블 내용 지우기 
				$("#resultTbl").append("전송받기 실패ㅜㅜ");
			}
		});
	});
	//================
	//사용자신고 질문 클릭시
	$("#reportBtn").click(function(){
		//다른 버튼 색상 변경 
		$("#oftenBtn").removeClass("puplebtn");
		$("#csBtn").removeClass("puplebtn");
		$("#oftenBtn").addClass("searchbtn");
		$("#csBtn").addClass("searchbtn");
		//현재버튼의 색상 변경
		$(this).removeClass("searchbtn");
		$(this).addClass("puplebtn");
		var params ="cate=report";
		var url = "/localer/oftenAndCs"
		$.ajax({
			type : "POST",
			url : url,
			data : params,
			success : function(result){
				var $result = $(result);
				$(".reset").remove();//테이블 내용 지우기 
				var txt = "";
				$result.each(function(idx,vo){//테이블 내용 추가
					txt += "<tr class='reset'>";
					txt += 		"<td>"+vo.rep_num+"</td>";
					txt += 		"<td>"+vo.rep_subject+"</td>";
					txt += 		"<td>"+vo.userid+"</td>";
					txt += 		"<td>"+vo.rep_writedate+"</td>";
					txt += 		"<td><input type='button' ";
					if(vo.cs_status==1){
						txt += " class='smallbtn' value='처리요청'</td></tr>";
					}else{
						txt += " class='spuplebtn' value='처리완료'</td></tr>";
					}
				});
				$("#resultTbl").append(txt);
			},error:function(){
				$(".reset").remove();//테이블 내용 지우기 
				$("#resultTbl").append("전송받기 실패ㅜㅜ");
			}
		});
	});
});
//자주하는 질문 수정버튼 클릭시,
$(document).on('click', '.smallbtn', function(){
	var cate = $(this).attr('title');//버튼 클릭종류 파악 
	var num =  $(this).attr('name');//버튼 클릭한 글번호 가져오기 
	if(cate=="oftenqBtn"){
		//자주하는 질문 수정클릭시
		location.href="oftenQWriteEdit?num="+num;
	}
});
//자주하는 질문 삭제 클릭시
$(document).on('click', '.redBtn', function(){
	var num =  $(this).attr('name');//버튼 클릭한 글번호 가져오기 
	if(confirm("삭제하시겠습니까?")){
		location.href="oftenQDelete?num="+num;
	}
});

</script>
<div id="main">
	<div class="title">고객센터</div>
	<p>
		<select name="searchkey" class="selectcomm">
			<option value="게시물번호">게시물 번호</option>
			<option value="게시글제목">게시글 제목</option>
			<option value="게시글내용">게시글 내용</option>
			<option value="작성자별명">작성자 닉네임</option>
		</select>
		<input type="text" class="textcomm"/>
		<input type="submit" class="puplebtn"value="검색"/>
	</p>
	<p>
		<input type="button" id="oftenBtn" class="searchbtn" value="자주하는 질문"/>
		<input type="button" id="csBtn" class="searchbtn" value="1:1 질문"/>
		<input type="button" id="reportBtn" class="puplebtn" value="사용자 신고"/>
		<input type="button" class="puplebtn" value="자주하는 질문작성"/>
	</p>
	<table id="resultTbl" class="tablea cstable">
		<colgroup>
             <col width="5%" />
             <col />
             <col width="10%"/>
             <col width="10%" />
             <col width="15%"/>
        </colgroup>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>게시글관리</td>
		</tr>
		<c:forEach var="vo" items="${list}">
			<tr class="reset">
				<td>${vo.rep_num }</td>
				<td><a href="#">${vo.rep_subject }</a></td>
				<td>${vo.userid }</td>
				<td>${vo.rep_writedate }</td>
				<td>
					<c:if test="${vo.rep_status==1 }">
						<input type="button" class="smallbtn" value="처리요청"/>
					</c:if>
					<c:if test="${vo.rep_status==2 }">
						<input type="button" class="spuplebtn" value="처리완료"/>
					</c:if>
					
				</td>
			</tr>
		</c:forEach>
		
	</table>
</div>










