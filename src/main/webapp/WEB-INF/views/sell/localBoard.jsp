<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--   제일진한색 : #3f1785
  중간색 : #571fb7 연보라 rgb(200 191 231)
  연한색 : #705abf -->
<!-- <input type="submit" value="" id="btn" style="background:url(img/search.png);"/>	 --> 
  
<style>
/* 	#selTop{ width:100%;height: 60px; line-height:60px; text-align:center;
			background-color:  #3f1785;color: #fff; font-size: 1.5em;	
	} */
	body, ul, li{margin:0px; padding:0px; list-style-type:none;}
	.selMain{ width:1300px; margin:0 auto; padding: 0px;
	}

	#selTop{ height: 60px; line-height:60px; text-align:center; color: #3f1785;
			border-bottom:1px solid #3f1785;border-top:1px solid #3f1785;background-color: #fff; font-size: 1.8em;
	}
	
	#selSearch{ height: 40px ; width: 310px; margin:  0 auto;
	}
	#searchForm{ margin-top: 20px; margin-bottom: 20px;
	}
	select{height: 30px ;}
	
	#btn{  width:28px; height: 28px ; padding: 2px
	}

	img{width: 200px; height: 200px;
	} 
	#pageNum{ padding-left:44%;
	} 
	#pageNum a {color:#3f1785;
	}
	#pageNum a:hover{text-decoration:none;color:#705abf ;  font-weight: bold;
	}
	#selBoard{ width:100%; height: 500px;
	}
	#selList{width:200px;height: 300px; float: left; margin: 20px; 
	
	}
</style>

<div class="selMain">
	<div id="selTop">
		 <span>착한발견 &nbsp;</span>&nbsp;|&nbsp;
		 <span>&nbsp;우리직구</span>
	</div>
	<div id="selSearch">
		<form method="post" action="" id="searchForm">
				<select style=" float:left; margin-right: 10px " >
					<option >카테고리</option>
					<option value="'">생필품</option>
					<option value="">식료품</option>
					<option value="">기타</option>
				</select>
				<input type="text"name ="search" placeholder="검색.." id="search" style=" float:left;border:1px solid black;  border-right: none;"/>
<!-- 				<img src="img/icons8.png" /> 
				<input type="submit" value="검색"/> -->
				<input type="image" id="btn" src="sel_img/icons8.png" style="display:block; float:left; border: 1px solid #000;" /> 
		</form>
	</div>
	
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

	<div>
		<ul class="pagination pagination-sm" id ="pageNum">
		 	<li class="page-item"><a href="#" class="page-link"> << </a></li>
		 	<li class="page-item"><a href="#" class="page-link">1</a></li>
		 	<li class="page-item"><a href="#" class="page-link">2</a></li>
		 	<li class="page-item "><a href="#" class="page-link">3</a></li>
		 	<li class="page-item"><a href="#" class="page-link">4</a></li>
		 	<li class="page-item"><a href="#" class="page-link">5</a></li>
		 	<li class="page-item "><a href="#" class="page-link"> >> </a></li>
		</ul>
	</div>	

</div>
</body>
</html>