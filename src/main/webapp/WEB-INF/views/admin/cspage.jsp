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
		$('.puplebtn').removeClass("puplebtn").addClass("searchbtn");//보라색 버튼 클래스 지우고, 클래스 넣어주기
		//현재버튼의 색상 변경
		$(this).removeClass("searchbtn").addClass("puplebtn");
		//히든 selectcate value 변경
		$("#selectcate").val("oftenq");
		var params ="cate=oftenq";
		var url = "oftenAndCs"
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
					txt +=		"<input type='button' class='smallbtn' name='"+vo.cs_num+"' title='oftenqBtn' value='수정'/></td>";
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
		$('.puplebtn').removeClass("puplebtn").addClass("searchbtn");//보라색 버튼 클래스 지우고, 클래스 넣어주기
		//현재버튼의 색상 변경
		$(this).removeClass("searchbtn").addClass("puplebtn");
		//히든 selectcate value 변경
		$("#selectcate").val("cs");
		var params ="cate=cs";
		var url = "oftenAndCs"
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
					txt += 		"<td>"+vo.cs_subject+"</a></td>";
					txt += 		"<td>"+vo.userid+"</td>";
					txt += 		"<td>"+vo.cs_writedate+"</td>";
					txt += 		"<td><input type='button' ";
					if(vo.cs_status==1){
						txt += " class='smallbtn' name='"+vo.cs_num+"' title='csBtn'value='처리요청'</td></tr>";
					}else{
						txt += " class='spuplebtn' name='"+vo.cs_num+"' title='csBtn' value='처리완료'</td></tr>";
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
		$('.puplebtn').removeClass("puplebtn").addClass("searchbtn");//보라색 버튼 클래스 지우고, 클래스 넣어주기
		//현재버튼의 색상 변경
		$(this).removeClass("searchbtn").addClass("puplebtn");
		//히든 selectcate value 변경
		$("#selectcate").val("report");
		var params ="cate=report";
		var url = "oftenAndCs"
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
					if((vo.rep_status)==1){
						txt += " class='smallbtn' name='"+vo.rep_num+"' title='reportBtn' value='처리요청'</td></tr>";
					}else if((vo.rep_status)==2){
						txt += " class='spuplebtn' name='"+vo.rep_num+"' title='reportBtn' value='반려'</td></tr>";
					}else{
						txt += " class='spuplebtn' name='"+vo.rep_num+"' title='reportBtn' value='처리완료'</td></tr>";
					}
				});
				$("#resultTbl").append(txt);
			},error:function(){
				$(".reset").remove();//테이블 내용 지우기 
				$("#resultTbl").append("전송받기 실패ㅜㅜ");
			}
		});
	});
	$("#oftenqWriteBtn").click(function(){
		location.href="oftenQWrite";
	});
});
//===========테이블 안에 버튼이벤트=================
//자주하는 질문 수정버튼 클릭시,1:1질문 처리요청
$(document).on('click', '.smallbtn', function(){
	var cate = $(this).attr('title');//버튼 클릭종류 파악 
	var num =  $(this).attr('name');//버튼 클릭한 글번호 가져오기 
	alert(cate+"////"+num);
	if(cate=="oftenqBtn"){
		//자주하는 질문 수정클릭시
		location.href="oftenQWriteEdit?num="+num;
	}else if(cate=="csBtn"){
		//1:1질문 처리요청 클릭시 
		location.href="persnal?cs_num="+num;
	}else if(cate=="reportBtn"){
		//신고 처리요청 클릭시
		location.href = "reportEdit?num="+num;
	}
});
//1:1질문 처리완료
$(document).on('click', '.spuplebtn', function(){
	var cate = $(this).attr('title');//버튼 클릭종류 파악 
	var num =  $(this).attr('name');//버튼 클릭한 글번호 가져오기 
	alert(cate+"////"+num);
	if(cate=="csBtn"){
		//1:1질문 처리요청 클릭시 
		location.href="persnal?cs_num="+num;
	}else if(cate=="reportBtn"){
		//신고 반려, 처리완료 클릭시
		location.href = "reportEdit?num="+num;
	}
});
//자주하는 질문 삭제 클릭시
$(document).on('click', '.redBtn', function(){
	var num =  $(this).attr('name');//버튼 클릭한 글번호 가져오기 
	if(confirm("삭제하시겠습니까?")){
		location.href="oftenQDelete?num="+num;
	}
});
//============검색부분 구현===========
$(document).on('click', '#searchCS', function(){
	var searchVal =$('.selectcomm').val();
	var searchTxt = $('.textcomm').val();
	var cate = $("#selectcate").val();
	if(cate=='report'){
		searchReportF("searchCS","searchkey="+searchVal+"&text="+searchTxt)
	}else if(cate=='oftenq'){
		alert("자주하는 질문");
	}else if(cate=='cs'){
		alert("cs클릭");
	}
});
//신고글 검색 ajax 함수
function searchReportF(url,params){
	$.ajax({
		url:url,
		data:params+"&cate=report",
		success:function(result){
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
					if((vo.cs_status)==1){
						txt += " class='smallbtn' name='"+vo.cs_num+"' title='reportBtn' value='처리요청'</td></tr>";
					}else if((vo.cs_status)==2){
						txt += " class='spuplebtn' name='"+vo.cs_num+"' title='reportBtn' value='반려'</td></tr>";
					}else{
						txt += " class='spuplebtn' name='"+vo.cs_num+"' title='reportBtn' value='처리완료'</td></tr>";
					}
				});
				$("#resultTbl").append(txt);
			
		},error:function(){
			alert("검색 실패했다 하,,,");
		}
	});
}
</script>
<div class="main">
	<div class="title">고객센터</div>
	<p>
		<select name="searchkey" class="selectcomm">
			<option value="num">게시물 번호</option>
			<option value="subject">게시글 제목</option>
			<option value="content">게시글 내용</option>
			<option value="userid">아이디</option>
		</select>
		<input type="text" class="textcomm"/>
		<input type="button" class="searchbtn" id="searchCS" value="검색"/>
	</p>
	<p>
		<input type="button" id="oftenBtn" class="searchbtn" value="자주하는 질문"/>
		<input type="button" id="csBtn" class="searchbtn" value="1:1 질문"/>
		<input type="button" id="reportBtn" class="puplebtn" value="사용자 신고"/>
		<input type="button" id="oftenqWriteBtn"class="searchbtn" value="자주하는 질문작성"/>
		<input type="hidden" id="selectcate" value="report"/>
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
				<td>${vo.rep_subject }</td>
				<td>${vo.userid }</td>
				<td>${vo.rep_writedate }</td>
				<td>
					<c:if test="${vo.rep_status==1 }">
						<input type="button" name="${vo.rep_num }" title="reportBtn" class="smallbtn" value="처리요청"/>
					</c:if>
					<c:if test="${vo.rep_status==2 }">
						<input type="button" name="${vo.rep_num }" title="reportBtn" class="spuplebtn" value="반려"/>
					</c:if>
					<c:if test="${vo.rep_status==3 }">
						<input type="button" name="${vo.rep_num }" title="reportBtn" class="spuplebtn" value="처리완료"/>
					</c:if>
					
				</td>
			</tr>
		</c:forEach>
		
	</table>
</div>











