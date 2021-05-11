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
   
   #sellImgDiv input[type=checkbox]{
		display:none;
   }
   #sellImgDiv input[type=checkbox]+label{
		background:url("<%=request.getContextPath()%>/img/groupImg/likeE.png") no-repeat; line-height:20px; ;
   }
	#sellImgDiv input[type=checkbox]:checked+label{
		background:url("<%=request.getContextPath()%>/img/groupImg/likeF.png") no-repeat;
	}
	#sellImgDiv label{
		height:30px; 
		width:30px;
		vertical-align:-24px; 
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
               <c:forEach var="i" begin="1" end="8">
                  <li id="selList">
                     <div >
                        <div id="sellImgDiv">
                           <img src="img/deal/div.jfif" OnClick="location.href ='sellView'"  />
                           
                           <!-- 체크박스 넣고싶은데 -->
<!--                            <input type="checkbox" name="num" id="like" value="1" style="position: relative ;top:150px;left:278px;" />
                           <label for="like"></label>
                           <script>
									$("#sellImgDiv input[name=num]").on('click',function(){
									    if($(this).is(':checked')){
									       console.log($(this).val());
									    }else{
									       console.log($(this).val());
									    }
									 });  
							</script> -->
							
						 <!-- 체크	박스 ㅎ  -->
                        </div>
                        <ul OnClick="location.href ='sellView'">   
                           <li class="wordcut">D.I.Y 오르골 엔틱소품</li>
                           
                           <li>
                              리뷰 : 180개
                           </li>
                           <li>20,000원</li>
                           <li class="wordcut">#오르골 #DIY #엔틱소품 #소품</li>
                           <li>
                              goguma1234 &nbsp;
                              <img src="common/user.png">&nbsp;&nbsp;
                           </li>
                        </ul>
                     </div>
                  </li>
               </c:forEach>   
            </ul>
         </div>
         
         <div>
         	<a href="selWrite" class="btn commBtn "  style="float:right"> 글쓰기</a>
         
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