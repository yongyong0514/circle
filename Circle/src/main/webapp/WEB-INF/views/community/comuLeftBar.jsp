<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/menuBar/menuLeftBar.css">
</head>
<body>
	<div>
		<div class="menuLeftBar">
			<div class="menuLeftListTop" onclick="location.href='/circle/community/comuList'">동호회</div>
			
			<div class="menuLeftListBtn">
			<%-- <c:if test="${ !empty sessionScope.member }">  --%>
			<button class="menuLeftBtn" onclick="location.href='/circle/community/comuAdd'">글 작성</button>
			<%-- 	</c:if> --%>
			</div>
			
			<div class="menuLeftListBtn">
			<%-- <c:if test="${ !empty sessionScope.member }">  --%>
			<button class="menuLeftBtn" onclick="location.href='/circle/community/comuApp'">가입 신청</button>
			<%-- 	</c:if> --%>
			</div>
			
			<div class="menuLeftList"></div>
			
			<div class="menuLeftListTitle"># 가입 동호회</div>
			
			<div class="menuLeftList"></div>
			<div class="menuLeftList"></div>					
			<div class="menuLeftList"></div>
			<div class="menuLeftList"></div>
			<div class="menuLeftList"></div>
			
			<!-- <div class="menuLeftListTitle"># 가입 회원</div> -->
									
			<!-- <div class="menuLeftList">전체</div>
			<div class="menuLeftList"></div> -->															
		</div>
	</div>
</body>
</html>