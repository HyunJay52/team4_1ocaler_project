<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%@ include file="/inc/sideBar.jspf" %>
<div id="totalSearchResult" class="centerDiv">
	<div>"${sideWord }" 통합검색 결과</div>
	<ul>
		<li>
			<select>
				<option>통합검색</option>
			</select>
		</li>
		<li><input type="text" /></li>
		<li><button>검색</button></li>
	</ul>
</div>