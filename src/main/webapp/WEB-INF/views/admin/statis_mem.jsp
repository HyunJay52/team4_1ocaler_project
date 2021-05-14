<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/statis_mem.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);//그래프
      google.charts.setOnLoadCallback(drawChart1);//도넛차트
      google.charts.setOnLoadCallback(drawChart2);//도넛차트
      google.charts.setOnLoadCallback(drawChart3);//도넛차트
	  //=======그래프==============
      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Month', '방문자수', '누적회원수', '신규회원수', '신규셀러수'],
          ['21/${dataVO.month1}',  ${memCountVO.loginmem1},${memCountVO.totalmem1},${newCountVO.loginmem1},${newCountVO.totalmem1}],
          ['21/${dataVO.month2}',  ${memCountVO.loginmem2},${memCountVO.totalmem2},${newCountVO.loginmem2},${newCountVO.totalmem2}],
          ['21/${dataVO.month3}',  ${memCountVO.loginmem3},${memCountVO.totalmem3},${newCountVO.loginmem3},${newCountVO.totalmem3}]
        ]);

        var options = {
         // hAxis: {title: 'Month'},
          seriesType: 'bars',
          series: {0: {type: 'line'}},
          fontSize: 16
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    //=======그래프==============
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
    
    function drawChart2() {

        var data2 = google.visualization.arrayToDataTable([
          ['분류', '회원수'],
          ['신규',     ${subVO.totalmem1}],
          ['휴면',     ${subVO.totalmem2}]
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
            ['일반',     ${subVO.loginmem1}],
            ['셀러',     ${subVO.loginmem2}]
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
</script>
<div class="main">
	<!--월 이동 부분-->
     
	 <div class="loadDateFrm">
	 	<button class="dayBtn prev">이전</button>
	 	<button class="setMonth">2021년 ${dataVO.month3}월</button>
	 	<button class="dayBtn next">다음</button>
	 </div>
	 
	<div class="btitle">회원통계</div>
    <div id="chart_div"></div>
				
     <div class="btitle">월별 회원 통계 추이</div>
     
     <ul class="donutUl">
     	<li id="donut_single"></li>
     	<li id="donut_two"></li>
     	<li id="donut_three"></li>
     	<li>지역별이용률</li>
     	<li>신규/휴면</li>
     	<li>일반/셀러</li>
     </ul>
     
</div>






















