<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
ul, li {
	margin: 0px;
	padding: 0px;
	list-style-type: none;
}

#boardText>li>div>div>img {
	width: 100%;
	height: 218px;
}

#selBoard {
	width: 1300px;
	height: 780px;
}

.selList {
	width: 220px;
	height: 340px;
	float: left;
	margin: 20px;
	border: 1px solid gray;
}

#boardText {
	float: left;
}

.selList>div>ul li {
	margin: 2px;
}

.selList>div>ul li:nth-child(1) {
	width: 100%;
	text-align: center;
	font-size: 18px;
	font-weight: bold;
}

.selList>div>ul li:nth-child(2) {
	width: 40%;
	float: left;
	line-height: 24px;
}

.selList>div>ul li:nth-child(3) {
	float: left;
	width: 50%;
	text-align: right;
	line-height: 24px;
	font-size: 18px;
	font-weight: bold;
	color: #3f1785;
}

.selList>div>ul li:nth-child(4) {
	width: 100%;
	font-size: 13px;
	color: gray;
	text-align: center;
}

.selList>div>ul li:nth-child(5) {
	width: 100%;
	float: left;
	text-align: right;
}

.selList>div>ul>li:nth-child(5) img {
	width: 30px;
	height: 30px;
	text-align: right;
}

.selList:hover {
	border: 3px solid #3f1785;
}

.cntJoin {
	font-size: 22px;
	font-weight: bold;
	color: #3f1785;
}
</style>

<div id="selBoard">
	<ul id="boardText">
		<c:forEach var="i" begin="1" end="4">
		<li class="selList">
			<div OnClick="location.href='sellView'">
				<div>
					<img src="img/deal/div.jfif" />
				</div>
				<ul>
					<li class="wordcut">D.I.Y 오르골 엔틱소품</li>
					<li><span class="cntJoin">&nbsp;&nbsp;5</span> /160개</li>
					<li>20,000원</li>
					<li class="wordcut">#오르골 #DIY #엔틱소품 #소품</li>
					<li>goguma1234 &nbsp; <img src="common/user.png">&nbsp;&nbsp;
					</li>
				</ul>
			</div>
		</li>
		</c:forEach>
	</ul>
</div>
