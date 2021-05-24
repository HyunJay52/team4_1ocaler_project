<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealStyle.css"/>

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

<style>
   #SBBanner{
      margin-top:50px;
      background-image: url("<%=request.getContextPath()%>/img/deal/handmade.jpg");
      height:180px;
      border-radius:10px;
   }
   .aaaa[type=checkbox]{ display:none; }
	#sellImgDiv>input[type=checkbox] + label { display: inline-block; cursor: pointer; line-height: 22px; padding-left: 22px; background: url("<%=request.getContextPath()%>/img/groupImg/likeE.png") left/22px no-repeat; }
	#sellImgDiv>input[type=checkbox]:checked + label { background-image: url("<%=request.getContextPath()%>/img/groupImg/likeF.png"); }
	#sellImgDiv>label{position: absolute; height: 30px; right: 20px; top: 4px;}
</style>
   <%-- <%@ include file="/inc/dealHeader.jspf" %> <!-- 사이드 메뉴 include --> --%>
   <%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
   <div id="dealMnSMain">
   <div id="SBBanner">
      	<span style="display:block; padding:30px 0px 0px 150px; font-size:36px; color:#fff; font-weight:bold;">1인 공방에서 만든 핸드메이드 제품</span> <span style="display:block; padding:0px 0px 0px 500px; font-size:36px; color:#fff; font-weight:bold;">
      		제품의 질을 느껴보세요</span>
      </div>
      	<h3 style="margin-top:50px;">#착한발견 <span style="font-size:20px">| 핸드메이드 제품의 매력을 느껴봐요</span></h3>
      	
      	<!-- 검색파트 -->
        <div id="commuSearch" style="height: auto; width:1300px;">
	      <div style="float:left; margin-bottom: 6px; width: 1300px; text-align: right;">
	      
			<form method="get" action="selBard" id="commuForm" style="margin-left: 636px;">
				<select name="searchKey">
					<option value="i_content">내용</option>
					<option value="i_subject">제목</option>		
					<option value="userid">작성자</option>			
				</select>
					<input type="text"name ="searchWord" placeholder=" &nbsp;검색.." id="search"/>
					<input type="image" id="btn" src="img/deal/icons8.png" style="display:block; float:left;margin-top: 21; border: 1px solid #000;" /> 
			</form>
		</div>	
      </div>	                
                 
                 
        <div id="selBoard" >
           <ul id="boardText">
              <c:forEach var="itemVO" items="${itemList }">
                 <li id="selList">
                    <div  >
                       <div id="sellImgDiv">
                          <img src="<%=request.getContextPath()%>/img/sellItemInsertPicture/${itemVO.i_img1}"/>
                          <c:if test="${logId!=null }">
	                           <input class="aaaa" type="checkbox" name="numLike" id="like${itemVO.i_num}" value="${itemVO.i_num}" 
		                           <c:forEach var="likes" items="${likeList}">
	                           			<c:if test="${likes.numLike==itemVO.i_num && logId==likes.userid }">
	                           				checked
	                           			</c:if>
	                           		</c:forEach> 
	                           	/>	
	                           <label for="like${itemVO.i_num}"></label>
							</c:if>
                       </div>
                       <ul OnClick="location.href ='sellView?i_num=${itemVO.i_num}'">   
                          <li class="wordcut">${itemVO.i_subject }</li>
                          
                          <li>
                             <span class="cntJoin">&nbsp;&nbsp;5</span>
                             /${itemVO.i_cnt }개
                          </li>
                          <li>${itemVO.i_price}원</li>
                          <li class="wordcut">${itemVO.i_tag }</li>
                          <li>
                             ${itemVO.userid } &nbsp;
                             <img src="<%=request.getContextPath()%>/img/mem_prof/${itemVO.sel_prof}">&nbsp;&nbsp;
                          </li>
                       </ul>
                    </div>
                 </li>
              </c:forEach>   
           </ul>
        </div>
        
        <div>
        	<c:if test='${logType==2 }'>
        		<a href="selWrite" class="btn commBtn "  style="float:right"> 글쓰기</a>
        	</c:if>
           	       
            <ul id="MBPaging">
               <c:if test="${pageVO.pageNum>1}">
					<li>
						<a href='selBard?pageNum=${pageVO.pageNum-1}<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!=''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>'>이전</a></li>
				</c:if>
				<c:if test="${pageVO.pageNum<=1}">
					<li>이전</li>
				</c:if>
				<c:forEach var="p" begin="${pageVO.startPageNum}" end="${pageVO.startPageNum+pageVO.onePageNum-1}">
					<c:if test="${p<=pageVO.totalPage}">
						<c:if test="${p==pageVO.pageNum}">
						<!-- 현재페이지일떄 -->
							<li style="background-color:#d9d9d9"><a href="selBard?pageNum=${p}<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!=''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>">${p}</a></li>
						</c:if>
						<c:if test="${p!=pageVO.pageNum}">
						<!-- 현재페이지가 아닐때 -->
							<li><a href="selBard?pageNum=${p}<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!=''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>">${p}</a></li>
						</c:if>
					</c:if>		
				</c:forEach>			
				<c:if test="${pageVO.pageNum<pageVO.totalPage}">
					<li>
						<a href="selBard?pageNum=${pageVO.pageNum+1}<c:if test="${pageVO.searchWord!=null && pageVO.searchWord!=''}">&searchKey=${pageVO.searchKey}&searchWord=${pageVO.searchWord}</c:if>">다음</a></li>
				</c:if>	
				<c:if test="${pageVO.pageNum==pageVO.totalPage || pageVO.totalPage==0}">
					<li>다음</li>
				</c:if>	
            </ul>
            
        </div>
     
   </div> <!-- body -->
</body>
</html>