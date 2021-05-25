$(function(){
		
		//날짜 셋팅
		var date = new Date();
		var toYear = date.getFullYear();
		var toMonth = date.getMonth()+1;
		
		$(".setMonth").text(toMonth+"월");
		
		//달력 날짜 선택시 이벤트
		$(".date").on('change', function(){
			var monthArr = $(this).val().split("-");
			
			toYear = monthArr[0];
			toMonth = monthArr[1].replace(/(^0+)/, "");

			setMonth(toYear, toMonth);
		}); 
		
		//월 세팅
		function setMonth(toYear, toMonth){
			$(".setMonth").text(toMonth+"월");

			if($("#sel").val() != null){// 충전하기 페이지(load)의 셀렉트박스 체크
				console.log($("#sel").val());			
			}

			var select = $("#myDealToggle button[value='select']").text();
			if(select != null && select != '' ){
				console.log("event="+select);						
			}	
			
			console.log(toYear);
			console.log(toMonth);
		}	
		
		//이전날짜
		$(".prev").click(function(){
			toMonth--;
			if(toMonth == 2){
				toMonth = 3;
				
			}
			setMonth(toYear, toMonth);
		});

		//다음날짜
		$(".next").click(function(){
			toMonth++;
			if(toMonth == 6){
				toMonth = 5;
				
			}		
			setMonth(toYear, toMonth);
		});	
			
});