<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealWriteStyle.css"/>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script> 

<script>
		$(()=>{
			$("#cancelBtn").on('click',()=>{
				history.back();
			});	
			$(document).ready(function() {
			    $('#summernote').summernote({
			    	height: 600,
			    	placeholder: '내용을 입력해주세요.',
			        tabsize: 2,
			        disableResizeEditor: true
			    });
			 });
			
		
		
		$(document).on('submit','#memWrite',function(){
			if($("#s_cate").val()==null || $("#s_cate").val()=='' ){
				alert('카테고리를 선택해주세요')
				return false;
			}
			if($("#s_status").val()==null || $("#s_status").val()=='' ){
				alert('판매상태를 선택해주세요')
				return false;
			}
			if($("#subject").val()==null || $("#subject").val()==''){
				alert('제목을 입력해 주세요!')
				return false;
			}
			if($("#summernote").val()==null || $("#summernote").val()==''){
				alert('내용을 입력해주세요')
				return false;
			}		
			if($("#cnt").val()==null || $("#cnt").val()==''){
				alert('모집 인원을 입력해 주세요!')
				return false;
			}
		
			if($('#price').val()==null || $('#price').val()==''){
				alert('판매 가격을 입력해 주세요!')
				return false;
			}
			if($("#s_img1").val()=='' ){
				alert('상품 이미지 1개를 선택해 주세요')
				return false;
			}
		
		});
		
	});

</script>

	<div id="dealWnEMain">
		<div>
		
			<h4 >동네직구 글쓰기 </h4>
			
			<form method="post" action="memWriteOk" enctype="multipart/form-data" id="memWrite">
				<select name="s_cate" id="s_cate">
					<option selected disabled hidden  >카테고리</option>
					<option value="1">식료품</option>	
					<option value="2">생필품</option>			
					<option value="3">기타</option>
				</select>		
				<select name="s_status" id ="s_status">
					<option selected disabled hidden> 판매상태</option>
					<option value="1">판매중</option>	
					<option value="2">판매완료</option>			
				</select>				
	 			<br/>
	 			<input type="text" id ="subject" name="s_subject" placeholder=" &nbsp; &nbsp;제목을 입력해주세요." />
	 			<input type="number" id ="cnt" name="s_cnt" placeholder="모집인원"/>
	 			
	 			<textarea id="summernote" name="s_content"></textarea>
	 			
	 			
	 			<!-- <textarea name="s_content" id ="content" placeholder="내용을 입력해주세요."></textarea>
	 			<script>CKEDITOR.replace("s_content");</script> -->
	 			
	 		
	 			<span style="font:bold;">판매기한 &ensp; : &ensp;</span>
	 			<input type="date"  id ="date" name="s_date" value=""/> <!-- 날짜 -->
	 			
	 			
	 			<input type="number" id ="price"  name="s_price" placeholder="판매가격" style="float: right"/>
	 			<input type="text" id ="gu"  name="s_gu" value="${logLoc_gu }" placeholder="${logLoc_gu }" style="float: right"/> <!-- 선호구역은는 vo에서 가져오기 -->
	 			
	 			
				
	 			<br/>
	 			
				<span style="font:bold;display: inline-block;margin-top: 25px;">사진파일을 선택해주세요.
					<label class="deal_input-file-button" for="s_img1"> 사진선택 </label> 
				</span><br/>
				 
				<div style="border: none; width: 1300px; height: 400px; margin-right: 10px; float: left;">
					<img src="img/deal/color.jpg"	id="dealSellImg" class="dealSellerImg form-control-file border" alt="upload image" />
				</div> 
				<input type="file" name="s_img" accept="image/*" id="s_img1"style="display: none; margin-top: 70px; border: none;" />
				
			<script>
				//상품 사진
				$("#s_img1").on('change', function() {
					readURL(this);
				});
				
				function readURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
				
						reader.onload = function(e) {
							$('#dealSellImg').attr('src', e.target.result);
						}
				
						reader.readAsDataURL(input.files[0]);
					}
			};

	
			</script>
				
				<br/>
	 			<input type="text" id = "loc" name="s_loc" placeholder="&ensp;지도에 표시될 위치 한 곳을 정확히 기재해주세요. ex) 광화문역 2번출구 , 김포공항 롯데시네마"/>
				<input type="text" id ="tag"  name="s_tag" placeholder="&ensp;태그를 입력해주세요 &nbsp; #태그를 #입력해 #주세요" />
				
	 		 	<div id="btn" >
		 		 	<input type="button" id="cancelBtn" class="btn cancelBtn" value="취소"/>&nbsp;&nbsp;
		 		 	<input type="submit" id="confBtn" class="btn commBtn" value="등록"/>
		 		 	
	 		 	</div>

			</form>
		</div>
	</div>
</body>
</html>