<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		
	
	//회원간 거래 리스트
	function myInfoReviewList(num){
		var kategorie = $("#reviewKategorie option:selected").val();
		console.log("kategorie="+kategorie);
		$.ajax({
			url : "myInfoReviewList",
			data : {"nowNum": num,
				"kategorie": kategorie,
				"dateContent":"j_writedate",
				"searchDate":"2021-03-01 00:00:00",
				"searchDate2":"2021-05-31 23:59:59",
				"searchKey":"j_status",
				"searchWord":"%참여완료%",
				"onePageRecord":5,
				"onePageSize":5
				},
			dataType : "json",
			success : function(result){
				console.log(result);
				var tag = "<tr><td>제목</td><td>아이디</td><td>날짜</td><td>리뷰</td></tr>";
				var index = 0;
				result.list.forEach(function(data, idx){
					if(kategorie == 'mem_share'){
						console.log("idx="+idx);
						console.log("kategorie="+kategorie);
						index = idx;
						tag += "<td class=''>"+data.s_subject+"</td>";
						tag += "<td>"+data.sellerid+"</td>";
						tag += "<td>"+data.j_writedate+"</td>";
						tag += "<td><button class='btn btn-primary reviewButton' title='"+data.j_num+"' value='"+data.numjoin+"' data-target='#reviewMd' data-toggle='modal'>리뷰쓰기</button></td>";							
						tag += "</tr>";
					}else if(kategorie == 'grouplocal'){
						console.log("idx="+idx);
	
						index = idx;
						tag += "<td class='wordCut'>"+data.g_subject+"</td>";
						tag += "<td>"+data.sellerid+"</td>";
						tag += "<td>"+data.j_writedate+"</td>";
						tag += "<td><button class='btn btn-primary reviewButton' title='"+data.j_num+"' value='"+data.numjoin+"' data-target='#reviewMd' data-toggle='modal'>리뷰쓰기</button></td>";							
						tag += "</tr>";
					}
					
				});
				if(index < 5){
					for(var i = index; i < 4; i++){
						console.log("i=="+i);
						tag += "<tr><td></td><td></td><td></td><td></td></tr>";							
					}
				}
				$("#myinfoReviewTable").html(tag);
				setShareReviewPaging(result.sharePVO);
			},error : function(e){
				console.log("error");	
			}				
		
		});
	}
	myInfoReviewList(1);
	
	//상품리뷰 리스트
	function myInfoItemReviewList(num){
		$.ajax({
			url : "myInfoItemReviewList",
			data : {"nowNum": num,
				"kategorie":"ordertbl",
				"dateContent":"o_date",
				"searchDate":"2021-03-01 00:00:00",
				"searchDate2":"2021-05-31 23:59:59",
				"searchKey":"o_conf",
				"searchWord":2,
				"onePageRecord":5,
				"onePageSize":5
				},
			dataType : "json",
			success : function(result){
				console.log(result);
				var tag = "<tr><td>제목</td><td>아이디</td><td>날짜</td><td>리뷰</td></tr>";
				var index = 0;
				var count = 0;
				result.IList.forEach(function(data, idx){
					console.log("o_num="+data.num+"reviewCount="+data.reviewCount);
					index = idx;
					
					tag += "<td class=''>"+data.i_subject+"</td>";
					tag += "<td>"+data.sellerid+"</td>";
					tag += "<td>"+data.o_date+"</td>";
				
					tag += "<td><button class='btn btn-primary reviewButton' value='"+data.num+"' data-target='#reviewMd' data-toggle='modal'>리뷰쓰기</button></td>";
					tag += "</tr>";
					
				});
				if(index < 5){
					for(var i = index; i < 4; i++){
						console.log("i="+i);
						tag += "<tr><td></td><td></td><td></td><td></td></tr>";							
					}
				}
				$("#myinfoItemReviewTable").html(tag);
				setItemReviewPaging(result.itemPVO);
			},error : function(e){
				console.log("error");	
			}				
		
		});
	}
	myInfoItemReviewList(1);
	
	//셀렉스박스 체인지 이벤트
	$("#reviewKategorie").change(function(){
		myInfoReviewList(1);
	});
	//회원간 거래 페이징
	function setShareReviewPaging(sharePVO){
		console.log(sharePVO);
		$("#shareListPaging").html("");
		var tag = '<ul class="pagination justify-content-center">';
		if(sharePVO.nowNum > 1){
			tag += '<li class="page-item"><button value="'+(sharePVO.nowNum-1)+'" class="page-link">Prev</button></li>';					
		}else{
			tag += '<li class="page-item disabled"><button class="page-link">Prev</button></li>';				
		}
		for(var p = sharePVO.startPage; p < sharePVO.startPage + sharePVO.onePageSize; p++){
			if(p <= sharePVO.totalPage){
				if(p == sharePVO.nowNum){
					tag += '<li class="page-item active"><button class="page-link" value="'+p+'">'+p+'</button></li>';						
				}else{
					tag += '<li class="page-item"><button class="page-link" value="'+p+'">'+p+'</button></li>';						
				}
			}	
		}
		if(sharePVO.nowNum == sharePVO.totalPage){
			tag += '<li class="page-item disabled"><button class="page-link">Next</button></li>';				
		}else{
			tag += '<li class="page-item"><button value="'+(sharePVO.nowNum+1)+'" class="page-link">Next</button></li>';				
		}
		tag += "</ul>";
		$("#shareListPaging").append(tag);
	}
	//회원간 거래 페이징 이벤트
	$(document).on('click', "#shareListPaging>ul>li>button", function(){
		console.log("페이지 번호="+$(this).val());
		var num = $(this).val();
		myInfoReviewList(num);
	});
	//상품 거래 페이징
	function setItemReviewPaging(itemPVO){
		console.log(itemPVO);
		console.log("상품페이징 시작")
		$("#itemListPaging").html("");
		var tag = '<ul class="pagination justify-content-center">';
		if(itemPVO.nowNum > 1){
			tag += '<li class="page-item"><button value="'+(itemPVO.nowNum-1)+'" class="page-link">Prev</button></li>';					
		}else{
			tag += '<li class="page-item disabled"><button class="page-link">Prev</button></li>';				
		}
		for(var p = itemPVO.startPage; p < itemPVO.startPage + itemPVO.onePageSize; p++){
			if(p <= itemPVO.totalPage){
				if(p == itemPVO.nowNum){
					tag += '<li class="page-item active"><button class="page-link" value="'+p+'">'+p+'</button></li>';						
				}else{
					tag += '<li class="page-item"><button class="page-link" value="'+p+'">'+p+'</button></li>';						
				}
			}	
		}
		if(itemPVO.nowNum == itemPVO.totalPage){
			tag += '<li class="page-item disabled"><button class="page-link">Next</button></li>';				
		}else{
			tag += '<li class="page-item"><button value="'+(itemPVO.nowNum+1)+'" class="page-link">Next</button></li>';				
		}
		tag += "</ul>";
		$("#itemListPaging").append(tag);
	}
	//상품 거래 페이징 이벤트
	$(document).on('click', "#itemListPaging>ul>li>button", function(){
		console.log("페이지 번호="+$(this).val());
		var num = $(this).val();
		myInfoItemReviewList(num);
	});
	//내 리뷰 목록 조회
	function setMyAllReview(num){
		console.log($("#selectMyReviewListForm").serialize());
		$.ajax({
			url : "selectMyReviewList",
			data : $("#selectMyReviewListForm").serialize()+"&nowNum="+num,
			type : "POST",
			success : function(result){
				console.log(result);
				var kategorie = $("#reviewKategorie option:selected").val();
				var tag = "<tr><td>구분</td><td>평가</td><td>제목</td><td>판매자</td><td>날짜</td><td>수정</td></tr>";
				var index = 0;
				result.list.forEach(function(data, idx){
					if(result.pVO.kategorie == 'mem_share'){
						tag += "<tr><td>회원간 거래</td>";
					}else if(result.pVO.kategorie == 'grouplocal'){
						tag += "<tr><td>모집</td>";
					}else{
						tag += "<tr><td>파머 직거래</td>";							
					}
					if(data.re_rate == 1){//재구매 의향 있음
						tag += "<td><img src='img/myInfo/myDeal/reviewHeart.png'/></td>";
					}else if(data.re_rate == 2){//없음
						tag += "<td><img src='img/myInfo/myDeal/reviewHeart2.png'/></td>";
					}
					if(result.pVO.kategorie == 'sell_item'){
						tag += "<td><a href='sellView?i_num="+data.num+"'>"+data.re_subject+"</a></td>";							
					}else{
						tag += "<td>"+data.re_subject+"</td>";							
					}
					tag += "<td>"+data.sellerid+"</td>";
					tag += "<td>"+data.re_writedate+"</td>";
					tag += "<td><button class='btn btn-primary reviewUpdateButton' value='"+data.re_num+"' data-target='#reviewMd' data-toggle='modal'>리뷰수정</button></td></tr>";
					index = idx;
				});
				if(index < 5){
					for(var i = index; i < 4; i++){
						console.log("i="+i);
						tag += "<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>";							
					}
				}
				
				$("#myinfoMyReviewTable").html(tag);
				setMyAllReviewPageing(result.pVO);
			},error : function(e){
				console.log("error");
			}
		})
	}
	setMyAllReview(1);
	
	//리뷰 목록 조회 페이징
	function setMyAllReviewPageing(pVO){
		console.log(pVO);
		$("#myReviewListPaging").html("");
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
		$("#myReviewListPaging").append(tag);
	}
	//내 리뷰 목록 페이징 이벤트
	$(document).on('click', "#myReviewListPaging>ul>li>button", function(){
		console.log("페이지 번호="+$(this).val());
		var num = $(this).val();
		setMyAllReview(num);
	});
	//리뷰쓰기 ajax
	function myinfoReviewWrite(data, rateCheck, j_num, num){
		if(j_num == null){
			j_num = "";
		}
		$.ajax({
			url : "writeReview",
			data : data+"&re_rate="+rateCheck+"&j_num="+j_num,
			success : function(result){
				console.log(result);
				alert("리뷰가 작성되었습니다.");
				myInfoReviewList(1)
				myInfoItemReviewList(1);
				$("#reviewWriteForm")[0].reset();
				$('.modal-backdrop').remove();
				$("#reviewMd").modal("hide");
				setMyAllReview(1);
				
			},error : function(e){
				console.log("error");
			}
		});
	}
	// 리뷰수정 ajax
	function myinfoReviewUpdate(data, num, rateCheck){
		$.ajax({
			url : "reviewUpdate",
			data : data+"&re_num="+num+"&re_rate="+rateCheck,
			success : function(result){
				console.log(result);
				alert("리뷰가 수정되었습니다.");
				setMyAllReview(1);
				$("#reviewWriteForm")[0].reset();
				$('.modal-backdrop').remove();
				$("#reviewMd").modal("hide");
	
	
			},error : function(e){
				console.log("error");
			}
		});
	}
	// 리뷰수정
	$(document).on('click', '#reviewUpdate', function(){
		if($("#myinfoReviewForm>ul>li>textarea").val() == null || $("#myinfoReviewForm>ul>li>textarea").val() == ''){
			alert('내용을 입력해주세요.');
		}else{
			var rateCheck = $("#myinfoReviewForm>ul>li>button[name=re_rate]").val();
			var num = $("#WriteReviewNum").val();
			console.log("re_rate="+rateCheck);
			if(rateCheck == null || rateCheck == ''){
				alert('리뷰점수를 선택해주세요.');				
			}else{
				if(confirm('리뷰를 작성하시겠습니까?')){
					var data = $("#reviewWriteForm").serialize();
					console.log(data);
					myinfoReviewUpdate(data, num, rateCheck);				
				}
			}
		}
	});
	// 리뷰쓰기
	$(document).on('click', '#WriteReview', function(){
		if($("#myinfoReviewForm>ul>li>textarea").val() == null || $("#myinfoReviewForm>ul>li>textarea").val() == ''){
			alert('내용을 입력해주세요.');
		}else{
			var rateCheck = $("#myinfoReviewForm>ul>li>button[name=re_rate]").val();
			var j_num = $("#WriteReviewNum").attr('title');
			var num = $("#WriteReviewNum").val();
			console.log("re_rate="+rateCheck);
			if(rateCheck == null || rateCheck == ''){
				alert('리뷰점수를 선택해주세요.');				
			}else{
				if(confirm('리뷰를 작성하시겠습니까?')){
					var data = $("#reviewWriteForm").serialize();
					console.log(data);
					myinfoReviewWrite(data, rateCheck, j_num, num);				
				}
			}
		}
	});
	
	//리뷰쓰기 버튼 클릭
	$(document).on('click',".reviewButton", function(){
		var num = $(this).val();
		var j_num = $(this).attr('title');
		$("#WriteReviewNum").attr('value', num);
		$("#WriteReviewNum").attr('title', j_num);
		$("#WriteReview").css('display', 'block');
		$("#reviewUpdate").css('display', 'none');
		$("#review-title").text("리뷰 작성하기");
		$(".dealTextarea").val("");
	});
	
	//리뷰 수정버튼시 모달세팅
	$(document).on('click', '.reviewUpdateButton', function(){
		var num = $(this).val();
		setMyReviewContent(num);
		$("#WriteReviewNum").attr('value', num);
		$("#WriteReview").css('display', 'none');
		$("#reviewUpdate").css('display', 'block');
		$("#review-title").text("리뷰 수정하기");
	
	});
	
	//수정시 리뷰내용 가져오기
	function setMyReviewContent(num){
		$.ajax({
			url : "selectMyReview",
			data : {"re_num":num},
			dataType : "json",
			success : function(result){
				console.log(result);
				$(".dealTextarea").text(result.re_content);
			}, error : function(e){
				console.log("리뷰내용 가져오기 실패");
			}
		});
	}
	
	//다음에 할게요 버튼 클릭
	$("#WriteReviewNumCancel").click(function(){
		$(".imgBtn").attr('name', null);
	})
	
	//리뷰 등록 버튼 클릭
	$("#WriteReview").click(function(){
		console.log($("#reviewWriteForm").serialize());
		
	});
	
	//리뷰 점수 이벤트
	$(document).on('click', '.imgBtn', function(){
		$(".imgBtn").attr('name', null);
		$(this).attr('name', 're_rate');
	});
	
	//검색버튼 클릭
	$("#reviewSearchAreaBtn").click(function(){
		setMyAllReview(1);
	});
	
	//textarea 글자수 제한
	$(document).ready(function(){
		$("#myinfoReviewForm>ul>li>textarea").on('keyup', function(){
			$(".reviewTextCount").html($(this).val().length+" / 250");
			
			if($(this).val().length > 250){
				$(this).val($(this).val().substring(0, 250));
				$(".reviewTextCount").html("250 / 250");
	
			}
		});
	});
	//모달 닫으면 폼 리셋
	$("#reviewMd").on('hidden.bs.modal', function(){
		$("#reviewWriteForm")[0].reset();
	});
});
</script>
<%@ include file="/inc/sideBar.jspf" %>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h3>리뷰 관리<span class="smlFnt"> 리뷰작성은 구매 확정 후 한달 내로 작성하실 수 있습니다.</span></h3>
		<div class="reviewTop">
			<div class="reviewLeft">
			<h4>회원리뷰</h4>
				<select name="kategorie" id="reviewKategorie">
					<option value="mem_share" selected>회원간 거래</option>
					<option value="grouplocal">모집</option>
					
				</select>
				<table class="myinfoReviewTable" id="myinfoReviewTable">
					<tr>
						<td>제목</td>
						<td>아이디</td>
						<td>날짜</td>
						<td>리뷰</td>
					</tr>
				</table>
				<div id="shareListPaging">
				
				</div>
			</div>
			<div class="reviewRight">
				<h4>상품리뷰</h4>
				<table class="myinfoReviewTable" id="myinfoItemReviewTable">
					<tr>
						<td>제목</td>
						<td>아이디</td>
						<td>날짜</td>
						<td>리뷰</td>
					</tr>
				</table>
				<div id="itemListPaging">
				
				</div>
			</div>
		</div>
		<div class="reviewBottom">
			<h4>작성된 리뷰목록</h4>	
			<form method="post" id="selectMyReviewListForm" onsubmit="return false;">
			<div class="dealDateForm" style="width:400px;">
				<input type="date" name="searchDate" value="2021-03-01" min="2021-03-01" max="2021-05-31"/> ~ 
				<input type="date" name="searchDate2" value="2021-05-31" min="2021-03-01" max="2021-05-31"/>
				<select name="kategorie" id="reviewKategorie">
					<option value="mem_share" selected>회원간 거래</option>
					<option value="grouplocal">모집</option>
					<option value="sell_item">착한발견 거래</option>
				</select>
			</div>
			<div class="reviewSearchArea">
				<select name="searchKey" id="reviewSearchKey">
					<option value="userid" selected>전체</option>
					<option value="subject">제목</option>
					<option value="re_content">내용</option>
				</select>
				<input type="text" name="searchWord"/>
				<input type="button" value="검색" id="reviewSearchAreaBtn"/>
			</div>
			</form>
			<div class="myinfoReviewList">
			<table class="myinfoTable2" id="myinfoMyReviewTable">
					<tr>
						<td>구분</td>
						<td>상태</td>					
						<td>제목</td>
						<td>판매자</td>
						<td>날짜</td>
						<td>수정</td>
					</tr>
					
			</table>
			<div id="myReviewListPaging">
				
			</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="reviewMd" data-backdrop="static">
		<div class="modal-dialog modal-lg" data-backdrop="static">
			<form id="reviewWriteForm" method="post" onsubmit="return false;">
			<div class="modal-content">
				<div class="modal-header reviewHeader" data-backdrop="static">
				<h3 class="modal-title" id="review-title">리뷰 작성하기</h3>

				</div>
				<div class="modal-body reviewBody" id="myinfoReviewForm" data-backdrop="static">
					<ul>
						<li><img src="img/myInfo/myDeal/reviewHeart.png"/></li>
						<li><img src="img/myInfo/myDeal/reviewHeart2.png"/></li>
						<li><button class="btn lgFnt btn-lg imgBtn btnYellow" value="1">또 참여할래요</button></li>
						<li><button class="btn lgFnt btn-lg imgBtn" value="2">음, 글쎄요</button></li>
						<li>
							<textarea class="dealTextarea mdFnt" maxlength="250" name="re_content" placeholder="당신의 후기가 다른 사람에게 큰 도움이 됩니다"></textarea>
							<div class="reviewTextCount">0 / 250</div>
						</li>
						<li><input type="file" name="re_img"/></li>
						<li style="display:none"><input type="hidden" id="WriteReviewNum" name="num" value=""/></li>
						<li><button class="btn btn-outline-dark btn-lg" id="WriteReviewNumCancel" data-dismiss="modal">다음에 할게요</button>
							<button class="btn btn-outline-dark btn-lg" id="WriteReview">작성완료</button>
							<button class="btn btn-outline-dark btn-lg" id="reviewUpdate">수정완료</button>		
						</li>
					</ul>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>