<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealSellWriteStyle.css"/>


	<script>
		
		$(()=>{
			$(document).on('keyup','.option_price', function() {
				var regex= /^[0-9]/g;
				if (!regex.test($(".option_price").val())) {
					this.value=this.value.replace(/[^0-9]/g,'');
					alert('추가 옵션 가격은 숫자만 입력해주세요');
				}
				
			});
			
			$(document).ready(function() {
			    $('#summernote').summernote({
			    	height: 650,
			    	placeholder: '판매 하는 상품의 내용, 설명, 이미지를 작성해 주세요.',
			        tabsize: 2,
			        disableResizeEditor: true
			    });
			    
			    $("#optionDivs>div:first-child>img[class=optionMinus]").css("display","none");
			 });
					
			//옵션 추가	
			tag = '';
			$(document).on("click",'.optionPlus', ()=>{
				tag += '<div><input type="text" class="option_title" name="option_title" placeholder="옵션명을 입력해 주세요" required/>';
				tag += '<input type="text" class="option_content" name="option_content" placeholder="옵션 내용을 입력해 주세요" required/>';
				tag += '<input type="text" class="option_price" name="o_price" placeholder="추가 옵션 가격을 입력해 주세요" required/>';
				tag += '<img class="optionPlus" style="margin-left:10px;" src="/1ocaler/img/deal/plus.png"/>';
				tag += '<img class="optionMinus" style="margin-left:10px;" src="/1ocaler/img/deal/minus.png"/></div>';
				$('#optionDiv').append(tag);
				tag='';
			});
			
			$(document).on('click','.optionMinus',function(){
				$(this).parent().remove();
			});
		
			//취소누르면 sellView 로 이동
			$("#cancelBtn").click(()=>{
				location.href="selBard";
			})
				
			
			//유효성 검사
			$(document).on('submit','#sellModifyFrm',function(){
				if($("#i_subject").val()==null || $("#i_subject").val()==''){
					alert('제목을 입력해 주세요!');
					return false;
				}
				if($("#i_cnt").val()==null || $("#i_cnt").val()==''){
					alert('판매 수량을 입력해 주세요!')
					return false;
				}
				if ($('#summernote').summernote('isEmpty')) {
					alert('내용을 입력해주세요.');
					return false;
				}
				if($("#i_period").val()==null || $("#i_period").val()==''){
					alert('판매 종료일을 선택해 주세요!')
					return false;
				}
				if($('#i_price').val()==null || $('#i_price').val()==''){
					alert('판매 가격을 입력해 주세요!')
					return false;
				}
				
			});
			
			//파일삭제
			$(function(){
				$("#file b").click(function(){
					$(this).parent().css("display" , "none")
					$(this).parent().next().attr("name","delFile");
					$(this).parent().next().next().attr("type","file");
					$(this).parent().next().next().next().attr("type","text");
					$(this).parent().next().next().next().next().css("display","block");
					
				});
			});
			
			
			
		});
	
	</script>

	<div id="dealWnEMain">
		<h4 style="text-align:center; font-size:30px;">#상품수정</h4>
		<hr style=" margin: 0px; margin-bottom:50px; width: 143px; border-bottom: 10px solid #FFFF00; margin-top: -16px; margin-left: 582px; opacity: 0.7;"/>
		<hr/>
		<div>
		
			<!-- 상품 type, 제목 내용 등 -->
			<form method="post" id="sellModifyFrm" action="sellModifyOk" enctype="multipart/form-data">
				<select disabled>
					<option selected>착한발견</option>
				</select>
				<select name="i_status" >		
					<option value="1" <c:if test="${modifyVO.i_status==1 }">selected</c:if>      >판매중</option>	
					<option value="2" <c:if test="${modifyVO.i_status==2 }">selected</c:if>      >판매종료</option>
					<option value="3" <c:if test="${modifyVO.i_status==3 }">selected</c:if>      >종료예정</option>
					<option value="4" <c:if test="${modifyVO.i_status==4 }">selected</c:if>      >판매중단</option>			
				</select>				
	 			<br/>
	 			<input type="text" id="i_subject" name="i_subject" placeholder=" &nbsp; &nbsp;제목을 입력해주세요." value="${modifyVO.i_subject }"/>
	 			<input type="number" id ="i_cnt" name="i_cnt" max=100 placeholder="판매수량" value="${modifyVO.i_cnt }"/>
	 			<textarea id="summernote" name="i_content">${modifyVO.i_content }</textarea>


	 			<span style="font:bold;">판매 종료일 &ensp; : &ensp;</span>
	 			<input type="date"  id ="i_period" name="i_period" style="width: 300px;" value="${modifyVO.i_period }"/> <!-- 날짜 -->
	 			<input type="number" id ="i_price"  name="i_price" placeholder="판매 가격" style="float: right" value="${modifyVO.i_price }"/>		
	 			<br/>
	 			<input type="text" id ="i_tag"  name="i_tag" placeholder="&nbsp;&nbsp;태그를 입력해주세요 &nbsp; #태그를 #입력해 #주세요" value="${modifyVO.i_tag }" />
	 				
	 			<h4 style="text-align:center; font-size:30px; margin-top:50px;">#상품사진 및 옵션등록</h4>
				<hr style=" margin: 0px; margin-bottom:50px; width: 298px; border-bottom: 10px solid #FFFF00; margin-top: -16px; margin-left: 503px; opacity: 0.7;"/>
	 			<hr/>
	 			
	 			<!-- 사진등록 및 옵션등록 -->
				<span style="font-weight:bold; display:inline-block; margin:25px 0px 25px 0px;"> ▶ 상품 이미지를 등록해 주세요</span><span style="font-size:16px;"> (이미지 1개는 필수 등록 해야합니다.)</span><br/>
				<div id="file">
					<div>
						<div>▶ [IMG_File] ${modifyVO.i_img1} <b>X</b></div>
						<input type="hidden" name="" value="${modifyVO.i_img1}"/>
						<input type="hidden" name ="i_imgName" id="filename1" style="display:none"onchange="javascript: document.getElementById('fileName1').value = this.value" required/>
						<input type="hidden" id="fileName1" class="file_input_textbox" readonly="readonly"placeholder="&nbsp;&nbsp;파일을 선택해주세요."  >
						<label class="btn confBtn" for ="filename1" style="font-size:15px ;height: 39px; display:none; ">파일등록</label>
					</div>
					
					<div>
						<c:if test="${modifyVO.i_img2!=null && modifyVO.i_img2!=''}"> <!-- 두번째 첨부파일이있을경우 -->
							<div>▶ [IMG_File] ${modifyVO.i_img2} <b>X</b></div>
							<input type="hidden" name="" value="${modifyVO.i_img2 }"/>
							<input type="hidden" name ="i_imgName"id="filename2" style="display:none"onchange="javascript: document.getElementById('fileName2').value = this.value"/>
							<input type="hidden" id="fileName2" class="file_input_textbox" readonly="readonly"placeholder="&nbsp;&nbsp;파일을 선택해주세요."  >
							<label class="btn confBtn" for ="filename2" style="font-size:15px ;height: 39px; display:none;  ">파일등록</label>
						</c:if>
						
						<c:if test="${modifyVO.i_img2==null || modifyVO.i_img2==''}"> <!-- 두번째 첨부파일이없을경우 -->
							<input type="file" name ="i_imgName"id="filename2" style="display:none"onchange="javascript: document.getElementById('fileName2').value = this.value"/>
							<input type="text" id="fileName2" class="file_input_textbox" readonly="readonly"placeholder="&nbsp;&nbsp;파일을 선택해주세요."  >
							<label class="btn confBtn" for ="filename2" style="font-size:15px ;height: 39px ">파일등록</label>
						</c:if>
					</div>
					
					<div>
						<c:if test="${modifyVO.i_img3!=null && modifyVO.i_img3!=''}"> <!-- 세번째 첨부파일이있을경우 -->
							<div>▶ [IMG_File] ${modifyVO.i_img3} <b>X</b></div>
							<input type="hidden" name="" value="${modifyVO.i_img3 }"/>
							<input type="hidden" name ="i_imgName"id="filename3" style="display:none"onchange="javascript: document.getElementById('fileName3').value = this.value"/>
							<input type="hidden" id="fileName3" class="file_input_textbox" readonly="readonly"placeholder="&nbsp;&nbsp;파일을 선택해주세요."  >
							<label class="btn confBtn" for ="filename3" style="font-size:15px ;height: 39px; display:none; ">파일등록</label>
						</c:if>
						
						<c:if test="${modifyVO.i_img3==null || modifyVO.i_img3==''}"> <!-- 두번째 첨부파일이없을경우 -->
							<input type="file" name ="i_imgName"id="filename3" style="display:none"onchange="javascript: document.getElementById('fileName3').value = this.value"/>
							<input type="text" id="fileName3" class="file_input_textbox" readonly="readonly"placeholder="&nbsp;&nbsp;파일을 선택해주세요."  >
							<label class="btn confBtn" for ="filename3" style="font-size:15px ;height: 39px ">파일등록</label>
						</c:if>
					</div>
				</div>
				
				<span style="font-weight:bold; display:inline-block; margin:25px 0px 0px 0px;"> ▶ 상품 옵션을 입력해 주세요</span><span style="font-size:16px;"> (옵션명과 옵션 내용을 필수로 입력해 주세요)</span><br/>
				
				<div id="optionDiv">
					<div style="margin:5px 0px;"><span>&nbsp;&nbsp; ● &nbsp;&nbsp;배송비 :</span>
		 			<select id="i_ship" name="i_ship" style="margin: 8px 0px 0px 10px;;">	
						<option value="3000" <c:if test="${modifyVO.i_ship==3000 }">selected</c:if>>기본료 (+3000)</option>	
						<option value="0"    <c:if test="${modifyVO.i_ship==0 }">selected</c:if>>무료배송</option>						
					</select>
					</div>
					<div id="spanTitle"><span>[ 옵션명 : EX) 색상, 사이즈, 세트 ]</span><span>[ 옵션내용 : EX) 빨강, 파랑, 90, 95 ]</span><span>[ 추가 가격 : EX) 0, 100, 500, 1000 ]</span></div>
					<div id="optionDivs">	
						<c:forEach var="optionVO" items="${optionList }">
						<div><input type="text" id="option_title" class="option_title" name="option_title" placeholder="옵션명을 입력해 주세요" value="${optionVO.option_title }" required/><input type="text" id="option_content" class="option_content" name="option_content" placeholder="옵션 내용을 입력해 주세요" value="${optionVO.option_content }" required/><input type="text" id="option_price" class="option_price" name="o_price" placeholder="추가 옵션 가격을 입력해 주세요" value="${optionVO.o_price }" required/><img class="optionPlus" style="margin-left:10px;" src="<%=request.getContextPath() %>/img/deal/plus.png"/><img class="optionMinus" style="margin-left:10px;" src="/1ocaler/img/deal/minus.png"/></div>
						</c:forEach>	
					</div>
				</div>
				
	 		 	<div id="btn">
		 		 	<input type="button" id="cancelBtn" class="btn cancelBtn" value="취소"/>&nbsp;&nbsp;
		 		 	<input type="submit" id="modifyBtn" class="btn commBtn" value="수정완료"/>	
	 		 	</div>
				<input type="hidden" name="i_num" value="${modifyVO.i_num}">
			</form>
		</div>
	</div>
</body>
</html>