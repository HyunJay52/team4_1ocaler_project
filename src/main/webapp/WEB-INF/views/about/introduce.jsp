<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>  


<style>
	#introDiv {
		width: 1300px; height: 80%;
		margin: 0 auto;
		background: pink;
	}
	#introDiv>#introDetail {
		width: 700px; height: 150px;
		padding-top: 50px;
		margin: 0 auto;
	}
	#introDiv>table tr td {
		text-align: center;
	}
	
	#introDiv>table tr td>img {
		text-align: center;
		width: 200px;
		padding: 20px;
	}
</style>


<div id="introDiv">
	<div id="introDetail">
		<div>1ocaler 구상계기</div>
		<div>
			1인 가구 증가함에 따라 소비패턴의 변화로 소포장 상품 판매의 필요성 증가<br/>
			1인 가구간의 소통과 변화된 소비패턴에 맞는 시장 구축을 위한 1인 가구 공유 플랫폼 구상
		</div>
	</div>

	<table style="width:1000px; margin: 0 auto;">
		<tbody>
			<tr>
				<td colspan="5"><span style="font-size:20px;"><strong>개발자 소개</strong></span></td>
			</tr>
			<tr>
				<td><img src="common/user.png"/></td>
				<td><img src="common/user.png"/></td>
				<td><img src="common/user.png"/></td>
				<td><img src="common/user.png"/></td>
				<td><img src="common/user.png"/></td>
			</tr>
			<tr>
				<td>
				<p>이름 : 김용우</p>
	
				<p>담당 : 모집</p>
				</td>
				<td>
				<p>이름 : 김현정</p>
	
				<p>담당 : 메인, 사이드, about, 고객정보</p>
				</td>
				<td>
				<p>이름 : 이용섭</p>
	
				<p>담당 : 내정보</p>
				</td>
				<td>
				<p>이름 : 이지수</p>
	
				<p>담당 : 관리자</p>
				</td>
				<td>
				<p>이름 : 신희연</p>
	
				<p>담당 : 판매, 게시판</p>
				</td>
			</tr>
			<tr>
				<td colspan="5">&nbsp;</td>
			</tr>
		</tbody>
	</table>

</div>


