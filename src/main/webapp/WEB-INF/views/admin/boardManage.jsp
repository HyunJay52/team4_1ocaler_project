<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/boardManage.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<div id="main">
	<ul class="statis">
		<li>
			우리직구
			<div>1127</div>
		</li>
		<li>
			가치가장
			<div>1995</div>
		</li>
		<li>
			커뮤니티
			<div>1219</div>
		</li>
	</ul>
	<div id="btndiv">
		<input type="button" class="searchbtn" value="가치가장"/>
		<input type="button" class="searchbtn" value="커뮤니티"/>
		<input type="button" class="searchbtn" value="공지작성"/>
	</div>
	
	<table class="tablea">
		<colgroup>
             <col width="5%" />
             <col width="10%" />
             <col width="5%" />
             <col />
             <col width="10%" />
             <col width="5%" />
             <col width="20%" />
             <col width="10%" />
          </colgroup>
		<tr>
			<td>번호</td>
			<td>게시판</td>
			<td>분류</td>
			<td>제목</td>
			<td>참여인원</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>신고횟수</td>
			<td>게시글관리</td>
		</tr>
		<tr>
			<td>1</td>
			<td>우리직구</td>
			<td>회원간</td>
			<td><a href="#">트레이더스 가실분 구해요</a></td>
			<td>1/3</td>
			<td>김자바</td>
			<td>2021-01-01</td>
			<td>0</td>
			<td><input type="button" class="smallbtn" id="del" value="글삭제"/>
				<input type="button" class="smallbtn" value="댓글보기"/>
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td>커뮤니티</td>
			<td>레시피</td>
			<td><a href="#">토달볶 존맛탱</a></td>
			<td>0</td>
			<td>김자바</td>
			<td>2021-01-01</td>
			<td>1</td>
			<td><input type="button" class="smallbtn" id="del" value="글삭제"/>
				<input type="button" class="smallbtn" value="댓글보기"/>
			</td>
		</tr>
	</table>

</div>

	
	
	
	
	
	