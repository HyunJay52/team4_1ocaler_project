<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealWriteStyle.css"/>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script> 

	<div id="dealWnEMain">
		<div>
		
			<h4 >동네직구 글쓰기 </h4>
			
			<form method="post" action="memWriteOk" >
				<select name="s_cate">
					<option>카테고리</option>
					<option value="1">식료품</option>	
					<option value="2">생필품</option>			
					<option value="3">기타</option>
				</select>		
				<select name="s_status">
					<option > 판매상태</option>
					<option value="1">판매종료</option>	
					<option value="2">판매중</option>			
				</select>				
	 			<br/>
	 			<input type="text" id ="subject" name="s_subject" placeholder=" &nbsp; &nbsp;제목을 입력해주세요." />
	 			<input type="number" id ="cnt" name="s_cnt" placeholder="모집인원"/>
	 			<textarea name="s_content" id ="content" >내용을 입력해주세요.</textarea>
	 			<script>CKEDITOR.replace("s_content");</script>
	 			
	 		
	 			<span style="font:bold;">판매기한 &ensp; : &ensp;</span>
	 			<input type="date"  id ="date" name="s_date" value=""/> <!-- 날짜 -->
	 			
	 			
	 			<input type="number" id ="price"  name="s_price" placeholder="판매가격" style="float: right"/>
	 			<input type="text" id ="gu"  name="s_gu" value="${logLoc_gu }" placeholder="${logLoc_gu }" style="float: right"/> <!-- 선호구역은는 vo에서 가져오기 -->
	 			
	 			<br/>
	 			
	 			
	 			
				<span style="font:bold;display: inline-block;margin-top: 25px;">사진파일을 선택해주세요. ↓</span><br/>
				
				<!-- <input type="file" name ="s_img1" id="filename1" class="filename1" style="display:none"onchange="javascript: document.getElementById('fileName1').value = this.value"/>
				<input type="text" id="fileName1" class="file_input_textbox" readonly="readonly"placeholder="&nbsp;&nbsp;파일을 선택해주세요."  >
				<label class="btn confBtn" for ="filename1" style="font-size:15px ;height: 44px ">파일등록</label>
				
				<input type="file" name ="s_img1"id="filename2" class="filename2" style="display:none"onchange="javascript: document.getElementById('fileName2').value = this.value"/>
				<input type="text" id="fileName2" class="file_input_textbox" readonly="readonly"placeholder="&nbsp;&nbsp;파일을 선택해주세요."  >
				<label class="btn confBtn" for ="filename2" style="font-size:15px ;height: 44px ">파일등록</label>
				 -->
				 
				 //시도
				<!-- <input type="file" name ="s_img1"id="filename3" class="filename3" style="display:none"onchange="javascript: document.getElementById('fileName3').value = this.value"/>
				<input type="text"  name ="s_img1" id="fileName3" class="file_input_textbox" readonly="readonly"placeholder="&nbsp;&nbsp;파일을 선택해주세요."  >
				<label class="btn confBtn" for ="filename3" style="font-size:15px ;height: 44px ">파일등록</label> -->
				
				<input type="text"  name ="s_img1" id="fileName3"/ >
				
				
				<input type="text" id = "loc" name="s_loc" placeholder="&ensp;지도에 표시될 위치를 기재해주세요."/>
				<input type="text" id ="tag"  name="s_tag" placeholder="&ensp;태그를 입력해주세요 &nbsp; #태그를 #입력해 #주세요" />
				
				
	 		 	<div id="btn" >
		 		 	<input type="submit" id="cancelBtn" class="btn cancelBtn" value="취소"/>&nbsp;&nbsp;
		 		 	<input type="submit" id="confBtn" class="btn commBtn" value="등록"/>
		 		 	
	 		 	</div>

			</form>
		</div>
	</div>
</body>
</html>