<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);
	  var averege = (${month2VO.o_price}+${month1VO.o_price}+${OkVO.o_price})/3;
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Element', '매출'],
          ['${monthArr[0]}월 매출', ${month2VO.o_price}],
          ['${monthArr[1]}월 매출', ${month1VO.o_price}],
          ['${monthArr[2]}월 매출', ${OkVO.o_price}],
          ['평균 매출', averege],
        ]);

        var options = {
          bars: 'horizontal' // Required for Material Bar Charts.
        	
        };

        var chart = new google.charts.Bar(document.getElementById('barchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
 	var totalsale= ${notOkVO.o_price }+${OkVO.o_price };
	$(function(){
		
	});
	$(document).ready(function(){
		$("#totalSale").text(totalsale+"원");
		$("#fee").text("총 수수료 : "+${OkVO.i_img1}+"원");
		$("#fusale").text("총 순매출 : "+(totalsale-${OkVO.i_img1})+"원");
	});
</script>
<%@ include file="/inc/sideBar.jspf" %>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->	
	<div class="myinfoContainer">
		<div class="myinfoStatisticsTop">
			<div class="myinfoStatisticsHeader">
				<h3>판매관리 - 통계</h3>
			</div>
			<div class="myinfoStatisticsLeft">
				<table class="myinfoStatisticsTable2 info-font-weight mdFnt">
					<tr>
						<td style="height:70px;">${monthArr[2]}월 총매출 현황</td>
					</tr>
					<tr>	
						<td id="totalSale"></td>				
					</tr>
				</table>
				<table class="myinfoStatisticsTable2">
					<tr>
						<td>주문미확정</td>
						<td>주문확정</td>
					</tr>
					<tr>
						<td>${notOkVO.o_num}건</td>
						<td>${OkVO.o_num}건</td>
					</tr>
					<tr>
						<td>${notOkVO.o_price }원</td>
						<td>${OkVO.o_price}원</td>
					</tr>
				</table>
				<label class="myinfoStatisticsLabel mdFnt info-font-weight">${monthArr[2]}월 정산예정금액 : ${OkVO.o_price}원</label>
			</div>
			<div class="myinfoStatisticsRight">
				<div id="barchart_material" style="width: 600px; height: 320px;"></div>
			</div>
		</div>
<script>
	$(function(){
		var month =  parseInt(${monthArr[2]});
		$(".prev").click(function(){
			if(month==1){
				month=12;
			}else{
				month-=1;
			}
			location.href="myInfoStatistics?month="+month;
		});
		$(".next").click(function(){
			if(month==12){
				month=1;
			}else{
				month+=1;
			}
			location.href="myInfoStatistics?month="+month;
		});
	});
</script>
		<div class="myinfoStatisticsBottom">
			<div class="myinfoStatisticsBottomHeader">
				<div class="dealDateForm">
					<input type="date" min="2021-01-01" max="2021-05-31" class="date"/>
					<div class="myDealFrm"><input type="button" class="dayBtn prev"value="《"/>${monthArr[2]}월<input type="button" class="dayBtn next"value="》"/></div>
				</div>
				<div class="myinfoStatisticsLabel mdFnt info-font-weight">
					<label id="fee"></label>
					<label id="fusale"></label>
				</div>
			</div>
			<table class="myinfoStatisticsTable2">
				<tr>
					<td>주문일</td>
					<td>주문번호</td>
					<td>아이디</td>
					<td>판매글제목</td>
					<td>주문수량</td>
					<td>결제금액</td>
					<td>배송비</td>
					<td>주문확정상태</td>
					<td>결제합계</td>
					<td>수수료</td>
					<td>순매출</td>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.o_date }</td>
						<td>${vo.o_num}</td>
						<td>${vo.userid}</td>
						<td><a href="sellView?i_num=${vo.i_num}">${vo.i_subject}</a></td>
						<td>${vo.o_cnt}</td>
						<td>${vo.o_price}</td>
						<td>${vo.o_ship}</td>
						<c:if test="${vo.o_conf==1 }">
							<td>미확정</td>
						</c:if>
						<c:if test="${vo.o_conf==2 }">
							<td>확정</td>
						</c:if>
						<c:if test="${vo.o_conf==3 }">
							<td>취소/환불</td>
						</c:if>
						<td>${vo.hap_money}</td>
						<td>${vo.i_img1}</td>
						<td>${vo.fu_money }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
	</div>
</div>