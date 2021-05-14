<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/statis_board.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);
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
          title : 'Monthly Coffee Production by Country',
          vAxis: {title: 'Cups'},
          hAxis: {title: 'Month'},
          seriesType: 'bars',
          series: {4: {type: 'line'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
	  $(document).ready(function(){//페이지 실행되자마자 실행된다.
		  $("#totalCnt").append(month1Cnt+month2Cnt+month3Cnt);
		  $("#newTotal").append(month3Cnt);
		});
</script>
<div class="main">
	<!--월 이동 부분-->
	 <div class="loadDateFrm">
	 	<button class="dayBtn prev">이전</button>
	 	<button class="setMonth">2021년 ${monthArr[2]}월</button>
	 	<button class="dayBtn next">다음</button>
	 </div>
	<ul class="statis">
		<li>
			전체 게시글
			<div id="totalCnt"></div>
		</li>
		<li>
			신규 게시글
			<div id="newTotal"></div>
		</li>
	</ul>
	<div class="btitle">게시글 통계</div>
	<div id="chart_div"></div>
	<div class="searchDiv">
		<div class="searchInfo">
			<form id="searhFrm">
		     	<select name="searchKey" class="selectcomm">
					<option value="sell_item">착한발견</option>
					<option value="mem_share">동네직구</option>
					<option value="grouplocal">같이가치</option>
					<option value="board">커뮤니티</option>
				</select>
				<select name="orderBy"class="selectcomm">
					<option value="hit">조회수</option>
					<option value="repot">신고</option>
				</select>
				<input type="button" class="pupleBtn" value="검색">
		    </form>
	    </div>
	</div>
    <table class="tablea" >
		 <colgroup>
               <col width="10%" />
               <col />
               <col width="10%" />
               <col width="10%" />
               <col width="10%" />
            </colgroup>
		<tr>
			<td>순위</td>
			<td>제목</td>
			<td>조회수</td>
			<td>신고</td>
			<td>작성자</td>
		</tr>
		<tr>
			<td>1</td>
			<td>밥같이 드실분</td>
			<td>30</td>
			<td>뫄뫄뫄</td>
			<td>2021-02-12</td>
		</tr>
		<tr>
			<td>2</td>
			<td>특가 이거놓치면 후회각</td>
			<td>203</td>
			<td>뫄뫄뫄</td>
			<td>2021-12-32</td>
		</tr>
		<tr>
			<td>3</td>
			<td>감바스 존맛탱 이리와보슈</td>
			<td>13</td>
			<td>커뮤니티</td>
			<td>2021-02-23</td>
		</tr>
	</table>
</div>







































