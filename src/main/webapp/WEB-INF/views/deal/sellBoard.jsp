<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealStyle.css"/>
<style>
   #SBBanner{
      margin-top:50px;
      background-image: url("<%=request.getContextPath()%>/img/deal/handmade.jpg");
      height:180px;
      border-radius:10px;
   }
</style>
   <%-- <%@ include file="/inc/dealHeader.jspf" %> <!-- 사이드 메뉴 include --> --%>
   <%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
   <div id="dealMnSMain">
   <div id="SBBanner">
      	<span style="display:block; padding:30px 0px 0px 150px; font-size:36px; color:#fff; font-weight:bold;">1인 공방에서 만든 핸드메이드 제품</span> <span style="display:block; padding:0px 0px 0px 500px; font-size:36px; color:#fff; font-weight:bold;">
      		제품의 질을 느껴보세요</span>
      </div>
      	<h3 style="margin-top:50px;">#착한발견 <span style="font-size:20px">| 핸드메이드 제품의 매력을 느껴봐요</span></h3>
                  
                  
         <div id="selBoard" >
            <ul id="boardText">
               <c:forEach var="itemVO" items="${itemList }">
                  <li id="selList">
                     <div  OnClick="location.href ='sellView?i_num=${itemVO.i_num}'">
                        <div id="sellImgDiv">
                           <img src="<%=request.getContextPath()%>/img/sellItemInsertPicture/${itemVO.i_img1}"/>
                        </div>
                        <ul>   
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
               <li>이전</li>
               <li>1</li>
               <li>2</li>
               <li>3</li>
               <li>4</li>
               <li>5</li>
               <li>다음</li>
            </ul>
         </div>
      
   </div> <!-- body -->
</body>
</html>