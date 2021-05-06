<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/m_sel.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script>
	$(function(){
		//페이지 이동 클릭
		$(document).on('click', '.clickpage', function(){
			var txt = $(this).text();
			$("#pageNum").val(txt);	
			memberAjax();
		});
		//아이디 클릭시 회원정보 테이블 띄워주는 곳 
		$('.memid').click(function(){
			var userid = $(this).text();//회원아이디
			alert("userid-->"+userid);
			meminfo(userid);
			selinfo(userid);
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
		function selinfo(userid){
			$.ajax({
				type : "POST",
				url : "sel_detail",
				data : "userid="+userid,
				success : function(result){
					$(".seldetail").remove();
					var txt = "<tr class='seldetail'>";
					for(var i=0;i<result.length;i++){
						txt += "<td>"+result[i]+"</tb>";
					}	
					txt+= "</tr>";
					$("#selinfo").append(txt);
				},error : function(){
					alert("실패,,,")
				}
			});
			//아작스로 셀러 판매글 목록가져오기
			$("#selinfo").css("display", "block");
		}
		//검색버튼 클릭이벤트 
		$('#searchbtn').click(function(){
			sellerAjax();
		});
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
						txt += 		"<td class='memid'>"+vo.userid+"</td>";
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
						txt += "<td><input type='button' class='spuplebtn edit'value='수정'></td>";
						txt += "</tr>";
					});
					$("#sellerList").append(txt);
					//페이징 부분
					var link="";
					$(".clickpage").remove();//기존 페이징 부분 삭제
					for(var i=start;i<=last;i++){
						link +="<li  class='clickpage'>"+i+"</li>";
					}
					$(".link").append(link);
				},error : function(){
					alert("데이터 가져오기 실패");
				}
			});
		}
	});
	$(function(){
		//블랙리스트 버튼 클릭시
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
<div class="main">
	<div class="title">셀러회원관리</div>
	<ul class="statis">
		<li>
			총회원수
			<div>2500</div>
			<b>▲4% </b>지난주 대비
		</li>
		<li>
			신규회원
			<div>2500</div>
			<b>▼4% </b>지난주 대비
		</li>
		<li>
			셀러회원
			<div>2500</div>
			<b>4% </b>지난주 대비
		</li>
		<li>
			휴면계정
			<div>2500</div>
			<b>4% </b>지난주 대비
		</li>
		<li>
			탈퇴
			<div>2500</div>
			<b>4% </b>지난주 대비
		</li>
	</ul>
	
	<form id="selFrm">
		<select name="serchkey" class="selectcomm">
			<option value="회원아이디">회원아이디</option>
			<option value="회원번호">회원 번호</option>
			<option value="회원이름">회원 이름</option>
		</select>
		<input type="text" class="textcomm" name="serchword"/>
		<input type="submit" class="searchbtn" value="검색"/>
		<input type="hidden" name="pageNum" id="pageNum"value="1"/>
	</form>	
	
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
	<!-- 셀러정보 테이블 -->
	<table id="selinfo" class="tablea">
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
			<td>판매 횟수/환불횟수</td>
			<td>작성자</td>
			<td>작성날짜</td>
			<td>판매금액</td>
		</tr>
		<tr class="seldetail">
			<td>101</td>
			<td>감자</td>
			<td>130/10</td>
			<td>goguma</td>
			<td>2021.01.20</td>
			<td>10000</td>
		</tr>
	</table>

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
               <col width="5%"/>
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
			<td>정보수정</td>
		</tr>
		<c:forEach var="vo" items="${list}">
			<tr class="selList">
				<td>${vo.sel_num }</td>
				<td class="memid">${vo.userid }</td>
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
				
				<td><input type="button" class="spuplebtn edit"value="수정"></td>
			</tr>
		</c:forEach>
	</table>
	<ul class="link">
		<!-- 페이지 번호              1부터                            5까지   -->
         <c:forEach var="p" begin="${pageVO.startPageNum}" end="${pageVO.startPageNum+pageVO.onePageNum-1}">
            <c:if test="${p<=pageVO.totalPage}">              
            	<li class="clickpage" >${p}</li>  
            </c:if>
         </c:forEach>
	</ul>

		
</div>