<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/boardManage.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script>
	$(function(){
		$("#publicwrite").click(function(){
			//공지 작성 버튼 클릭시
			location.href="publicwrite";
		});
		//삭제 
		$(document).on('click','#del',function(){//글삭제버튼클릭시
			var num=$(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().text();
			var cate = $("#cate").val();
			if(confirm(num+"번 글을 정말 삭제하시겠습니까?")){
				location.href ="boardManageDel?num="+num+"&cate="+cate;
			}
			
		});
		//검색부분
		$(document).on('click', '#searchBTN', function(){
			var cate = $("#cate").val();
			$("#pageNum").val(1);//현재페이지 히든태그의 번호를 1로 변경해줘야한다.
			if(cate=="grouplocal"){
				groupAjax();
			}else{
				boardAjax();
			}
		});
		//페이지 이동 클릭
		$(document).on('click', '.clickpage', function(){
			var txt = $(this).text();
			var cate = $("#cate").val();
			if(txt=="이전"){
				var nextPage = parseInt($("#pageNum").val())-1;
				$("#pageNum").val(nextPage);	
			}else if(txt=="다음"){
				var nextPage = parseInt($("#pageNum").val())+1;
				$("#pageNum").val(nextPage);
			}else{
				$("#pageNum").val(txt);
			}
			
			if(cate=="grouplocal"){
				groupAjax();
			}else{
				boardAjax();
			}
		});
		//가치가장버튼 클릭시 
		$(".group").click(function(){//셀러판매관리 버튼 클릭시 셀러판매목록 호출
			$("#cate").val("grouplocal");
			$("#pageNum").val(1);//현재페이지 히든태그의 번호를 1로 변경해줘야한다.
			$(".puplebtn").removeClass().addClass("searchbtn board");//멤버 목록 버튼 css바꿔주기
			$(this).removeClass().addClass("puplebtn group");
			$(".textcomm").val("");//text 글씨 지워주기
			groupAjax();
		});
		//커뮤니티버튼 클릭시 
		$(".board").click(function(){//셀러판매관리 버튼 클릭시 셀러판매목록 호출
			$("#cate").val("board");
			$("#pageNum").val(1);//현재페이지 히든태그의 번호를 1로 변경해줘야한다.
			$(".puplebtn").removeClass().addClass("searchbtn group");//멤버 목록 버튼 css바꿔주기
			$(this).removeClass().addClass("puplebtn board");
			$(".textcomm").val("");//text 글씨 지워주기
			boardAjax();
		});
		function boardAjax(){
			$.ajax({
				url : "cumuManageListSearch",
				type : "POST",
				data : $("#boardFrm").serialize(),
				success : function(result){
					var $list = $(result.list);
					var pagenum = result.pageNum;
					var start = result.startPageNum;
					var last = result.totalPage;
					$(".selboardList").remove();//테이블 내용 지우기 
					var txt = "";
						txt += "<colgroup class='selboardList'>";
						txt += 		"<col width='5%' />";
						txt += 		"<col width='8%' />";
						txt += 		"<col width='5%' />";
						txt += 		"<col />";
						txt += 		"<col width='8%' />";
						txt += 		"<col width='10%' />";
						txt += 		"<col width='5%' />";
						txt += 		"<col width='5%' />";
						txt += 		"<col width='15%' />";
						txt += "</colgroup>";
						txt += "<tr class='selboardList'>";
						txt +=		"<td>번호</td>";
						txt += 		"<td>카테고리</td>";
			    		txt += 		"<td>지역구</td>";
			    		txt += 		"<td>제목</td>";
			    		txt += 		"<td>작성자</td>";
			    		txt += 		"<td>등록일</td>";
			    		txt += 		"<td>조회</td>";
			    		txt += 		"<td>신고</td>";
			    		txt += 		"<td>게시글관리</td>";
			    		txt += "</tr>";
					$.each($list ,function(idx,vo){//테이블 내용 추가
						txt += "<tr class='selboardList'>";
						txt += 		"<td>"+vo.num+"</td>";
						if(vo.up_cate==1){
							txt += 		"<td>동네정보</td>";
						}else if(vo.up_cate==2){
							txt += 		"<td>쓱싹레시피</td>";
						}else{
							txt += 		"<td>자유자게</td>";
						}
						txt += 		"<td>"+vo.b_gu+"</td>";
						txt += 		"<td class='wordcut'><a href='commuView?num="+vo.num+"'>"+vo.b_subject+"</a></td>";
						txt += 		"<td>"+vo.userid+"</td>";
						txt += 		"<td>"+vo.b_writedate+"</td>";
						txt += 		"<td>"+vo.b_hit+"</td>";
						txt += 		"<td>"+vo.reportCount+"</td>";
						txt += "<td><input type='button' class='redbtn' id='del' title='"+vo.i_num+"' value='글삭제'/>";
						txt += "</td>";
					});
					$(".tablea").append(txt);
					paging(pagenum,start,last)
				},error:function(){
					$(".reset").remove();//테이블 내용 지우기 
					alert("데이터 전송받기 실패,,");
				}
			});
		}
		function groupAjax(){
			$.ajax({
				url : "groupManageListSearch",
				type : "POST",
				data : $("#boardFrm").serialize(),
				success : function(result){
					var $list = $(result.list);
					$(".selboardList").remove();//테이블 내용 지우기 
					var txt = "";
						txt += "<colgroup class='selboardList'>";
						txt += 		"<col width='5%' />";
						txt += 		"<col width='8%' />";
						txt += 		"<col width='8%' />";
						txt += 		"<col />";
						txt += 		"<col width='5%' />";
						txt += 		"<col width='10%' />";
						txt += 		"<col width='10%' />";
						txt += 		"<col width='5%' />";
						txt += 		"<col width='15%' />";
						txt += "</colgroup>";
						txt += "<tr class='selboardList'>";
						txt +=		"<td>번호</td>";
						txt += 		"<td>상위카테고리</td>";
			    		txt += 		"<td>하위카테고리</td>";
			    		txt += 		"<td>제목</td>";
			    		txt += 		"<td>모집인원</td>";
			    		txt += 		"<td>작성자</td>";
			    		txt += 		"<td>등록일</td>";
			    		txt += 		"<td>신고</td>";
			    		txt += 		"<td>게시글관리</td>";
			    		txt += "</tr>";
					$.each($list ,function(idx,vo){//테이블 내용 추가
						txt += "<tr class='selboardList'>";
						txt += 		"<td>"+vo.num+"</td>";
						txt += 		"<td>"+vo.up_cate+"</td>";
						txt += 		"<td>"+vo.down_cate+"</td>";
						txt += 		"<td class='wordcut'><a href='withViewPage?num="+vo.num+"'>"+vo.g_subject+"</a></td>";
						txt += 		"<td>"+vo.g_cnt+"</td>";
						txt += 		"<td>"+vo.userid+"</td>";
						txt += 		"<td>"+vo.g_writedate+"</td>";
						txt += 		"<td>"+vo.reportCount+"</td>";
						txt += "<td><input type='button' class='redbtn' id='del' title='"+vo.i_num+"' value='글삭제'/></td>";
						txt += "</td>";
					});
					$(".tablea").append(txt);
					var pagenum = result.pageNum;
					var start = result.startPageNum;
					var last = result.totalPage;
					paging(pagenum,start,last)
				},error:function(){
					$(".reset").remove();//테이블 내용 지우기 
					alert("데이터 전송받기 실패,,");
				}
			});
		}
		function paging(pagenum,start,last){
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
		}
	});
</script>
<div class="main">
<div class="title">게시글 관리</div>
	<ul class="statis">
		<li>
			우리직구
			<div>${statisVO.price_total }</div>
		</li>
		<li>
			가치가장
			<div>${statisVO.o_conf1 }</div>
		</li>
		<li>
			커뮤니티
			<div>${statisVO.o_conf2 }</div>
		</li>
	</ul>
	<div class="searchDiv">
		<div class="searchInfo">
			<form id="boardFrm">
				<select name="searchKey" class="selectcomm">
						<option value="num">게시글 번호</option>
						<option value="subject">게시글 제목</option>
						<option value="userid">작성자 아이디</option>
				</select>
				<input type="text" class="textcomm" name="searchWord" />
				<input type="button" class="searchbtn" id="searchBTN" value="검색"/>
				<input type="hidden" value="grouplocal" id="cate" name="cate"/>
				<input type="hidden" value="1" id="pageNum" name="pageNum"/>
			</form>
		</div>
		<div class="searchCate">
			<input type="button" class="puplebtn group" value="가치가장"/>
			<input type="button" class="searchbtn board" value="커뮤니티"/>
			<input type="button" id="publicwrite" class="searchbtn" value="공지작성"/>
		</div>
	</div>
	
	<table class="tablea">
		<colgroup class="selboardList">
             <col width="5%" />
             <col width="8%" />
             <col width="8%" />
             <col />
             <col width="5%" />
             <col width="10%" />
             <col width="10%" />
             <col width="5%" />
             <col width="15%" />
          </colgroup>
		<tr class="selboardList">
			<td>번호</td>
			<td>상위카테고리</td>
			<td>하위카테고리</td>
			<td>제목</td>
			<td>모집인원</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>신고</td>
			<td>게시글관리</td>
		</tr>
		<c:forEach var="vo" items="${ list}">
			<tr class="selboardList">
				<td>${vo.num }</td>
				<td>${vo.up_cate}</td>
				<td>${vo.down_cate}</td>
				<td class="wordcut"><a href="withViewPage?num=${vo.num }">${vo.g_subject}</a></td>
				<td>${vo.g_cnt}</td>
				<td>${vo.userid}</td>
				<td>${vo.g_writedate}</td>
				<td>${vo.reportCount}</td>
				<td><input type="button" class="redbtn" id="del" title="${vo.num }" value="글삭제"/></td>
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

	
	
	
	
	
	