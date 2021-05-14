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
		location.href="commuDel?num=${vo.num}";
		}
	}

	//댓글시작
	$(function(){
		
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
					var tag ="<ul>";
					
					$result.each(function(idx,obj){
						tag+= "<li><div><a href='#'><h5>"+obj.userid+"</h5></a> &emsp;("+obj.rep_date+")</div>";
						
						if(obj.userid =="${logId}"){
							tag+= "<div><input type='button' class='btn replycommBtn' value='수정' /> &ensp;";
		                    tag+= "<input type='button' class='btn replycommBtn' value='삭제' title='"+obj.rep_num+"' /></div><br/>"; 	
						}else{
							
							
						}
						  tag+= "<br/><div>"+ obj.rep_content+"</div>";
						  
						  
						  
						   //수정폼 보여주기
		                  if(obj.userid=="${logId}"){
		                     tag += "<div style='display:none;'>";
		                     tag += "<form method ='post'>";
		                     tag += "<textarea name='rep_content'style='width:500px;height:80px;'>"+obj.rep_content+"</textarea>";
		                     tag += "<input type='submit' value='수정하기'/>" ;
		                     tag += "<input type='hidden' name='num' value='"+obj.rep_num+"'/>";
		                     tag+="</form></div>";
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
		
		
        $(document).on('click','#commuViewreplyList input[value=수정]',function(){
            
            $("#commuViewreplyList>ul>li>div:nth-child(1)").css("display", "block"); 
            $("#commuViewreplyList>ul>li>div:nth-child(2)").css("display", "none"); 
            
            $(this).parent().css("display", "none");
            $(this).parent().next().css("display", "block");
         });
	})
	


	
</script>




	

	<div id="commuViewMain">
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		
		<div id="commuViewcenter">
			<div>
				<a href="javascript:boardDel()"><button class="btn commBtn ">삭제</button></a>
				<button class="btn commBtn" onclick = "location.href = 'commuEdit?num=${vo.num}' ">수정</button>
			</div>
			<div id="commuViewboard">
				<ul>
					<li>
						<span style="color: #fff;">
								<c:if test="${vo.up_cate == 1 }">
									<a href="commuBoard?b_gu=${logLoc_gu}">
										우리동네이야기
									</a>	
								</c:if>	
								<c:if test="${vo.up_cate == 2 }">
									<a href="commuBoard?b_gu=${logLoc_gu}">
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
						<a href="">${vo.userid }</a>
					</li>
					<li>
						<span>조회수 : ${vo.b_hit } &nbsp; &nbsp; </span>
						<span>추천수 : 10 </span>					
					</li>
					
					<li> ${vo.b_content }</li>
					
					<li>${vo.b_tag }</li>
					<li id="likeLi">추천 &nbsp;&nbsp;
						<input type="checkbox" name="num" id="like" value="1"/>
						<label for="like"></label>&nbsp;&nbsp;&nbsp;댓글  ${vo.repcont }개
					
					</li>
			
					 	<span  style="display: none">${vo.num }</span>
					
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
				<a href=""> 
					<span style="font-weight: bold;">이전글 :</span> 안녕하세요 
				</a>
			</div>
			<div>
				<a href=""> 
					<span style="font-weight: bold;">다음글 :</span> 안녕히계세요 
				</a>
			</div>
		</div>
		

		<div id="commuViewreply">
			
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
				<li><span>총 게시물 : ${vo.mem_post }개</span></li>
				<li><span>총 댓글수 : ${vo.mem_rev }개</span></li>
			</ul>
		</div>
		<div><button class="btn commBtn">1:1채팅</button><button class="btn commBtn">신고하기</button></div>
		</div>
	</div>
	
</body>
</html>