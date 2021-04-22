<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.body{
		overflow:auto;
		width:1300px;
	}
	.lgFnt {
		font-size: 32px;	
	}
	.mdFnt {
		font-size: 22px;
	}
	.smlFnt {
		font-size: 13px;
	}
	.mainContainer{
		width:1000px;
		margin:50px 185px;
		
	}
	#top{
		width:970px;
		overflow:auto;
		padding:0 40px;
	}
	#loadArea{
		width:500px;
		height:300px;
		float:left;
	}
	#loadArea>form>ul>li{
		float:left;
		width:25%;
		margin:20px 0;
	}
	#loadArea>form>input:nth-child(1){
		width:100%;
		height:50px;
		padding-left:10px;
	}
	#myPoint{
		border:3px solid #3f1785;
		color:#3f1785;
		width:300px;
		float:right;
		padding:50px 30px;
		font-weight:bold;
		border-radius:5em;
	}
	.selectBox{
		width:140px; height:38px; margin-bottom:10px; position:relative;
	}
	.textBox{
		width:300px; height:30px; margin-bottom:10px; padding-left:5px;
	}
	#loadList{
		width:1000px; position:relative; padding:20px 0;
		
	}
	.table2 {width:90%;margin:0 auto;padding:0}
    .table2 tr{/*테이블 목록*/
       border-bottom:1px solid rgb(227,227,227); 
       text-align:center;
       height:40px;
    }
   .table2 tr:first-child{/*첫번째 테이블 목차*/
      text-align:center;
      
      background-color:#3f1785;
      color:#fff; font-weight:bold;
   }
   .table2 tr:last-child{/*마지막 줄 tr 스타일*/
      border-bottom:2px solid #3f1785;
   }
   .table2 tr>td{}/*전체적인 열 폭조정*/
   .table2 tr>td:nth-child(1){/*첫번째 열 선택*/}
   .table2 tr>td:nth-child(3){/*세번째 열 선택 : 제목부분*/
      /* text-align:left; */
   }
	.dateFrm{
		position:absolute;
		top:55px;
  	  	left:64px;
  	  	background-color:#fff;
  	 	height:40px;
		width:110px;
		z-index:100;
		line-height:40px;
		text-align:center;
	}
	.date{
		height:50px; background-color:#fff; padding-left:10px; border-radius:40px; position:relative; margin:0px 50px 10px 50px;
	}
	.line{
	  	position:absolute; background-color:#3f1785; width:100%; height:4px; top:70px; border-radius:100px;
	}
	#sel{
		width:100px; height:30px; float:right; margin:0 50px 0px 790px
	}
	#prev{float:left}
	#next{float:right}
	.dayBtn{font-weight:bold; font-size:26px; margin:0 2px; border:none; background-color:#fff;}
	#load{
		margin:10px 0;	
	}
</style>
<script>
	$(function(){
		var date = new Date();
		
		var toYear = date.getFullYear();
		var toMonth = date.getMonth()+1;
		
		$("#setMonth").text(toMonth+"월");
		
		//달력 날짜 선택시 이벤트
		$("#date").on('change', function(){
			var monthArr = $(this).val().split("-");
			
			toYear = monthArr[0];
			toMonth = monthArr[1].replace(/(^0+)/, "");

			setMonth(toYear, toMonth);
		});
		
		//월 세팅
		function setMonth(toYear, toMonth){
			$("#setMonth").text(toMonth+"월");
			
			console.log(toYear);
			console.log(toMonth);
			console.log($("#sel").val());

		}
		
		//이전날짜
		$("#prev").click(function(){
			toMonth--;
			if(toMonth == 0){
				toMonth = 12;
				toYear--;
			}
			setMonth(toYear, toMonth);
		});
		
		//다음날짜
		$("#next").click(function(){
			toMonth++;
			if(toMonth == 13){
				toMonth = 1;
				toYear++;
			}
			setMonth(toYear, toMonth);
		});
		
		var nowMoney = 100000;
		setMoney(nowMoney); //현제 포인트 세팅
		//충전금액 버튼 선택시
		var firstMoney = nowMoney;
		setMoney(0);
		$("#load").val(0);
		$("#loadArea>form>ul>li input").click(function(){
			var charge = parseInt($(this).attr("title"));
			var nowCharge = parseInt($("#load").val());
			nowCharge += charge;
			$("#load").val(nowCharge);
			setMoney(nowCharge);
		});
		
		//충전후 잔액 세팅
		var myMoney = 0;
		function setMoney(money){
			var chargeMoney = money += firstMoney;
			myMoney = chargeMoney;
			$("#loadMoney").text(money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
		}
		
		//입력 이벤트 세팅
		$("#load").on("keyup", function(){
			var charge = parseInt($("#load").val());
			setMoney(charge);
		});
		
		$("#loadFrom").on("submit", function(){
			$("#myPoint").children().next().text(myMoney.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
		});
		
	});
</script>
<div class="body">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="mainContainer">
	<h2>충전하기</h2>
	<div id="top">
		<div id="loadArea">
			<form method="post" action="load" id="loadFrom">
				<input type="text" id="load" name="load" class="lgFnt"/>
				<span class="mdFnt">충전 후 잔액 :</span><span class="mdFnt" id="loadMoney"></span>
				<ul>
					<li><input type="button" class="btn commBtn mdFnt btn-block" title="10000" value="1 만원"/></li>
					<li><input type="button" class="btn commBtn mdFnt btn-block" title="50000" value="5 만원"/></li>
					<li><input type="button" class="btn commBtn mdFnt btn-block" title="100000" value="10 만원"/></li>
					<li><input type="button" class="btn commBtn mdFnt btn-block" title="200000" value="20 만원"/></li>
				</ul>
				<br/>
				<select class="selectBox" name="결제수단">
					<option value="결제수단 선택">결제수단 선택</option>
					<option value="무통장입금">무통장입금</option>
					<option value="카드결제">카드결제</option>
				</select>
				<input type="submit" class="btn commBtn" value="충전하기"/>
			</form>
		</div>
		<div id="myPoint">
			<h2>잔액</h2>
			<h2 style="float:right">100,000원</h2>
		</div>
	</div>	
		<div id="loadList">
				<select class="selectBox " name="sel" id="sel">
					<option value="전체">전체</option>
					<option value="충전내역">충전내역</option>
					<option value="사용내역">사용내역</option>
				</select>
				<div class="line"></div>
				<div class="dateFrm"><button class="dayBtn" id="prev">《</button><button id="setMonth" class="dayBtn mdFnt"></button><button class="dayBtn" id="next">》</button></div>
				<input type="date" id="date" min="2021-01-01" max="2021-05-31" class="date"/>
				
			<table class="table2">
				<tr>
					<td>구분</td>
					<td>날짜</td>
					<td>수단</td>
					<td>금액</td>
				</tr>
				<tr>
					<td><label class="btn">충전</label></td>
					<td>2021.04.02</td>
					<td>카드결제</td>
					<td>100,000원</td>
				</tr>
				<tr>
					<td><label class="btn">사용</label></td>
					<td>2021.04.01</td>
					<td>포인트결제</td>
					<td>100,000원</td>
				</tr>
				<tr>
					<td><label class="btn">충전</label></td>
					<td>2021.04.02</td>
					<td>카드결제</td>
					<td>100,000원</td>
				</tr>
				<tr>
					<td><label class="btn">사용</label></td>
					<td>2021.04.01</td>
					<td>포인트결제</td>
					<td>100,000원</td>
				</tr>
				<tr>
					<td><label class="btn">충전</label></td>
					<td>2021.04.02</td>
					<td>카드결제</td>
					<td>100,000원</td>
				</tr>
				<tr>
					<td><label class="btn">사용</label></td>
					<td>2021.04.01</td>
					<td>포인트결제</td>
					<td>100,000원</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>