<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/spend_mem.css"/>
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
	<table class="t_spend" >
       	<colgroup>
       		<col width=33%/>
       		<col width=33%/>
       		<col width=33%/>
       	</colgroup>
		<tr>
			<td colspan=3>총 누적 충전액 : 10,000,000,000원</td>
		</tr>
		<tr>
			<td colspan=3>총 누적 사용액 : 34,500,000원</td>
		</tr>
		<tr>
			<td>충전횟수</td>
			<td>무통장</td>
			<td>카드</td>
		</tr>
		<tr>
			<td>178</td>
			<td>73</td>
			<td>55</td>
		</tr>
		<tr>
			<td colspan=3>이번달 충전액 : 4,534,000 원&nbsp;&nbsp;</td>
		</tr>
	</table>
	<div id="chart_div"></div>
	





</div>




















