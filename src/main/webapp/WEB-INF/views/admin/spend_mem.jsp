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
    	  //======modal1======
    	  //사용금액 클릭시 모달1 창 띄우기
    	  $(".spend").click(function(){
    		 var num=$(this).prev().prev().prev().text();
    		 modalOne(num);//모달창 띄우는
    	  });
    	  function modalOne(num){//모달 1 창 띄우는 함수 
    		  $("#moOne").css("display", "block");
    		  $("#moOne").draggable({'cancel':'.tbl', containment:'parent', scroll:false});
    	  }
    	  
    	  
    	  //======modal2======
    	  //회원거래 클릭시 모달2 창 띄우기
    	  $(".add").click(function(){
    		 var num=$(this).prev().prev().prev().text();
    		 modalTwo(num);//모달창 띄우는
    	  });
    	  
    	  function modalTwo(num){//모달 2 창 띄우는 함수 
    		  $("#moTwo").css("display", "block");
    		  $("#moTwo").draggable({'cancel':'.tbl', containment:'parent', scroll:false});
    	  }
    	  
    	  $(".exit").click(function(){
    		  //부모의 부모 ->모달 div 
    		  $(this).parent().parent().css("display","none");
    	  });
      
      });
</script>
<div class="main">
	<!--월 이동 부분-->
	 <div class="loadDateFrm">
	 	<button class="dayBtn prev">이전</button>
	 	<button class="setMonth">2021년 ${monthArr[2]}월</button>
	 	<button class="dayBtn next">다음</button>
	 </div>
<div class="title">회원 정산</div>
<div id="doublediv">
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
	<div id="nodiv">
		<input type="button" class="pnBtn" value="◁" id="pre"/> 
		<div id="month">4월</div>
		<input type="button" class="pnBtn"  value="▷" id="next"/> 
		<input type="button" class="puplebtn alignright" value="검색"/>
		<input type="text" class="textcomm alignright" placeholder="회원명을 입력하세요"/>
	</div>
	<table class="tablea" >
		<tr>
			<td>번호</td>
			<td>회원명</td>
			<td>충전액</td>
			<td>사용금액</td>
			<td>회원거래</td>
			<td>잔여금액</td>
		</tr>
		<tr>
			<td>12</td>
			<td>user</td>
			<td>10000</td>
			<td class="spend" >사용금액부분</td>
			<td class="add">받을 포인트 창띄워주기</td>
			<td>20000</td>
		</tr>
		<tr>
			<td>13</td>
			<td>user1</td>
			<td>0</td>
			<td>20000</td>
			<td></td>
			<td>40000</td>
		</tr>
		<tr>
			<td>14</td>
			<td>user2</td>
			<td>0</td>
			<td>20000</td>
			<td></td>
			<td>40000</td>
		</tr>
		<tr>
			<td>15</td>
			<td>user3</td>
			<td>0</td>
			<td>20000</td>
			<td></td>
			<td>40000</td>
		</tr>
		<tr>
			<td>16</td>
			<td>user4</td>
			<td>0</td>
			<td>20000</td>
			<td></td>
			<td>40000</td>
		</tr>
	</table>
	
	<div id="moOne"class="modaldiv">
		<div>사용금액 참여 <b class="exit">X</b></div>
		<br/>게시글 수 (10)
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
			<td class="wordcut">글제목</td>
			<td>회원명</td>
			<td>사용금액</td>
			<td>거래일</td>
		</tr>
		<tr>
			<td>101</td>
			<td class="wordcut">등촌역...</td>
			<td>user1234</td>
			<td>30,000</td>
			<td>2021.04.02</td>
		</tr>
		<tr>
			<td>101</td>
			<td class="wordcut">등촌역...</td>
			<td>user1234</td>
			<td>30,000</td>
			<td>2021.04.02</td>
		</tr>
		<tr>
			<td>101</td>
			<td class="wordcut">등촌역...</td>
			<td>user1234</td>
			<td>30,000</td>
			<td>2021.04.02</td>
		</tr>
		<tr>
			<td>101</td>
			<td class="wordcut">등촌역...</td>
			<td>user1234</td>
			<td>30,000</td>
			<td>2021.04.02</td>
		</tr>
		<tr>
			<td>101</td>
			<td class="wordcut">등촌역...</td>
			<td>user1234</td>
			<td>30,000</td>
			<td>2021.04.02</td>
		</tr>
		</table>
	
	</div>
	<div id="moTwo" class="modaldiv">
		<div>받을 포인트 <b class="exit" >X</b></div>
		<br/>참여자수 (10)
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
				<td class="wordcut">글제목</td>
				<td>회원명</td>
				<td>사용금액</td>
				<td>거래일</td>
			</tr>
			<tr>
				<td>101</td>
				<td class="wordcut">등촌역...</td>
				<td>user1234</td>
				<td>30,000</td>
				<td>2021.04.02</td>
			</tr>
			<tr>
				<td>101</td>
				<td class="wordcut">등촌역...</td>
				<td>user1234</td>
				<td>30,000</td>
				<td>2021.04.02</td>
			</tr>
			<tr>
				<td>101</td>
				<td class="wordcut">등촌역...</td>
				<td>user1234</td>
				<td>30,000</td>
				<td>2021.04.02</td>
			</tr>
			<tr>
				<td>101</td>
				<td class="wordcut">등촌역...</td>
				<td>user1234</td>
				<td>30,000</td>
				<td>2021.04.02</td>
			</tr>
			<tr>
				<td>101</td>
				<td class="wordcut">등촌역...</td>
				<td>user1234</td>
				<td>30,000</td>
				<td>2021.04.02</td>
			</tr>
		</table>
	
	</div>
	





</div>




















