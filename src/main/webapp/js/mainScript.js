//index page & side-bar script

//header page javascript
$(function(){
	//헤더 마우스 호버 이벤트 
	//마우스 호버 시, 하위 메뉴 팝업 .. 초기 세팅때 display-none이 안됨, 마우스 이벤트 정리하기
    $("#topNavi").hover(
         function(){ //마우스 인
            $("#topSubMenu").children('ul').slideDown(100);
            $("#topSubMenu").css({
            	"width": "100%", "height": "180px",
				"backgroundColor": "#f7f7f7", 
				"position": "absolute", "top": "102px",
             	"zIndex": "10", "display":"block"
             });
         },
         function(){ //마우스 아웃
        	$("#topSubMenu").children('ul').slideUp(100);
        	$("#topSubMenu").css("display", "none");
         }
      );
});

//sidebar javascript
$(function(){
		//검색창 팝업 이벤트
		$("#showSearch").click(function(){
			$("#searchDiv").css({'display':'block', 'margin': '0px'});
			$('html, body').css({'overflow': 'hidden', 'height': '100%'}); //스크롤 이동 막기
		});
    	$("#close").on('click', function(){
        	$("#searchDiv").css('display', 'none');
        	$('html, body').css({'overflow': 'auto', 'height': 'auto'});
    	})

});

// index page javascript
	document.title = "1ocler home";
	$(function(){
		//bxslider 넣을 부분
		
		//우리직구 게시판 클릭시 이동 이벤트
		$("#indexMain>#sell").children("#selltitle").click(function(){
			location.href="memberBoard";
		});
		$("#sell>ul li").on('click', function(){
			alert("우리직구 클릭함");
			location.href="#";
		});
		
		//가치가장 게시판 클릭시 이동 이벤트
//		$("#indexMain>#gachi").children("#gachititle").click(function(){
//			location.href="groupPage";
//		});
		
		$(".indexInnerUl").click(function(){
			alert("ul 클릭함 ");
			location.href="#";
		});
		
		//쓱싹레시피 게시판 클릭시 이동 이벤트
		$("#sggSak li").on('click', function(){
			alert("쓱싹 레시피 클릭함");
			location.href="#";
		});
		
		//사이드바 색깔 변경
		$(window).on("scroll", function(){
			var scrollTop = $(this).scrollTop();
			if(scrollTop==0){
// 				$("#sideBar li a img").attr("src", $("#sideBar li a img").attr("src").replace("000.png", "fff.png"));
			}
			if(scrollTop>0){
// 				$("#sideBar li a img").attr("src", $("#sideBar li a img").attr("src").replace("fff.png", "000.png"));
			}
		});
		
});

//footer javascript
	$(function(){
		$("#endAlign>div:last-child").prev().click(function(){
			location.href="oftenQna";
		})
		$("#endAlign>div:last-child").click(function(){
			location.href="routeUs";
		})
	});

//ajax interceptor setting 
	$(function(){
		$(document).ajaxSend(function(event, request, setting){
			request.setRequestHeader('AJAX', 'true');
		});
		
		$(document).ajaxError(function(event, jqxhr, settings, throwError){
			if(getter.status==400){
				console.log("로그인 상태가 아닙니다.");
				location.href="login";
			}
		});
		
	});