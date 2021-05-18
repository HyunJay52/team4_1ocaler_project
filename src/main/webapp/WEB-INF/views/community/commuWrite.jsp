<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commu/communityWriteStyle.css"/>
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
		
		$("#cancelBtn").on('click',()=>{
			history.back();
		});
	});
	
	
	
	
	
</script>


	<div id="commueWnEmain">
		<div>
			<form method="post" action="commuWriteOk" >
				
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
	 			<textarea name="b_content" id ="content" > 내용을 입력해주세요. </textarea>
	 			<script>CKEDITOR.replace("b_content");</script>
	 			
	 			<br/>

				<input type="text" id ="tag"  name="b_tag" placeholder="&nbsp;&nbsp;태그를 입력해주세요 &nbsp; #태그를 #입력해 #주세요" />
				

	 		 	<div id="btn">
		 		 	<input type="button" id="cancelBtn" class="btn cancelBtn" value="취소"/>&nbsp;&nbsp;
		 		 	<input type="submit" id="confBtn" class="btn confBtn" value="등록"/>
	 		 	</div>
			</form>
		</div>
	</div>
</body>
</html>