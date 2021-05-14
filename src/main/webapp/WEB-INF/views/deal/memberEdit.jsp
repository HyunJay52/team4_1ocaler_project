<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealWriteStyle.css"/>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script> 

<script>

	

</script>


	<div id="dealWnEMain">
		<div>
			<h4 >동네직구 글수정 </h4>
			<form method="post" action="dealEditOk" enctype="multipart/form-data">
				<select>
					<option selected disabled hidden>카테고리</option>
					<option value="1" <c:if test='${vo.s_cate==1 }'>selected</c:if> >식료품</option>	
					<option value="2" <c:if test='${vo.s_cate==2 }'>selected</c:if> >생필품</option>			
					<option value="3"<c:if test='${vo.s_cate==3 }'>selected</c:if> >기타</option>
				</select>		
				<select>
					<option selected disabled hidden > 판매상태</option>
					<option value="1" <c:if test='${vo.s_status==1 }'>selected</c:if> >판매종료</option>	
					<option value="2" <c:if test='${vo.s_status==2 }'>selected</c:if> >판매중</option>			
				</select>				
	 			<br/>
	 			<input type="text" id ="subject" name="s_subject" placeholder=" &nbsp; &nbsp;제목을 입력해주세요." value="${vo.s_subject }"/>
	 			<input type="number" id ="cnt" name="s_cnt" placeholder="모집인원"  value="${vo.s_cnt }" />
	 			<textarea name="s_content" id ="content"  > ${vo.s_content }</textarea>
	 			<script>CKEDITOR.replace("s_content");</script>
	 			
	 	
	 			<span style="font:bold;">판매기한 &ensp; : &ensp;</span>
	 			<input type="date"  id ="date" name="s_date" value="${vo.s_date }"/> <!-- 날짜 -->
	 			
	 			
	 			<input type="number" id ="price"  name="s_price" placeholder="판매가격" value="${vo.s_price }" style="float: right"  />
	 			<input type="text" id ="gu"  name="s_gu" value="${logLoc_gu }" placeholder="${logLoc_gu }" style="float: right"/> <!-- 선호구역은는 vo에서 가져오기 -->
	 			
	 			<br/>
	 			
	 			<span style="font:bold;display: inline-block;margin-top: 25px;">수정할 사진파일을 선택해주세요.
					<label class="deal_input-file-button" for="s_img1"> 사진선택 </label> 
				</span><br/>
				 
				<div style="border: none; width: 1300px; height: 400px; margin-right: 10px; float: left;">
					<img src="<%=request.getContextPath()%>/img/dealFileImg/${vo.s_img1}"	id="dealSellImg" class="dealSellerImg form-control-file border" alt="upload image" />
				</div> 
				<input type="file" name="s_img" accept="image/*" id="s_img1"style="display: none; margin-top: 70px; border: none;" />
				<!-- 수정 전의 프로필 사진 저장 -->
					<input type="hidden" id="sellImg" name="sellImg" value="${vo.s_img1}"/>
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
	 			<input type="text" id = "loc" value="${vo.s_loc }" name="s_loc" placeholder="&ensp;지도에 표시될 위치 한 곳을 정확히 기재해주세요. ex) 광화문역 2번출구 , 김포공항 롯데시네마"/>
				<input type="text" id ="tag"   value="${vo.s_tag }" name="s_tag" placeholder="&ensp;태그를 입력해주세요 &nbsp; #태그를 #입력해 #주세요" />
				<input type="hidden" name="num" value="${vo.num }"/>
	 		 	<div id="btn">
		 		 	<input type="submit" id="cancelBtn" class="btn cancelBtn" value="취소"/>&nbsp;&nbsp;
		 		 	<input type="submit" id="confBtn" class="btn commBtn" value="수정"/>
		 		 	
	 		 	</div>

			</form>
		</div>
	</div>
</body>
</html>