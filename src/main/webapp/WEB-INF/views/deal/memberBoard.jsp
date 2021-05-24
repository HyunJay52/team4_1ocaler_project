<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealStyle.css"/>

	<style>
		.aaaa[type=checkbox]{ display:none; }
 		#sellImgDiv>input[type=checkbox] + label { display: inline-block; cursor: pointer; line-height: 22px; padding-left: 22px; background: url("<%=request.getContextPath()%>/img/groupImg/likeE.png") left/22px no-repeat; }
		#sellImgDiv>input[type=checkbox]:checked + label { background-image: url("<%=request.getContextPath()%>/img/groupImg/likeF.png"); }
		#sellImgDiv>label{position: absolute; height: 30px; right: 20px; top: 4px;}
	</style>
	
	<script>
			
			$(function(){
			//좋아요=================================================================================================	
					if(${logId!=null}){
						$("#sellImgDiv input[name=numLike]").on('click',function(){
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
			});	
	</script>
   
   
   
   <%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
  <%--  <%@ include file="/inc/dealHeader.jspf" %> <!-- 사이드 메뉴 include --> --%>
   
   
   <div id="dealMnSMain">
 	
      
      <h3 style="margin-top:50px;">#동네직구 <span style="font-size:20px">| 지역 주민들과 나눔</span></h3>
      
      
      
   
      <div id="commuSearch" style="height: auto; width:1300px;">
		  <div style="float:left; margin-bottom: 6px; width: 30%;height:58px;line-height: 3.8;">		      
	         <span style="display: inline-block; font-size:20px; margin-left:12px">
		      	<a href="memberBoard?s_cate=1&s_gu=<c:if test="${logName!=null && logName!='' }">${logLoc_gu }</c:if><c:if test="${logId==null }">강서구</c:if>">식료품</a>&ensp;<span style="font-size:10px; ">|</span>&nbsp;
		      	<a href="memberBoard?s_cate=2&s_gu=<c:if test="${logName!=null && logName!='' }">${logLoc_gu }</c:if><c:if test="${logId==null }">강서구</c:if>">생필품</a>&ensp;<span style="font-size:10px; ">|</span>&ensp; 
		      	<a href="memberBoard?s_cate=3&s_gu=<c:if test="${logName!=null && logName!='' }">${logLoc_gu }</c:if><c:if test="${logId==null }">강서구</c:if>">기 타</a>&ensp; 
		      </span>
	      </div>
	      <div style="float:left; margin-bottom: 6px; width: 70%; text-align: right;">
			<form method="get" action="memberBoard" id="commuForm">
				<select name="searchKey">
					<option value="s_content">내용</option>
					<option value="s_subject">제목</option>		
					<option value="s_gu">지역검색</option>
					<option value="userid">작성자</option>			
				</select>
					<input type="text"name ="searchWord" placeholder=" &nbsp;검색.." id="search"/>
					<input type="image" id="btn" src="img/deal/icons8.png" style="display:block; float:left;margin-top: 21; border: 1px solid #000;" /> 
			</form>
		</div>	
      </div>	         
                  
               
         <div id="selBoard" >
            <ul id="boardText">
               <c:forEach var="vo" items="${dealSellList}">
                  <li id="selList">
                     <div>
                        <div id="sellImgDiv">
                           <img src="<%=request.getContextPath()%>/img/dealFileImg/${vo.s_img1}"/>
                           
                           <c:if test="${logId!=null }">
	                           <input class="aaaa" type="checkbox" name="numLike" id="like${vo.num}" value="${vo.num}" 
		                           <c:forEach var="likes" items="${likeList}">
	                           			<c:if test="${likes.numLike==vo.num && logId==likes.userid }">
	                           				checked
	                           			</c:if>
	                           		</c:forEach> 
	                           	/>	
	                           <label for="like${vo.num}"></label>
							</c:if>
                           
                        </div>
                        <ul OnClick="location.href ='memberView?num=${vo.num}'" >   
                           <li class="wordcut">${vo.s_subject }</li>
                           
                           <li style="text-align: center; font-size: 20px">
                              <span class="cntJoin">${appNum}</span>
                              /${vo.s_cnt } 개
                           </li>
                           <li>${vo.s_price }원</li>
                           <li class="wordcut">${vo.s_tag }</li>
                           <li>
                              ${vo.userid } &nbsp;
                              <img src="<%=request.getContextPath()%>/img/mem_prof/${vo.mem_prof}">&nbsp;&nbsp;
                           </li>
                        </ul>
                     </div>
                  </li>
               </c:forEach>
            </ul>
         </div>
         
         <div>
       	
       		<c:if test="${logId !=null }">
       	 		<a href="memberWrite"  class="btn commBtn"  style="float:right"> 글쓰기</a>
 			</c:if> 
 			
 			       
            <ul id="MBPaging">
               <c:if test="${pageVO.pageNum>1}">
					<li>
						<a href='memberBoard?pageNum=${pageVO.pageNum-1}<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!=''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if><c:if test="${pageVO.s_gu!=null && pageVO.s_gu!=''}">&s_gu=${pageVO.s_gu}</c:if><c:if test="${pageVO.s_cate!=null && pageVO.s_cate!=''}">&s_cate=${pageVO.s_cate}</c:if>'>이전</a></li>
				</c:if>
				<c:if test="${pageVO.pageNum<=1}">
					<li>이전</li>
				</c:if>
				<c:forEach var="p" begin="${pageVO.startPageNum}" end="${pageVO.startPageNum+pageVO.onePageNum-1}">
					<c:if test="${p<=pageVO.totalPage}">
						<c:if test="${p==pageVO.pageNum}">
						<!-- 현재페이지일떄 -->
							<li style="background-color:#d9d9d9"><a href="memberBoard?pageNum=${p}<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!=''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if><c:if test="${pageVO.s_gu!=null && pageVO.s_gu!=''}">&s_gu=${pageVO.s_gu}</c:if><c:if test="${pageVO.s_cate!=null && pageVO.s_cate!=''}">&s_cate=${pageVO.s_cate}</c:if>">${p}</a></li>
						</c:if>
						<c:if test="${p!=pageVO.pageNum}">
						<!-- 현재페이지가 아닐때 -->
							<li><a href="memberBoard?pageNum=${p}<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!=''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if><c:if test="${pageVO.s_gu!=null && pageVO.s_gu!=''}">&s_gu=${pageVO.s_gu}</c:if><c:if test="${pageVO.s_cate!=null && pageVO.s_cate!=''}">&s_cate=${pageVO.s_cate}</c:if>">${p}</a></li>
						</c:if>
					</c:if>		
				</c:forEach>			
				<c:if test="${pageVO.pageNum<pageVO.totalPage}">
					<li>
						<a href="memberBoard?pageNum=${pageVO.pageNum+1}<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!=''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if><c:if test="${pageVO.s_gu!=null && pageVO.s_gu!=''}">&s_gu=${pageVO.s_gu}</c:if><c:if test="${pageVO.s_cate!=null && pageVO.s_cate!=''}">&s_cate=${pageVO.s_cate}</c:if>">다음</a></li>
				</c:if>	
				<c:if test="${pageVO.pageNum==pageVO.totalPage || pageVO.totalPage==0}">
					<li>다음</li>
				</c:if>	
            </ul>
            
            
         </div>
         
            
      
   </div> <!-- body -->
</body>
</html>