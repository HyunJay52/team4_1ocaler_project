<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		//collape in
		//버튼선택 이벤트
		$(document).on('click', '#myDealTbl tr>td>button', function(){
			$('#myDealTbl tr>td>div').attr('class', 'myDealMem collapse');
			$(this).next().attr('class', 'collape in myDealMem');

		});
		
		//드롭박스 이벤트
		$(document).on('click', '#myDealTbl tr>td>div>ul>li>button', function(){
			$(this).parent().parent().parent().attr('class', 'collapse');
			$(this).parent().parent().parent().prev().text($(this).text());
		});

		
		//다른곳 클릭시 드롭박스 닫기
		$("body").click(function(){
			$('#myDealTbl tr>td>div').attr('class', 'myDealMem collapse');
		});
		
		$("#myDealToggle>input").click(function(){
			$("#myDealToggle>input").css('background-color', '#fff').css('color', '#3f1785').attr('name', null);
			$(this).css('background-color', '#3f1785').css('color', '#fff').attr('name', 'kategorie');
			setDealList(1);
		});
		
		//리뷰버튼 클릭이벤트
		$("#myDealTbl button").click(function(){
			var title = $(this).text()+"님과의 거래가 어떠셨나요 ?";
			$(".modal-title").text(title);
			console.log($(this).text());
			
		});
		
		//모달 닫힘 이벤트
		$(".close").on('click', function(){
			console.log("모달닫힘");
			$(".reviewBody").css('display', 'none');
			$(".reviewList").css('display', 'block');
			$("#reviewForm")[0].reset();
			$(".imgBtn").attr('name', null);
			$(".checkJoinMember").css('display', 'none');
			$(".cancelJoinMember").css('display', 'none');
		});
		
		//검색 이벤트
		$("#myDealSearch").click(function(){
			var kategorie = $("#myDealToggle>input[name='kategorie']").attr('title');
			console.log($("#myDealForm").serialize()+"&kategorie="+kategorie);
			setDealList(1);
			//$(this).prev().val(""); 보류
		});
		//////////////////////
		//리스트 불러오기
		function setDealList(page){
			var kategorie = $("#myDealToggle>input[name='kategorie']").attr('title');
			console.log("kategorie="+kategorie);
			$.ajax({
				url : "myDealList",
				data : $("#myDealForm").serialize()+"&kategorie="+kategorie+"&nowNum="+page,
				type : 'POST',
				success: function(result){
					console.log(result);
					var tag = "<tr><td>작성자</td><td>날짜</td><td>제목</td><td>위치</td><td>상태</td><td>비고</td></tr>";
					result.list.forEach(function(data,idx){
						
						//내가 참여한 리스트일 경우
						if(kategorie == 'joinus'){
							tag += "<tr>";
							tag += "<td>"+data.userid+"</td>";
							tag += "<td>"+data.j_writedate+"</td>";
							tag += "<td>"+data.s_subject+"</td>";
							tag += "<td>"+data.s_gu+"</td>";
							
							if(data.j_status == '리뷰완료'){
								tag += "<td><button class='btn btn-block btn-outline-success'>"+data.j_status+"</button></td>";
								tag += "<td><button class='btn btn-block btn-outline-danger getMyReview' data-target='#myJoinDealMd' data-toggle='modal' value='"+data.num+"'>리뷰보기</button></td>";
							}else if(data.j_status == '참여취소'){
								tag += "<td><button class='btn btn-block btn-outline-danger'>취소됨</button></td>";
								tag += "<td></td>";
							}else if(data.j_status == '참여승인'){
								tag += "<td><button class='btn btn-block btn-outline-primary'>"+data.j_status+"</button></td>";
								tag += "<td><button class='btn btn-block btn-outline-danger cancelMyJoin' data-target='#myJoinDealMd' data-toggle='modal' title='"+data.numJoin+"' value='"+data.j_num+"'>참여취소</button></td>";
							}else if(data.j_status == '참여완료'){
								tag += "<td><button class='btn btn-block btn-outline-success'>"+data.j_status+"</button></td>";
								tag += "<td><button class='btn btn-block btn-outline-dark btn-light myReviewBtn' data-target='#myJoinDealMd' data-toggle='modal' title='"+data.numJoin+"' value='"+data.j_num+"'>리뷰쓰기</button></td>";
							}else{//참여신청
								tag += "<td><button class='btn btn-block btn-light btn-outline-dark'>"+data.j_status+"</button></td>";
								tag += "<td><button class='btn btn-block btn-outline-danger cancelMyJoin' data-target='#myJoinDealMd' data-toggle='modal' title='"+data.numJoin+"' value='"+data.j_num+"'>참여취소</button></td>";								
							}
							tag += "</tr>";
							
						//내가 개설한 리스트일 경우
						}else if(kategorie == 'mem_share'){
							var joinCount = 0;
							var reviewCount = 0;
							
							tag += "<tr>";
							tag += "<td>"+data.userid+"</td>";
							tag += "<td>"+data.s_writedate+"</td>";
							tag += "<td>"+data.s_subject+"</td>";
							tag += "<td>"+data.s_gu+"</td>";
							tag += "<td><button class='btn btn-block btn-outline-dark dealModalOpen' data-target='#myDealMd' data-toggle='modal' value='"+data.num+"'>참여회원</button></td>";
							$.ajax({
								url : "selectReviewCount",
								data : {"num": data.num,
										"kategorie":"joinus"
										},
								dataType : 'json',
								async : false,
								success : function(result){
									console.log(result);
									console.log("reviewcount="+result.reviewCount);
									console.log("joincount="+result.joinCount);
									tag += "<td>"+result.reviewCount+"/"+(result.joinCount-result.joinCancel)+"명</td>";	
								},error : function(e){
									console.log("리뷰완료 조회 실패");
								}
							});				
							
							tag += "</tr>";									
						}else if(kategorie == 'grouplocal'){//내가 개설한 모집글
							var joinCount = 0;
							var reviewCount = 0;
							
							tag += "<tr>";
							tag += "<td>"+data.userid+"</td>";
							tag += "<td>"+data.g_writedate+"</td>";
							tag += "<td>"+data.g_subject+"</td>";
							tag += "<td>"+data.g_gu+"</td>";
							tag += "<td><button class='btn btn-block btn-outline-dark dealModalOpen' data-target='#myDealMd' data-toggle='modal' value='"+data.num+"'>참여회원</button></td>";
							$.ajax({
								url : "selectReviewCount",
								data : {"num": data.num,
										"kategorie":"grouplocal"	
										},
								dataType : 'json',
								async : false,
								success : function(result){
									console.log(result);
									console.log("reviewcount="+result.reviewCount);
									console.log("joincount="+result.joinCount);
									tag += "<td>"+result.reviewCount+"/"+(result.joinCount-result.joinCancel)+"명</td>";	
								},error : function(e){
									console.log("리뷰완료 조회 실패");
								}
							});				
							
							tag += "</tr>";	
						}else if(kategorie == 'groupJoinus'){ //내가 참여한 모집글
							tag += "<tr>";
							tag += "<td>"+data.sellerid+"</td>";
							tag += "<td>"+data.g_writedate+"</td>";
							tag += "<td>"+data.g_subject+"</td>";
							tag += "<td>"+data.g_gu+"</td>";
							
							if(data.j_status == '리뷰완료'){
								tag += "<td><button class='btn btn-block btn-outline-success'>"+data.j_status+"</button></td>";
								tag += "<td><button class='btn btn-block btn-outline-danger getMyReview' data-target='#myJoinDealMd' data-toggle='modal' value='"+data.num+"'>리뷰보기</button></td>";
							}else if(data.j_status == '참여취소'){
								tag += "<td><button class='btn btn-block btn-outline-danger'>취소됨</button></td>";
								tag += "<td></td>";
							}else if(data.j_status == '참여승인'){
								tag += "<td><button class='btn btn-block btn-outline-primary'>"+data.j_status+"</button></td>";
								tag += "<td><button class='btn btn-block btn-outline-danger cancelMyJoin' data-target='#myJoinDealMd' data-toggle='modal' title='"+data.numJoin+"' value='"+data.j_num+"'>참여취소</button></td>";
							}else if(data.j_status == '참여완료'){
								tag += "<td><button class='btn btn-block btn-outline-success'>"+data.j_status+"</button></td>";
								tag += "<td><button class='btn btn-block btn-outline-dark btn-light myReviewBtn' data-target='#myJoinDealMd' data-toggle='modal' title='"+data.numJoin+"' value='"+data.j_num+"'>리뷰쓰기</button></td>";
							}else{//참여신청
								tag += "<td><button class='btn btn-block btn-light btn-outline-dark'>"+data.j_status+"</button></td>";
								tag += "<td><button class='btn btn-block btn-outline-danger cancelMyJoin' data-target='#myJoinDealMd' data-toggle='modal' title='"+data.numJoin+"' value='"+data.j_num+"'>참여취소</button></td>";								
							}
							tag += "</tr>";
						}
						
					});
					$("#myDealTbl").html(tag);
					setDealPaging(result.pVO);
			
				},error : function(e){
					console.log(e);
				}
			
			});
		}
		setDealList(1);
		//페이징
		function setDealPaging(pVO){
			console.log(pVO);
			$("#myinfoDealPaging").html("");
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
			$("#myinfoDealPaging").append(tag);
		}
		//페이징 이벤트
		$(document).on('click', '#myinfoDealPaging>ul>li>button', function(){
			var nowNum = $(this).val(); //현제 페이지
			console.log("nownum="+nowNum)
			setDealList(nowNum);			
		});
			
		//참여회원보기 이벤트
		$(document).on('click', '.dealModalOpen', function(){
			var num = $(this).val();
			$(".cancelJoinMember").css('display','none');
			setJoinList(num);
		});
		
		//참여리스트
		function setJoinList(num){
			console.log(num);
			$.ajax({
				url : "selectJoinUs",
				data : {'numJoin':num},
				success : function(result){
					console.log("modalData="+result)
					var tag = "";
					result.forEach(function(data,idx){
					tag += "<ul><li>"+data.userid+"</li>";
					console.log(data.j_status);
					if(data.j_status == '참여신청'){
						tag += "<li><button class='btn btn-outline-danger reviewJoin' title='"+data.numJoin+"' value='"+data.j_num+"'>"+data.j_status+"</button></li>";					
					}else if(data.j_status == '참여승인'){
						tag += "<li><button class='btn btn-outline-primary cancelJoin' title='"+data.numJoin+"' value='"+data.j_num+"'>"+data.j_status+"</button></li>";
					}else if(data.j_status == '참여취소'){
						tag += "<li><button class='btn btn-outline-Secondary'>"+data.j_status+"</button></li>";
					}else if(data.j_status == '참여완료'){
						tag += "<li><button class='btn btn-outline-Success reviewBtn' title='"+data.numJoin+"' value='"+data.j_num+"'>리뷰쓰기</button></li>";
					}else if(data.j_status == '리뷰완료'){
						tag += "<li><button class='btn btn-outline-dark'>"+data.j_status+"</button></li>";
					}
					tag += "<li>"+data.mem_post+"</li>";
					tag += "<li>"+data.mem_rev+"</li>";
					tag += "<li><p>"+data.j_writedate+"</p></li>";
					tag += "</ul>";											
					});
					$("#reviewList").html(tag);
				}, error : function(e){
					console.log("error");
				}
				
			});
		}
		//내가 참여한 리뷰 작성하기 버튼 클릭
		$("#myReviewWrite").click(function(){
			$("#myReviewForm").serialize();
		});
		
		//내가 참여한 목록 취소버튼 이벤트
		$(document).on('click', ".cancelMyJoin", function(){
			$("#joinMemberCancel").attr('value', $(this).val());
			$("#myjoinDealCancel").attr('value', $(this).val());
			$(".cancelJoinMember").css('display', 'block');
			$("#myjoinContent").css('background-color', 'rgba(255,255,255,0)');
		});
		//내가 참여한 목록 취소처리
		$(document).on('click', '#myjoinDealCancel', function(){
			joinCancel($(this).val(), 0)
		});
		//내가 참여한 리뷰쓰기
		$(document).on('click', '.myReviewBtn', function(){
			$("#myjoinReview").css('display', 'block');
			$(".cancelJoinMember").css('display', 'none');
			$("#myReviewNum").attr('value', $(this).attr('title'));
			$("#myReviewNum").attr('title', $(this).attr('value'));
			$("#myjoinContent").css('background-color', 'rgba(255,255,255,1)');
			
		});
		//내가 참여한 리뷰쓰기 폼 닫기
		$(document).on('click', '#myReviewCancel', function(){
			$("#myjoinReview").css('display', 'none');	
			$(".cancelJoinMember").css('display', 'block');
		});
		
		//참여신청 수락 이벤트
		function joinUpdate(j_num, num){
			console.log(j_num+"/"+num);
			$.ajax({
				url : "joinUpdate",
				data : {'j_num': j_num},
				dataType : "json",
				type : "post",
				success : function(result){
					console.log("참여신청 승인 성공");
					$(".checkJoinMember").css('display', 'none');
					setJoinList(num);
				}, error : function(e){
					console.log("참여신청 승인 실패");
				}
				
				
			})
		}
		//참여신청 취소처리 이벤트
		function joinCancel(j_num, num){
			$.ajax({
				url : "joinCancel",
				data : {'j_num': j_num},
				dataType : 'json',
				success : function(result){
					$(".modalBackground").css('display', 'none');
					$(".cancelJoinMember").css('display', 'none');
					$(".checkJoinMember").css('display', 'none');
					if(num != null && num != 0){
						setJoinList(num);						
					}else{
						setJoinList(num);	
					}
					$('.modal-backdrop').hide();
					$("#myJoinDealMd").hide();
					setDealList(1);
					
				}, error : function(e){
					console.log("error"); 
				}
				
			});
		}
			
		//내 참여신청 취소창 닫기
		$(".myjoinCancel").click(function(){
			$(".modal-content").css('background-color', 'rgba(255,255,255,1)');
			$(".cancelJoinMember").css('display', 'none');
		});
		
		//참여신청 취소
		$("#joinMemberCancel").click(function(){
			var j_num = $("#joinMemberCancel").val();
			var num = $("#joinMemberCancel").attr('title');
			joinCancel(j_num, num);
		});
		
		//참여신청 취소폼 표시하기
		$(document).on('click', '.cancelJoin', function(){
			$(".cancelJoinMember").css('display', 'block');
			$(".modalBackground").css('display', 'block');
			$("#joinMemberCancel").attr('value', $(this).val());
			$("#joinMemberCancel").attr('title', $(this).attr('title'));
		});
	 	
		//참여신청 수락
		$("#joinMember").click(function(){
			var j_num = $(this).val();
			var num = $(this).attr('title');
			joinUpdate(j_num, num);
		});
		//참여신청 수락폼 닫기
		$(".joinCancel").click(function(){
			$(this).parent().parent().css('display', 'none');
			$(".modalBackground").css('display', 'none');
		});
		//참여신청 이벤트
		$(document).on('click', '.reviewJoin', function(){
			$(".checkJoinMember").css('display', 'block');
			$("#joinMember").attr('value', $(this).val());
			$("#joinMember").attr('title', $(this).attr('title'));
			$("#joinReject").attr('value', $(this).val());
			$("#joinReject").attr('title', $(this).attr('title'));
		});
		//리뷰쓰기 클릭 이벤트
		$(document).on('click','.reviewBtn', function(){
			$(".reviewList").css('display', 'none');
			$(".reviewBody").css('display', 'block');
			$("#reviewNum").attr('value', $(this).val());
			$("#reviewNum").attr('title', $(this).attr('title'));
			
		});
		
		//리뷰쓰기 취소 이벤트
		$(document).on('click', '#cancelReview', function(){
			console.log("cancel");
			$(".reviewBody").css('display', 'none');
			$(".reviewList").css('display', 'block');
		});
	
		
		//리뷰 점수 이벤트
		$(document).on('click', '.imgBtn', function(){
			$(".imgBtn").attr('name', null);
			$(this).attr('name', 're_rate');
		});
		
		//내 리뷰쓰기 이벤트
		$(document).on('click', '#myReviewWrite', function(){
			if($("#myjoinReview>ul>li>textarea").val() == null || $("#myjoinReview>ul>li>textarea").val() == ''){
				alert('내용을 입력해주세요.');
			}else{
				var rateCheck = $("#myjoinReview>ul>li>button[name=re_rate]").val();
				var j_num = $("#myReviewNum").attr('title');
				var num = $("#myReviewNum").val();
				console.log("re_rate="+rateCheck);
				if(rateCheck == null || rateCheck == ''){
					alert('리뷰점수를 선택해주세요.');				
				}else{
					if(confirm('리뷰를 작성하시겠습니까?')){
						var data = $("#myReviewForm").serialize();
						console.log(data);
						writeReview(data, rateCheck, j_num, num);				
					}
				}
			}
		});
		//리뷰작성 클릭 이벤트
		$(document).on('click', '#reviewWrite', function(){
			if($("#writeReviewBody>ul>li>textarea").val() == null || $("#writeReviewBody>ul>li>textarea").val() == ''){
				alert('내용을 입력해주세요.');
			}else{
				var rateCheck = $("#writeReviewBody>ul>li>button[name=re_rate]").val();
				var j_num = $("#reviewNum").val();
				var num = $("#reviewNum").attr('title');
				console.log("re_rate="+rateCheck);
				if(rateCheck == null || rateCheck == ''){
					alert('리뷰점수를 선택해주세요.');				
				}else{
					if(confirm('리뷰를 작성하시겠습니까?')){
						var data = $("#reviewForm").serialize();
						writeReview(data, rateCheck, j_num, num);				
					}
				}
			}
		});
		
		//리뷰쓰기 이벤트
		function writeReview(data,rate,j_num, num){

			console.log("data="+data);
			$.ajax({
				url : "writeReview",
				data : data+"&re_rate="+rate+"&j_num="+j_num,
				type : "post",
				success: function(result){
					console.log(result);
					if(result > 0){
						alert("리뷰가 작성되었습니다.");
						$(".reviewBody").css('display', 'none');
						$(".reviewList").css('display', 'block');
						setJoinList(num);
						$("#reviewForm")[0].reset();
						$("#myReviewForm")[0].reset();
						$('.modal-backdrop').remove();
						$("#myJoinDealMd").hide();
						$(".imgBtn").attr('name', null);
					}else{
						alert("리뷰작성에 실패했습니다.");
					}
				}, error : function(e){
					console.log("error")
				}
			
			});
			setDealList(1);
		}
		//리뷰보기 클릭시
		$(document).on('click', ".getMyReview", function(){
			var num = $(this).val();
			selectMyReview(num);
		});
		
		//리뷰보기 닫기시
		$("#closeMyReview").click(function(){
			$("#viewMyReview").css('display', 'none');
						
			
		});
		//한 게시글의 내 리뷰 가져오기
		function selectMyReview(num){
			$.ajax({
				url : "selectMyReview",
				data : {"num": num},
				dataType : "json",
				success: function(result){
					console.log(result);
					var tag = "<li>번호 : "+result.re_num+"</li>";
					tag += "<li>작성자 : "+result.userid+"</li>";
					if(result.re_rate == 1){
						tag += "<li>평가 : 재구매 의사 있음</li>";						
					}else if(result.re_rata == 2){
						tag += "<li>평가 : 재구매 의사 없음</li>";
					}
					tag += "<li>작성일 : "+result.re_writedate+"</li>";
					if(result.re_img != null){
						tag += "<li><div class=''>"+result.re_img+"</div>"+result.re_content+"</li>";						
					}
					tag += "<li>"+result.re_content+"</li>";
					
					
					$("#viewMyReviewForm").html(tag);	
					$(".cancelJoinMember").css('display', 'none');
					$("#viewMyReview").css('display', 'block');
				}, error : function(){
					console.log("error");
				}
			});
		}
	});
</script>
<%@ include file="/inc/sideBar.jspf" %>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h3>회원간거래</h3>
		<div class="dealTop">
			<div class="dealInfo">
				<img src="<%=request.getContextPath()%>/img/mem_prof/${logProf }"/>
				<div class="infoList">
					<div class="infoListHeader">
						<h3>${vo.mem_name }</h3>
						<input type="button" class="btn dealBtn btn-outline-dark" value="Send Message"/>
						<a href="myInfoCheck"><input type="button" class="btn dealBtn btn-outline-dark" value="Info" /></a>
					</div>
					<ul style="font-weight:bold;">
						<li>참여</li>
						<li>모집</li>
						<li>직거래</li>
						<li>방문</li>
						<li>내글</li>
						<li>댓글</li>
						<li>좋아요</li>
					</ul>
					<ul>
						<li>${vo.joinus}</li>						
						<li>${vo.grouplocal}</li>
						<li>${vo.mem_share }</li>
						<li>${vo.logcount}</li>
						<li>${vo.board}</li>
						<li>${vo.reply}</li>
						<li>${vo.likeit}</li>
					</ul>
				</div>
			</div>
		</div>
		<form method="post" id="myDealForm" onsubmit="return false;">
		<div class="dealBottom">
			<div id="myDealToggle">
				<input type="button" class="btn commBtn btn-outline-dark" title="joinus" value="거래 참여"/>
				<input type="button" style="background-color:#3f1785; color:#fff;" class="btn commBtn btn-outline-dark" title="mem_share" name="kategorie" value="거래 개설"/>
				<input type="button" class="btn commBtn btn-outline-dark" title="groupJoinus" value="모집 참여"/>
				<input type="button" class="btn commBtn btn-outline-dark" title="grouplocal" value="모집 개설"/>
				
			</div>
			<div class="dealDateForm">
				<input type="date" value="2021-03-01" id="dealDate" name="searchDate" min="2021-03-01" max="2021-05-31"/> ~ 
				<input type="date" value="2021-05-31" id="dealDate2" name="searchDate2" min="2021-03-01" max="2021-05-31"/>
			</div>
			
			<table class="myinfoTable2" id="myDealTbl">
		
			</table>
			<div id="myinfoDealPaging">
				
			</div>
			<div class="searchArea">
				<select id="dealSearchKey" name="searchKey">
					<option value="s_subject">제목</option>
					<option value="s_content">내용</option>
					<option value="s_gu">위치</option>
					<option value="s_tag">태그</option>	
				</select>
				<input type="text" name="searchWord"/>
				<input type="button" value="검색" id="myDealSearch"/>
			</div>
		</div>
		</form>
	</div>
		<!-- 내가 참여한 리스트 모달 -->
	<div class="modal fade" id="myJoinDealMd" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" id="myjoinContent" style="overflow:none" data-backdrop="static">
			<div class="model-body" data-backdrop="static">
				<div class="cancelJoinMember" style="height:300px">
					<h2>참여신청을 거절하시겠습니까?</h2>
					<div class="cancelJoinBody">
						<p class="mdFnt">참여신청을 거절할 시 재수락이 불가능합니다</p>
						
					</div>
					<div class="joinBtnform">
						<button type="button" class="btn commBtn" id="myjoinDealCancel" value="">확인</button>
						<button type="button" class="btn commBtn myjoinCancel" data-dismiss="modal">취소</button>		
					</div>
				</div>
				
				</div>
				<form method="post" id="myReviewForm" onsubmit="return false;">
				<div class="modal-body reviewBody" id="myjoinReview" style='display:none' data-backdrop="static">
					<h3 style="height:0px">리뷰 작성하기</h3>
					<ul>
						<li><img src="img/myInfo/myDeal/reviewHeart.png"/></li>
						<li><img src="img/myInfo/myDeal/reviewHeart2.png"/></li>
						<li><button class="btn lgFnt btn-lg imgBtn btnYellow" value="1">또 참여할래요</button></li>
						<li><button class="btn lgFnt btn-lg imgBtn" value="2">음, 글쎄요</button></li>
						<li>
							<textarea class="dealTextarea mdFnt" name="re_content" placeholder="당신의 후기가 다른 사람에게 큰 도움이 됩니다"></textarea>
						</li>
						<li><input type="file" name="re_img"/></li>
						<li style="display:none"><input type="hidden" id="myReviewNum" name="num" value=""/></li>
						<li><button class="btn btn-outline-dark btn-lg" id="myReviewCancel" data-dismiss="modal">다음에 할게요</button>
							<button class="btn btn-outline-dark btn-lg" id="myReviewWrite">작성완료</button>
						</li>
					</ul>
				</div>
				</form>
				<div class="modal-body" id="viewMyReview" style="display:none">
					<h3>리뷰 보기</h3>
					<ul id="viewMyReviewForm">
					
					</ul>
					<button class="btn btn-outline-dark" id="closeMyReview" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
		<!-- 내가 개설한 리스트 모달 -->
	<div class="modal fade" id="myDealMd" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="overflow:none">
				<div class="modal-header reviewHeader">
					<h4 class="modal-title" style="width:100%">참여자 목록<button class="close" data-dismiss="modal" style="float:right">&times;</button></h4>
					
				</div>
				
				
				<div class="model-body reviewList">
						
					<div class="reviewListHearder">
						<ul>
							<li>신청자</li>
							<li>상태</li>
							<li>작성글 수</li>
							<li>받은 평가</li>	
							<li>신청 날짜</li>	
						</ul>
					</div>
					<div id="reviewList">
						
					</div>
				</div>
				<form method="post" id="reviewForm" onsubmit="return false;">
				<div class="modal-body reviewBody" id="writeReviewBody" style='display:none' data-backdrop="static">
				
					<ul>
						<li><img src="img/myInfo/myDeal/reviewHeart.png"/></li>
						<li><img src="img/myInfo/myDeal/reviewHeart2.png"/></li>
						<li><button class="btn lgFnt btn-lg imgBtn btnYellow" value="1">또 참여할래요</button></li>
						<li><button class="btn lgFnt btn-lg imgBtn" value="2">음, 글쎄요</button></li>
						<li>
							<textarea class="dealTextarea mdFnt" name="re_content" placeholder="당신의 후기가 다른 사람에게 큰 도움이 됩니다"></textarea>
						</li>
						<li><input type="file" name="re_img"/></li>
						<li style="display:none"><input type="hidden" id="reviewNum" name="num" value=""/></li>
						<li><button class="btn btn-outline-dark btn-lg" id="canselReview">다음에 할게요</button>
							<button class="btn btn-outline-dark btn-lg" id="reviewWrite">작성완료</button>
						</li>
					</ul>
				</div>
				</form>
				<div class="cancelJoinMember" style="display:none; height:300px">
					<h2>참여신청을 거절하시겠습니까?</h2>
					<div class="cancelJoinBody">
						<p class="mdFnt">참여신청을 거절할 시 재수락이 불가능합니다</p>
						
					</div>
					<div class="joinBtnform">
						<button type="button" class="btn commBtn" id="joinMemberCancel" value="">확인</button>
						<button type="button" class="btn commBtn joinCancel">취소</button>		
					</div>
				</div>
				<div class="checkJoinMember" style="display:none">
					<h2>참여를 승인하시겠습니까?</h2>
					<div class="">
						<textarea class="readMe" readonly>
							거래시 유의사항
제 1 조 [목적]
이 준칙은 회사의 윤리경영을 통하여 투자자 보호와 자본시장의 발전을 도모함을 목적으로 한다.
제 2 조 [적용범위]
이 준칙은 회사 및 회사의 금융투자상품 판매임직원들(계약직원 및 임시직원 등을 포함한다. 이하 이 준칙에서 같다)에게 적용되며, 현재의 투자자 및 잠재적 투자자에 대해서도 준수되어야 한다.
제 3 조 [윤리준칙의 운영]
회사는 투자자 보호를 위하여 업무처리 원칙과 실무지침이 포함된 영업행위 윤리준칙(이하 ‘윤리준칙’이라 한다)을 제정∙운영하여야 하며, 해당 윤리준칙을 회사의 인터넷 홈페이지 등 적절한 수단을 통하여 공개하여야 한다.
제 4 조 [윤리준칙 준수여부의 확인]
① 회사는 금융투자상품 판매임직원들의 윤리준칙 준수 여부를 주기적으로 점검하여야 한다.
② 회사는 금융사고가 발생하거나 투자자의 민원이 제기되는 경우 금융투자상품 판매임직원들의 윤리준칙 준수 여부를 점검하여야 한다.
③ 회사는 윤리준칙 준수 여부를 점검하는 과정에서 위법∙부당행위가 발견되는 경우 조사하여야 하며, 유사행위가 발생하지 않도록 필요한 조치를 신속하게 취하여야 한다.
제 5 조 [판매과정에서의 정보제공]
회사 및 금융투자상품 판매임직원들은 불완전 판매를 방지하고 필요한 정보가 투자자에게 충분히 제공될 수 있도록 다음 각 호의 사항을 준수하여야 한다.
1. 투자자에게 금융투자상품에 대한 충분한 선택정보 및 금융투자상품의 특징, 원금 손실 가능 여부, 중도 해지시의 불이익 등 중요 위험요인에 관한 정보를 제공하여 불완전 판매가 발생하지 않도록 최선의 노력을 다하여야 한다.
2. 투자자에게 제공하는 정보는 다음 각 목의 원칙에 따라 투자자가 이해하기 쉽도록 작성되어야 한다.
가. 투자자가 알기 쉽도록 간단∙명료하게 기술되어야 한다.
나. 객관적인 사실에 근거하여야 하며, 투자자가 오해할 우려가 있는 정보가 기재되어서는 아니 된다.
다. 금융투자회사 상호 간의 공정경쟁을 해치거나 사실을 왜곡하는 내용을 포함하여서는 아니 된다.
라. 신문, 방송 등 언론매체를 통해 상품 및 서비스를 홍보하는 경우, 그 내용에 대한 책임을 명확하게 함과 동시에, 투자자가 오인하지 않도록 하여야 한다.
3. 회사가 투자자에게 제공하는 서비스와 관련하여 업무의 일부를 제3자에게 위탁하는 경우 회사는 위탁을 한 내용을 투자자에게 알려주어야 한다.
제 6 조 [계약서류의 작성 등]
① 회사는 투자자가 계약서의 내용을 쉽게 알 수 있도록 표준화된 용어를 사용하여야 하며, 중요한 내용은 부호, 색채, 굵고 큰 문자 등으로 명확하게 표시하여 알아보기 쉽게 하여야 한다.
② 회사는 투자자와 계약을 체결한 경우 그 계약서류를 투자자에게 지체없이 교부하여야 한다. 다만, 다음 각 호의 어느 하나에 해당하는 경우에는 계약서류를 교부하지 아니할 수 있다.
1. 매매거래계좌를 설정하는 등 금융투자상품을 거래하기 위한 기본계약을 체결하고 그 계약내용에 따라 계속적∙반복적으로 거래를 하는 경우
2. 투자자가 계약서류의 수령을 거부한다는 의사를 서면으로 표시한 경우
3. 투자자가 계약서류를 우편이나 전자우편으로 수령하겠다는 의사를 서면으로 표시하여 우편이나 전자우편으로 계약서류를 제공하는 경우
③ 회사가 투자자에게 제공하는 계약서류에는 다음 각 호의 사항이 포함되어야 한다.
1. 수수료의 종류 및 요율 등의 세부적인 수수료 부과기준
2. 투자자에게 신용을 제공할 경우 이자율 산정방식 등 세부적인 이자율 부과기준과 신용의 거래구조 및 위험성
3. 민원처리 방법
4. 투자자가 투자한 금융투자상품의 환금성에 제한이 있을 경우 그 내용
5. 계약의 해지조건
제 7 조 [적합성 및 적정성 원칙]
① 일반투자자에게 투자권유를 하는 경우 회사 및 금융투자상품 판매임직원들은 일반투자자의 투자목적∙재산상황 및 투자경험 등에 비추어 그 일반투자자에게 적합하지 아니하다고 인정되는 투자권유를 하여서는 아니 되며, 이를 위하여 투자권유를 하기 전에 면담∙질문 등을 통하여 일반투자자의 투자목적∙재산상황 및 투자경험 등의 정보를 파악하여야 한다.
② 회사 및 금융투자상품 판매임직원들은 일반투자자에게 투자권유를 하지 아니하고 파생상품, 그 밖에 자본시장법시행령 제52조의2 제1항 각 호의 어느 하나에 해당하는 금융투자상품(이하 “파생상품등”이라 한다)을 판매하려는 경우에는 면담∙질문 등을 통하여 그 일반투자자의 투자목적∙재산상황 및 투자경험 등의 정보를 파악하여야 한다.
③ 회사 및 금융투자상품 판매임직원들은 일반투자자의 투자목적∙재산상황 및 투자경험 등에 비추어 해당 파생상품등이 그 일반투자자에게 적정하지 아니하다고 판단되는 경우에는 다음 각 호의 사실을 알려야 한다.
1. 해당 파생상품 등의 내용 및 투자에 따르는 위험
2. 해당 파생상품 등이 일반투자자의 투자목적∙재산상황 및 투자경험 등에 비추어 그 일반투자자에게 적정하지 아니하다는 사실
제 8 조 [판매 원칙]
회사 및 금융투자상품 판매임직원들은 투자권유 및 금융투자상품을 판매함에 있어 다음 각 호의 어느 하나에 해당하는 행위를 하여서는 아니되며 관계법규를 준수하고 건전한 금융거래가 유지되도록 최선의 노력을 다하여야 한다.
1. 거짓의 내용을 알리는 행위
2. 불확실한 사항에 대하여 단정적 판단을 제공하거나 확실하다고 오인하게 할 소지가 있는 내용을 알리는 행위
3. 투자자로부터 투자권유의 요청을 받지 아니하고 방문, 전화 등 실시간 대화의 방법을 이용하는 행위. 다만, 증권과 장내파생상품에 대하여 투자권유를 하는 경우는 제외한다.
4. 일반투자자의 투자목적․재산상황 및 투자경험 등에 비추어 적합하지 아니하다고 인정되는 투자권유를 하거나 일반 투자자의 의사에 반하여 다른 금융투자상품의 구매를 강요하는 행위
5. 금융투자상품의 투자위험에 대하여 충분히 알리지 않거나 투자광고시 투자위험을 축소하여 표현하는 행위
6. 임직원이 해당 금융투자상품의 투자에 수반되는 위험을 충분히 이해하지 못하거나 관련법규가 정하는 자격요건을 보유하지 아니하고 금융투자상품을 판매하는 행위
제 9 조 [투자광고]
① 회사는 투자광고를 하는 경우 투자자가 그 내용을 쉽게 이해할 수 있도록 표준화된 용어를 사용하여야 한다.
② 회사는 투자광고에 공정한 거래질서를 해하거나 사실과 다른 표현을 사용하여서는 아니 되며, 건전한 투자문화 조성에 필요한 내용이 포함되도록 최대한 노력하여야 한다.
제 10 조 [이해상충방지]
회사 및 금융투자상품 판매임직원들은 회사와 투자자간 또는 투자자와 투자자간 이해상충의 관계에 있거나 이해상충이 우려되는 경우 회사가 정하는 내부통제기준 등에 따라 투자자 보호 등에 문제가 발생하지 아니하도록 사전에 조치하며, 이해상충이 발생할 가능성을 낮추는 것이 곤란하다고 판단되는 경우에는 그 사실을 투자자에게 통지하고 매매 그 밖의 거래를 하여서는 아니 된다.
제 11 조 [매매명세의 통지]
① 회사는 금융투자상품의 매매가 체결된 경우 지체없이 매매의 유형, 종목, 수량, 가격, 수수료 등 모든 비용 그 밖의 거래내용을 관련법규가 정하는 방법에 따라 통지하여야 한다. 다만, 투자자가 통지 받기를 원하지 아니하는 경우에는 지점 그 밖의 영업소에 비치하거나 인터넷 홈페이지에 접속하여 수시로 조회가 가능하게 하는 등으로 통지를 갈음할 수 있다.
② 회사는 월간 매매, 그 밖의 거래가 있는 계좌에 대하여 월간 매매내역, 손익내역, 월말잔액 및 잔량현황, 월말 현재 파생상품의 미결제 약정현황, 예탁자산잔고, 위탁증거금 필요액 현황 등을 투자자가 쉽게 이해할 수 있도록 작성하여 관계법규가 정하는 바에 따라 투자자에게 통지하여야 한다.
③ 회사는 투자자가 매매명세의 정확성에 대해 사전에 약정된 기한 내에 이의를 제기한 경우 이에 대하여 적절히 조치하여야 한다.
제 12 조 [출금∙고 등]
회사는 투자자가 자신의 계좌 내 자산의 출금∙고 또는 이체∙대체를 요청하는 경우 관련법규 상 제한이 있거나 및 해당 금융투자상품의 특성상 출․금고 또는 이체․대체의 제한이 필요한 경우 또는 전기통신금융사기 피해방지를 위하여 필요한 경우를 제외하고 지체없이 응하여야 한다.
제 13 조 [업무처리]
① 회사 및 임직원은 선량한 관리자의 주의로서 투자자의 매매주문, 배당 및 투자자예탁금 이용료의 입금․고, 투자자의 각종 권리행사 등에 따른 업무처리가 공정하고 정확하게 이루어질 수 있도록 맡은 업무를 충실하게 수행하여야 한다.
② 회사는 금융사고 방지를 위한 적절한 내부통제장치를 갖추어야 하며, 금융사고 발생 시 지체없이 투자자의 피해를 최소화하기 위한 조치를 취하여야 한다.
제 14 조 [기록의 보관]
1. 투자자 실명확인 증표 사본
2. 투자자와 체결한 계약 관련 자료 및 각종 위험고지 서류
3. 투자자에게 제공된 정기 보고서
4. 투자권유 관련 자료
5. 주문기록, 매매명세 등 투자자의 금융투자상품의 매매, 그 밖의 거래 관련 자료
6. 금융투자상품의 매매 업무와 관련하여 당해 투자자로부터 제출받은 의사표시자료의 사본
7. 회사가 투자자에게 통지한 내용의 기록물
제 15 조 [투자자의 정보 보호]
① 회사는 금융투자상품 판매와 관련하여 개인정보의 수집 및 활용이 필요한 경우 투자자로부터 명확한 동의를 얻어 그 목적에 부합하는 최소한의 정보만 수집∙활용하고, 선량한 관리자의 주의로서 관리하여야 하며, 당해 목적 이외에는 사용하지 아니하여야 한다.
② 투자자의 금융거래 정보를 제3자에게 제공하는 경우 회사는 관계법규에서 다르게 정하지 않는 한 투자자에게 해당 사실을 통보해야 한다.
③ 회사는 개인정보의 수집∙이용 및 제3자 제공∙공유 시 적용되는 개인정보 취급방침을 공개하여야 하며, 투자자에게 투자자 개인정보의 제3자 제공에 대하여 이를 거부할 권리가 있다는 사실과 동의 거부에 따른 불이익이 있는 경우 그 내용을 알려 주어야 한다.
제 16 조 [민원 등의 처리]
① 회사 및 금융투자상품 판매임직원들은 금융투자상품 판매과정에서 투자자에게 피해가 생긴 경우 신속한 피해구제를 위해 최선의 노력을 다하여야 한다.
② 회사는 투자자의 민원을 신속하고 공정하게 처리하기 위한 프로세스를 구축․운영하여야 한다.
③ 회사는 투자자의 민원 처리를 전담하는 담당자를 지정하여 민원처리를 전담케 하여야 한다.
④ 회사는 민원처리 절차를 회사의 영업점 및 홈페이지에 게시하여야 한다.
⑤ 회사는 금융투자상품 판매에 따른 민원을 수시로 모니터링하고 필요한 경우 그 내용을 임직원에게 전파하여 유사한 민원이 발생되지 않도록 노력한다.
⑥ 회사는 투자자에게 회사와 분쟁이 발생하는 경우 회사의 민원처리기구에 그 해결을 요구하거나 금융감독원, 한국금융투자협회, 한국거래소 등에 분쟁조정을 신청할 수 있다는 사실을 약관 등을 통하여 안내한다.
제 17 조 [상품공시]
회사는 회사가 판매하는 금융투자상품을 회사의 인터넷 홈페이지에 공시하는 경우 다음 각 호의 원칙을 준수하여야 한다.
1. 투자자가 알기 쉽도록 간단․명료하게 작성할 것>
2. 객관적인 사실에 근거하여 작성할 것
3. 투자자의 오해를 초래할 우려가 있는 정보를 포함하지 아니할 것
제 18 조 [판매관련 평가 및 보상체계]
회사는 금융투자상품을 판매하는 과정에서 금융투자상품 판매임직원들과 투자자의 이해상충이 발생하지 않도록 금융투자상품 판매임직원들의 평가 및 보상체계를 「성과보상 규정」등에 근거한 평가절차에 따라 운영한다.
제 19 조 [소비자보호 총괄 책임자의 지정]
① 회사는 업무집행책임자(임원급) 중에서 준법감시인에 준하는 독립적 지위의 금융소비자보호총괄 책임자를 1인 이상 지정하여야 한다. 다만 자산규모, 영위하는 업무의 성질상 업무집행책임자로 지정하기에 적합하지 아니한 경우에는 준법감시인으로 하여금 금융소비자보호총괄 책임자의 직무를 겸직하게 할 수 있다.
② 금융소비자보호 총괄 책임자는 최근 5년간 금융관계 법령을 위반하여 금융위원회 또는 금융감독원장으로부터 문책경고 또는 감봉요구 이상에 해당하는 조치를 받은 사실이 없어야 한다.
제 20 조 [소비자보호 총괄 책임자의 직무]
금융소비자보호 총괄책임자는 투자자의 권익이 침해되거나 침해될 현저한 우려가 있는 경우 지체 없이 대표이사에게 보고하여야 하며, 대표이사는 보고받은 사항을 확인하여 신속히 필요한 제반조치를 신속히 취하여야 한다.
제 21 조 [금품 및 향응수령 신고 등]
① 임직원은 직무수행과 관련하여 회사가 정하는 일정액 이상의 금품 및 향응 등을 수수한 경우 회사에 지체없이 신고하여야 한다.
② 임직원은 직무수행과 관련하여 선물 등을 요구하거나 사회상규에 벗어나는 향응, 그 밖의 금품 등을 수수하여서는 아니된다.
제 22 조 [임직원 매매]
① 임직원은 금융투자상품의 매매거래와 관련하여 투자자, 회사 또는 주주와의 사이에서 이해상충이 발생하지 않도록 하여야 하며, 업무상 직위를 이용하여 투자자, 회사 또는 주주에게 손실을 끼치는 행위를 하여서는 아니 된다.
② 회사는 임직원의 자기계산에 의한 금융투자상품 매매와 관련하여 불공정행위의 방지 또는 투자자와의 이해상충의 방지를 위하여 임직원이 따라야 할 적절한 기준 및 절차를 정하여야 하며, 관련법규가 정하는 바에 따라 임직원의 금융투자상품 매매명세를 확인하여야 한다.
제 23 조 [위법행위 등의 신고]
회사는 투자자 및 임직원으로부터 회사 및 임직원의 위법∙부당한 행위 및 불공정 거래 등을 홈페이지∙전화∙팩스 등으로 접수받아 전담 직원이 처리하는 절차와 내부 고발자보호를 위한 내부 규정을 마련∙운영하여야 한다.
부 칙
제 1 조 [시행일] 이 준칙은 2018년 9월 11일부터 시행한다.
						</textarea>
					</div>
					<div class="joinBtnform">
						<button type="button" class="btn commBtn" id="joinMember" value="">수락</button>
						<button type="button" class="btn btn-outline-danger cancelJoin" id="joinReject" value="">거절</button>
						<button type="button" class="btn commBtn joinCancel">취소</button>		
					</div>
				</div>
				<div class="modalBackground"></div>
			</div>
		</div>
	</div>
</div>