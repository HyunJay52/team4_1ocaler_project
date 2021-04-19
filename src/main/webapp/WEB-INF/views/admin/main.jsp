<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#main{
		margin:0 auto;padding:0;width:1300px;
		font-weight:bold; 
		font-size:60px;line-hieght:300px;
		overflow:auto;/* background-color:rgb(233,233,231); */
	}
	#main>div{float:left;}
	.cir1{
		background-color:#fff;/*#3f1785 > #571fb8 > #705abf  */
		width:300px;
		height:300px; border-radius:150px; text-align:center;
		vartical-align:middel;  line-height:100px; 
		float:left;font-size:30px;margin:11px; font-weight:bold;
		color:#3f1785;
		border:1px solid #3f1785;
	}
	b{font-size:150px;}
	table{margin:0 auto; padding:0;
		font-size:30px;font-wieght:normal;
	}
	
	#more{float:right;margin:0 80px 10px 0; width:100px;}
	
	/*테이블 css  */
	.table {width:90%;margin:0 auto;padding:0}
    .table tr{/*테이블 목록*/
    	border-bottom:1px solid rgb(227,227,227); 
    	text-align:center;
    	height:40px;
    }
	.table tr:first-child{/*첫번째 테이블 목차*/
		text-align:center;
		
		background-color:#3f1785;
		color:#fff; font-weight:bold;
	}
	.table tr:last-child{/*마지막 줄 tr 스타일*/
		border-bottom:2px solid #3f1785;
	}
	.table tr>td{width:10%;}/*전체적인 열 폭조정*/
	.table tr>td:nth-child(1){/*첫번째 열 선택*/}
	.table tr>td:nth-child(3){/*세번째 열 선택 : 제목부분*/
		width:50%;/* text-align:left; */
	}
</style>
<div  id="main">
	<div style="padding:30px;">일일현황</div>
	<div>
		<div class="cir1">신규회원<br/><b>25</b></div>
		<div class="cir1">새 게시물<br/><b>10</b></div>
		<div class="cir1">방문자수<br/><b>3</b>/총</div>
		<div class="cir1">셀러신청<br/><b>1</b></div>
	</div>
	<div style="padding:30px;">문의사항</div>
	<input type="button" id="more" value="더보기"/><br/>
	<table class="table">
		<tr>
			<td>번호</td>
			<td>분류</td>
			<td>제목</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>게시글관리</td>
		</tr>
		<tr>
			<td>1</td>
			<td>1:1문의</td>
			<td>거래가 안되요</td>
			<td>사람1</td>
			<td>2021-01-01</td>
			<td><input type="button" value="처리완료"/></td>
		</tr>
		<tr>
			<td>1</td>
			<td>1:1문의</td>
			<td>거래가 안되요</td>
			<td>사람1</td>
			<td>2021-01-01</td>
			<td><input type="button" value="처리완료"/></td>
		</tr>
		<tr>
			<td>1</td>
			<td>1:1문의</td>
			<td>거래가 안되요</td>
			<td>사람1</td>
			<td>2021-01-01</td>
			<td><input type="button" value="처리완료"/></td>
		</tr>
		<tr>
			<td>1</td>
			<td>1:1문의</td>
			<td>거래가 안되요</td>
			<td>사람1</td>
			<td>2021-01-01</td>
			<td><input type="button" value="처리완료"/></td>
		</tr>
	</table>
</div>