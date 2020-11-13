<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/addressBook/addressBookLeftBar.css">
</head>
<body>
	<div>
		<div class="menuLeftBar">
			<div class="menuLeftListTop">주소록</div>
			<div class="menuLeftListBtn"><button class="menuLeftBtn">새 주소 추가</button></div>
			<div class="menuLeftList0"></div>
			<div class="menuLeftListTitle">공용주소록</div>
				<a href="#"><div class="menuLeftList">전사 주소록</div></a>
			<div class="menuLeftListTitle">부서 주소록</div>		
			<c:forEach var="부서" items="부서들">
				<a href="#"><div class="menuLeftList">부서1....</div></a>
				<a href="#"><div class="menuLeftList">부서2....</div></a>
				<a href="#"><div class="menuLeftList">부서3....</div></a>
				<a href="#"><div class="menuLeftList">부서4....</div></a>
			</c:forEach>			
			<div class="menuLeftListTitle">개인주소록</div>
				<a href="#"><div class="menuLeftList">개인주소1</div></a>
				<a href="#"><div class="menuLeftList">개인주소2</div></a>
				<a href="#"><div class="menuLeftList">개인주소3</div></a>															
		</div>
	</div>
</body>
</html>