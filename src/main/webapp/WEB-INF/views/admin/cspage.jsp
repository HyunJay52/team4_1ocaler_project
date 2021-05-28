<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/cspage.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script>
$(function(){
	//============검색부분 구현===========
	$(document).on('click', '#searchCS', function(){
		var cate = $("#selectcate").val();
		if(cate=="report"){
			reportAjax();
		}else if(cate=="cs"){
			csAjax();
		}else {
			oftenAjax();
		}
	});
	//페이지 이동 클릭
	$(document).on('click', '.clickpage', function(){
		var txt = $(this).text();
		
		if(txt=="이전"){
			var nextPage = parseInt($("#pageNum").val())-1;
			$("#pageNum").val(nextPage);	
		}else if(txt=="다음"){
			var nextPage = parseInt($("#pageNum").val())+1;
			$("#pageNum").val(nextPage);
		}else{
			$("#pageNum").val(txt);
		}
		
		//페이지 이동 ajax 추가
		//무슨 카테고리인지 알아오기 
		var cate = $("#selectcate").val();
		if(cate=="report"){
			reportAjax();
		}else if(cate=="cs"){
			csAjax();
		}else {
			oftenAjax();
		}
	});
	//자주하는 질문 클릭시
	$("#oftenBtn").click(function(){
		//다른 버튼 색상 변경 
		$('.puplebtn').removeClass("puplebtn").addClass("searchbtn");//보라색 버튼 클래스 지우고, 클래스 넣어주기
		//현재버튼의 색상 변경
		$(this).removeClass("searchbtn").addClass("puplebtn");
		//히든 selectcate value 변경
		$("#selectcate").val("oftenq");
		//검색창에 text 지워주기
		$(".textcomm").val("");
		oftenAjax();
	});
	function oftenAjax(){
		$.ajax({
			type : "POST",
			url : "pagingCS",
			data : $("#searchFrm").serialize()+"&cate=often",
			success : function(result){
				var $list = $(result.list);
				var pagenum = result.pageNum;
				var start = result.startPageNum;
				var last = result.totalPage;
				$(".op1").remove();
				$(".op2").remove();
				$(".reset").remove();//테이블 내용 지우기 
				var txt = "";
					txt += "<colgroup class='op1'>";
					txt += 		"<col width='5%' />";
					txt += 		"<col width='10%' />";
					txt += 		"<col />";
					txt += 		"<col width='10%' />";
					txt += 		"<col width='10%' />";
					txt += 		"<col width='15%' />";
					txt += "</colgroup>";
					txt += "<tr class='op2'>";
					txt +=		"<td>번호</td>";
		    		txt += 		"<td>카테고리</td>";
		    		txt += 		"<td>제목</td>";
		    		txt += 		"<td>작성자</td>";
		    		txt += 		"<td>등록일</td>";
		    		txt += 		"<td>게시글관리</td>";
		    		txt += "</tr>";
		    	$.each($list ,function(idx,vo){//테이블 내용 추가
					txt += "<tr class='reset'>";
					txt += 		"<td>"+vo.of_num+"</td>";
					txt += 		"<td>"+vo.of_cate+"</td>";
					txt += 		"<td class='wordcut'>"+vo.of_subject+"</td>";
					txt += 		"<td>관리자</td>";
					txt += 		"<td></td>";
					txt += 		"<td><input type='button' class='redBtn' name='"+vo.of_num+"' value='삭제'/>";
					txt +=		"<input type='button' class='smallbtn' name='"+vo.of_num+"' title='oftenqBtn' value='수정'/></td>";
					txt += "</tr>";	
				});
				$("#resultTbl").append(txt);
				//페이징 부분
				var link="";
				$(".clickpage").remove();//기존 페이징 부분 삭제
				if(pagenum>1){
					link +="<li  class='clickpage'>이전</li>";	
				}
				var lastPg=last;
				if(lastPg>=start+4){//>11>2+4
					lastPg=5;
				}else{
					lastPg = last-start+1;
				}
				for(var i=start;i<=start+lastPg-1;i++){
					if(pagenum==i){
						link +="<li  class='clickpage nowPg'>"+i+"</li>";
					}else{
						link +="<li  class='clickpage'>"+i+"</li>";	
					}
					
				}
				if(last>pagenum){
					link +="<li  class='clickpage'>다음</li>";
				}
				$(".link").append(link);
			},error:function(){
				$(".reset").remove();//테이블 내용 지우기 
				$("#resultTbl").append("전송받기 실패ㅜㅜ");
			}
		});
	}
	//================================
		
	//1:1 질문 클릭시
	$("#csBtn").click(function(){
		//다른 버튼 색상 변경 
		$('.puplebtn').removeClass("puplebtn").addClass("searchbtn");//보라색 버튼 클래스 지우고, 클래스 넣어주기
		//현재버튼의 색상 변경
		$(this).removeClass("searchbtn").addClass("puplebtn");
		//히든 selectcate value 변경
		$("#selectcate").val("cs");
		//검색창에 text 지워주기
		$(".textcomm").val("");
		csAjax();//ajax로 페이지
	});
	function csAjax(){
		$.ajax({
			type : "POST",
			url : "pagingCS",
			data : $("#searchFrm").serialize()+"&cate=cs",
			success : function(result){
				var $list = $(result.list);
				var pagenum = result.pageNum;
				var start = result.startPageNum;
				var last = result.totalPage;
				$(".op1").remove();
				$(".op2").remove();
				$(".reset").remove();//테이블 내용 지우기 
				var txt = "";
				txt += "<colgroup class='op1'>";
				txt += 		"<col width='5%' />";
				txt += 		"<col />";
				txt += 		"<col width='10%' />";
				txt += 		"<col width='10%' />";
				txt += 		"<col width='15%' />";
				txt += "</colgroup>";
				txt += "<tr class='op2'>";
				txt +=		"<td>번호</td>";
	    		txt += 		"<td>제목</td>";
	    		txt += 		"<td>작성자</td>";
	    		txt += 		"<td>등록일</td>";
	    		txt += 		"<td>게시글관리</td>";
	    		txt += "</tr>";
	    		$.each($list ,function(idx,vo){//테이블 내용 추가
					txt += "<tr class='reset'>";
					txt += 		"<td>"+vo.cs_num+"</td>";
					txt += 		"<td class='wordcut'>"+vo.cs_subject+"</a></td>";
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
				//페이징 부분
				var link="";
				$(".clickpage").remove();//기존 페이징 부분 삭제
				if(pagenum>1){
					link +="<li  class='clickpage'>이전</li>";	
				}
				var lastPg=last;
				if(lastPg>=start+4){//>11>2+4
					lastPg=5;
				}else{
					lastPg = last-start+1;
				}
				for(var i=start;i<=start+lastPg-1;i++){
					if(pagenum==i){
						link +="<li  class='clickpage nowPg'>"+i+"</li>";
					}else{
						link +="<li  class='clickpage'>"+i+"</li>";	
					}
					
				}
				if(last>pagenum){
					link +="<li  class='clickpage'>다음</li>";
				}
				$(".link").append(link);
			},error:function(){
				$(".reset").remove();//테이블 내용 지우기 
				$("#resultTbl").append("전송받기 실패ㅜㅜ");
			}
		});
	}
	//================
	//사용자신고 질문 클릭시
	$("#reportBtn").click(function(){
		//다른 버튼 색상 변경 
		$('.puplebtn').removeClass("puplebtn").addClass("searchbtn");//보라색 버튼 클래스 지우고, 클래스 넣어주기
		//현재버튼의 색상 변경
		$(this).removeClass("searchbtn").addClass("puplebtn");
		//히든 selectcate value 변경
		$("#selectcate").val("report");
		//검색창에 text 지워주기
		$(".textcomm").val("");
		reportAjax();
	});
	function reportAjax(url,data){
		$.ajax({
			url : "pagingCS",
			type : "POST",
			data : $("#searchFrm").serialize()+"&cate=report",
			success : function(result){
				var $list = $(result.list);
				var pagenum = result.pageNum;
				var start = result.startPageNum;
				var last = result.totalPage;
				$(".op1").remove();
				$(".op2").remove();
				$(".reset").remove();//테이블 내용 지우기 
				var txt = "";
					txt += "<colgroup class='op1'>";
					txt += 		"<col width='5%' />";
					txt += 		"<col />";
					txt += 		"<col width='10%' />";
					txt += 		"<col width='10%' />";
					txt += 		"<col width='15%' />";
					txt += "</colgroup>";
					txt += "<tr class='op2'>";
					txt +=		"<td>번호</td>";
		    		txt += 		"<td>제목</td>";
		    		txt += 		"<td>작성자</td>";
		    		txt += 		"<td>등록일</td>";
		    		txt += 		"<td>게시글관리</td>";
		    		txt += "</tr>";
				$.each($list ,function(idx,vo){//테이블 내용 추가
					txt += "<tr class='reset'>";
					txt += 		"<td>"+vo.rep_num+"</td>";
					txt += 		"<td class='wordcut'>"+vo.rep_subject+"</td>";
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
				//페이징 부분
				var link="";
				$(".clickpage").remove();//기존 페이징 부분 삭제
				if(pagenum>1){
					link +="<li  class='clickpage'>이전</li>";	
				}
				var lastPg=last;
				if(lastPg>=start+4){//>11>2+4
					lastPg=5;
				}else{
					lastPg = last-start+1;
				}
				for(var i=start;i<=start+lastPg-1;i++){
					if(pagenum==i){
						link +="<li  class='clickpage nowPg'>"+i+"</li>";
					}else{
						link +="<li  class='clickpage'>"+i+"</li>";	
					}
					
				}
				if(last>pagenum){
					link +="<li  class='clickpage'>다음</li>";
				}
				$(".link").append(link);
			},error:function(){
				$(".reset").remove();//테이블 내용 지우기 
				$("#resultTbl").append("전송받기 실패ㅜㅜ");
			}
		});
	}
	$("#oftenqWriteBtn").click(function(){
		location.href="oftenQWrite";
	});
});
	//===========테이블 안에 버튼이벤트=================
	//자주하는 질문 수정버튼 클릭시,1:1질문 처리요청
	$(document).on('click', '.smallbtn', function(){
		var cate = $(this).attr('title');//버튼 클릭종류 파악 
		var num =  parseInt($(this).attr('name'));//버튼 클릭한 글번호 가져오기 
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


</script>
<div class="main">
	<div class="title">고객센터</div>
	<div class="searchDiv">
		<div class="searchInfo">
			<form id="searchFrm">
					<select name="searchKey" class="selectcomm">
						<option value="num">게시물 번호</option>
						<option value="subject">게시글 제목</option>
						<option value="content">게시글 내용</option>
						<option value="userid">아이디</option>
					</select>
					<input type="text" name="searchWord" class="textcomm"/>
					<input type="button" class="searchbtn" id="searchCS" value="검색"/>
					<input type="hidden" id="selectcate" value="report"/>
					<input type="hidden" name="pageNum" id="pageNum"value="1"/>
			</form>
		</div>
		<div class="searchCate">
			<input type="button" id="oftenBtn" class="searchbtn" value="자주하는 질문"/>
			<input type="button" id="csBtn" class="searchbtn" value="1:1 질문"/>
			<input type="button" id="reportBtn" class="puplebtn" value="사용자 신고"/>
			<input type="button" id="oftenqWriteBtn"class="searchbtn" value="자주하는 질문작성"/>
		</div>
	</div>
	<table id="resultTbl" class="tablea cstable">
		<colgroup class="op1">
             <col width="5%" />
             <col />
             <col width="10%"/>
             <col width="10%" />
             <col width="15%"/>
        </colgroup>
		<tr class="op2">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>게시글관리</td>
		</tr>
		<c:forEach var="vo" items="${list}">
			<tr class="reset">
				<td>${vo.rep_num }</td>
				<td class="wordcut">${vo.rep_subject }</td>
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
	<ul class="link">
		<!-- 이전버튼 -->
		<c:if test="${pageVO.pageNum>1 }">
			<li class="clickpage">이전</li>
		</c:if>
		<!-- 페이지 번호              1부터                            5까지   -->
         <c:forEach var="p" begin="${pageVO.startPageNum}" end="${pageVO.startPageNum+pageVO.onePageNum-1}">
            <c:if test="${p<=pageVO.totalPage}">              
            	<c:if test="${p==pageVO.pageNum }">
            		<li class="clickpage nowPg" >${p}</li> 
            	</c:if>
            	<c:if test="${p!=pageVO.pageNum }">
            		<li class="clickpage" >${p}</li>  
            	</c:if>
            </c:if>
         </c:forEach>
         <c:if test="${pageVO.totalPage>pageVO.pageNum }">
			<li class="clickpage">다음</li>
		</c:if>
	</ul>
</div>











