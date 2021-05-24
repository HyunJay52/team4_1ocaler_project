<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/m_sel.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
	$(function(){
		//검색버튼 클릭이벤트 
		$(document).on('click','.searchbtn',function(){
			sellerAjax();
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
			sellerAjax();
		});
		//==모달==
		//아이디 클릭시 회원정보 테이블 띄워주는 곳 
		$(document).on('click', '.memid', function(){
			var userid = $(this).text();//회원아이디
			var sel_num = $(this).prev().text();
			meminfo(userid);
			selinfo(sel_num);
			$("#detailinfo").css("display","block");
			$("#topsubject").text(userid+"님의 회원정보");
		});
		 $("#detailinfo").draggable();
		 $(".cbtn").click(function(){
	   		  $("#detailinfo").css("display","none");
	   	  });
		function meminfo(userid){//ajax로 데이터 가져오기
			$.ajax({
				type : "POST",
				url : "mem_detail",
				data : "userid="+userid,
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
		function selinfo(sel_num){
			$.ajax({
				type : "POST",
				url : "sel_detail",
				data : "sel_num="+sel_num,
				success : function(result){
					var $result = $(result);
					$(".seldetail").remove();
					var txt = "";
					$result.each(function(idx,vo){//테이블 내용 넣기
						txt += "<tr class='seldetail'>";
						txt += 		"<td>"+vo.i_num+"</td>";
						txt += 		"<td>"+vo.i_subject+"</td>";
						txt += 		"<td>"+vo.o_conf2+"</td>";
						txt += 		"<td>"+vo.o_conf1+"</td>";
						txt += 		"<td>"+vo.i_writedate+"</td>";
						txt += 		"<td>"+vo.price_total+"</td>";
						txt += "</tr>";
					});
					$("#selinfo").append(txt);
				},error : function(){
					alert("실패,,,")
				}
			});
			//아작스로 셀러 판매글 목록가져오기
			$("#selinfo").css("display", "block");
		}
		function sellerAjax(){
			$.ajax({
				url: "sellerListSearch",
				type : "POST",
				data : $("#selFrm").serialize(),
				success : function(result){
					var $list = $(result.list);
					var pagenum = result.pageNum;
					var start = result.startPageNum;
					var last = result.totalPage;
					$(".selList").remove();//테이블 내용 지우기
					var txt = "";
					$.each($list ,function(idx,vo){//테이블 내용 넣기
						txt += "<tr class='selList'>";
						txt += 		"<td>"+vo.sel_num +"</td>";
						txt += 		"<td class='memid' style='cursor:pointer;'>"+vo.userid+"</td>";
						txt += 		"<td>"+vo.sel_name+"</td>";
						txt += 		"<td class='wordcut'>"+vo.sel_addr+vo.sel_detail+"</td>";
						txt += 		"<td>"+vo.sel_tel+"</td>";
						txt += 		"<td>"+vo.sel_lvl+"</td>";
							<!--//1.정상, 2.휴면, 3.블랙,-->
						if(vo.mem_status==3){//블랙리스트 이면
							txt += 	"<td><input type='button' class='redbtn black'value='정지'></td>";
						}else{
							txt += "<td><input type='button' class='spuplebtn black' value='등록'</td>";
						}
						if(vo.mem_status==2){//휴면일때
							txt += "<td><input type='button' class='smallbtn rest'value='휴면회원'></td>";
						}else{
							txt += "<td><input type='button' class='spuplebtn rest'value='정상회원'></td>";
						}
						txt += "<td><input type='button' class='spuplebtn seller'value='권한박탈'></td>";
						txt += "</tr>";
					});
					$("#sellerList").append(txt);
					//페이징 부분
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
		
		$(document).on('click', '.black', function(){
			var status = $(this).val();//현재 버튼의 상태
			var userid = $(this).parent().prev().prev().prev().prev().text();//누른 버튼의 아이디 
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
		//휴면전환 버튼 클릭시 
		$(document).on('click', '.rest', function(){
			var status = $(this).val();//현재 버튼의 상태
			var userid = $(this).parent().prev().prev().prev().prev().prev().text();//누른 버튼의 아이디
			
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
		//셀러 권한 박탈 클릭시
		$(document).on('click','.seller',function(){
			var status = $(this).val();//현재 버튼의 상태
			var userid = $(this).parent().prev().prev().prev().prev().prev().prev().text();//누른 버튼의 아이디
			if(confirm(status+'하시겠습니까?')){
				if(status=='권한박탈'){
					memUpdate(userid,'mem_type',1);
					$(this).val('권한부여');
					$(this).removeClass().addClass('smallbtn seller');	
				}else{
					memUpdate(userid,'mem_type',2);
					$(this).val('권한박탈');
					$(this).removeClass().addClass('spuplebtn seller');	
				}
			}
		});
		//셀러 정보 수정 클릭시
		$(document).on('click','.edit',function(){
			var userid = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().text();//누른 버튼의 아이디
			var num = $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();//누른 버튼의 아이디
			if(confrim(userid+'회원 정보를 수정하시겠습니까?')){
				alert("회원정보 수정 페이지로 이동하는 location.href= num은 회원번호");
			}
		});
		//==========================================================================
		//회원 정보 update function ajax()
		function memUpdate(userid,cate,status){//누구를, 어느 부분을, 어떻게 update할지
			var param = "userid="+userid+"&cate="+cate+"&status="+status;
			$.ajax({
				type : "POST",
				url : "memUpdate",
				data : param,
				success : function(result){
					alert("수정 성공")
				},error : function(){
					alert("변경 실패,,,개발자와 연락해보세요,,,");
				}
			});
		}
	});
</script>
<div class="main" id="nonescroll">
	<div class="title">셀러회원관리</div>
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
			<form id="selFrm">
				<select name="searchKey" class="selectcomm">
					<option value="userid">회원아이디</option>
					<option value="sel_num">회원 번호</option>
					<option value="sel_name">회원 이름</option>
				</select>
				<input type="text" class="textcomm" name="searchWord"/>
				<input type="button" class="searchbtn" value="검색"/>
				<input type="hidden" name="pageNum" id="pageNum"value="1"/>
			</form>
		</div>
	</div>
	<table id="sellerList"class="tablea" >
		 <colgroup>
               <col width="5%" />
               <col width="5%" />
               <col width="6%" />
               <col />
               <col width="13%" />
               <col width="9%" />
               <col width="8%" />
               <col width="9%" />
               <col width="9%" />
            </colgroup>
		<tr>
			<td>번호</td>
			<td>아이디</td>
			<td>상호명</td>
			<td>사업주소</td>
			<td>고객상담번호</td>
			<td>셀러등급</td>
			<td>블랙리스트</td>
			<td>휴면상태</td>
			<td>셀러권한</td>
		</tr>
		<c:forEach var="vo" items="${list}">
			<tr class="selList">
				<td>${vo.sel_num }</td>
				<td class="memid" style="cursor:pointer">${vo.userid }</td>
				<td>${vo.sel_name }</td>
				<td class="wordcut">${vo.sel_addr } ${vo.sel_detail }</td>
				<td>${vo.sel_tel }</td>
				<td>${vo.sel_lvl }</td>
				<!--//1.정상, 2.휴면, 3.블랙,-->
				<c:if test="${vo.mem_status==3 }"><!--블랙리스트-->
					<td><input type="button" class="redbtn black"value="정지"></td>
				</c:if>
				<c:if test="${vo.mem_status!=3 }">
					<td><input type="button" class="spuplebtn black"value="등록"></td>
				</c:if>
				<c:if test="${vo.mem_status==2 }"><!-- 휴면일때 -->
					<td><input type="button" class="smallbtn rest"value="휴면회원"></td>
				</c:if>
				<c:if test="${vo.mem_status!=2 }">
					<td><input type="button" class="spuplebtn rest"value="정상회원"></td>
				</c:if>
				<td><input type="button" class="spuplebtn seller"value="권한박탈"></td>
			</tr>
		</c:forEach>
	</table>
	<ul class="link">
		<!-- 이전버튼 -->
		<c:if test="${pageVO.pageNum>1 }">
			<li class="clickpage" style="cursor:pointer">이전</li>
		</c:if>
		<!-- 페이지 번호              1부터                            5까지   -->
         <c:forEach var="p" begin="${pageVO.startPageNum}" end="${pageVO.startPageNum+pageVO.onePageNum-1}">
            <c:if test="${p<=pageVO.totalPage}">              
            	<c:if test="${p==pageVO.pageNum }">
            		<li class="clickpage nowPg" style="cursor:pointer" >${p}</li> 
            	</c:if>
            	<c:if test="${p!=pageVO.pageNum }">
            		<li class="clickpage" style="cursor:pointer" >${p}</li>  
            	</c:if>
            </c:if>
         </c:forEach>
         <c:if test="${pageVO.totalPage>pageVO.pageNum }">
			<li class="clickpage" style="cursor:pointer">다음</li>
		</c:if>
	</ul>
	
	
	
	<div id="detailinfo">
	<div id="topsubject"></div>
		<div>
			<table class="tablea" id="meminfo">
				<colgroup>
					   <col width="100" />
		               <col width="100" />
		               <col width="200" />
		               <col width="100" />
		               <col />
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
			</table>
		</div>
		<!-- 셀러정보 테이블 -->
		<div id="table2">
			<table class="tablea" id="selinfo">
				<colgroup>
		              <col width="200" />
		              <col width="300" />
		              <col width="300" />
		              <col width="200" />
		              <col width="300" />
		              <col width="300" />
		         </colgroup> 
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>구매 확정</td>
					<td>구매 확정전</td>
					<td>작성날짜</td>
					<td>판매금액</td>
				</tr>
			</table>
		</div>
		<div class="cbtn" style="cursor:pointer">닫기</div>
	</div>
</div>