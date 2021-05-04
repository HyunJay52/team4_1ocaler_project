<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/m_sel.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script>
	$(function(){
		$('.memid').click(function(){
			var text = $(this).prev().text();
			meminfo(text);
			selinfo(text);
		});
		
		function meminfo(num){
			$("#meminfo").css("display", "block");
		}
		function selinfo(num){
			$("#selinfo").css("display", "block");
		}
		//검색버튼 클릭이벤트 
		$('#searchbtn').click(function(){
			var param = $("#memFrm").serialize();
			$.ajax({
				url: "memListSearch",
				type : "POST",
				data : param,
				success : function(result){
					var $result = $(result);
					$(".memlist").remove();//테이블 내용 지우기
					var txt = "";
					$result.each(function(idx,vo){//테이블 내용 넣기
					/* 	txt += "<tr class='memlist'>";
						txt +=		"<td>"+vo.mem_no+"</td>";
						txt +=		"<td class='memid'>"+vo.userid+"</td>";
						txt +=		"<td>"+vo.mem_name+"</td>";
						txt +=		"<td>"+vo.mem_addr+"</td>";
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
						txt +="</tr>"; */
					});
					$("#memlistTbl").append(txt);
				},error : function(){
					alert("데이터 가져오기 실패");
				}
			});
		});
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
			alert("status="+status+"userid="+userid);
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
		//셀러 권한 박탈 클릭시
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
	
	<form id="memFrm">
		<select name="serchkey" class="selectcomm">
			<option value="회원아이디">회원아이디</option>
			<option value="회원번호">회원 번호</option>
			<option value="회원이름">회원 이름</option>
		</select>
		<input type="text" class="textcomm" name="serchword"/>
		<input type="submit" class="searchbtn" value="검색"/>
	</form>	
	
	<!-- 회원 정보 테이블 이름클릭시 보이도록 설정  -->
	<table id="meminfo" class="tablea">
		<colgroup>
               <col width="200" />
               <col width="200" />
               <col width="100" />
               <col width="250" />
               <col width="200" />
           </colgroup> 
		<tr>
			<td>게시물</td>
			<td>댓글</td>
			<td>등급</td>
			<td>가입날짜</td>
			<td>누적신고</td>
		</tr>
		<tr>
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
		<tr>
			<td>101</td>
			<td>감자</td>
			<td>130/10</td>
			<td>goguma</td>
			<td>2021.01.20</td>
			<td>10000</td>
		</tr>
	</table>

	<table class="tablea" >
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
			<td>블랙리스트</td>
			<td>휴면상태</td>
			<td>셀러권한</td>
			<td>쌓인신고</td>
			<td>정보수정</td>
		</tr>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.sel_num }</td>
				<td class="memid">${vo.userid }</td>
				<td>${vo.sel_name }</td>
				<td class="wordcut">${vo.sel_addr } ${vo.sel_detail }</td>
				<td>${vo.sel_tel }</td>
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
				<td>신고수,,,</td>
				<td><input type="button" class="spuplebtn edit"value="수정"></td>
			</tr>
		</c:forEach>
	</table>

		
</div>