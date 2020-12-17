<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/community/comuHomeBar.css">
<style>
	a:hover{
	color:black;
	}
</style>
</head>
<body>
	<div class="comuHomeBar">
		<ul>
			<li class="comuHomeTitle" onclick="location.href='/circle/community/comuList'"><a>동호회 홈</a></li>
		</ul>
	</div>
</body>
</html>