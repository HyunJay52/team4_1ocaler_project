<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/statis_board.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);
      google.charts.setOnLoadCallback(drawChart1);//도넛차트
      google.charts.setOnLoadCallback(drawChart2);//도넛차트
      google.charts.setOnLoadCallback(drawChart3);//도넛차트
      var month1Cnt = ${month1.boardcnt}+${month1.sell_itemcnt}+${month1.grouplocalcnt}+${month1.mem_sharecnt};//입력받은 달-2
	  var month2Cnt = ${month2.boardcnt}+${month2.sell_itemcnt}+${month2.grouplocalcnt}+${month2.mem_sharecnt};
	  var month3Cnt = ${month3.boardcnt}+${month3.sell_itemcnt}+${month3.grouplocalcnt}+${month3.mem_sharecnt};
	  function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Month', '자유게시판', '판매자게시판', '모집게시판', '회원간거래', '신규게시글총합'],
          ['21/${monthArr[0]}',${month1.boardcnt},${month1.sell_itemcnt},${month1.grouplocalcnt},${month1.mem_sharecnt},month1Cnt],
          ['21/${monthArr[1]}',${month2.boardcnt},${month2.sell_itemcnt},${month2.grouplocalcnt},${month2.mem_sharecnt},month2Cnt],
          ['21/${monthArr[2]}',${month3.boardcnt},${month3.sell_itemcnt},${month3.grouplocalcnt},${month3.mem_sharecnt},month3Cnt]
        ]);

        var options = {
          /* title : 'Monthly Coffee Production by Country',
          vAxis: {title: 'Cups'},
          hAxis: {title: 'Month'}, */
          seriesType: 'bars',
          series: {4: {type: 'line'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
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
	    
	    function drawChart2() {
			//자유게시판 상위 카테고리 분류 비율
			//1.동네 정보, 2. 쓱싹레시피,3.자유자게
	        var data2 = google.visualization.arrayToDataTable([
	          ['분류', '회원수'],
	          ['동네 정보',${cateVO.totalmem1}],
	          ['쓱싹레시피',${cateVO.totalmem2}],
	          ['자유자게',${cateVO.totalmem3}]
	        ]);

	        var options2 = {
	          width: 400,
	       	  height: 400,
	          pieHole: 0.3,
	          pieSliceTextStyle: {
	            color: 'white',
	          },
	          pieSliceText : 'label',
	          legend: 'none',
	          fontSize: 16
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('donut_two'));
	        chart.draw(data2, options2);
	      }
	    function drawChart3() {

	        var data3 = google.visualization.arrayToDataTable([
	        	['분류', '회원수'],
	            ['회원거래',${month3.mem_sharecnt}],
	            ['셀러거래',${month3.sell_itemcnt}]
	        ]);

	        var options3 = {
	          width: 400,
	       	  height: 400,
	          pieHole: 0.3,
	          pieSliceTextStyle: {
	            color: 'white',
	          },
	          pieSliceText : 'label',
	          legend: 'none',
	          fontSize: 16
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('donut_three'));
	        chart.draw(data3, options3);
	      }
	  $(document).ready(function(){//페이지 실행되자마자 실행된다.
		  $("#totalCnt").append(month1Cnt+month2Cnt+month3Cnt);
		  $("#newTotal").append(month3Cnt);
		});
	  $(function(){
	    	$(".prev").click(function(){
	  		  //이전 버튼 클릭시
	  		  location.href="statis_board?month="+${monthArr[1]};
	  	  });
	  	  $(".next").click(function(){
	  		  //다음 버튼 클릭시
	  		  var month = parseInt(${monthArr[2]});
	  		  if(month==12){
	  			  location.href="statis_board?month=1";
	  		  }else{
	  			  month=month+1;
	  			  location.href="statis_board?month="+month;
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
	<ul class="statisUl">
		<li>
			전체 게시글
			<div id="totalCnt"></div>
		</li>
		<li>
			신규 게시글
			<div id="newTotal"></div>
		</li>
	</ul>
	<div id="chartDiv">
		<div class="btitle">게시글 통계</div>
		<div id="chart_div"></div>
	</div>
	<ul class="donutUl">
     	<li id="donut_single"></li>
     	<li id="donut_two"></li>
     	<li id="donut_three"></li>
     	<li>모집게시판이용률</li>
     	<li>자유카테고리 비율</li>
     	<li>일반/셀러게시글 비율</li>
     </ul>
</div>







































