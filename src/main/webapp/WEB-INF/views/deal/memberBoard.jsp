<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealStyle.css"/>

	<style>
		.aaaa[type=checkbox]{ display:none; }
 		#sellImgDiv>input[type=checkbox] + label { display: inline-block; cursor: pointer; line-height: 22px; padding-left: 22px; background: url("<%=request.getContextPath()%>/img/groupImg/likeE.png") left/22px no-repeat; }
		#sellImgDiv>input[type=checkbox]:checked + label { background-image: url("<%=request.getContextPath()%>/img/groupImg/likeF.png"); }
		#sellImgDiv>label{position: absolute; height: 30px; right: 20px; top: 4px;}
	</style>

   
   
   
   <%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
  <%--  <%@ include file="/inc/dealHeader.jspf" %> <!-- 사이드 메뉴 include --> --%>
   
   
   <div id="dealMnSMain">
 
      
      <h3 style="margin-top:50px;">#동네직구 <span style="font-size:20px">| 지역 주민들과 나눔</span></h3>
      <span style="display: inline-block; font-size:20px; float:right; margin-bottom: 6px;">
      	<a href="memberBoard?s_cate=1">식료품</a>&ensp;<span style="font-size:10px; ">|</span>&nbsp;
      	<a href="memberBoard?s_cate=2">생필품</a>&ensp;<span style="font-size:10px; ">|</span>&ensp; 
      	<a href="memberBoard?s_cate=3">기 타</a>&ensp; 
      </span>
                  
               
         <div id="selBoard" >
            <ul id="boardText">
               <c:forEach var="vo" items="${dealSellList}">
                  <li id="selList">
                     <div>
                        <div id="sellImgDiv">
                           <img src="<%=request.getContextPath()%>/img/dealFileImg/${vo.s_img1}"/>
                           <input class="aaaa" type="checkbox" name="numLike" id="like${vo.num}" value="${vo.num}" />
                           <label for="like${vo.num}"></label>
                        </div>
                        <ul OnClick="location.href ='memberView?num=${vo.num}'" >   
                           <li class="wordcut">${vo.s_subject }</li>
                           
                           <li style="text-align: center; font-size: 20px">
                              <span class="cntJoin">3</span>
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
       	
       	 	<a href="memberWrite"  class="btn commBtn"  style="float:right"> 글쓰기</a>
         
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