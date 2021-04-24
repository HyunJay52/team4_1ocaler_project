<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/selManage.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<div id="main">
<div class="title">판매관리</div>
	<ul class="statis">
		<li>
			총게시글
			<div>100</div>
		</li>
		<li>
			거래진행
			<div>94</div>
		</li>
		<li>
			거래종료
			<div>6</div>
		</li>
	</ul>
	<form>
		<select name="serchkey" class="selectcomm">
				<option value="게시글번호">게시글 번호</option>
				<option value="게시글제목">게시글 제목</option>
				<option value="게시글내용">게시글 내용</option>
				<option value="작성자닉네임">작성자 닉네임</option>
		</select>
		<input type="text" class="textcomm" name="serchword" />
		<input type="submit" class="searchbtn" value="검색"/>
	</form>
	<div id="btndiv">
		<input type="button" class="searchbtn" value="회원간 거래관리"/>
		<input type="button" class="searchbtn" value="셀러 판매관리"/>
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
		
	</table>
</div>












