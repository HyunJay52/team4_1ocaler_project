<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		vertical-align:-22px; 
	}
</style>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/commu/communityViewStyle.css"/>

	

	<div id="body">
		<%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
		
		<div id="center">
			<div>
				<button class="btn commBtn " onclick = "location.href = '#' ">삭제</button>
				<button class="btn commBtn" onclick = "location.href = 'commuEdit' ">수정</button>
			</div>
			<div id="board">
				<ul>
					<li>
						<span><a href="#">동네정보공유 &nbsp; </a></span>
						<span> > &nbsp; 할인정보</span>	
					</li>
					<li>서대문구 혼밥하기 좋은 곳 아시나요?</li>
					<li>
						<img src="common/user.png">
						<a href=""> 서쪽마녀</a>
					</li>
					<li>
						<span>조회수 : 143 &nbsp; &nbsp; </span>
						<span>추천수 : 10 </span>					
					</li>
					
					<li> 서대문구에 혼밥하기 좋은 식당있을까요? 추천해주세요</li>
					
					<li>#서대문구 #혼밥 #식당 #음식 #맛있는거 #추천 #동네맛집</li>
					<li id="likeLi">추천 &nbsp;&nbsp;
						<input type="checkbox" name="num" id="like" value="1"/>
						<label for="like"></label>&nbsp;&nbsp;&nbsp;댓글 5개
					
					</li>
				</ul>			
			</div>
			<script>


					$("#board>ul>li:nth-child(7) input[name=num]").on('click',function(){
					    if($(this).is(':checked')){
					       console.log($(this).val());
					    }else{
					       console.log($(this).val());
					    }
					 });  
					
			</script>
		</div>
		
		<div id="preBtnnext">
			<div><a href=""> 이전글 : 안녕하세요 </a></div>
			<div><a href=""> 다음글 : 안녕히계세요 </a></div>
		</div>
		

		<div id="reply">
			<h4>COMMENT</h4>
			<form method="post" id="replyFrm">
				<div>
					<input type="hidden" name="num"/>
		        	<textarea placeholder="자신의 의견을 간단히 적어주세요." name="rep_content" id="content"></textarea>
		        </div>
		        <div>
		        	<input type="submit" value="댓글 달기" class="btn confBtn"/>
		        </div>	
			</form>
		</div>
		<div id="replyList">
		
		</div>
	</div>
	
</body>
</html>