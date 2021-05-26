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
			<img src="<%=request.getContextPath() %>/img/aboutImg/nei.jpg" style="width: 800px; height: 600px; margin-top: 100px;">
		</div>
		<div class="exHow">
			<span>HOW?</span> 
				<p style="padding-left:15px;font-size: 18px ;padding-top:20px ; line-height: 2;">
					회원이 선택한 지역을 기반으로<br/> 사이트를 사용 할 수 있습니다. <br/> 
					활동하시는 지역 안에서 <br/>자신의 소비패턴을 개선 할 수 있고,<br/> 
					같은 지역에서 활동하시는 새로운 이웃을 발견하고<br/>
					소통 할 수 있는 장소를 제공합니다.
				</p>
		</div>
	</div>
	
	<ul id="introTbl">
		<li>TEAM "PURBLIC"</li>
		<li>
			<ul class="introInnerul">
				<li><img src="<%=request.getContextPath() %>/img/aboutImg/wow.png"/></li>			
				<li class="aboutpageName" style="margin:10px auto; width: 70px; font-family: nsreb; font-size: 22px;">김용우</li>
				<li class="whatpage">
					<br/>
					착한발견<br/>
					같이가장<br/>
					한끼미식회<br/>
					어디페이지?<br/>
				</li>
			
			</ul>
		</li>	
	
		<li>
			<ul class="introInnerul">
				<li><img src="<%=request.getContextPath() %>/img/aboutImg/hj.png"/></li>			
				<li class="aboutpageName" style="margin:10px auto; width: 70px; font-family: nsreb; font-size: 22px;">김현정</li>
				<li class="whatpage">
					<br/>
					착한발견<br/>
					같이가장<br/>
					한끼미식회<br/>
					어디페이지?<br/>
				</li>
			
			</ul>
		</li>	
	
	
		<li>
			<ul class="introInnerul">
				<li><img src="<%=request.getContextPath() %>/img/aboutImg/sub.png"/></li>			
				<li class="aboutpageName" style="margin:10px auto; width: 70px; font-family: nsreb; font-size: 22px;">이용섭</li>
				<li class="whatpage">
					<br/>
					착한발견<br/>
					같이가장<br/>
					한끼미식회<br/>
					어디페이지?<br/>
				</li>
			</ul>
		</li>	
	
	
		<li>
			<ul class="introInnerul">
				<li><img src="<%=request.getContextPath() %>/img/aboutImg/jisu.png"/></li>			
				<li class="aboutpageName" style="margin:10px auto; width: 70px; font-family: nsreb; font-size: 22px;">이지수</li>
				<li class="whatpage">
					<br/>
					착한발견<br/>
					같이가장<br/>
					한끼미식회<br/>
					어디페이지?<br/>
				</li>
			</ul>
		</li>	
	
		<li>
			<ul class="introInnerul">
				<li><img src="<%=request.getContextPath() %>/img/aboutImg/heey.png"/></li>			
				<li class="aboutpageName" style="margin:10px auto; width: 70px; font-family: nsreb; font-size: 22px;">신희연</li>
				<li class="whatpage">
					<br/>
					착한발견<br/>
					같이가장<br/>
					한끼미식회<br/>
					어디페이지?<br/>
				</li>
			</ul>
		</li>	
	</ul>

</div>


