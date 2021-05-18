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
						console.log("idx="+idx);
						index = idx;
						tag += "<td class='wordCut'>"+data.s_subject+"</td>";
						tag += "<td>"+data.sellerid+"</td>";
						tag += "<td>"+data.j_writedate+"</td>";
						tag += "<td><button class='btn btn-primary' value='"+data.numjoin+"' data-target='#reviewMd' data-toggle='modal'>리뷰쓰기</button></td>";							
						tag += "</tr>";
					});
					if(index < 5){
						for(var i = index; i < 5; i++){
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
		myInfoReviewList(1)
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
					result.IList.forEach(function(data, idx){
						tag += "<td class='wordCut'>"+data.i_subject+"</td>";
						tag += "<td>"+data.sellerid+"</td>";
						tag += "<td>"+data.o_date+"</td>";
						tag += "<td><button class='btn btn-primary' value='"+data.num+"' data-target='#reviewMd' data-toggle='modal'>리뷰쓰기</button></td>";											
						tag += "</tr>";
					});
					if(index < 5){
						for(var i = index; i < 5; i++){
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
		
		//상품 거래 페이징
		function setItemReviewPaging(itemPVO){
			console.log(itemPVO);
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
		
		function setMyAllReview(num){
			$.ajax({
				url : "",
				data : "",
				success : function(result){
					
				},error : function(e){
					console.log("error");
				}
			})
		}
	});
</script>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h3>리뷰 관리<span class="smlFnt"> 리뷰작성은 구매 확정 후 한달 내로 작성하실 수 있습니다.</span></h3>
		<div class="reviewTop">
			<div class="reviewLeft">
			<h5>회원리뷰</h5>
				<select name="kategorie" id="reviewKategorie">
					<option value="mem_share" selected>회원간 거래</option>
					<option value="grouplocal">모집</option>
					
				</select>
				<table class="myinfoTable2" id="myinfoReviewTable">
					<tr>
						<td class="wordCut">제목<br/>(아이디)</td>
						<td>날짜</td>
						<td>리뷰</td>
					</tr>
				</table>
				<div id="shareListPaging">
				
				</div>
			</div>
			<div class="reviewRight">
				<h5>상품리뷰</h5>
				<table class="myinfoTable2" id="myinfoItemReviewTable">
					<tr>
						<td class="wordCut">제목<br/>(아이디)</td>
						<td>날짜</td>
						<td>리뷰</td>
					</tr>
				</table>
				<div id="itemListPaging">
				
				</div>
			</div>
		</div>
		<div class="reviewBottom">
			<div class="dealDateForm">
				<input type="date" value="2021-05-01" min="2021-03-01" max="2021-05-31"/> ~ 
				<input type="date" value="2021-05-31" min="2021-03-01" max="2021-05-31"/>
			</div>
			<div class="reviewSearchArea">
				<input type="text" name="searchWord"/>
				<input type="button" value="검색" id="reviewSearchAreaBtn"/>
			</div>
			<div class="myinfoReviewList">
			<table class="myinfoTable2">
					<tr>
						<td>구분</td>
						<td>상태</td>					
						<td class="wordCut">제목<br/>아이디</td>
						<td class="wordCut">내용</td>
						<td>날짜</td>
						<td>수정</td>
					</tr>
					<tr>
						<td>직거래</td>
						<td><img src="img/myInfo/myDeal/reviewHeart2.png"/></td>
						<td class="wordCut"><a href="">청년농장 콜라비 3kg</a><br/>test</td>
						<td class="wordCut">저렴하게 잘 구매했습니다</td>
						<td>2021-04-25</td>
						<td><button class="btn">수정</button></td>
					</tr>
					<tr>
						<td>직거래</td>
						<td><img src="img/myInfo/myDeal/reviewHeart2.png"/></td>
						<td class="wordCut"><a href="">청년농장 콜라비 3kg</a><br/>test</td>
						<td class="wordCut">저렴하게 잘 구매했습니다</td>
						<td>2021-04-25</td>
						<td><button class="btn">수정</button></td>
					</tr>
					<tr>
						<td>직거래</td>
						<td><img src="img/myInfo/myDeal/reviewHeart2.png"/></td>
						<td class="wordCut"><a href="">청년농장 콜라비 3kg</a><br/>test</td>
						<td class="wordCut">저렴하게 잘 구매했습니다</td>
						<td>2021-04-25</td>
						<td><button class="btn">수정</button></td>
					</tr>
			</table>
			</div>
		</div>
	</div>
	<div class="modal fade" id="reviewMd" data-backdrop="static">
		<div class="modal-dialog modal-lg" data-backdrop="static">
			<div class="modal-content">
				<div class="modal-header reviewHeader" data-backdrop="static">
				<h4 class="modal-title"></h4>

				</div>
				<div class="modal-body reviewBody" data-backdrop="static">
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
			</div>
		</div>
	</div>
</div>