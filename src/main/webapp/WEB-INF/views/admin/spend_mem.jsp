<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/spend_mem.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Month', '충전포인트', '소비포인트'],
          ['21/${monthArr[0]}',  ${month1VO.chargemoney},${month1VO.spendmoney}],
          ['21/${monthArr[1]}',  ${month2VO.chargemoney},${month2VO.spendmoney}],
          ['21/${monthArr[2]}',  ${totalVO.chargemoney},${totalVO.spendmoney}]
        ]);

        var options = {
          /* title : 'Monthly Coffee Production by Country',
          vAxis: {title: 'Cups'},
          hAxis: {title: 'Month'}, */
          seriesType: 'bars',
         /*  series: {5: {type: 'line'}} */
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      $(function(){
    	  //검색클릭시 
    	  $("#searchBtn").click(function(){
    		  memListAjax();
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
  			memListAjax();
  		});
  		function setComma(num) {     return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); }
    	  function memListAjax(){
    		  $.ajax({
  				type : "POST",
  				url : "memspendSearch",
  				data : $("#spendFrm").serialize(),
  				success : function(result){
  					var $list = $(result.list);
					var pagenum = result.pageNum;
					var start = result.startPageNum;
					var onePageNum = result.onePageNum;
					var last = result.totalPage;
					$(".memList").remove();
					var txt = "";
					$.each($list ,function(idx,vo){
						txt +="<tr class='memList'>";
						txt +=	"<td>"+vo.userid+"</td>";
						txt +=	"<td>"+setComma(vo.charge_point)+"</td>";
						txt +=	"<td class='spend' style='cursor:pointer'>"+setComma(vo.spend_point)+"</td>";
						txt +=	"<td class='add' style='cursor:pointer'>"+setComma(vo.add_point)+"</td>";
						txt +="</tr>";
					});
					$(".memlisttbl").append(txt);
					//페이징 부분
					var link="";
					$(".clickpage").remove();//기존 페이징 부분 삭제
					if(pagenum>1){
						link +="<li  class='clickpage' style='cursor:pointer'>이전</li>";	
					}
					var lastPg=last;
					if(lastPg>=start+4){//>11>2+4
						lastPg=5;
					}else{
						lastPg = last-start+1;
					}
					for(var i=start;i<=start+lastPg-1;i++){
						if(pagenum==i){
							link +="<li  class='clickpage nowPg' style='cursor:pointer'>"+i+"</li>";
						}else{
							link +="<li  class='clickpage' style='cursor:pointer'>"+i+"</li>";	
						}
						
					}
					if(last>pagenum){
						link +="<li  class='clickpage'>다음</li>";
					}
					$(".link").append(link);
  				},error:function(){
    				  alert("데이터 가져오기 실패,,,");
    		  	}
    		  
    		  });
    	  }
    	  //======modal1======
    	  //사용금액 클릭시 모달1 창 띄우기
    	  $(document).on('click','.spend',function(){
    		  var userid=$(this).prev().prev().text();
    		  $("#moOne>#topsubject").text(userid+"님의 사용포인트");
     		 modalOne(userid);//모달창 띄우는 
    	  });
    	  function setComma(num) {     return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); }
    	  function modalOne(userid){//모달 1 창 띄우는 함수 
    		  $("#moOne").css("display", "block");
    		  $("#moOne").draggable({'cancel':'.tbl', containment:'parent', scroll:false});
    		  $.ajax({
    				type : "POST",
    				url : "memspendModal",
    				data : "userid="+userid+"&modal=modal1",
    				success : function(result){
    					var $list = $(result.list);
    					var txt;
    					$(".modal1List").remove();
    					$.each($list ,function(idx,vo){
    						txt+="<tr class='modal1List'>";
	    						txt+="<td>"+vo.item_num+"</td>";
	    						txt+="<td class='wordcut cut'>"+vo.sel_subject+"</td>";
	    						txt+="<td>"+vo.sel_userid+"</td>";
	    						txt+="<td>"+setComma(vo.spend_point)+"</td>";
	    						txt+="<td>"+vo.sp_date+"</td>";
    						txt+="</tr>";
    					});
    					$(".modal1").append(txt);
    				},error:function(){
    					alert("데이터 불러오기 실패");	
    				}
    		  });
    	  }
    	  
    	  
    	  //======modal2======
    	  //회원거래 클릭시 모달2 창 띄우기
    	  $(document).on('click','.add',function(){
    		  var userid=$(this).prev().prev().prev().text();
    		 $("#moTwo>#topsubject").text(userid+"님의 획득포인트");
     		 modalTwo(userid);//모달창 띄우는
    	  });
    	  
    	  function modalTwo(userid){//모달 2 창 띄우는 함수 
    		  $("#moTwo").css("display", "block");
    		  $("#moTwo").draggable({'cancel':'.tbl', containment:'parent', scroll:false});
    		  $.ajax({
  				type : "POST",
  				url : "memspendModal",
  				data : "userid="+userid+"&modal=modal2",
  				success : function(result){
  					var $list = $(result.list);
  					var txt;
  					$(".modal2List").remove();
  					$.each($list ,function(idx,vo){
  						txt+="<tr class='modal2List'>";
	    						txt+="<td>"+vo.item_num+"</td>";
	    						txt+="<td class='wordcut cut'>"+vo.sel_subject+"</td>";
	    						txt+="<td>"+vo.sel_userid+"</td>";
	    						txt+="<td>"+setComma(vo.add_point)+"</td>";
	    						txt+="<td>"+vo.sp_date+"</td>";
  						txt+="</tr>";
  					});
  					$(".modal2").append(txt);
  				},error:function(){
  					alert("데이터 불러오기 실패");	
  				}
  		  });
    	  }
    	  
    	  $(".exit").click(function(){
    		  //부모의 부모 ->모달 div 
    		  $(this).parent().css("display","none");
    	  });
      
    	  $("input[type='text']").keydown(function(){
    		 if(event.keyCode==13){
    			 event.preventDefault();
    		 }
    	  });
    	  $(".prev").click(function(){
    		  //이전 버튼 클릭시
    		  location.href="spend_mem?month="+${monthArr[1]};
    	  });
    	  $(".next").click(function(){
    		  //이전 버튼 클릭시
    		  var month = parseInt(${monthArr[2]});
    		  if(month==12){
    			  location.href="spend_mem?month=1";
    		  }else{
    			  month=month+1;
    			  location.href="spend_mem?month="+month;
    		  }
    	  });
    	  
      });
</script>
<div class="main">
	<!--월 이동 부분-->
     <div class="loadDateFrm">
	 	<button class="dayBtn prev">《</button>
	 	<button class="setMonth">2021년 ${monthArr[2]}월</button>
	 	<button class="dayBtn next">》</button>
	 </div>
<div class="title">회원 정산</div>
<div id="doublediv">
	<div class="tablediv">
		<table class="t_spend">
			<tr>
				<td>누적 충전액</td>
				<td>누적 사용액</td>
			</tr>
			<tr>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalVO.totalcharge }"/></td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalVO.totalspend }"/></td>
			</tr>
			<tr>
				<td>이번달 충전액</td>
				<td>이번달 사용액</td>
			</tr>
			<tr>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalVO.chargemoney }"/></td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${totalVO.spendmoney }"/></td>
			</tr>
		</table> 
		<table class="t_spend" >
		    <colgroup>
		       	<col width=33%/>
		       	<col width=33%/>
		       	<col width=33%/>
		    </colgroup>
			<tr>
				<td>충전횟수</td>
				<td>무통장</td>
				<td>카드</td>
			</tr>
			<tr>
				<td>${cntVO.chargecnt}</td>
				<td>${cntVO.moneycnt}</td>
				<td>${cntVO.cardcnt}</td>
			</tr>
		</table>
	</div>
	<div id="chart_div"></div>
</div>
	<div id="formdiv">
		<form id="spendFrm">
			<input type="hidden" name="searchKey" value="userid"/>
			<input type="text" name="searchWord"  class="spendtext" placeholder="아이디를 입력하세요."/>
			<input type="button" id="searchBtn" class="puplebtn" value="검색"/>
			<input type="hidden" name="pageNum" id="pageNum" value="1"/>
		</form>
	</div>
	금액 클릭시 상세내역 확인
	<table class="tablea memlisttbl" >
		<tr>
			<td>아이디</td>
			<td>충전액</td>
			<td>사용금액</td>
			<td>받을금액</td>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr class="memList">
				<td>${vo.userid }</td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.charge_point }"/></td>
				<td class="spend" style="cursor:pointer"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.spend_point }"/></td>
				<td class="add" style="cursor:pointer"><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.add_point }"/></td>
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
	
	<div id="moOne"class="modaldiv">
		<div id="topsubject"></div>
		<div id="modalTbl">
			<table class="tablea modal1" >
				<colgroup>
		        	<col width="15%" />
		            <col />
		            <col width="15%" />
		            <col width="15%" />
		            <col width="20%" />
		        </colgroup>
				<tr>
					<td>번호</td>
					<td class="wordcut">글제목</td>
					<td>회원명</td>
					<td>사용금액</td>
					<td>거래일</td>
				</tr>
			</table>
		</div>
		<div class="exit" style="cursor:pointer;">닫기</div>
	</div>
	<div id="moTwo" class="modaldiv">
		<div id="topsubject"></div>
		<div id="modalTbl">
			<table class="tablea modal2" >
				<colgroup>
		        	<col width="15%" />
		            <col />
		            <col width="15%" />
		            <col width="15%" />
		            <col width="20%" />
		        </colgroup>
				<tr>
					<td>번호</td>
					<td class="wordcut">글제목</td>
					<td>회원명</td>
					<td>사용금액</td>
					<td>거래일</td>
				</tr>
			</table>
		</div>
		<div class="exit" style="cursor:pointer;">닫기</div>
	</div>

</div>




















