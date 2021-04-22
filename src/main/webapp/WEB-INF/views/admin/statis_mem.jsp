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
          ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
          ['2004/05',  165,      938,         522,             998,           450,      614.6],
          ['2005/06',  135,      1120,        599,             1268,          288,      682],
          ['2006/07',  157,      1167,        587,             807,           397,      623],
          ['2007/08',  139,      1110,        615,             968,           215,      609.4],
          ['2008/09',  136,      691,         629,             1026,          366,      569.6],
          ['2008/10',  136,      691,         629,             1026,          366,      569.6]
        ]);

        var options = {
          title : 'Monthly Coffee Production by Country',
          vAxis: {title: 'Cups'},
          hAxis: {title: 'Month'},
          seriesType: 'bars',
          series: {5: {type: 'line'}},
          fontSize: 16
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    //=======그래프==============
    //==도넛그래프
    function drawChart1() {

        var data = google.visualization.arrayToDataTable([
          ['Effort', 'Amount given'],
          ['My all',     20],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options = {
          width: 400,
       	  height: 400,
          pieHole: 0.3,
          pieSliceTextStyle: {
            color: 'black',
          },
          legend: 'none',
          fontSize: 16
        };

        var chart = new google.visualization.PieChart(document.getElementById('donut_single'));
        chart.draw(data, options);
      }
    function drawChart2() {

        var data2 = google.visualization.arrayToDataTable([
          ['Effort', 'Amount given'],
          ['My all',     20],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options2 = {
          width: 400,
       	  height: 400,
          pieHole: 0.3,
          pieSliceTextStyle: {
            color: 'white',
          },
          legend: 'none',
          fontSize: 16
        };

        var chart = new google.visualization.PieChart(document.getElementById('donut_two'));
        chart.draw(data2, options2);
      }
    function drawChart3() {

        var data3 = google.visualization.arrayToDataTable([
          ['Effort', 'Amount given'],
          ['My all',     20],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options3 = {
          width: 400,
       	  height: 400,
          pieHole: 0.3,
          pieSliceTextStyle: {
            color: 'black',
          },
          legend: 'none',
          fontSize: 16
        };

        var chart = new google.visualization.PieChart(document.getElementById('donut_three'));
        chart.draw(data3, options3);
      }
</script>
<div id="main">
	<div class="btitle">회원통계</div>
	<form>
     <!--  <p><input type="date" value="2019-09-22" min="2019-09-10" max="2019-09-25"></p> -->
      <p><input type="date" name="startDate">~<input type="date" name="lastDate">
      <input type="submit" class="pupleBtn" value="검색"></p>
    </form>
     <div id="chart_div"></div>
     
     <div class="btitle">월별 회원 통계 추이</div>
     
     <ul>
     	<li id="donut_single"></li>
     	<li id="donut_two"></li>
     	<li id="donut_three"></li>
     	<li>지역별</li>
     	<li>신규/휴면</li>
     	<li>일반/셀러</li>
     </ul>
     
</div>






















