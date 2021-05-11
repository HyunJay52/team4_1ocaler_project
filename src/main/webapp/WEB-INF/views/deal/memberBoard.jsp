<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/deal/dealStyle.css"/>



   
   
   
   <%@ include file="/inc/sideBar.jspf" %> <!-- 사이드 메뉴 include -->
   <%@ include file="/inc/dealHeader.jspf" %> <!-- 사이드 메뉴 include -->
   
   
   <div id="dealMnSMain">
 
      
      <h3 style="margin-top:50px;">#동네직구 <span style="font-size:20px">| 지역 주민들과 나눔</span></h3>
      <span style="display: inline-block; font-size:20px; float:right; margin-bottom: 6px;">
      	<a href="#">식료품</a>&ensp;<span style="font-size:10px; ">|</span>&nbsp;
      	<a href="#">생필품</a>&ensp;<span style="font-size:10px; ">|</span>&ensp; 
      	<a href="#">기 타</a>&ensp; 
      </span>
                  
               
         <div id="selBoard" >
            <ul id="boardText">
               <c:forEach var="vo" items="${dealSellList}">
                  <li id="selList">
                     <div OnClick="location.href ='memberView?num=${vo.num}'">
                        <div id="sellImgDiv">
                           <img src="<%=request.getContextPath()%>/img/dealFileImg/${vo.s_img1}"/>
                        </div>
                        <ul >   
                           <li class="wordcut">${vo.s_subject }</li>
                           
                           <li style="text-align: center; font-size: 20px">
                              <span class="cntJoin">3</span>
                              /${vo.s_cnt } 개
                           </li>
                           <li>${vo.s_price }원</li>
                           <li class="wordcut">${vo.s_tag }</li>
                           <li>
                              ${vo.userid } &nbsp;
                              <img src="common/user.png">&nbsp;&nbsp;
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