<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/statis_board.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
          ['2004/05',  165,      938,         522,             998,           450,      614.6],
          ['2005/06',  135,      1120,        599,             1268,          288,      682],
          ['2006/07',  157,      1167,        587,             807,           397,      623],
          ['2007/08',  139,      1110,        615,             968,           215,      609.4],
          ['2008/09',  136,      691,         629,             1026,          366,      569.6]
        ]);

        var options = {
          title : 'Monthly Coffee Production by Country',
          vAxis: {title: 'Cups'},
          hAxis: {title: 'Month'},
          seriesType: 'bars',
          series: {5: {type: 'line'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
</script>
<div id="main">
	<div class="btitle">게시글 통계</div>
	<ul class="statis">
		<li>
			전체 게시글
			<div>19921127</div>
		</li>
		<li>
			신규 게시글
			<div>19951219</div>
		</li>
	</ul>
	<div id="chart_div"></div>
	
	<form>
		<input type="button" class="puplebtn" value="월간"/>
		<input type="button" class="searchbtn" value="주간"/>
     <!--  <p><input type="date" value="2019-09-22" min="2019-09-10" max="2019-09-25"></p> -->
      <p><input type="date" name="startDate">~<input type="date" name="lastDate">
      <input type="submit" class="pupleBtn" value="검색"></p>
    </form>
</div>







































