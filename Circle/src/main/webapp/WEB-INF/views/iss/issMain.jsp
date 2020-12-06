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
			<jsp:include page="../project/projSidebar.jsp" />
		</div>
		<div class="container">
			<div class="contentBar">
				<jsp:include page="../project/projHomebar.jsp" />
			</div>
			<div class="content">
			
			<!-- 본문 -->
	<!-- 전체 게시판 불러오기 -->
	<table class="projParts">
		<tr>
			<th class="pro_code">이슈 코드</th>
			<th class="pro_title">이슈명</th>
			<th class="pro_manager">담당자</th>
			<th class="pro_sdate">이슈 시작일</th>
			<th class="pro_edate">이슈 종료일</th>
		</tr>
	<c:forEach var="projList" items="${projList}">
		<tr>
			<td>${projList.pro_code}</td>
			<td>${projList.pro_title}</td>
			<td>${projList.emp_info_name}</td>
			<td>${projList.pro_sdate}</td>
			<td>${projList.pro_edate}</td>
		</tr>
	</c:forEach>
	</table>
		<!--  본문 종료 -->
			</div>
		</div>
		</div>


</body>
</html>