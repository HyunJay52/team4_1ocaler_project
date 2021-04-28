<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commu/communityWriteStyle.css"/>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script> 

<script>
	

	$(()=>{
		$("select[name=up_cate]").change(()=>{
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
		});
	});
	
	
	
	
</script>


	<div id="body">
		<div>
			<form action="" >
				<select id="up_cate" name="up_cate">
					<option value="0">카테고리</option>
					<option value="1">동네정보공유</option>	
					<option value="2">나만의 레시피</option>			
					<option value="3">자유게시판</option>
				</select>		
				<select id="down_cate" name="down_cate">
					<option value="1"> 할인정보</option>
					<option value="2">도움구해요</option>				
				</select>				
	 			<br/>
	 			<input type="text" id ="subject" name="b_subject" placeholder=" &nbsp; &nbsp;제목을 입력해주세요." />
	 			<input type="text" id ="cnt" name="b_gu" />
	 			<textarea name="b_content" id ="content" > 내용을 입력해주세요. </textarea>
	 			<script>CKEDITOR.replace("b_content");</script>
	 			
	 			<br/>

				<input type="text" id ="tag"  name="b_tag" placeholder="&nbsp;&nbsp;태그를 입력해주세요 &nbsp; #태그를 #입력해 #주세요" />
				

	 		 	<div id="btn">
		 		 	<input type="submit" id="cancelBtn" class="btn cancelBtn" value="취소"/>&nbsp;&nbsp;
		 		 	<input type="submit" id="confBtn" class="btn commBtn" value="등록"/>
		 		 	
	 		 	</div>

			</form>
		</div>
	</div>
</body>
</html>