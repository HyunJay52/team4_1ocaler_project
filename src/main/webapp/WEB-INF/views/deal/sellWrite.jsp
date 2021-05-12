<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealSellWriteStyle.css"/>


	<script>
		$(()=>{
			$(document).ready(function() {
			    $('#summernote').summernote({
			    	height: 650,
			    	placeholder: '판매 하는 상품의 내용, 설명, 이미지를 작성해 주세요.',
			        tabsize: 2,
			        disableResizeEditor: true
			    });
			  });


			
			$("select[name=ship_opt]").change(()=>{
				if($("#ship_opt option:selected").val()=="1"){
					$("#i_ship1").css("display","block").attr("disabled",true);
					$("#i_ship2").css("display","none").attr("disabled",true);		
					
				}
				if($("#ship_opt option:selected").val()=="2"){
						$("#i_ship1").css("display","none").attr("disabled",true);
						$("#i_ship2").css("display","none").attr("disabled",true);
	
				}
				if($("#ship_opt option:selected").val()=="3"){
						$("#i_ship1").css("display","none").attr("disabled",true);
						$("#i_ship2").css("display","block").attr("disabled",false);
				}	
			}); 	
				
				
				
				
			//옵션 추가	
			tag = '';
			$(document).on("click",'#optionDiv>div>img[class=optionPlus]', ()=>{
				tag += '<div><input type="text" class="option_title" name="option_title" placeholder="옵션명을 입력해 주세요"/>';
				tag += '<input type="text" class="option_content" name="option_content" placeholder="옵션 내용을 입력해 주세요"/>';
				tag += '<input type="number" min="0" class="option_price" name="option_price" placeholder="추가 옵션 가격을 입력해 주세요"/>';
				tag += '<img class="optionPlus" style="margin-left:10px;" src="/1ocaler/img/deal/plus.png"/>';
				tag += '<img class="optionMinus" style="margin-left:10px;" src="/1ocaler/img/deal/minus.png"/></div>';
				$('#optionDiv').append(tag);
				tag='';
			});
			
			$(document).on('click','.optionMinus',function(){
				$(this).parent().remove();
			});
			
			
		});
	
	</script>

	<div id="dealWnEMain">
		<h4 style="text-align:center; font-size:30px;">#상품등록</h4>
		<hr style=" margin: 0px; margin-bottom:50px; width: 143px; border-bottom: 10px solid #FFFF00; margin-top: -16px; margin-left: 582px; opacity: 0.7;"/>
		<hr/>
		<div>
		
			<!-- 상품 type, 제목 내용 등 -->
			<form id="sellWriteFrm" action="" >
				<select disabled>
					<option selected>착한발견</option>
				</select>
				<select name="i_status" >		
					<option value="1" selected>판매중</option>	
					<option value="2">판매종료</option>			
				</select>				
	 			<br/>
	 			<input type="text" id="i_subject" name="i_subject" placeholder=" &nbsp; &nbsp;제목을 입력해주세요." />
	 			<input type="number" id ="i_cnt" name="i_cnt" placeholder="판매수량"/>
	 			<textarea id="summernote" name="i_content"></textarea>


	 			<span style="font:bold;">판매 종료일 &ensp; : &ensp;</span>
	 			<input type="date"  id ="i_period" name="i_period" value="" style="width: 300px;"/> <!-- 날짜 -->
	 			
	 			
	 			<input type="number" id ="i_price"  name="i_price" placeholder="판매 가격" style="float: right"/>
	 			<input type="number" id="i_ship1" name="i_ship" value="2500"  placeholder="2500원"  style="float: right ;" />
	 			<input type="number" id="i_ship2" name="i_ship"  placeholder="배송비 입력"  style="float: right ;"/>
	 			<select id="ship_opt" name="ship_opt" style="float: right ;margin-top: 8px;">
					<option>배송비</option> 
					<option value="1">기본료 (+2500)</option>	
					<option value="2">무료배송</option>			
					<option value="3">기타</option>				
				</select>		
	 			<br/>
	 			<input type="text" id ="i_tag"  name="i_tag" placeholder="&nbsp;&nbsp;태그를 입력해주세요 &nbsp; #태그를 #입력해 #주세요" />
	 			
	 			
	 			
	 			
	 			
	 			<h4 style="text-align:center; font-size:30px; margin-top:50px;">#상품사진 및 옵션등록</h4>
				<hr style=" margin: 0px; margin-bottom:50px; width: 298px; border-bottom: 10px solid #FFFF00; margin-top: -16px; margin-left: 503px; opacity: 0.7;"/>
	 			<hr/>
	 			

	 			<!-- 사진등록 및 옵션등록 -->
				<span style="font-weight:bold; display:inline-block; margin:25px 0px 25px 0px;"> ▶ 상품 이미지를 등록해 주세요</span><span style="font-size:16px;"> (이미지 1개는 필수 등록 해야합니다.)</span><br/>
				<input type="file" name ="i_img1" id="filename1" style="display:none"onchange="javascript: document.getElementById('fileName1').value = this.value"/>
				<input type="text" id="fileName1" class="file_input_textbox" readonly="readonly"placeholder="&nbsp;&nbsp;파일을 선택해주세요."  >
				<label class="btn confBtn" for ="filename1" style="font-size:15px ;height: 39px ">파일등록</label>
				
				<input type="file" name ="i_img1"id="filename2" style="display:none"onchange="javascript: document.getElementById('fileName2').value = this.value"/>
				<input type="text" id="fileName2" class="file_input_textbox" readonly="readonly"placeholder="&nbsp;&nbsp;파일을 선택해주세요."  >
				<label class="btn confBtn" for ="filename2" style="font-size:15px ;height: 39px ">파일등록</label>
				
				<input type="file" name ="i_img1"id="filename3" style="display:none"onchange="javascript: document.getElementById('fileName3').value = this.value"/>
				<input type="text" id="fileName3" class="file_input_textbox" readonly="readonly"placeholder="&nbsp;&nbsp;파일을 선택해주세요."  >
				<label class="btn confBtn" for ="filename3" style="font-size:15px ;height: 39px ">파일등록</label>
				
				<span style="font-weight:bold; display:inline-block; margin:25px 0px 0px 0px;"> ▶ 상품 옵션을 입력해 주세요</span><span style="font-size:16px;"> (옵션명과 옵션 내용을 필수로 입력해 주세요)</span><br/>
				
				<div id="optionDiv">
					<div>
						<input type="text" class="option_title" name="option_title" placeholder="옵션명을 입력해 주세요"/><input type="text" class="option_content" name="option_content" placeholder="옵션 내용을 입력해 주세요"/><input type="number" min="0" class="option_price" name="option_price" placeholder="추가 옵션 가격을 입력해 주세요"/><img class="optionPlus" style="margin-left:10px;" src="<%=request.getContextPath() %>/img/deal/plus.png"/><br/>
					</div>
				</div>
				
	 		 	<div id="btn">
		 		 	<input type="submit" id="cancelBtn" class="btn cancelBtn" value="취소"/>&nbsp;&nbsp;
		 		 	<input type="submit" id="confBtn" class="btn commBtn" value="등록"/>	
	 		 	</div>

			</form>
		</div>
	</div>
</body>
</html>