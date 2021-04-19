<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/dealStyle.css"/>


	<div id="body">
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		<%@ include file="/inc/dealHeader.jspf" %> <!-- 사이드 메뉴 include -->
						
			<div id="selBoard" >
				<ul>
					<li id="selList">
						<div>
							<div>
								<img src="sel_img/div.jfif"/>
							</div>
							<a>
								<span style="float:left">D.I.Y 오르골 </span><span style="float:right">20000</span><br/>
								<span>조녜 오르골상품</span><br/>
								<span>#오르골, #DIY</span>
							</a>
						</div>
					</li>
					<li id="selList">
						<div>
							<div>
								<img src="sel_img/div.jfif"/>
							</div>
							<a>
								<span style="float:left">D.I.Y 오르골 </span><span style="float:right">20000</span><br/>
								<span>조녜 오르골상품</span><br/>
								<span>#오르골, #DIY</span>
							</a>
						</div>
					</li>
				</ul>
			</div>
			
			
			<div id ="pageNum">
				<ul class="pagination pagination-sm" >
				 	<li class="page-item"><a href="#" class="page-link"> << </a></li>
				 	<li class="page-item"><a href="#" class="page-link">1</a></li>
				 	<li class="page-item"><a href="#" class="page-link">2</a></li>
				 	<li class="page-item "><a href="#" class="page-link">3</a></li>
				 	<li class="page-item"><a href="#" class="page-link">4</a></li>
				 	<li class="page-item"><a href="#" class="page-link">5</a></li>
				 	<li class="page-item "><a href="#" class="page-link"> >> </a></li>
				</ul>
			</div>
	</div> <!-- body -->
</body>
</html>