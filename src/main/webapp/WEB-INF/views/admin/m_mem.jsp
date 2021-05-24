<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/m_mem.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script>
	$(function(){
		//회원 아이디 클릭시 상세 정보 테이블 띄워주는 부분
		$(document).on('click', '.memid', function(){
			var userid = $(this).text();//회원아이디
			meminfo(userid);
		});
		
		function meminfo(userid){//ajax로 데이터 가져오기
			var params = "userid="+userid;
			$.ajax({
				type : "POST",
				url : "mem_detail",
				data : params,
				success : function(result){
					$(".memdetailTbl").remove();
					var txt = "<tr class='memdetailTbl'>";
						txt += "<td>"+userid+"</tb>";
					for(var i=0;i<result.length;i++){
						txt += "<td>"+result[i]+"</tb>";
					}	
						txt +="</tr>";
					$("#meminfo").append(txt);
				},error : function(){
					alert("실패,,,")
				}
			});
			$("#meminfo").css("display", "block");
		}
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
			memberAjax();
		});
		//검색버튼 클릭이벤트 
		$('#searchbtn').click(function(){
			memberAjax();
		});
		//휴먼 회원만 보여주기
		$(".humem").click(function(){
			//서치 키, word 변경
			$("#searchKey").val("mem_status");
			$("#searchText").val("2");
			memberAjax();
		});
		$(".talmem").click(function(){
			$("#searchKey").val("mem_status");
			$("#searchText").val("4");
			memberAjax();
		})
		//탈퇴 회원만 보여주기
		$(".humem").click(function(){
			//서치 키, word 변경
			$("#searchKey").val("mem_status");
			$("#searchText").val("2");
			memberAjax();
		});
		$(".blackmem").click(function(){
			$("#searchKey").val("mem_status");
			$("#searchText").val("3");
			memberAjax();
		});
		
		function memberAjax(){
			$.ajax({
				url: "memListSearch",
				type : "POST",
				data : $("#memFrm").serialize(),
				success : function(result){
					var $list = $(result.list);
					var pagenum = result.pageNum;
					var start = result.startPageNum;
					var last = result.totalPage;
					$(".memlist").remove();//테이블 내용 지우기
					var txt = "";
					$.each($list ,function(idx,vo){//테이블 내용 넣기
						txt += "<tr class='memlist'>";
						txt +=		"<td>"+vo.mem_no+"</td>";
						txt +=		"<td class='memid' style='cursor:pointer;'>"+vo.userid+"</td>";
						txt +=		"<td>"+vo.mem_name+"</td>";
						txt +=		"<td  class='wordcut'>"+vo.mem_addr+"</td>";
						txt +=		"<td>"+vo.mem_tel+"</td>";
						txt += "<td><input type='button'";
						if(vo.mem_status==2){//휴먼일때
							txt += "class='smallbtn rest'value='휴면회원'></td>";
						}else if(vo.mem_status==4){//탈퇴회원
							txt += "class='smallbtn rest'value='탈퇴회원'></td>";
						}else{//정상회원
							txt += "class='spuplebtn rest'value='정상회원'></td>";
						}
						txt += "<td><input type='button'";
						if(vo.mem_type==1){//일반회원
							txt += "class='spuplebtn seller'value='일반'></td>";
						}else{
							txt += "class='smallbtn seller'value='셀러'></td>";
						}
						txt += "<td><input type='button' ";
						if(vo.mem_status==3){//블랙리스트 회원
							txt +="class='redBtn black'value='정지'></td>"
						}else{//정상회원
							txt +="class='spuplebtn black'value='등록'></td>"
						}
						txt +="</tr>";
					});
					$("#memlistTbl").append(txt);
					//페이징 부분
					var link="";
					$(".clickpage").remove();//기존 페이징 부분 삭제
					if(pagenum>1){
						link +="<li  class='clickpage' style='cursor:pointer;'>이전</li>";	
					}
					var lastPg=last;
					if(lastPg>=start+4){//>11>2+4
						lastPg=5;
					}else{
						lastPg = last-start+1;
					}
					for(var i=start;i<=start+lastPg-1;i++){
						if(pagenum==i){
							link +="<li  class='clickpage nowPg' style='cursor:pointer;'>"+i+"</li>";
						}else{
							link +="<li  class='clickpage' style='cursor:pointer;'>"+i+"</li>";	
						}
						
					}
					if(last>pagenum){
						link +="<li  class='clickpage' style='cursor:pointer;'>다음</li>";
					}
					$(".link").append(link);
				},error : function(){
					alert("데이터 가져오기 실패");
				}
			});
		}
	});
$(function(){
	
	//블랙리스트작은  버튼 클릭시
	$(document).on('click', '.black', function(){
		var status = $(this).val();//현재 버튼의 상태
		var userid = $(this).parent().prev().prev().prev().prev().prev().prev().text();//누른 버튼의 아이디 
		if(confirm('블랙리스트 '+status+"하시겠습니까?")){
			if(status=='등록'){//정상회원 -> 블랙리스트
				memUpdate(userid,'mem_status',3);//mem_status==3 블랙리스트
				//버튼 클래스 변경해주기
				$(this).val('정지');
				$(this).removeClass().addClass('redBtn black');		
			}else{//블랙리스트 정지시켜주기
				memUpdate(userid,'mem_status',1);
				$(this).val('등록');
				$(this).removeClass().addClass('spuplebtn black');
			}	
		}
	});
	$(document).on('click', '.seller', function(){
		var status = $(this).val();//현재 버튼의 상태
		var userid = $(this).parent().prev().prev().prev().prev().prev().text();//누른 버튼의 아이디 
		if(status=='일반'){
			if(confirm("셀러권한을 부여하시겠습니까?")){
				memUpdate(userid,'mem_type',2);//mem_type 1.일반회원 2.셀러회원 -->
				$(this).val('셀러');
				$(this).removeClass().addClass('smallbtn seller');	
			}
		}else{
			if(confirm("셀러권한을 박탈하시겠습니까?")){
				memUpdate(userid,'mem_type',1);
				$(this).val('일반');
				$(this).removeClass().addClass('spuplebtn seller');	
			}
		}
	});
	$(document).on('click', '.rest', function(){
		var status = $(this).val();//현재 버튼의 상태
		var userid = $(this).parent().prev().prev().prev().prev().text();//누른 버튼의 아이디
		if(status=='휴면회원'){
			if(confirm('휴면상태를 정지하시겠습니까?')){//1.정상, 2.휴면, 3.블랙,4.탈퇴  -->
				memUpdate(userid,'mem_status',1);
				$(this).val('정상회원');
				$(this).removeClass().addClass('spuplebtn rest');	
			}
		}else{
			if(confirm("휴면처리 하시겠습니까?")){
				memUpdate(userid,'mem_status',2);
				$(this).val('휴면회원');
				$(this).removeClass().addClass('smallbtn rest');	
			}
		}
	});
	//회원 정보 update function ajax()
	function memUpdate(userid,cate,status){//누구를, 어느 부분을, 어떻게 update할지
		var param = "userid="+userid+"&cate="+cate+"&status="+status;
		$.ajax({
			type : "POST",
			url : "memUpdate",
			data : param,
			success : function(result){
				
			},error : function(){
				alert("변경 실패,,,개발자와 연락해보세요,,,");
			}
		});
	}
});
	
</script>
<div class="main">
	<div class="title">일반회원관리</div>
	<ul class="statisM">
		<li>
			총회원수
			<div>${statis.total }</div>
		</li>
		<li>
			신규회원
			<div>${statis.new_mem}</div>
		</li>
		<li>
			셀러회원
			<div>${statis.sell_mem}</div>
		</li>
		<li>
			휴면계정
			<div>${statis.hu_mem}</div>
		</li>
		<li>
			탈퇴
			<div>${statis.tal_mem}</div>
		</li>
	</ul>
	<div class="searchDiv">
		<div class="searchInfo">
			<form id="memFrm">
				<select name="searchKey" id="searchKey" class="selectcomm">
					<option value="userid">회원아이디</option>
					<option value="mem_no">회원 번호</option>
					<option value="mem_name">회원 이름</option>
					<option value="mem_status">휴면, 탈퇴, 블랙</option>
				</select>
				<input type="text" class="textcomm" id="searchText" name="searchWord"/>
				<input type="button" id="searchbtn" class="searchbtn" value="검색"/>
				<input type="hidden" name="pageNum" id="pageNum"value="1"/>
			</form>
		</div>
		<div class="searchCate">
			<input type="button" class="searchbtn humem" value="휴먼 회원"/>
			<input type="button" class="searchbtn talmem" value="탈퇴 회원"/>
			<input type="button" class="searchbtn blackmem" value="블랙리스트"/>
		</div>
	</div>
	<!-- 회원 정보 테이블 이름클릭시 보이도록 설정  -->
	<table id="meminfo" class="tablea">
		<colgroup>
			   <col width="100" />
               <col width="100" />
               <col width="200" />
               <col width="100" />
               <col width="250" />
               <col width="200" />
           </colgroup> 
		<tr>
			<td>아이디</td>
			<td>게시물</td>
			<td>댓글</td>
			<td>등급</td>
			<td>가입날짜</td>
			<td>누적신고</td>
		</tr>
		<tr class='memdetailTbl'>
			<td>10</td>
			<td>40</td>
			<td>5</td>
			<td>2021.01.01</td>
			<td>88</td>
		</tr>
	</table>
	<table id="memlistTbl" class="tablea tablelage" >
		 <colgroup>
               <col width="5%" />
               <col width="8%" />
               <col width="8%" />
               <col />
               <col width="13%" />
               <col width="9%" />
               <col width="9%" />
               <col width="9%" />
            </colgroup>
		<tr>
			<td>번호</td>
			<td>아이디</td>
			<td>이름</td>
			<td>주소</td>
			<td>연락처</td>
			<td>휴면상태</td>
			<td>판매자 권한</td>
			<td>블랙리스트</td>
		</tr>
		<c:forEach var="vo" items="${list}">
			<tr class="memlist">
				<td>${vo.mem_no }</td>
				<td class="memid" style="cursor:pointer;">${vo.userid }</td>
				<td>${vo.mem_name }</td>
				<td  class="wordcut">${vo.mem_addr }</td>
				<td>${vo.mem_tel }</td>
				<!-- 휴면인지 아닌지 mem_status 1.정상, 2.휴면, 3.블랙,4.탈퇴  -->
				<c:if test="${vo.mem_status==2 }"><!-- 휴면일때 -->
					<td><input type="button" class="smallbtn rest"value="휴면회원"></td>
				</c:if>
				<c:if test="${vo.mem_status!=2 }">
					<td><input type="button" class="spuplebtn rest"value="정상회원"></td>
				</c:if>
				<c:if test="${vo.mem_type==1 }"><!-- 1.일반회원 2.셀러회원 -->
					<td><input type="button" class="spuplebtn seller"value="일반"></td>
				</c:if>
				<c:if test="${vo.mem_type==2 }"><!-- 1.일반회원 2.셀러회원 -->
					<td><input type="button" class="smallbtn seller"value="셀러"></td>
				</c:if>
				<c:if test="${vo.mem_status==3 }"><!-- 3.블랙리스트 -->
					<td><input type="button" class="redBtn black"value="정지"></td>
				</c:if>
				<c:if test="${vo.mem_status!=3 }"><!-- 블랙리스트가 아닌경우 -->
					<td><input type="button" class="spuplebtn black"value="등록"></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<ul class="link">
		<!-- 이전버튼 -->
		<c:if test="${pageVO.pageNum>1 }">
			<li class="clickpage" style="cursor:pointer;">이전</li>
		</c:if>
		<!-- 페이지 번호              1부터                            5까지   -->
         <c:forEach var="p" begin="${pageVO.startPageNum}" end="${pageVO.startPageNum+pageVO.onePageNum-1}">
            <c:if test="${p<=pageVO.totalPage}">              
            	<c:if test="${p==pageVO.pageNum }">
            		<li class="clickpage nowPg" style="cursor:pointer;">${p}</li> 
            	</c:if>
            	<c:if test="${p!=pageVO.pageNum }">
            		<li class="clickpage" style="cursor:pointer;">${p}</li>  
            	</c:if>
            </c:if>
         </c:forEach>
         <c:if test="${pageVO.totalPage>pageVO.pageNum }">
			<li class="clickpage" style="cursor:pointer;">다음</li>
		</c:if>
	</ul>
</div>