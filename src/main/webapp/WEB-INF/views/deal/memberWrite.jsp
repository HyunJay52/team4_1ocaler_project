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
	 			
	 			<input type="text" name="s_subject" placeholder="제목을 입력해주세요." />
	 			<input type="text" name="s_cnt" placeholder="모집인원"/>
	 			<textarea name="s_content"> 내용을 입력해주세요. </textarea>
	 			<script>CKEDITOR.replace("s_content");</script>
	 			
	 		
	 			<input type="date" name="s_date" value=""/> <!-- 날짜 -->
	 			
	 			<input type="text" name="s_gu" value=""/> <!-- 선호구역은는 vo에서 가져오기 -->
	 			<input type="text" name="s_loc" placeholder="위치를 입력해주세요"/>
	 			<input type="text" name="s_price" placeholder="가격"/>
	 			
	 			<input type="text" name="s_tag" placeholder="태그를 입력해주세요"/>
	 			
	 			<input type="file" class="form-control" id="s_img1" />
				<input type="file" class="form-control" id="s_img2" />
				<input type="file" class="form-control" id="s_img3" />
	 		 
	 		 	
	 		 	<input type="submit" value="취소"/>
	 		 	<input type="submit" value="등록"/>

			</form>
		</div>
	</div>
</body>
</html>