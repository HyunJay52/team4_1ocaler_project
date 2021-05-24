<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commu/communityViewStyle.css"/>
<style>
	#likeLi>input[type=checkbox]{
		display:none;
	}
	#likeLi>input[type=checkbox]+label{
		background:url("<%=request.getContextPath()%>/img/groupImg/likeE.png") no-repeat; line-height:20px; ;
	}
	#likeLi>input[type=checkbox]:checked+label{
		background:url("<%=request.getContextPath()%>/img/groupImg/likeF.png") no-repeat;
	}
	#likeLi label{
		height:30px; 
		width:30px;
		vertical-align:-24px; 
	}
</style>


<script>

	function boardDel(){
		if(confirm("삭제하시겠습니까? ")){
		location.href="commuDel?num=${vo.num}&up_cate=${vo.up_cate}";
		}
	}


	$(function(){
		
		//좋아요=================================================================================================	
		if(${logId!=null}){
			$("#likeLi input[name=num]").on('click',function(){
				if($(this).is(':checked')){
					
					var url = "likeInsert";
					var params = "numLike="+$(this).val();	
					$.ajax({
						url : url,
						data : params,
						success : function(result){
							console.log(result,"좋아요 추가 성공");
						},error :function(request,status,error){
							 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
						}
					})
				}else{
					var url = "likeDelete";
					var params = "numLike="+$(this).val();	
					$.ajax({
						url : url,
						data : params,
						success : function(result){
							console.log(result,"좋아요 삭제 성공");
						},error :function(request,status,error){
							 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
						}
					})
					
				}
			});	
		}
		
		//팝업창 띄우기================================================
		/*위치설정*/
		var x = window.innerWidth;
		var y = window.innerHeight;
		var width =	$("#WVPProfilePopup").width();
		var height = $("#WVPProfilePopup").height();
		console.log(width,height)
		$("#WVPProfilePopup").css("top",y/2-height/2).css("left",x/2-width/2);
		/*띄우기*/
		$("#commuImgProf").click(()=>{
			$("#WVPProfilePopup").css("display","block");
			
		});	
	
		
		/*팝업창 닫기*/
		
		$('#WVPProfilePopup>div:first-child>span').click(()=>{
			$("#WVPProfilePopup").css("display","none");
		});
		
		$('#withViewPageReportBtn').click(()=>{ //글번호 넘겨야해?memberPageVO 보고서 결정하자
			if(${logId!=null}){
				location.href="reportWrite?userid=${vo.userid}"	
			}else{
				alert('로그인후 사용할 수 있습니다.');
				location.href="login";
			}
		});
		/*신고하기*/
		$('#eatViewPageReportBtn').click(()=>{
			if(${logId!=null}){
				location.href="reportWrite?num=${vo.num}"	
			}else{
				alert('로그인후 사용할 수 있습니다.');
				location.href="login";
			}
		});
		
		//댓글시작
		//댓글보기
		
		function replyList(){
			var url="replyList";
			var params="num=${vo.num}";
			
			$.ajax({
				url:url,
				data:params,
				success:function(result){
					
					//여기서부터 
					var $result = $(result);
					var tag ="<h4>댓글목록</h4><hr/><ul>";
					
					$result.each(function(idx,obj){
						/* 아이디 댓글 날짜 */
						tag+= "<li><div><h5 style='font-weight:bold;'>"+obj.userid+"</h5>&emsp;("+obj.rep_date+")</div>";
					
						/* 로그인되어있을때, 수정이랑 삭제 버튼보이기 */
						if(obj.userid =="${logId}"){
							tag+= "<div><input type='button' class='btn replycommBtn' value='수정' /> &ensp;";
		                    tag+= "<input type='button' class='btn replycommBtn' value='삭제' title='"+obj.rep_num+"' /></div>"; 	
						}else{
							tag+= "<div></div>";
							
						}
						  tag+= "<div id='replyContent'>"+ obj.rep_content+"</div>";
				 
						   //수정폼 보여주기
		                  if(obj.userid=="${logId}"){
		                     tag += "<div style='display:none' id='replyEdit'>";
		                     tag += "<form method ='post'><span style='margin-left: 37px;display: inline-block;vertical-align: top;'>↳</span>";
		                     tag += "<textarea name='rep_content'style='width:1170px;margin-left: 9px;'>"+obj.rep_content+"</textarea>";
		                     tag += "<input type='hidden' name='rep_num' value='"+obj.rep_num+"'/>";
		                     tag += "<input type='submit' class='btn editBtn' value='수정하기'/>" ;
		                     
		                     tag+="</form></div>";
		                    
		                  }else {
		                	
						}
						   

						  tag+= "</li>";
						  
					})//$result.each 
					 tag+= "</ul>";
					 $("#commuViewreplyList").html(tag);
					
				},error:function(){
					console.log("에러에러에러!!!");
				}// 에러
			
			})// ajax end
			
		} // 댓글보기 end
		
		//댓글 쓰기
		$("#commuViewreplyFrm").submit(function(){
			console.log("들어오니?");
			if($("#rep_content").val()!=''){
				console.log("들어옴?22");
				
				var url = "replyWriteOk";
				var params =$("#commuViewreplyFrm").serialize();
				
				$.ajax({
					url : url,
		            data : params,
		            success : function(result){
		            	replyList();
		            	$("#rep_content").val("");
		            	console.log('댓글등록성공' + result);	
		            },error:function(e){
		               console.log("오류 실패 실패 실패!!!!!!!!!")            
		            }
				})
			}else {
				 alert("댓글을 입력후 저장하세요."); //될까..?
			}
	
		})
		
		  //댓글 삭제
        $(document).on('click','#commuViewreplyList input[value=삭제]',function(){
           var url = "replyDel";
           var params = "rep_num="+$(this).attr("title");
           
           $.ajax({
              url: url,
              data : params,
              success:function(result){
                 replyList();
              },error : function(e){
                 console.log("댓글 삭제 실패");
              }
              
           });
        })
        
        //댓글 수정
        $(document).on('submit','#commuViewreplyList form',function(){
           var url="replyEdit";
           var params = $(this).serialize();
           
           $.ajax({
              url:url,
              data: params,
              type: "post",
              success:function(reslut){
                   replyList();
              },error:function(e){
                 console.log("댓글수정실패");
              }
           })
           
        })
	
			replyList();
		
		//댓글 수정폼이 이상해진것같은데...
        $(document).on('click','#commuViewreplyList input[value=수정]',function(){
        	
          $("#commuViewreplyList>ul>li>div:nth-child(2)").css("display", "none"); 
         //   $("#commuViewreplyList>ul>li>div:nth-child(4)").css("display", "block"); 
           
         
            // 세번쨰 네번쨰를 선탹해야한다고...
            $(this).parent().next().css("display", "none");// 원래내용..?
            $(this).parent().next().next().css("display", "block"); //수정내용..
     
         });
	})
	


	
</script>




	

	<div id="commuViewMain">
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		
		<div id="commuViewcenter">
			<div>
				<c:if test="${vo.userid==logId}">
				
					<a href="javascript:boardDel()"><button class="btn commBtn ">삭제</button></a>
					<button class="btn commBtn" onclick = "location.href = 'commuEdit?num=${vo.num}' ">수정</button>
				</c:if>	
			</div>
			<div id="commuViewboard">
				<ul>
					<li>
						<span style="color: #fff;">
								<c:if test="${vo.up_cate == 1 }">
									<a href="commuBoard?b_gu=${logLoc_gu}&up_cate=1">
										우리동네이야기
									</a>	
								</c:if>	
								<c:if test="${vo.up_cate == 2 }">
									<a href="commuRecipeBoard?up_cate=2">
										쓱싹레시피
									</a>	
								</c:if>
								<c:if test="${vo.up_cate == 3 }">
									<a href="commuFreeBoard?up_cate=3">
										자유게시판
									</a>	
								</c:if>
						</span>
						<span>  
							<c:if test="${vo.down_cate == 1 }">
								>  &nbsp; 할인정보
							</c:if>
							<c:if test="${vo.down_cate == 2 }">
								>  &nbsp; 도움구해요
							</c:if>
						</span>	
					</li>
					<li>${vo.b_subject }</li>
					<li id = "commuImgProf">
						<img src="<%=request.getContextPath()%>/img/mem_prof/${vo.mem_prof}">
						${vo.userid }
					</li>
					<li>
						<span>조회수 : ${vo.b_hit } &nbsp; &nbsp; </span>
						<span>추천수 : ${vo.numlike }</span>					
					</li>
					
					<li> ${vo.b_content }</li>
					
					<li>${vo.b_tag }</li> 
					
					
					<li id="likeLi">추천 &nbsp;&nbsp;
						<c:if test="${logId != null }">
	                           <input class="aaaa" type="checkbox" name="num" id="like${vo.num}" value="${vo.num}" 
		                           <c:forEach var="likes" items="${likeList}">
	                           			<c:if test="${likes.numLike==vo.num && logId==likes.userid }">
	                           				checked
	                           			</c:if>
	                           		</c:forEach> 
	                           	/>	
	                           <label for="like${vo.num}"></label>	
						</c:if>
						
						댓글  ${vo.repcont }개
					
					</li>
			
					 	<span  style="display: none">${vo.num }</span>
					 	<span  style="display: none">${vo.up_cate}</span>
					
				</ul>			
			</div>
			<script>


					$("#commuViewboard>ul>li:nth-child(7) input[name=num]").on('click',function(){
					    if($(this).is(':checked')){
					       console.log($(this).val());
					    }else{
					       console.log($(this).val());
					    }
					 });  
					
			</script>
		</div>
		
		<div id="commuViewpreBtnnext">
			<div style="border-bottom:1px solid #d9d9d9;color: #181b46; ">
				<span style="font-weight: bold;">이전글 :</span> 
				<c:if test="${voSel.prevNo==0 }"> <!-- 이전글 없음 -->
				   	 ${voSel.prevSubject}
			   	</c:if>
			   	<c:if test="${voSel.prevNo>0 }"><!-- 이전글 있음 -->
			       	<a href="commuView?num=${voSel.prevNo }&up_cate=${vo.up_cate}">${voSel.prevSubject }</a>
			    </c:if> 
			</div>
			<div>
				<span style="font-weight: bold;">다음글 :</span> 
				<c:if test="${voSel.nextNo==0 }">
			 	   ${voSel.nextSubject}
			   	</c:if>
			   	<c:if test="${voSel.nextNo>0 }">
			        <a href="commuView?num=${voSel.nextNo }&up_cate=${vo.up_cate}">${voSel.nextSubject}</a>
			   	</c:if><br/>
				
			</div>
		</div>
		

		<div id="commuViewreply">
			<c:if test="${logId != null}">
				<form method="post" id="commuViewreplyFrm">
					<div>
						<h4>COMMENT</h4>	
						<input type="hidden" name="num" value="${vo.num }"/>
			        	<textarea placeholder="자신의 의견을 간단히 적어주세요." name="rep_content" id="rep_content"></textarea>
			        </div>
			        <div>
			        	<input type="submit" value="댓글 달기" class="btn confBtn" id="replyBtn"/>
			        </div>	
				</form>
			</c:if>	
		</div>
		<div id="commuViewreplyList">
			
		</div>
		
		<div id="WVPProfilePopup">
		<div><span>X</span></div>
		<div><span>활동정보</span></div>
		<div><img src="<%=request.getContextPath()%>/img/mem_prof/${vo.mem_prof}"></div>
		<div>
			<ul>
				<li><span>${vo.userid }</span></li>
				<li><span>가입일 : ${vo.mem_sub } </span></li>
				<li><span>총 게시물 : ${vo.mem_post } / 100</span></li>
				<li><span>회원등급 : ${vo.mem_rev }개</span></li>
			</ul>
		</div>
		<div><button id="eatViewPageChatBtn"  class="btn commBtn">1:1채팅</button><button id="eatViewPageReportBtn" class="btn commBtn">신고하기</button></div>
		</div>
	</div>
	
</body>
</html>