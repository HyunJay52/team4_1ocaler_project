<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/cspage.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/adminCmm.css"/>
<div id="main">
	<a>고객센터</a>
	<p>
		<select name="searchkey" class="selectcomm">
			<option value="게시물번호">게시물 번호</option>
			<option value="게시글제목">게시글 제목</option>
			<option value="게시글내용">게시글 내용</option>
			<option value="작성자별명">작성자 닉네임</option>
		</select>
		<input type="text" class="textcomm"/>
		<input type="submit" class="puplebtn"value="검색"/>
	</p>
	<p>
		<input type="button" class="searchbtn" value="자주하는 질문"/>
		<input type="button" class="searchbtn" value="1:1 질문"/>
		<input type="button" class="puplebtn" value="사용자 신고"/>
		<input type="button" class="puplebtn" value="게시글 작성"/>
	</p>
	<table class="tablea cstable">
		<colgroup>
             <col width="5%" />
             <col width="10%" />
             <col />
             <col width="10%"/>
             <col width="10%" />
             <col width="15%"/>
        </colgroup>
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
			<td>사용자신고</td>
			<td><a href="#">판매자가 벨튀해요ㅡㅅㅡ</a></td>
			<td>뫄뫄님</td>
			<td>2021-12-32</td>
			<td><input type="button" class="smallbtn" value="처리요청"/></td>
		</tr>
		<tr>
			<td>2</td>
			<td>사용자</td>
			<td>내 돈 환불해라 내돈 내놔~~!!!</td>
			<td>뫄뫄님</td>
			<td>2021-12-32</td>
			<td><input type="button" class="spuplebtn" value="처리완료"/></td>
		</tr>
		<tr>
			<td>1</td>
			<td>사용자신고</td>
			<td>판매자가 벨튀해요ㅡㅅㅡ</td>
			<td>뫄뫄님</td>
			<td>2021-12-32</td>
			<td><input type="button" class="smallbtn" value="처리요청"/></td>
		</tr>
		<tr>
			<td>2</td>
			<td>사용자</td>
			<td>내 돈 환불해라 내돈 내놔~~!!!</td>
			<td>뫄뫄님</td>
			<td>2021-12-32</td>
			<td><input type="button" class="spuplebtn" value="처리완료"/></td>
		</tr>
		<tr>
			<td>1</td>
			<td>사용자신고</td>
			<td>판매자가 벨튀해요ㅡㅅㅡ</td>
			<td>뫄뫄님</td>
			<td>2021-12-32</td>
			<td><input type="button" class="smallbtn" value="처리요청"/></td>
		</tr>
		<tr>
			<td>2</td>
			<td>사용자</td>
			<td>내 돈 환불해라 내돈 내놔~~!!!</td>
			<td>뫄뫄님</td>
			<td>2021-12-32</td>
			<td><input type="button" class="spuplebtn" value="처리완료"/></td>
		</tr>
	</table>
</div>










