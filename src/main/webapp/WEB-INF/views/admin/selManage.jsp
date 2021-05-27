<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/selManage.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script>
	$(document).on('click','#del',function(){//글삭제버튼클릭시
		var num=$(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
		var cate = $("#cate").val();
		if(confirm(num+"번 글을 정말 삭제하시겠습니까?")){
			location.href ="selManageDel?num="+num+"&cate="+cate;
		}
		
	});
	$(document).on('click','#reply',function(){
		var num=$(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
		alert("글번호"+num);
	});
	$(function(){
		$(".seller").click(function(){//셀러판매관리 버튼 클릭시 셀러판매목록 호출
			$("#cate").val("sell_item");
			$("#pageNum").val(1);//현재페이지 히든태그의 번호를 1로 변경해줘야한다.
			$(".puplebtn").removeClass().addClass("searchbtn member");//멤버 목록 버튼 css바꿔주기
			$(this).removeClass().addClass("puplebtn seller");
			$(".textcomm").val("");//text 글씨 지워주기
			sellerAjax();
		});
		$(".member").click(function(){//회원간 거래 관리 클릭시
			$("#cate").val("mem_share");
			$("#pageNum").val(1);
			$(".puplebtn").removeClass().addClass("searchbtn seller");//멤버 목록 버튼 css바꿔주기
			$(this).removeClass().addClass("puplebtn member");
			$(".textcomm").val("");//text 글씨 지워주기
			memberAjax();
		})
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
			
			if(cate=="mem_share"){
				memberAjax();
			}else{
				sellerAjax();
			}
		});
		//검색부분
		$(document).on('click', '#searchBTN', function(){
			var cate = $("#cate").val();
			if(cate=="mem_share"){
				memberAjax();
			}else if(cate=="sell_item"){
				sellerAjax();
			}
		});
		function sellerAjax(){
			$.ajax({
				url : "sellerBoardSearch",
				type : "POST",
				data : $("#boardFrm").serialize(),
				success : function(result){
					var $list = $(result.list);
					var pagenum = result.pageNum;
					var start = result.startPageNum;
					var onePageNum = result.onePageNum;
					var last = result.totalPage;
					$(".selboardList").remove();//테이블 내용 지우기 
					var txt = "";
						txt += "<colgroup class='selboardList'>";
						txt += 		"<col width='5%' />";
						txt += 		"<col width='5%' />";
						txt += 		"<col />";
						txt += 		"<col width='10%' />";
						txt += 		"<col width='5%' />";
						txt += 		"<col width='20%' />";
						txt += 		"<col width='5%' />";
						txt += 		"<col width='15%' />";
						txt += "</colgroup>";
						txt += "<tr class='selboardList'>";
						txt +=		"<td>번호</td>";
						txt += 		"<td>판매상태</td>";
			    		txt += 		"<td>제목</td>";
			    		txt += 		"<td>판매수량</td>";
			    		txt += 		"<td>작성자</td>";
			    		txt += 		"<td>등록일</td>";
			    		txt += 		"<td>조회수</td>";
			    		txt += 		"<td>게시글관리</td>";
			    		txt += "</tr>";
					$.each($list ,function(idx,vo){//테이블 내용 추가
						txt += "<tr class='selboardList'>";
						txt += 		"<td>"+vo.i_num+"</td>";
						if(vo.i_status==1){
							txt += 		"<td>판매중</td>";
						}else{
							txt += 		"<td>판매완료</td>";
						}
						txt += 		"<td class='wordcut'><a href='sellView?i_num="+vo.i_num+"'>"+vo.i_subject+"</a></td>";
						txt += 		"<td>"+vo.i_cnt+"</td>";
						txt += 		"<td>"+vo.userid+"</td>";
						txt += 		"<td>"+vo.i_writedate+"</td>";
						txt += 		"<td>"+vo.i_hit+"</td>";
						txt += "<td><input type='button' class='redbtn' id='del' title='"+vo.i_num+"' value='글삭제'/>";
						txt += "</td>";
					});
					$(".tablea").append(txt);
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
		function memberAjax(){
			$.ajax({
				url : "sellerBoardSearch",
				type : "POST",
				data : $("#boardFrm").serialize(),
				success : function(result){
					var $list = $(result.list);
					console.log("여기는 들어오니,,,memberAjax()"+result.list);
					var pagenum = result.pageNum;
					var start = result.startPageNum;
					var last = result.totalPage;
					var onePageNum = result.onePageNum;
					$(".selboardList").remove();//테이블 내용 지우기 
					var	txt = "<colgroup class='selboardList'>";
						txt += 		"<col width='5%' />";
						txt += 		"<col width='10%' />";
						txt += 		"<col />";
						txt += 		"<col width='10%' />";
						txt += 		"<col width='5%' />";
						txt += 		"<col width='20%' />";
						txt += 		"<col width='10%' />";
						txt += "</colgroup>";
						txt += "<tr class='selboardList'>";
						txt +=		"<td>번호</td>";
						txt += 		"<td>카테고리</td>";
			    		txt += 		"<td>제목</td>";
			    		txt += 		"<td>참여인원</td>";
			    		txt += 		"<td>작성자</td>";
			    		txt += 		"<td>등록일</td>";
			    		txt += 		"<td>신고횟수</td>";
			    		txt += 		"<td>게시글관리</td>";
			    		txt += "</tr>";
					$.each($list ,function(idx,vo){//테이블 내용 추가
						txt += "<tr class='selboardList'>";
						txt += 		"<td>"+vo.num+"</td>";
						if(vo.s_cate==1){
							txt += 		"<td>식료품</td>";
						}else if(vo.s_cate==2)){
							txt += 		"<td>생필품</td>";
						}else{
							txt += 		"<td>기타</td>";
						}
						txt += 		"<td class='wordcut'><a href='memberView?num="+vo.num+"'>"+vo.s_subject+"</a></td>";
						txt += 		"<td>"+vo.s_cnt+"</td>";
						txt += 		"<td>"+vo.userid+"</td>";
						txt += 		"<td>"+vo.s_writedate+"</td>";
						txt += 		"<td>"+vo.reportCnt+"</td>";
						txt += "<td><input type='button' class='redbtn' id='del' title='"+vo.num+"' value='글삭제'/>";
						txt += "</td>";
					});
					$(".tablea").append(txt);
					//페이징 부분
					var link="";
					$(".clickpage").remove();//기존 페이징 부분 삭제
					if(pagenum>1){
						link +="<li  class='clickpage'>이전</li>";	
					}
					if(last>=start+4){
						last=4;
					}
					for(var i=start;i<=start+last-1;i++){
						if(pagenum==i){
							link +="<li  class='clickpage nowPg'>"+i+"</li>";
						}else{
							link +="<li  class='clickpage'>"+i+"</li>";	
						}
						
					}
					if(pagenum<last){
						link +="<li  class='clickpage'>다음</li>";
					}
					$(".link").append(link);
				},error:function(){
					$(".reset").remove();//테이블 내용 지우기 
					$("#resultTbl").append("전송받기 실패ㅜㅜ");
				}
			});
		}
	})
</script>
<div class="main">
<div class="title">판매관리</div>
	<ul class="statis">
		<li>
			총게시글
			<div>${statisVO.price_total }</div>
		</li>
		<li>
			거래진행
			<div>${statisVO.o_conf1 }</div>
		</li>
		<li>
			거래종료
			<div>${statisVO.o_conf2 }</div>
		</li>
	</ul>
	<div class="searchDiv">
		<div class="searchInfo">
			<form id="boardFrm">
				<select name="searchKey" class="selectcomm">
						<option value="num">게시글 번호</option>
						<option value="subject">게시글 제목</option>
						<option value="content">게시글 내용</option>
						<option value="userid">작성자 아이디</option>
				</select>
				<input type="text" class="textcomm" name="searchWord" />
				<input type="button" class="searchbtn" id="searchBTN" value="검색"/>
				<input type="hidden" id="cate" name="cate" value="mem_share"/>
				<input type="hidden" name="pageNum" id="pageNum"value="1"/>
			</form>
		</div>
		<div class="searchCate">
			<input type="button" class="puplebtn member" value="회원간 거래관리"/>
			<input type="button" class="searchbtn seller" value="셀러 판매관리"/>
		</div>
	</div>
	<table class="tablea">
		<colgroup class="selBoardList">
             <col width="5%" />
             <col width="10%" />
             <col />
             <col width="10%" />
             <col width="5%" />
             <col width="20%" />
             <col width="10%" />
          </colgroup>
		<tr class="selBoardList">
			<td>번호</td>
			<td>카테고리</td><!-- 카테고리 1:식품 2:생필품-->
			<td>제목</td>
			<td>참여인원</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>신고횟수</td>
			<td>게시글관리</td>
		</tr>
		<c:forEach var="vo" items="${ list}">
			<tr class="selboardList">
				<td>${ vo.num}</td>
				<td>
					<c:if test="${vo.s_cate==1}">
						식료품
					</c:if>
					<c:if test="${vo.s_cate==2  }">
						생필품
					</c:if>
					<c:if test="${vo.s_cate==3  }">
						기타
					</c:if>
				</td>
				<td class="wordcut"><a href="memberView?num=${ vo.num}">${vo.s_subject}</a></td>
				<td>${ vo.s_cnt}</td>
				<td>${ vo.userid}</td>
				<td>${ vo.s_writedate}</td>
				<td>${ vo.reportCnt}</td>
				<td><input type="button" class="redbtn" id="del" title="${vo.num }" value="글삭제"/>
				</td>
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












