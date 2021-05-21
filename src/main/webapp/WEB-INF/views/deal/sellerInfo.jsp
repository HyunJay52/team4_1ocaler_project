<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/sellerInfo.css"/>
<script>
	$(function(){
		function numberWithCommas(x) {
			
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
	});
	
</script>
	<div id="infoMain">
		<div id="infoSeller">
			<ul>
				<li>
					<div>
						<img src="<%=request.getContextPath()%>/img/mem_prof/${sellerVO.sel_prof}">
					</div>
					<div>
						<h4>${sellerVO.userid}</h4>
						&nbsp;게&nbsp;시&nbsp;글&nbsp;: ${sellerVO.sel_count} 개 <br/>
						등급 : ${sellerVO.sel_lvl}
					</div>
				</li>
				<li>
					<h4>판매자 정보</h4>
					<div>
						상호명 : ${sellerVO.company} <br/>
						연락처 : ${sellerVO.sel_telStr} <br/>
						대표자 : ${sellerVO.sel_name}  <br/>
						사업자번호 : ${sellerVO.com_numStr}<br/>
						사업장 소재지 : ${sellerVO.sel_addr}
					</div>
				</li>
			</ul>
		</div>		
	
		<hr/>
	
		<div id="infoBoard" >
			<ul id="boardText">
				<c:forEach var="vo" items="${list}">
					<li id="selList">
						<div  OnClick="location.href ='sellView'">
							<div id="sellImgDiv">
								<img src="<%=request.getContextPath()%>/img/sellItemInsertPicture/${vo.i_img1}"/>
							</div>
							<ul>	
								<li class="wordcut">${vo.i_subject }</li>
								
								<li>
									<span class="cntJoin">${vo.i_cnt}</span>개
									
								</li>
								<li>${vo.i_priceStr}원</li>
								<li class="wordcut">${vo.i_tag}</li>
								<li>
									${sellerVO.userid} &nbsp;
									<img src="<%=request.getContextPath()%>/img/mem_prof/${sellerVO.sel_prof}">&nbsp;&nbsp;
								</li>
							</ul>
						</div>
					</li>
				</c:forEach>	
			</ul>
		</div>
		
		
	</div>	
</body>
</html>