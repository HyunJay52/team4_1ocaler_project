<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.body{
		overflow:auto;
		width:1300px;
	}
	.mainContainer{
		width:1000px;
		margin:50px 185px;	
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
	#myDealInfo{
		width:702px;
		height:202px;
		border:1px solid #ddd;
	}
	#myDealTop{
		padding:50px;
	}
	#myDealBottom{position:relative;}
	#myDealTop, #myDealBottom{
		width:900px;
	}
	#infoList>ul>li{
		float:left; width:20%; height:40px;
	}

	#myDealInfo img{
		width:200px;
		height:200px;
		float:left;
	}
	#infoList{
		width:460px;
		height:150px;
		float:left;
		padding:20px;
		
	}
	ul, li{
		margin:0; padding:0;
	}
	.dealBtn{
		 width:250px; height:50px; float:right;
	}
	.dateFrm{
		position:absolute;
		top:5px;
  	  	left:62px;
  	  	background-color:#fff;
  	 	height:40px;
		width:110px;
		z-index:100;
		line-height:40px;
		text-align:center;
	}
	.date{
		height:50px; background-color:#fff; padding-left:10px; border-radius:40px; position:relative; margin:0px 50px 10px 50px; border:none;
	}
	#prev{float:left}
	#next{float:right}
	.dayBtn{font-weight:bold; font-size:26px; margin:0 2px; border:none; background-color:#fff;}
	#load{
		margin:10px 0;	
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
      position:relative;/* text-align:left; */
   }
   .myDealBtn{
		position:relative;
   }
   .myDealMem{
   		width:114px;
		position:absolute;
		top:0;
		left:116px;
		z-index:100;
		text-align:center;
		border:2px solid black;
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
		
		
		//collape in
		//버튼선택 이벤트
		$(document).on('click', '#myDealTbl tr>td>button', function(){
			$('#myDealTbl tr>td>div').attr('class', 'myDealMem collapse');
			$(this).next().attr('class', 'collape in myDealMem');

		});
		
		//드롭박스 이벤트
		$(document).on('click', '#myDealTbl tr>td>div>ul>li>button', function(){
			$(this).parent().parent().parent().attr('class', 'collapse');
			$(this).parent().parent().parent().prev().text($(this).text());
		});

		//리스트 세팅
		function setList(){
			var item = ['회원1','회원2','회원3'];
			
			
			for(var i = 0; i < 3; i++){
				var tag = "<tr>"; 
				tag += "<td>2021.04.21</td>";
				tag += "<td>상수역에서 10kg 고구마 소분하실 분?</td>";
				tag += "<td><button class='btn btn-light btn-outline-dark btn-block myDealBtn' data-toggle='collapse'>선택&nbsp;&nbsp;</button>";
				
				tag += "<div class='myDealMem collapse'><ul>";			
				for(var j = 0; j < 3; j++){
					tag += "<li><button class='btn btn-light commBtn btn-block'>"+item[j]+"</button></li>";
					
				}
				tag += "</ul></div></td>";
				tag += "<td>리뷰완료</td>";
				tag += "</tr>";
				$("#myDealTbl").append(tag);
			}
			
		}
		setList();
	});
</script>
<div class="body">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="mainContainer">
		<h3>회원간거래</h3>
		<div id="myDealTop">
			<div id="myDealInfo">
				<img src="img/myInfo/saver.gif"/>
				<div id="infoList">
					<h3>김자바</h3>
					<ul>
						<li>참여(10)</li>
						<li>모집(5)</li>
						<li>직거래(3)</li>
						<li>방문(31)</li>
						<li>내글(5)</li>
						<li>댓글(21)</li>
						<li>좋아요(21)</li>
					</ul>
				</div>
				<input type="button" class="btn dealBtn commBtn" value="Send Message"/>
				<input type="button" class="btn dealBtn commBtn" value="Info"/>
			</div>
		</div>
		<div id="myDealBottom">
			<div class="dateFrm"><button class="dayBtn" id="prev">《</button><button id="setMonth" class="dayBtn mdFnt"></button><button class="dayBtn" id="next">》</button></div>
			<input type="date" id="date" min="2021-01-01" max="2021-05-31" class="date"/>
			<table class="table2" id="myDealTbl">
				<tr>
					<td>날짜</td>
					<td>제목</td>
					<td>회원선택</td>
					<td>리뷰상태</td>
				</tr>
			
				<tr>
					<td>2021.04.20</td>
					<td>마포역 3kg 세제2+1 같이 사실 분?</td>
					<td><a href="#">회원4</a></td>
					<td>1/3완료</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>