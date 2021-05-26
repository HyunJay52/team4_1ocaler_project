<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<script>
	document.title = "about us";
</script>

<%@ include file="/inc/sideBar.jspf" %>
<div class="aboutDiv">
	<div id="introDetail">
		<div>1ocal+er 의 시작 </div>
		<div><img src="<%=request.getContextPath() %>/img/aboutImg/window1.jpg"/></div>
		<div id="abtIntro">
				<span>1ocal+er 란 ?</span>  
				<p style="padding-left:15px;font-size: 20px ;padding-top:20px ">
					1인 가구의 '1' , 지역의 'local' , 사람들을 나타내는 'er'을 합성하여 나온 합성어로<br/> 
					지역을 기반으로 하여 1인 가구 특성에 맞는 소비를 지원하는 프로젝트이다.  <br/>
					<br/>
					1인 가구는 지난 10년 동안 연평균 6.4%라는 높은 증가세를 기록하고 있으며, 그에 따른 1인 가구의 소비 시장도 매우 커지고 있다.<br/>
					소포장, 소량판매의 필요성과 시장이 증가함에 비해 실질적인 플랫폼과 상품들은 활성화되어있지 않고, 소비가 힘든 대량판매만 늘어나는 추세이다.<br/>		
					<br/>				
					이번 프로젝트에서는 소비시장에서 제외되고 있는 1인 가구의 소량 구매, 소량구매시 더 상승되는 소비의 비용감소를 목적으로 하였으며 <br/> 
					더 나아가서는 버려지게 되어 생기는 쓰레기의 감소 효과도 기대할 수 있다. <br/>
					 <br/>
					사용자들이 안전하고, 알뜰하게 소비 할 수 있도록 하고 이웃과 도움을 나누며 함께 할 수 있는 새로운 플랫폼을 구현하고자 한다.
				</p>
				 
				
		</div>
		
		<div class="abtVideo">
			<video src="<%=request.getContextPath() %>/img/aboutImg/dining.mp4" width="800px" height="600px" class="abtVideo" preload="none" autoplay muted loop></video>
		</div>
		<div class="exHow">
			<span>HOW?</span> 
				<p style="padding-left:15px;font-size: 22px ;padding-top:20px ; line-height: 2;">
					지역을 기반으로 하며 거래, 구매, 게시판 등 <br/> 
					지역구 안에서 1인 가구의 소비와 <br/> 
					이웃 간의 소통 공간을 제공한다.   
				</p>
		</div>
	</div>
	
	<ul id="introTbl">
		<li>TEAM "PURBLIC"</li>
		<li>
			<ul class="introInnerul">
				<li><img src="<%=request.getContextPath() %>/img/aboutImg/wow.png"/></li>			
				<li>김용우</li>
			
			
			</ul>
		</li>	
	
		<li>
			<ul class="introInnerul">
				<li><img src="<%=request.getContextPath() %>/img/aboutImg/hj.png"/></li>			
				<li>김현정</li>
			
			
			</ul>
		</li>	
	
	
		<li>
			<ul class="introInnerul">
				<li><img src="<%=request.getContextPath() %>/img/aboutImg/sub.png"/></li>			
				<li>이용섭</li>
			
			
			</ul>
		</li>	
	
	
		<li>
			<ul class="introInnerul">
				<li><img src="<%=request.getContextPath() %>/img/aboutImg/jisu.png"/></li>			
				<li>이지수</li>
			
			
			</ul>
		</li>	
	
	
		<li>
			<ul class="introInnerul">
				<li><img src="<%=request.getContextPath() %>/img/aboutImg/heey.png"/></li>			
				<li>신희연</li>
			
			
			</ul>
		</li>	
	
	
	</ul>

</div>


