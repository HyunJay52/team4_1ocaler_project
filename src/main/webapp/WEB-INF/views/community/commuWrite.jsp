<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commu/communityWriteStyle.css"/>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script> 

<script>
	

	$(()=>{
		/* $("select[name=up_cate]").change(()=>{
			if($("#up_cate option:selected").val()=="1"){
				$("#Edit_down_cate").css("display","block").attr("disabled",false);
				$("select").css("width","150px");
				$("select").css("margin-right","20px");
				
				
			}
			if($("#up_cate option:selected").val()=="2"){
					$("#Edit_down_cate").css("display","none").attr("disabled",true);
					
					
					
			}
			if($("#up_cate option:selected").val()=="3"){
				$("#Edit_down_cate").css("display","none");
				$("#Edit_down_cate").css("display","none").attr("disabled",true);
			}
			
		}); */
		
		$(document).on('submit','#commuWrite',function(){
			if($("#subject").val()==null || $("#subject").val()=='' ){
				alert('제목을 입력해주세요')
				return false;
			}
			if($("#summernote").val()==null || $("#summernote").val()=='' ){
				alert('내용을 입력주세요')
				return false;
			}
			if($("#tag").val()==null || $("#tag").val()=='' ){
				alert('태그를 선택해주세요')
				return false;
			}
			
		
		});
		
		
		
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
		
		
	});
	
	
	
	
	
</script>


	<div id="commueWnEmain">
		<div>
			<form method="post" action="commuWriteOk"enctype="multipart/form-data" id="commuWrite" >
				
				<c:if test="${vo.up_cate==1}">		
					<h5>우리동네 이야기 글쓰기</h5>
					<select id="up_cate" name="up_cate" Readonly >
						
						<option value="1"<c:if test='${vo.up_cate==1 }'>selected</c:if>>동네정보공유</option>	
						
					</select>
					
				</c:if>
				<c:if test="${vo.up_cate==2}">		
					<h5>쓱싹레시피 글쓰기</h5>
					<select id="up_cate" name="up_cate" Readonly >
						
						<option value="2"<c:if test='${vo.up_cate==2 }'>selected</c:if>>나만의 레시피</option>			
						
					</select>
					
				</c:if>
				<c:if test="${vo.up_cate==3}">		
					<h5>자유자게 글쓰기</h5>
					<select id="up_cate" name="up_cate" Readonly >
								
						<option value="3" <c:if test='${vo.up_cate==3 }'>selected</c:if>>자유게시판</option>
					</select>
					
				</c:if>

				<c:if test="${vo.up_cate==1}">		
					<select id="Edit_down_cate" name="down_cate">
						<option value="1"> 할인정보</option>
						<option value="2">도움구해요</option>			
					</select>
				</c:if>	
				
								
	 			<br/>
	 			<c:if test="${vo.up_cate==1 }">
	 				<input type="text" id ="subject" name="b_subject" placeholder=" &nbsp; &nbsp;제목을 입력해주세요." style="width: 1000px;  "/>
	 			</c:if>
	 			<c:if test="${vo.up_cate!=1 }">
	 				<input type="text" id ="subject" name="b_subject" placeholder=" &nbsp; &nbsp;제목을 입력해주세요." style="width: 100%;  "/>
	 			</c:if>
	 			
	 			
	 			<c:if test="${vo.up_cate==1 }">
	 				<input type="text" id ="cnt" name="b_gu" value="${logLoc_gu}" style="text-align: center;" readonly/>
	 			</c:if>
	 			<!-- <textarea name="b_content" id ="content" > 내용을 입력해주세요. </textarea>
	 			<script>CKEDITOR.replace("b_content");</script> -->
	 			
	 			<textarea id="summernote" name="b_content"></textarea>
	 			
	 			<br/>

				<input type="text" id ="tag"  name="b_tag" placeholder="&nbsp;&nbsp;태그를 입력해주세요 &nbsp; #태그를 #입력해 #주세요" />
				
				
				<br/>
				
				
				<c:if test="${vo.up_cate==2}">
				<span style="font:bold;display: inline-block;margin-top: 25px;"> 메인에 등록될 대표이미지를 선택해주세요.
					<label class="deal_input-file-button" for="b_img1"> 사진 선택 </label> 
				</span><br/>
				 
				 
			
					<div style="border: none; width: 1300px; height: 400px; margin-right: 10px; float: left;">
						<img src="img/deal/color.jpg"	id="dealSellImg" class="dealSellerImg form-control-file border" alt="upload image" />
					</div> 
					<input type="file" name="b_img" accept="image/*" id="b_img1"style="display: none; margin-top: 70px; border: none;" />
	
					<script>
							//상품 사진
							$("#b_img1").on('change', function() {
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
				</c:if>
				
					
				<br/>

	 		 	<div id="btn" >
		 		 	<input type="button" id="cancelBtn" class="btn cancelBtn" value="취소"/>&nbsp;&nbsp;
		 		 	<input type="submit" id="confBtn" class="btn confBtn" value="등록"/>
	 		 	</div>
			</form>
		</div>
	</div>
</body>
</html>