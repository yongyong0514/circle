<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/community/comuHomeBar.css">
</head>
<body>
		<c:if test="${ member != null}">
		<form name="logout" action="logout" method="GET">
		<p>${member.EMP_INFO_NAME }님 환영합니다.</p>
			
			<button class="logout">로그아웃</button>
		</form>
		</c:if>
	<div class="comuHomeBar">
		<ul>
			<li class="comuHomeTitle" onclick="location.href='/circle/community/comuList'">동호회 홈</li>
		</ul>
	</div>
</body>
</html>