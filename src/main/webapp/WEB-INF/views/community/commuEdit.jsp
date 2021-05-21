<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commu/communityWriteStyle.css"/>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commu/communityWriteStyle.css"/>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script> 

<script>
	

	$(()=>{
		/* $("select[name=up_cate]").change(()=>{
			if($("#up_cate option:selected").val()=="1"){
				$("#down_cate").css("display","block");
				$("select").css("width","150px");
				$("select").css("margin-right","20px");
				
			}
			if($("#up_cate option:selected").val()=="2"){
				$("#down_cate").css("display","none");
			}
			if($("#up_cate option:selected").val()=="3"){
				$("#down_cate").css("display","none");
			}
			if($("#up_cate option:selected").val()=="0"){
				$("#down_cate").css("display","none");
			}
		}); */
		$(document).ready(function() {
		    $('#summernote').summernote({
		    	height: 600,
		        tabsize: 2,
		        disableResizeEditor: true
		    });
		 });
		
		
		$("#cancelBtn").on('click',()=>{
			console.log("클릭");
			history.back();
		});
	});
	
	
	
	
</script>


	<div id="commueWnEmain">
		<div>
			<form  method="post" action="commuEditOk" enctype="multipart/form-data"  >
			
				<c:if test="${vo.up_cate==1}">		
					<h5>우리동네 이야기 글수정</h5>
				</c:if>
				<c:if test="${vo.up_cate==2}">		
					<h5>쓱싹레시피 글수정</h5>
				</c:if>
				<c:if test="${vo.up_cate==3}">		
					<h5>자유자게 글수정</h5>
				</c:if>
			
				<select id="up_cate" name="up_cate" disabled>
					<option value="0" selected disabled hidden<c:if test='${vo.up_cate==0 }'></c:if> >카테고리</option>
					<option value="1" <c:if test='${vo.up_cate==1 }'>selected</c:if>>동네정보공유</option>	
					<option value="2" <c:if test='${vo.up_cate==2 }'>selected</c:if>>나만의 레시피</option>			
					<option value="3" <c:if test='${vo.up_cate==3 }'>selected</c:if>>자유게시판</option>
				</select>	
				
				
				<c:if test="${vo.up_cate==1 }">	
				<select id="Edit_down_cate" name="down_cate" disabled>
					<option value="1"  <c:if test='${vo.down_cate==1 }'>selected</c:if>> 할인정보</option>
					<option value="2" <c:if test='${vo.down_cate==2 }'>selected</c:if> >도움구해요</option>				
				</select>		
				</c:if>
				
				
				
				
				
						
	 			<br/>
	 			<input type="hidden" name="num" value="${vo.num }"/>
	 			
	 			<c:if test="${vo.up_cate==2}">
	 				<input type="text" id ="subject" name="b_subject"value="${vo.b_subject }"style="width: 100%; "/>
	 			</c:if>
	 			<c:if test="${vo.up_cate==3}">
	 				<input type="text" id ="subject" name="b_subject"value="${vo.b_subject }"style="width: 100%; "/>
	 			</c:if>
	 			<c:if test="${vo.up_cate==1 }">
	 				<input type="text" id ="subject" name="b_subject"value="${vo.b_subject }"style="width: 1000px; "/>
	 				<input type="text" id ="cnt" name="b_gu" value="${logLoc_gu}"/>
	 			</c:if>
	 		<%-- 	
	 			<textarea name="b_content" id ="content" > ${vo.b_content } </textarea>
	 			<script>CKEDITOR.replace("b_content");</script>
	 			 --%>
	 			
	 			<textarea id="summernote" name="b_content"> ${vo.b_content } </textarea>
	 			<br/>

				<input type="text" id ="tag"  name="b_tag" value="${vo.b_tag}" />
				
					<br/>
				<!-- 파일 -->
				<c:if test="${vo.up_cate==2}">
				
					<c:if test="${vo.b_img1 == null}">
						<span style="font:bold;display: inline-block;margin-top: 25px;"> 수정할 메인 사진이 없습니다
							<label class="deal_input-file-button" for="b_img1"> 메인 사진 선택 </label> 
						</span><br/>
						
						<div style="border: none; width: 1300px; height: 400px; margin-right: 10px; float: left;">
							<img src="img/deal/color.jpg"	id="dealSellImg" class="dealSellerImg form-control-file border" alt="upload image" />
						</div> 
					</c:if>
					
					 
					<c:if test="${vo.b_img1 != null }">
						<span style="font:bold;display: inline-block;margin-top: 25px;"> 수정될 등록될 사진파일을 선택해주세요.
							<label class="deal_input-file-button" for="b_img1"> 수정 사진 선택 </label> 
						</span><br/>
						 
						
						
						<div style="border: none; width: 1300px; height: 400px; margin-right: 10px; float: left;">
							<img src="<%=request.getContextPath()%>/img/recipeImg/${vo.b_img1}"	id="dealSellImg" class="dealSellerImg form-control-file border" alt="upload image" />
						</div> 
					</c:if>	
					
					
					<input type="file" name="b_img" accept="image/*" id="b_img1"style="display: none; margin-top: 70px; border: none;" />
					<!-- 수정 전의 프로필 사진 저장 -->
						<input type="hidden" id="sellImg" name="sellImg" value="${vo.b_img1}"/>
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

	 		 	<div id="btn">
		 		 	<input type="button" id="cancelBtn" class="btn cancelBtn" value="취소"/>&nbsp;&nbsp;
		 		 	<input type="submit" id="confBtn" class="btn commBtn" value="수정"/>
		 		 	
	 		 	</div>

			</form>
		</div>
	</div>
</body>
</html>