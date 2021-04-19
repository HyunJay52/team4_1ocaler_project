<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%@ include file="/inc/sideBar.jspf" %>

<script src="<%=request.getContextPath() %>/plugin/jquery.easing.1.3.js"></script>
<script src="<%=request.getContextPath() %>/plugin/jquery.bxslider.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/plugin/jquery.bxslider.css" type="text/css">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style>
	#header {
		margin-bottom: 30px;
	}
	#indexMain {
		width: 1300px; height: 1200px;
		background-color: #ddd;
		margin: 0px auto;
	}
	#homeSlider {
		margin: 0 auto;
	}
	#homeSlider>li {
		text-align: center;
	}
</style>

<script>
	document.title = "1ocler home";
	
	$(function(){
		$("#homeSlider").bxSlider({
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
	<ul id="homeSlider">
		<li><a href="#"><img src="img/indexImg/bx1.png" title="bxslider test1"/></a></li>
		<li><a href="#"><img src="img/indexImg/bx1.png"/></a></li>
		<li><a href="#"><img src="img/indexImg/bx1.png" title="bxslider test3"/></a></li>
	</ul>

</div>

</body>
</html>
