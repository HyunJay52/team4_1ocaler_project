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
      function setComma(num) {     return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); }
      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Month', '매출', '수익', '판매글수'],
          ['21/${monthArr[0]}',${month1.monthsale}/10000,${month1.monthmoney}/10000, ${boardCnt.month1}],
          ['21/${monthArr[1]}',${month2.monthsale}/10000,${month2.monthmoney}/10000 ,${boardCnt.month2}],
          ['21/${monthArr[2]}',${month3.monthsale}/10000,${month3.monthmoney}/10000 ,${boardCnt.month3}]
        ]);

        var options = {
          title : '매출, 수익 (단위:만원)',/*
          vAxis: {title: 'Cups'},
          hAxis: {title: 'Month'}, */
          seriesType: 'bars',
          series: {2: {type: 'line'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    //==도넛그래프
      function drawChart1() {

          var data = google.visualization.arrayToDataTable([
            ['지역구', '방문자수'],
            ['강서구',${guVO.gu1}],
            ['구로구',${guVO.gu2}],
            ['금천구',${guVO.gu3}],
            ['관악구',${guVO.gu4}],
            ['강남구',${guVO.gu5}],
            ['강동구',${guVO.gu6}],
            ['용산구',${guVO.gu7}],
            ['중구',${guVO.gu8}],
            ['광진구',${guVO.gu9}],
            ['동대문구',${guVO.gu10}],
            ['중랑구',${guVO.gu11}],
            ['은평구',${guVO.gu12}],
            ['강북구',${guVO.gu13}],
            ['노원구',${guVO.gu14}],
            ['도봉구',${guVO.gu15}],
            ['양천구',${guVO.gu16}],
            ['영등포구',${guVO.gu17}],
            ['동작구',${guVO.gu18}],
            ['서초구',${guVO.gu19}],
            ['송파구',${guVO.gu20}],
            ['마포구',${guVO.gu21}],
            ['서대문구',${guVO.gu22}],
            ['성동구',${guVO.gu23}],
            ['종로구',${guVO.gu24}],
            ['성북구',${guVO.gu25}],          
          ]);

          var options = {
            title : '지역별이용률',
            width: 400,
         	  height: 400,
            pieHole: 0.3,
            pieSliceTextStyle: {
              color: 'white'
            },
            pieSliceText : 'label',
            legend: 'none',
          };
          var chart = new google.visualization.PieChart(document.getElementById('donut_single'));
          chart.draw(data, options);
        }
      $(function(){
    	  //검색버튼 클릭시
    	  $("#searchBtn").click(function(){
    		  sellerAjax();
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
    			sellerAjax();
    		});
    	  function sellerAjax(){
    		  $.ajax({
  				type : "POST",
  				url : "selspendSearch",
  				data : $("#spendFrm").serialize(),
  				success : function(result){
  					var $list = $(result.list);
					var pagenum = result.pageNum;
					var start = result.startPageNum;
					var onePageNum = result.onePageNum;
					var last = result.totalPage;
					$(".selList").remove();
					var txt = "";
					$.each($list ,function(idx,vo){
						txt +="<tr class='selList'>";
						txt +=	"<td>"+vo.sel_num+"</td>";
						txt +=	"<td>"+vo.sel_userid +"</td>";
						txt +=	"<td class='popup wordcut' style='cursor:pointer'>"+vo.sel_subject +"</td>";
						txt +=	"<td>"+vo.sel_cnt +"</td>";
						txt +=	"<td>"+setComma(vo.sel_price)+"</td>";
						txt +=	"<td>"+setComma(vo.fee)+"</td>";
						txt +=	"<td>"+setComma(vo.remoney)+"</td>";
						txt +="</tr>";
					});
					$(".selListTbl").append(txt);
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
						link +="<li  class='clickpage' style='cursor:pointer'>다음</li>";
					}
					$(".link").append(link);
  				},error:function(){
    				  alert("데이터 가져오기 실패,,,");
    		  	}
    		  });
    	  }
    	  $(document).on('click','.popup',function(){
    		  var num = $(this).prev().prev().text();
    		  var txt =$("#topsubject").text($(this).text());
    		  modalOne(num);
    	  });
    	  
    	  function modalOne(num){
    		  $.ajax({
	  				type : "POST",
	  				url : "selspendModal",
	  				data : "num="+num,
	  				success : function(result){
	  					var $list = $(result.list);
	  					var txt="";
	  					$(".modal1List").remove();
	  					$.each($list ,function(idx,vo){
	  						txt+="<tr class='modal1List'>";
		    						txt+="<td>"+vo.num+"</td>";
		    						txt+="<td class='wordcut'>"+vo.userid+"</td>";
		    						txt+="<td>"+vo.o_cnt+"</td>";
		    						txt+="<td>"+setComma(vo.o_price)+"</td>";
		    						txt+="<td>"+vo.o_date+"</td>";
	  						txt+="</tr>";
	  					});
	  					$(".modal1").append(txt);
	  				},error:function(){
	  					alert("데이터 불러오기 실패");	
	  				}
	  		  }); 
    		  $("#moOne").css("display", "block");
    		  $("#moOne").draggable({'cancel':'.tbl', containment:'parent', scroll:false});
    	  }
    	  $(".exit").click(function(){
    		  //부모의 부모 ->모달 div 
    		  $(this).parent().css("display","none");
    	  });
    	  $(".prev").click(function(){
    		  //이전 버튼 클릭시
    		  location.href="spend_sel?month="+${monthArr[1]};
    	  });
    	  $(".next").click(function(){
    		  //이전 버튼 클릭시
    		  var month = parseInt(${monthArr[2]});
    		  if(month==12){
    			  location.href="spend_sel?month=1";
    		  }else{
    			  month=month+1;
    			  location.href="spend_sel?month="+month;
    		  }
    	  });
      })
</script>
<div class="main">
	<!--월 이동 부분-->
     <div class="loadDateFrm">
	 	<button class="dayBtn prev">《</button>
	 	<button class="setMonth">2021년 ${monthArr[2]}월</button>
	 	<button class="dayBtn next">》</button>
	 </div>
	<div class="title">셀러정산</div>
	<div id="doublediv">
		<div class="tablediv">
			<table class="t_spend">
				<tr>
					<td>누적 수익</td>
					<td>누적 매출</td>
				</tr>
				<tr>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total.totalmoney}"/></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${total.totalsale }"/></td>
				</tr>
				<tr>
					<td>이번달 수익</td>
					<td>이번달 매출</td>
				</tr>
				<tr>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${month3.monthmoney }"/></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${month3.monthsale }"/></td>
				</tr>
			</table> 
			<table class="t_spend" >
			    <colgroup>
			       	<col width=33%/>
			       	<col width=33%/>
			       	<col width=33%/>
			    </colgroup>
				<tr>
					<td>판매글수</td>
					<td>정산예정</td>
					<td>정산완료</td>
				</tr>
				<tr>
					<td>${boardCnt.month3}</td>
					<td>${spendCnt.sp_be}</td>
					<td>${spendCnt.sp_af}</td>
				</tr>
			</table>
		</div>
		<div id="chart_div"></div>
	</div>
	<div id="formdiv">
		<form id="spendFrm">
			<select name="searchKey" class="selectcomm">
				<option value="sel_num">게시물 번호</option>
				<option value="sel_subject">판매글 제목</option>
				<option value="sel_userid">판매자명</option>
			</select>
			<input type="text" class="spendtext" name="searchWord"/>	
			<input type="button" class="puplebtn" id="searchBtn" value="검색"/>
			<input type="hidden" name="pageNum" id="pageNum" value="1"/>
			<input type="hidden" name="month" value="${pageVO.month }"/>
		</form>
	</div>
	제목 클릭시 판매 상세내역 확인
	<table class="tablea selListTbl" >
		<tr>
			<td>번호</td>
			<td>판매자명</td>
			<td>판매글</td>
			<td>판매수량</td>
			<td>총금액</td>
			<td>수수료</td>
			<td>정산금액</td>
		</tr>
		<c:forEach var="vo" items="${list }">
			<tr class="selList">
				<td>${vo.sel_num }</td>
				<td>${vo.sel_userid }</td>
				<td class="popup wordcut" style="cursor:pointer">${vo.sel_subject }</td>
				<td>${vo.sel_cnt }</td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.sel_price }"/></td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.fee }"/></td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.remoney }"/></td>
			</tr>
		</c:forEach>
	</table>
	<ul class="link">
		<!-- 이전버튼 -->
		<c:if test="${pageVO.pageNum>1 }">
			<li class="clickpage" style="cursor:pointer">이전</li>
		</c:if>
		<!-- 페이지 번호              1부터                            5까지   -->
         <c:forEach var="p" begin="${pageVO.startPageNum}" end="${pageVO.startPageNum+pageVO.onePageNum-1}">
            <c:if test="${p<=pageVO.totalPage}">              
            	<c:if test="${p==pageVO.pageNum }">
            		<li class="clickpage nowPg" style="cursor:pointer">${p}</li> 
            	</c:if>
            	<c:if test="${p!=pageVO.pageNum }">
            		<li class="clickpage" style="cursor:pointer">${p}</li>  
            	</c:if>
            </c:if>
         </c:forEach>
         <c:if test="${pageVO.totalPage>pageVO.pageNum }">
			<li class="clickpage" style="cursor:pointer">다음</li>
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
					<td>구매자</td>
					<td>구매수량</td>
					<td>구매금액</td>
					<td>구매확정일</td>
				</tr>
			</table>
		</div>
		<div class="exit" style="cursor:pointer">닫기</div>
	</div><!-- /모달div -->
	
</div><!--#main div-->




















