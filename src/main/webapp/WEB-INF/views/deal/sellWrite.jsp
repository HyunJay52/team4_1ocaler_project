<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/dealWriteStyle.css"/>


	<div id="body">
		<div>
			<form action="">
				<div class="dropdown">
				    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
				      카테고리
				    </button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" >생필품</a>
			      <a class="dropdown-item" >식료품</a>
			      <a class="dropdown-item" >기타</a>
				</div>
	 			</div>
	 			<div class="dropdown">
				    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
				      판매상태
				    </button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" >판매종료</a>
			      <a class="dropdown-item" >판매중</a>
				</div>
	 			</div>
	 			
	 			<input type="text" name="i_subject" placeholder="제목을 입력해주세요." />
	 			<input type="text" name="i_cnt" placeholder="판매수량"/>
	 			<textarea name="i_content"> 내용을 입력해주세요. </textarea>
	 			<script>CKEDITOR.replace("i_content");</script>
	 			
	 			
	 			<input type="date" name="i_period" value=""/> <!-- 날짜 -->
	 			
	 			
	 			
	 			<input type="text" name="i_price" placeholder="가격"/>
	 			
	 			<div class="dropdown">
				    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
				      배송비
				    </button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" >무료</a>
			      <a class="dropdown-item">기본배송비</a>
				</div>
	 			</div>
	 			
	 			
	 			<input type="text" name="i_tag" placeholder="태그를 입력해주세요"/>
	 			
	 			<input type="file" class="form-control" id="customFile" />
				<input type="file" class="form-control" id="customFile" />
				<input type="file" class="form-control" id="customFile" />
	 		 
	 		 	
	 		 	<input type="submit" value="취소"/>
	 		 	<input type="submit" value="등록"/>

			</form>
		</div>
	</div>
</body>
</html>