<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/selManage.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script>
	//페이지 이동 클릭
	$(document).on('click', '.clickpage', function(){
		var txt = $(this).text();
		$("#pageNum").val(txt);	
		alert(txt);
		selBoardAjax();
	});
	$(document).on('click','#del',function(){//글삭제버튼클릭시
		var num=$(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
		confirm(num+"번 글을 정말 삭제하시겠습니까?");
	});
	$(document).on('click','#reply',function(){
		var num=$(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
		alert("글번호"+num);
	});
	$(function(){
		$(".seller").click(function(){//셀러판매관리 버튼 클릭시 셀러판매목록 호출
			$("#cate").val("sell_item");
			$(".puplebtn").removeClass().addClass("searchbtn member");//멤버 목록 버튼 css바꿔주기
			$(this).removeClass().addClass("puplebtn seler");
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
						txt += 		"<col width='10%' />";
						txt += 		"<col width='10%' />";
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
							txt += 		"<td>"+판매중+"</td>";
						}else{
							txt += 		"<td>"+판매완료+"</td>";
						}
						txt += 		"<td class='wordcut'>"+vo.i_subject+"</td>";
						txt += 		"<td>"+vo.i_cnt+"</td>";
						txt += 		"<td>"+vo.userid+"</td>";
						txt += 		"<td>"+vo.i_writedate+"</td>";
						txt += 		"<td>"+vo.i_hit+"</td>";
						txt += "<td><input type='button' class='smallbtn' id='del' title='"+vo.i_num+"' value='글삭제'/>";
						txt += "<input type='button' class='smallbtn' id='reply' title='"+vo.i_num+"'value='댓글보기'/>";
						txt += "</td>";
					});
					$(".tablea").append(txt);
					//페이징 부분
					var link="";
					$(".clickpage").remove();//기존 페이징 부분 삭제
					for(var i=start;i<=last;i++){
						link +="<li  class='clickpage'>"+i+"</li>";
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
			<div>100</div>
		</li>
		<li>
			거래진행
			<div>94</div>
		</li>
		<li>
			거래종료
			<div>6</div>
		</li>
	</ul>
	<form id="boardFrm">
		<select name="serchkey" class="selectcomm">
				<option value="게시글번호">게시글 번호</option>
				<option value="게시글제목">게시글 제목</option>
				<option value="게시글내용">게시글 내용</option>
				<option value="작성자닉네임">작성자 닉네임</option>
		</select>
		<input type="text" class="textcomm" name="serchword" />
		<input type="submit" class="searchbtn" value="검색"/>
		<input type="hidden" id="cate"value="mem_share"/>
	</form>
	<div id="btndiv">
		<input type="button" class="puplebtn member" value="회원간 거래관리"/>
		<input type="button" class="searchbtn seller" value="셀러 판매관리"/>
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
					<c:if test="${vo.s_cate==1 }">
						식료품
					</c:if>
					<c:if test="${vo.s_cate==2 }">
						생필품
					</c:if>
				</td>
				<td class="wordcut"><a href="#">${vo.s_subject}</a></td>
				<td>1/${ vo.s_cnt}</td>
				<td>${ vo.userid}</td>
				<td>${ vo.s_writedate}</td>
				<td>${ vo.reportCnt}</td>
				<td><input type="button" class="smallbtn" id="del" title="${vo.num }" value="글삭제"/>
					<input type="button" class="smallbtn" id="reply" title="${vo.num }"value="댓글보기"/>
				</td>
			</tr>
		</c:forEach>
		
	</table>
	<table class="tablea">
		<colgroup>
             <col width="5%" />
             <col width="5%" />
             <col />
             <col width="10%" />
             <col width="5%" />
             <col width="20%" />
             <col width="10%" />
             <col width="10%" />
          </colgroup>
		<tr>
			<td>번호</td>
			<td>판매상태</td>
			<td>제목</td>
			<td>판매수량</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>조회수</td>
			<td>게시글관리</td>
		</tr>
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












