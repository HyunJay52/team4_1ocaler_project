//index page & side-bar script

//header page javascript
$(function(){
	//헤더 마우스 호버 이벤트 
	//마우스 호버 시, 하위 메뉴 팝업 .. 초기 세팅때 display-none이 안됨, 마우스 이벤트 정리하기
    $("#navi>li").hover(
         function(){ //마우스 인
            $(this).children('ul').slideDown(100);
            $(this).children('a').css("color", "#fff");
            $(this).css("border-bottom", "2px solid #3f1785");
          	//$(this).children('ul').children('li').children('a').css("color", "#3f1785");
            $(this).css("background", "#3f1785");
            $(this).css("zIndex", "10");
         },
         function(){ //마우스 아웃
            $(this).children('ul').slideUp(200);
            $(this).css("background-color", "#fff");
            $(this).children('a').css("color", "#000");
           	//$(this).css("border-bottom", "2px solid #3f1785");
            $(this).css("zIndex", "10");
         }
      );
      
      
      
      
      
      
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
		$("#indexMain>#gachi").children("#gachititle").click(function(){
			location.href="groupPage";
		});
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