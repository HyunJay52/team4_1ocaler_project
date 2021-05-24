<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		function setQnAlist(num){
			$.ajax({
				url : "selectMyBoard",
				data : $("#myinfoQnAForm").serialize()+"&nowNum="+num,
				success : function(result){
					console.log(result);
					var tag = "<tr><td>번호</td><td>상품명</td><td>질문자</td>";
						tag += "<td>질문 작성일</td><td>답변상태</td><td>내용</td></tr>";
					result.list.forEach(function(data,idx){
						tag += "<tr>";
						tag += "<td>"+data.q_num+"</td>";
						tag += "<td>"+data.i_subject+"</td>" 
						tag += "<td>"+data.userid+"</td>"
						tag += "<td>"+data.q_writedate+"</td>";
						if(data.q_answer != null){
							tag += "<td>답변완료</td>";
							tag += "<td><button class='btn commBtn viewQnABtn' data-target='#myInfoQnAManagementMd' data-toggle='modal' value='"+data.q_num+"'>내용보기</button></td>"; 
						}else{
							tag += "<td>답변 대기중</td>";
							tag += "<td><button class='btn commBtn qnaBtn' data-target='#myInfoQnAManagementMd' data-toggle='modal' value='"+data.q_num+"'>내용보기</button></td>"; 
						}
					
					});
					$("#myInfoQnAManagementTable").html(tag);
					$("#qnaCount").html("QnA : "+result.count.qna+"건");
					setMyinfoQnAManagementPaging(result.pVO);
				}, error : function(e){
					console.log("error");
				}
				
			});
		}
		//QnA페이징
		function setMyinfoQnAManagementPaging(pVO){
			console.log(pVO);
			$("#myInfoQnAManagementTablePagingArea").html("");
			var tag = '<ul class="pagination justify-content-center">';
			if(pVO.nowNum > 1){
				tag += '<li class="page-item"><button value="'+(pVO.nowNum-1)+'" class="page-link">Prev</button></li>';					
			}else{
				tag += '<li class="page-item disabled"><button class="page-link">Prev</button></li>';				
			}
			for(var p = pVO.startPage; p < pVO.startPage + pVO.onePageSize; p++){
				if(p <= pVO.totalPage){
					if(p == pVO.nowNum){
						tag += '<li class="page-item active"><button class="page-link" value="'+p+'">'+p+'</button></li>';						
					}else{
						tag += '<li class="page-item"><button class="page-link" value="'+p+'">'+p+'</button></li>';						
					}
				}	
			}
			if(pVO.nowNum == pVO.totalPage){
				tag += '<li class="page-item disabled"><button class="page-link">Next</button></li>';				
			}else{
				tag += '<li class="page-item"><button value="'+(pVO.nowNum+1)+'" class="page-link">Next</button></li>';				
			}
			tag += "</ul>";
			$("#myInfoQnAManagementTablePagingArea").append(tag);
		}
		setQnAlist(1);
		
		//QnA페이징 이벤트
		$(document).on('click', "#myInfoQnAManagementTablePagingArea>ul>li>button", function(){
			console.log("페이지 번호="+$(this).val());
			var num = $(this).val();

			setQnAlist(num);
		});
		
		//qna 내용 불러오기
		function setQnAContent(q_num){
			$.ajax({
				url : "setQnA",
				data : {"q_num": q_num,
						"searchKey":"none"
						},
				dataType : "json",
				success : function(result){
					console.log(result);
					var tag = "<li>작성자 : "+result.userid+"</li>";
					tag += "<li>등록일 : "+result.q_writedate+"</li>";
					if(result.q_status == 1){
						tag += "<li>공개여부 : 공개</li>";						
					}else if(result.q_status == 2){
						tag += "<li>공개여부 : 비공개</li>";							
					}
					tag += "<li class='viewQnAContent'>"+result.q_content+"</li>";
					if(result.q_answer != null){
						tag += "<li class='qnaAnswerHead'>답변</li>";
						tag += "<li class='viewQnAContent'>"+result.q_answer+"</li>";
					}
					$("#qnaTextarea").val(result.q_answer);
					$("#viewQnA").html(tag);
				}, error : function(e){
					console.log("qna불러오기 실패");
				}
			});
		}
		
		//답변보기 모달내용 세팅
		$(document).on('click' , '.qnaBtn', function(){
			var q_num = $(this).val();
			setQnAContent(q_num);
			$(".answerBtn").attr('value', $(this).val());
		});
		//답변 완료된 경우 답변보기
		$(document).on('click', '.viewQnABtn', function(){
			var q_num = $(this).val();
			setQnAContent(q_num);

			$(".answerEditBtn").attr('value', $(this).val());
			$(".answerEditBtn").css('display', 'initial');
			$(".answerBtn").css('display','none');
		});
		//답변쓰기 버튼클릭
		$(".answerBtn").click(function(){
			$(".myinfoQnAModalBackground").css('display','block');
			$(".myinfoQnAAnswerArea").css('display','block');
			$(".myinfoQnAAnswerArea>h3").text("답변 쓰기");
			$("#qnaWriteNum").attr('value', $(this).val());

		});
		//답변수정 버튼클릭
		$(".answerEditBtn").click(function(){
			$(".myinfoQnAModalBackground").css('display','block');
			$(".myinfoQnAAnswerArea").css('display','block');
			$(".myinfoQnAAnswerArea>h3").text("답변 수정");
			$("#qnaWriteNum").attr('value', $(this).val());

		});
		//모달 닫기
		$(".answerCancelBtn").click(function(){
			$(".answerEditBtn").css('display','none');
			$(".answerBtn").css('display','initial');
		});
		//답변쓰기 취소버튼 클릭
		$(".answerWriteCancelBtn").click(function(){
			$(".myinfoQnAModalBackground").css('display','none');
			$(".myinfoQnAAnswerArea").css('display','none');
			$("#answerWriteForm")[0].reset();
		});
		
		//답변쓰기 이벤트
		$(".answerWriteBtn").click(function(){
			if($(".myinfoQnAAnswerArea>ul>li>textarea").val() == '' || $(".myinfoQnAAnswerArea>ul>li>textarea").val() == null){
				alert("답변을 입력해주세요");
			}else{
				if(confirm("답변을 작성하시겠습니까?")){
					answerWrite();					
				}
			}
		});
		
		//답변 수정하기
		function answerWrite(){
			$.ajax({
				url : "QnAAnswerWrite",
				data : $("#answerWriteForm").serialize(),
				success : function(result){
					if(result > 0){					
						alert("답변이 등록되었습니다.");
						$("#myInfoQnAManagementMd").modal("hide");
						var num = $("#myInfoQnAManagementTablePagingArea>ul>li.active>button").val();
						console.log("nowNum="+num);
						setQnAlist(num);
					}
					$(".myinfoQnAModalBackground").css('display','none');
					$(".myinfoQnAAnswerArea").css('display','none');
					$("#answerWriteForm")[0].reset();
				}, error : function(e){
					console.log("답변작성 실패");
				}
			})
		}
		
		//검색버튼
		$(".QnAManagementBtn").click(function(){
			setQnAlist(1);		
		});
		
		//체크박스 
		$(".productManagementLabelCenter>ul>li>input").change(function(){
			$(".productManagementLabelCenter>ul>li>input").prop('checked', false);
			$(this).prop('checked', true)
		});
	
	});
</script>
<%@ include file="/inc/sideBar.jspf" %>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h2>QnA 관리</h2>
		<div class="myInfoProductManagementTop">
			<div class="productManagementLabelForm">
				<ul class="productManagementLabel">
					<li><label>답변상태</label></li>
					<li><label>기간선택</label></li>
					<li><label>질문내용 검색</label></li>					
				</ul>
				<form method="post" id="myinfoQnAForm" onsubmit="return false;">
				<div class="productManagementLabelCenter">
					<ul>
						<li><input name="searchKey2" type="checkbox" value="all" checked/>전체</li>
						<li><input name="searchKey2" type="checkbox" value="is null "/>답변대기</li>
						<li><input name="searchKey2" type="checkbox" value="is not null"/>답변완료</li>
					</ul>
					<div class="productManagementLabelCenterDiv">
						<input type="date" name="searchDate" value="2021-03-01" min="2021-03-01" max="2021-05-31"/>~
						<input type="date" name="searchDate2" value="2021-05-31" min="2021-03-01" max="2021-05-31"/>
					</div>
					<div class="productManagementLabelCenterDiv">
						<input type="hidden" name="kategorie" value="seller"/>
						<input type="hidden" name="searchKey" value="q_content"/>
						<input type="text" name="searchWord"/>
						<input type="button" value="검색" class="btn commBtn QnAManagementBtn"/>
					</div>				
				</div>	
				</form>			
			</div>
		</div>
		<div class="myInfoProductManagementBottom">
			<ul>
				<li><button class="btn commBtn myInfoProductManagementBottomBtn" id="qnaCount">QnA : 14건</button></li>
			</ul>
			<table class="myInfoProductManagementTable2" id="myInfoQnAManagementTable">

			</table>
			<div id="myInfoQnAManagementTablePagingArea" style="margin-top:30px;">
			
			</div>
		</div>
	</div>
	<div class="modal fade mdFnt" id="myInfoQnAManagementMd"  data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content" style="height:600px">
				<div class="modal-header ">
				<h4 class="modal-title">QnA</h4>

				</div>
				<div class="modal-body" style="text-align:right; overflow:auto">
					<ul id="viewQnA">
						
					</ul>
					<ul>
						<li>
							<button class="btn btn-outline-dark btn-lg answerBtn">답변쓰기</button>
							<button class="btn btn-outline-dark btn-lg answerEditBtn">답변수정</button>
							<button class="btn btn-outline-dark btn-lg answerCancelBtn" data-dismiss="modal">취소</button>
						</li>
					</ul>
				</div>
				<div class="myinfoQnAModalBackground"></div>
				<form method="post" id="answerWriteForm" onsubmit="return false">
					<div class="myinfoQnAAnswerArea">
						<h3>답변 쓰기</h3>
						<ul>
							<li style="display:none"><input type="hidden" id="qnaWriteNum" name="q_num" value=""/></li>
							<li>
								<textarea style="width:100%; height:340px; resize:none" id="qnaTextarea"name="q_answer" placeholder="답변을 입력해주세요"></textarea>
								<button class="btn btn-outline-dark btn-lg answerWriteBtn">답변등록</button>
								<button class="btn btn-outline-dark btn-lg answerWriteCancelBtn">등록취소</button>
							</li>						
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
