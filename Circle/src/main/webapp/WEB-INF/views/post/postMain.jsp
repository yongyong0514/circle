<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="../post/postSidebar.jsp" />
		</div>
		<div class="container">
			<div class="contentBar">
				<jsp:include page="../post/postHomebar.jsp" />
			</div>
			<div class="content">
			
			<!-- 본문 -->
		
	<!-- 전체 게시판 불러오기 -->

	<table class="postParts">
		<tr>
			<th class="post_codes">글번호</th>
			<th class="post_types">게시판명</th>
			<th class="post_writers">작성자</th>
			<th class="post_title">제 목</th>
			<th class="post_dates">작성일</th>
			<th class="post_cvps">조회수</th>
		</tr>
	<c:forEach var="postMain" items="${postMain}">
			<tr>
				<td>${postMain.post_code}</td>
				<td>${postMain.post_type_title}</td>
				<td>${postMain.emp_info_name}</td>
				<td>${postMain.post_title}</td>
				<td>${postMain.post_wdat}</td>
				<td>${postMain.post_cvp}</td>
			
			</tr>
</c:forEach>
	</table>
		
		
		<!--  본문 종료 -->
			</div>
		</div>
	</div>


</body>
</html>