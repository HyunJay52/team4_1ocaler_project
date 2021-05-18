<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		function setList(){
			for(var i = 0; i <= 5; i++){
				var tag = "<tr>";
				tag += "<td><input type='checkbox'/></td>";
				tag += "<td>2021-04-25</td>";
				tag += "<td>동내정보</td>";
				tag += "<td class='wordCut'>(마포구)투썸 신촌점에서 이벤트 박스 판매</td>";
				tag += "<td>10</td>";
				tag += "<td>3</td>";
				tag += "</tr>";
				$("#activityTbl").append(tag);
			}	
		}
		setList();
	});
</script>
<div class="myinfoBody">
	<%@ include file="/inc/sideMenu.jspf" %> <!-- 사이드 메뉴 include -->
	<div class="myinfoContainer">
		<h3>나의 활동</h3>
		<div class="dealTop">
			<div class="dealInfo">
				<img src="img/myInfo/saver.gif"/>
				<div class="infoList">
					<div class="infoListHeader">
						<h3>${vo.mem_name}</h3>
						<input type="button" class="btn dealBtn btn-outline-dark" value="Send Message"/>
						<a href="myInfoSeller"><input type="button" class="btn dealBtn btn-outline-dark" value="Info"/></a>
					</div>
					<ul style="font-weight:bold;">
						<li>참여</li>
						<li>모집</li>
						<li>직거래</li>
						<li>방문</li>
						<li>내글</li>
						<li>댓글</li>
						<li>좋아요</li>
					</ul>
					<ul>
						<li>${vo.joinus}</li>						
						<li>${vo.grouplocal}</li>
						<li>${vo.mem_share }</li>
						<li>${vo.logcount}</li>
						<li>${vo.board}</li>
						<li>${vo.reply}</li>
						<li>${vo.likeit}</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="dealBottom">
			<div class="activityRight">
				<input type="button" class="btn btn-outline-danger" value="삭제" style="float:right; height:30px; margin-bottom:10px; line-height:10px"/>
				<div class="myActivityForm">
					<input type="date" min="2021-01-01" max="2021-05-31"/> ~ 
					<input type="date" min="2021-01-01" max="2021-05-31"/>
					<div class="activitySelect">
						<select id="activitySelectbox">
							<option value="">나의 작성글</option>
							<option value="">나의 댓글</option>
							<option value="">나의 Q&A</option>
						</select>
					</div>
				</div>
				
				<table class="myinfoTable2" id="activityTbl">
					<tr>
						<td><input type="checkbox" class="allCheckboxSelect"/></td>
						<td>날짜</td>
						<td>분류</td>
						<td>제목</td>
						<td>조회수</td>
						<td>댓글수</td>
					</tr>
					<tr>
						<td><input type="checkbox"/></td>
						<td>2021-04-25</td>
						<td>동내정보</td>
						<td class="wordCut">(마포구)투썸 신촌점에서 이벤트 박스 판매</td>
						<td>10</td>
						<td>3</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>