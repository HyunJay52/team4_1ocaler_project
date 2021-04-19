<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%@ include file="/inc/sideBar.jspf" %>

<script src="<%=request.getContextPath() %>/plugin/jquery.easing.1.3.js"></script>
<script src="<%=request.getContextPath() %>/plugin/jquery.bxslider.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugin/jquery.bxslider.css" type="text/css">

<style>
	#header {
		margin-bottom: 30px;
	}
	#indexMain {
		width: 1300px; height: 1200px;
		margin: 0px auto;
	}
	#slider{
		margin: 0px; padding: 0px;
		width: 800px; 
		margin-top: 5px;
		background-color: pink;
		text-align: center;
		height: 300px;
	}
	#slider li{
		margin: 0px; padding: 0px;
	}
	#slider img{
		width: 100%; height: 300px;
	}
	.bx-wrapper {
		margin: 0 auto;
	}
	.divWidth {
		width: 1300px;
	}
</style>

<script>
	document.title = "1ocler home";
	
	//슬라이드 광고 js
	$(function(){
		$("#slider").bxSlider({
			mode: 'horizontal',
			slideWidth: 800,
			speed: 1000,
			auto: true,
			captions: true,
			infiniteLoop: true,
			hideControlOnEnd: true
		});
	});
</script>
<div id="indexMain">
	<!-- bx-slider part -->
	<div>
	<ul id="slider">
		<li><img src="<%=request.getContextPath()%>/img/indexImg/bx1.png" title="ad 1"/></li>
		<li><img src="<%=request.getContextPath()%>/img/indexImg/bx1.png" title="ad 2"/></li>
		<li><img src="<%=request.getContextPath()%>/img/indexImg/bx1.png" title="ad 3"/></li>
	</ul>
	</div>
	<div id="sell" class="divWidth" style="background: pink">
		판매 div 보여줄 곳	
	</div>
	
	<div id="gachi" class="divWidth">
	 	모집 내용 보여줄 곳 
	</div>
	
	<div id="sggSak" class="divWidth">
		레시피 보여줄 곳
	</div>
</div>

<%@ include file="/inc/footer.jspf" %>
</body>
</html>
