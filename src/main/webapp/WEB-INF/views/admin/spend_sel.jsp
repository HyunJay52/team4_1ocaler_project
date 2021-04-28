<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      $(function(){
    	  $(".popup").click(function(){
    		  var num = $(this).prev().prev().text();
    		  modalOne(num);
    	  });
    	  
    	  function modalOne(num){
    		  $("#moOne").css("display","block");
    		  $("#moOne").draggable({'cancel':'.tbl', containment:'parent', scroll:false});
    	  		consol.log("선택한 번호 "+num);
    	  }
    	  $(".exit").click(function(){
    		  //부모의 부모 ->모달 div 
    		  $(this).parent().parent().css("display","none");
    	  });
      })
</script>
<div id="main">
	<div class="title">셀러정산</div>
	<div id="doublediv">
		<table class="t_spend" >
		    <colgroup>
		       	<col width=33%/>
		       	<col width=33%/>
		       	<col width=33%/>
		    </colgroup>
			<tr>
				<td colspan=3>총 누적 수익 : 10,000,000,000원</td>
			</tr>
			<tr>
				<td colspan=3>총 누적 매출 : 34,500,000원</td>
			</tr>
			<tr>
				<td>판매글수</td>
				<td>정산예정</td>
				<td>정산완료</td>
			</tr>
			<tr>
				<td>178</td>
				<td>73</td>
				<td>55</td>
			</tr>
			<tr>
				<td colspan=3>이번달 수익금 : 4,534,000 원&nbsp;&nbsp;</td>
			</tr>
		</table>
		<div id="chart_div"></div>
	</div>
	<div id="nodiv">
		<input type="button" class="pnBtn" value="◁" id="pre"/> 
		<div id="month">4월</div>
		<input type="button" class="pnBtn"  value="▷" id="next"/> 
		<input type="button" class="puplebtn alignright" value="검색"/>
		<input type="text" class="textcomm alignright" placeholder="회원명을 입력하세요"/>	
		<select name="searchkey" class="selectcomm alignright">
			<option value="게시물번호">게시물 번호</option>
			<option value="판매글제목">판매글 제목</option>
			<option value="판매자명">판매자명</option>
		</select>
	</div>
	<table class="tablea" >
		<tr>
			<td>번호</td>
			<td>판매자명</td>
			<td>판매글</td>
			<td>판매수량</td>
			<td>총금액</td>
			<td>수수료</td>
			<td>정산금액</td>
		</tr>
		<tr>
			<td>12</td>
			<td class="wordcut">user</td>
			<td class="popup">제목 블라블라~~</td>
			<td>2</td>
			<td>200000</td>
			<td>2000</td>
			<td>18000</td>
		</tr>
		<tr>
			<td>12</td>
			<td class="wordcut">user</td>
			<td>제목 블라블라~~</td>
			<td>2</td>
			<td>200000</td>
			<td>2000</td>
			<td>18000</td>
		</tr>
		<tr>
			<td>12</td>
			<td class="wordcut">user</td>
			<td>제목 블라블라~~</td>
			<td>2</td>
			<td>200000</td>
			<td>2000</td>
			<td>18000</td>
		</tr>
		<tr>
			<td>12</td>
			<td class="wordcut">user</td>
			<td>제목 블라블라~~</td>
			<td>2</td>
			<td>200000</td>
			<td>2000</td>
			<td>18000</td>
		</tr>
		<tr>
			<td>12</td>
			<td class="wordcut">user</td>
			<td>제목 블라블라~~</td>
			<td>2</td>
			<td>200000</td>
			<td>2000</td>
			<td>18000</td>
		</tr>
	</table>
	
	<div id="moOne"class="modaldiv">
		<div>판매글 제목 <b class="exit">X</b></div>
		<br/>총판매 수 (10)
		<table class="tablea" >
			<colgroup>
	        	<col width="15%" />
	            <col />
	            <col width="15%" />
	            <col width="15%" />
	            <col width="15%" />
	        </colgroup>
			<tr>
				<td>번호</td>
				<td>구매자</td>
				<td>구매수량</td>
				<td>구매금액</td>
				<td>구매확정일</td>
			</tr>
			<tr>
				<td>101</td>
				<td>user1234</td>
				<td>2</td>
				<td>30,000</td>
				<td>2021.04.02</td>
			</tr>
			<tr>
				<td>101</td>
				<td>user1234</td>
				<td>2</td>
				<td>30,000</td>
				<td>2021.04.02</td>
			</tr>
			<tr>
				<td>101</td>
				<td>user1234</td>
				<td>2</td>
				<td>30,000</td>
				<td>2021.04.02</td>
			</tr>
			<tr>
				<td>101</td>
				<td>user1234</td>
				<td>2</td>
				<td>30,000</td>
				<td>2021.04.02</td>
			</tr>
			<tr>
				<td>101</td>
				<td>user1234</td>
				<td>2</td>
				<td>30,000</td>
				<td>2021.04.02</td>
			</tr>
		</table>
	</div><!-- /모달div -->
	
</div><!--#main div-->




















