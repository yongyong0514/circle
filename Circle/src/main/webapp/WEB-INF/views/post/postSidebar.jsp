<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/menuBar/menuLeftBar.css">
<style type="text/css">
.organChart{
position:absolute;
z-index:99;
}

</style>
</head>
<body>
	<div>
		<div class="menuLeftBar">
			<div class="menuLeftListTop">게시판</div>
			<div class="menuLeftListTitle"><a href="#">전체 게시글</a></div><!-- 공지 + 전사만 -->
			<div class="menuLeftListTitle"><a href="#">공지 사항</a></div>
			<div class="menuLeftListTitle"><a href="#">전사 게시판</a></div>
		</div>
		<div class="organChart">
			<c:import url="/organChart/getInfo"/>
		</div>
	</div>
</body>
</html>