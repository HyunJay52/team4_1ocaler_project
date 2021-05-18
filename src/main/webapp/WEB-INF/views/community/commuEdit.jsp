<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commu/communityWriteStyle.css"/>
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
		
		
		$("#cancelBtn").on('click',()=>{
			console.log("클릭");
			history.back();
		});
	});
	
	
	
	
</script>


	<div id="commueWnEmain">
		<div>
			<form  method="post" action="commuEditOk"   >
			
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
	 			
	 			<textarea name="b_content" id ="content" > ${vo.b_content } </textarea>
	 			<script>CKEDITOR.replace("b_content");</script>
	 			
	 			<br/>

				<input type="text" id ="tag"  name="b_tag" value="${vo.b_tag}" />
				

	 		 	<div id="btn">
		 		 	<input type="button" id="cancelBtn" class="btn cancelBtn" value="취소"/>&nbsp;&nbsp;
		 		 	<input type="submit" id="confBtn" class="btn commBtn" value="수정"/>
		 		 	
	 		 	</div>

			</form>
		</div>
	</div>
</body>
</html>