<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		//체크박스 이벤트
		$(".productManagementLabelCenter>ul>li>input").change(function(){
			$(".productManagementLabelCenter>ul>li>input").prop('checked', false);
			$(this).prop('checked', true)
		});
		
		//페이징 버튼 클릭
		$("#shippingManagementPaging>ul>li>button").click(function(){
			var num = $(this).val();
			if(num == 0){
				num = $("#shippingManagementPaging>ul>li.active>button").val();
				num--;
				if(num == 0){
					num = 1;
				}
			}else if(num == 4){
				num = $("#shippingManagementPaging>ul>li.active>button").val();
				num++;
				if(num == 4){
					num = 3;
				}
			}
			$("#shippingManagementPaging>ul>li").removeClass("active");
			if(num == 1){
				$("#shippingManagementPaging>ul>li:last-child").removeClass("disabled");
				$("#shippingManagementPaging>ul>li:first-child").addClass("disabled");
				$("#shippingManagementPaging>ul>li:nth-child(2)").addClass("active");
				$("#shipTable1").css('display' , 'inline-table');
				$("#shipTable2").css('display' , 'none');
				$("#shipTable3").css('display' , 'none');
			}else if(num == 2){
				$("#shippingManagementPaging>ul>li:first-child").removeClass("disabled");
				$("#shippingManagementPaging>ul>li:last-child").removeClass("disabled");
				$("#shippingManagementPaging>ul>li:nth-child(3)").addClass("active");

				$("#shipTable1").css('display' , 'none');
				$("#shipTable2").css('display' , 'inline-table');
				$("#shipTable3").css('display' , 'none');			
			}else if(num == 3){
				$("#shippingManagementPaging>ul>li:first-child").removeClass("disabled");
				$("#shippingManagementPaging>ul>li:last-child").addClass("disabled");
				$("#shippingManagementPaging>ul>li:nth-child(4)").addClass("active");

				$("#shipTable1").css('display' , 'none');
				$("#shipTable2").css('display' , 'none');
				$("#shipTable3").css('display' , 'inline-table');
			}
			$("#shippingManagementPaging>ul>li:first-child").removeClass("active");
			$("#shippingManagementPaging>ul>li:last-child").removeClass("active");
		})
		
		$("#shipSearchBtn").click(function(){
			var val = $(".productManagementLabelCenter>ul>li>input[type='checkbox']:checked").val();
			console.log(val);
			if(val == 0){
				$("#shipTableGoing").css('display', 'none');
				$("#shipTableStay").css('display', 'none');
				$("#shipTable1").css('display' , 'inline-table');
				$("#shipTable2").css('display' , 'none');
				$("#shipTable3").css('display' , 'none');
				$(".pagedisplay").css('display' , 'block');
			}else if(val == 1){
				$("#shipTableStay").css('display', 'inline-table');
				$("#shipTableGoing").css('display', 'none');
				$("#shipTable1").css('display' , 'none');
				$("#shipTable2").css('display' , 'none');
				$("#shipTable3").css('display' , 'none');
				$(".pagedisplay").css('display' , 'none');
			}else if(val == 2){
				$("#shipTableGoing").css('display', 'inline-table');
				$("#shipTableStay").css('display', 'none');
				$("#shipTable1").css('display' , 'none');
				$("#shipTable2").css('display' , 'none');
				$("#shipTable3").css('display' , 'none');
				$(".pagedisplay").css('display' , 'none');
			}
		});
	});
</script>
<%@ include file="/inc/sideBar.jspf" %>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h2>판매관리 - 배송관리</h2>
		<div class="myInfoProductManagementTop">
			<div class="shippingManagementHeaderForm">
				<ul class="managementHeader" style="margin-left:80px;">
					<li>배송대기 : 2개</li>
					<li>배송중 : 1개</li>
					<li>배송완료 : 24개</li>
					<li>주문확정 : 23개</li>
				</ul>
			</div>
			<div class="productManagementLabelForm">
				<ul class="productManagementLabel">
					<li><label>판매상태</label></li>
					<li><label>기간선택</label></li>
					<li><label>상품명검색</label></li>					
				</ul>
				<div class="productManagementLabelCenter">
					<ul>
						<li><input type="checkbox" value="0"/>전체</li>
						<li><input type="checkbox" value="1"/>배송대기</li>
						<li><input type="checkbox" value="2"/>배송중</li>
						<li><input type="checkbox" value="3"/>배송완료</li>
						<li><input type="checkbox" value="4"/>주문확정</li>
					</ul>
					<div class="productManagementLabelCenterDiv">
						<input type="date" value="2021-03-01"/>~
						<input type="date" value="2021-05-31"/>
					</div>
					<div class="productManagementLabelCenterDiv">
						<input type="text" name="search"/>
						<input id="shipSearchBtn" type="button" value="검색" class="btn commBtn productManagementBtn"/>
					</div>				
				</div>				
			</div>
		</div>
		<div class="myInfoProductManagementBottom">
			<ul>
				<li><input type="button" value="주문 : 27건" class="btn commBtn myInfoProductManagementBottomBtn"/></li>
			</ul>
			<table class="myInfoProductManagementTable2" id="shipTable1">
				<tr>
					<td>번호</td>
					<td>상품명</td>
					<td>가격</td>
					<td>주문일</td>
					<td>결제상태</td>
					<td>주문확정</td>
					<td>주문인</td>							
				</tr>
				<tr>
					<td>27</td>
					<td data-target='#shippingManagementMd' data-toggle='modal'>신선감자20kg</td>
					<td>65,000원</td>
					<td>2021-05-25</td>
					<td>배송대기</td>
					<td>주문미확정</td>
					<td>gamjawang</td>							
				</tr>
				<tr>
					<td>26</td>
					<td>감자</td>
					<td>10,000원</td>
					<td>2021-05-25</td>
					<td>배송대기</td>
					<td>주문확정</td>
					<td>bitcamp1</td>							
				</tr>
				<tr>
					<td>25</td>
					<td>꿀고구마6kg</td>
					<td>43,000원</td>
					<td>2021-05-25</td>
					<td>배송중</td>
					<td>주문확정</td>
					<td>tiger</td>
				</tr>
				<tr>
					<td>24</td>
					<td>토끼당근10kg</td>
					<td>52,000원</td>
					<td>2021-05-24</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>dragon</td>
				</tr>
				<tr>
					<td>23</td>
					<td>꿀 고구마6kg</td>
					<td>43,000원</td>
					<td>2021-05-23</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>abcdefg</td>
				</tr>
				<tr>
					<td>22</td>
					<td>산양파10kg</td>
					<td>71,000원</td>
					<td>2021-05-22</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>power</td>
				</tr>
				<tr>
					<td>21</td>
					<td>토끼당근10kg</td>
					<td>52,000원</td>
					<td>2021-05-21</td>
					<td>배송정보 없음</td>
					<td>주문취소</td>
					<td>tokki</td>
				</tr>
				<tr>
					<td>20</td>
					<td>국내산 호밀12kg</td>
					<td>56,000원</td>
					<td>2021-05-20</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>homeal</td>
				</tr>
				<tr>
					<td>19</td>
					<td>신선한 딸기4kg</td>
					<td>48,000원</td>
					<td>2021-05-19</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>ttalgi</td>
				</tr>
			</table>			
			<table class="myInfoProductManagementTable2" id="shipTable2">
				<tr>
					<td>번호</td>
					<td>상품명</td>
					<td>가격</td>
					<td>주문일</td>
					<td>결제상태</td>
					<td>주문확정</td>
					<td>주문인</td>							
				</tr>
				<tr>
					<td>18</td>
					<td>국산꿀고구마10kg</td>
					<td>35,000원</td>
					<td>2021-05-18</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>ontheboat</td>
				</tr>
				<tr>
					<td>17</td>
					<td>맛좋은맛감자12kg</td>
					<td>35,000원</td>
					<td>2021-05-17</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>taisty</td>
				</tr>
				<tr>
					<td>16</td>
					<td>신선한 당근20kg</td>
					<td>35,000원</td>
					<td>2021-05-16</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>dangjun</td>
				</tr>
				<tr>
					<td>15</td>
					<td>고급산양파5kg</td>
					<td>35,000원</td>
					<td>2021-05-14</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>yangpha</td>
				</tr>
				<tr>
					<td>14</td>
					<td>쌈전용배추5kg</td>
					<td>35,000원</td>
					<td>2021-05-10</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>ssamjoa</td>
				</tr>
				<tr>
					<td>13</td>
					<td>농장꿀사과10kg</td>
					<td>57,000원</td>
					<td>2021-05-08</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>likeapple</td>
				</tr>
				<tr>
					<td>12</td>
					<td>무농약 배8kg</td>
					<td>41,000원</td>
					<td>2021-05-06</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>munongyack</td>
				</tr>
				<tr>
					<td>11</td>
					<td>포동한포도5kg</td>
					<td>33,000원</td>
					<td>2021-04-28</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>podo</td>
				</tr>
				<tr>
					<td>10</td>
					<td>맛좋은맛감자12kg</td>
					<td>35,000원</td>
					<td>2021-04-27</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>gamja</td>
				</tr>
			</table>
			<table class="myInfoProductManagementTable2" id="shipTable3">
				<tr>
					<td>번호</td>
					<td>상품명</td>
					<td>가격</td>
					<td>주문일</td>
					<td>결제상태</td>
					<td>주문확정</td>
					<td>주문인</td>							
				</tr>
				<tr>
					<td>9</td>
					<td data-target='#shippingManagementMd' data-toggle='modal'>신선감자10kg</td>
					<td>40,000원</td>
					<td>2021-04-25</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>goguma</td>							
				</tr>
				<tr>
					<td>8</td>
					<td>고급산양파5kg</td>
					<td>35,000원</td>
					<td>2021-04-24</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>yangpha</td>
				</tr>
				<tr>
					<td>7</td>
					<td>꿀고구마15kg</td>
					<td>73,000원</td>
					<td>2021-04-22</td>
					<td>배송정보 없음</td>
					<td>주문취소</td>
					<td>tiger</td>
				</tr>
				<tr>
					<td>6</td>
					<td>토끼당근7kg</td>
					<td>32,000원</td>
					<td>2021-04-20</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>dragon</td>
				</tr>
				<tr>
					<td>5</td>
					<td>신선감자6kg</td>
					<td>30,000원</td>
					<td>2021-04-18</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>abcdefg</td>
				</tr>
				<tr>
					<td>4</td>
					<td>포동한포도5kg</td>
					<td>33,000원</td>
					<td>2021-04-16</td>
					<td>배송정보 없음</td>
					<td>주문취소</td>
					<td>ontheboat</td>
				</tr>
				<tr>
					<td>3</td>
					<td>농장꿀사과10kg</td>
					<td>57,000원</td>
					<td>2021-04-15</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>bitcamp25</td>
				</tr>
				<tr>
					<td>2</td>
					<td>국내산 호밀</td>
					<td>22,000원</td>
					<td>2021-04-12</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>homeal</td>
				</tr>
				<tr>
					<td>1</td>
					<td>신선한 딸기2kg</td>
					<td>48,000원</td>
					<td>2021-04-10</td>
					<td>배송완료</td>
					<td>주문확정</td>
					<td>cat</td>
				</tr>
			</table>
			<table class="myInfoProductManagementTable2" id="shipTableStay">
				<tr>
					<td>번호</td>
					<td>상품명</td>
					<td>가격</td>
					<td>주문일</td>
					<td>결제상태</td>
					<td>주문확정</td>
					<td>주문인</td>							
				</tr>
				<tr>
					<td>27</td>
					<td data-target='#shippingManagementMd' data-toggle='modal'>신선감자20kg</td>
					<td>65,000원</td>
					<td>2021-05-25</td>
					<td>배송대기</td>
					<td>주문미확정</td>
					<td>gamjawang</td>							
				</tr>
				<tr>
					<td>26</td>
					<td>감자</td>
					<td>10,000원</td>
					<td>2021-05-25</td>
					<td>배송대기</td>
					<td>주문확정</td>
					<td>bitcamp1</td>							
				</tr>
			</table>
			<table class="myInfoProductManagementTable2" id="shipTableStay">
				<tr>
					<td>번호</td>
					<td>상품명</td>
					<td>가격</td>
					<td>주문일</td>
					<td>결제상태</td>
					<td>주문확정</td>
					<td>주문인</td>							
				</tr>
				<tr>
					<td>27</td>
					<td data-target='#shippingManagementMd' data-toggle='modal'>신선감자20kg</td>
					<td>65,000원</td>
					<td>2021-05-25</td>
					<td>배송대기</td>
					<td>주문미확정</td>
					<td>gamjawang</td>							
				</tr>
				<tr>
					<td>26</td>
					<td>감자</td>
					<td>10,000원</td>
					<td>2021-05-25</td>
					<td>배송대기</td>
					<td>주문확정</td>
					<td>bitcamp1</td>							
				</tr>
			</table>
			<table class="myInfoProductManagementTable2" id="shipTableGoing">
				<tr>
					<td>번호</td>
					<td>상품명</td>
					<td>가격</td>
					<td>주문일</td>
					<td>결제상태</td>
					<td>주문확정</td>
					<td>주문인</td>							
				</tr>
				<tr>
					<td>25</td>
					<td>꿀고구마6kg</td>
					<td>43,000원</td>
					<td>2021-05-25</td>
					<td>배송중</td>
					<td>주문확정</td>
					<td>tiger</td>
				</tr>
			</table>
			<table class="myInfoProductManagementTable2" id="shipTableGoing">
				<tr>
					<td>번호</td>
					<td>상품명</td>
					<td>가격</td>
					<td>주문일</td>
					<td>결제상태</td>
					<td>주문확정</td>
					<td>주문인</td>							
				</tr>
				<tr>
					<td>25</td>
					<td>꿀고구마6kg</td>
					<td>43,000원</td>
					<td>2021-05-25</td>
					<td>배송중</td>
					<td>주문확정</td>
					<td>tiger</td>
				</tr>
			</table>
			
			<div id="shippingManagementPaging">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled"><button value="0" class="page-link">Prev</button></li>				
					<li class="page-item active"><button class="page-link" value="1">1</button></li>
					<li class="page-item pagedisplay"><button class="page-link" value="2">2</button></li>
					<li class="page-item pagedisplay"><button class="page-link" value="3">3</button></li>					
					<li class="page-item"><button value="4" class="page-link">Next</button></li>			
				</ul>
			</div>
		</div>
	</div>
	<div class="modal fade mdFnt" id="shippingManagementMd">
		<div class="modal-dialog">
			<div class="modal-content shippingManagementContent">
				<div class="modal-header shippingManagementHeader">
				<h4 class="modal-title">고구마 10kg</h4>

				</div>
				<div class="modal-body shippingManagementBody">
					<ul>
						<li>주문일 : 2021.05.01</li>
						<li>받으실 분 : </li>
						<li>
							<select class="shippingManagementSelectbox">
								<option value="">한진택배</option>
								<option value="">로젠택배</option>
								<option value="">우체국택배</option>					
							</select>
						</li>
						<li>
							<textarea class="shippingManagementTextarea mdFnt" name="shipNum" placeholder="송장번호를 입력해주세요"></textarea>
						</li>
						<li><button class="btn btn-outline-dark btn-lg">작성완료</button>
							<button class="btn btn-outline-dark btn-lg" data-dismiss="modal">취소</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
