//index page & side-bar script

$(function(){
	//헤더 마우스 호버 이벤트 
	//마우스 호버 시, 하위 메뉴 팝업 .. 초기 세팅때 display-none이 안됨, 마우스 이벤트 정리하기
    $("#navi>li").hover(
         function(){ //마우스 인
            $(this).children('ul').slideDown(100);
            $(this).children('a').css("color", "#fff");
            $(this).children('ul').children('li').children('a').css("color", "#3f1785");
            $(this).css("background", "#3f1785");
            $(this).css("zIndex", "10");
         },
         function(){ //마우스 아웃
            $(this).children('ul').slideUp(200);
            $(this).css("background-color", "#fff");
            $(this).children('a').css("color", "#000");
            $(this).css("border-bottom", "1px solid #3f1785");
            $(this).css("zIndex", "10");
         }
      );
      
      
      
      
      
      
   });