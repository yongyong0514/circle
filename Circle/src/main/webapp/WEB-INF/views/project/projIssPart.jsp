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
			<th class="pro_code">업무 코드</th>
			<th class="pro_title">업무명</th>
			<th class="pro_manager">담당자</th>
			<th class="pro_sdate">업무 진행단계</th>
			<th class="pro_edate">업무 상황</th>
		</tr>
	<c:forEach var="projIssMain" items="${projIssMain}">
		<tr>
			<td>${projIssMain.iss_code}</td>
			<td><a href='<c:url value='/project/projIssPart?iss_code=${projIssMain.iss_code}'/>'>${projIssMain.iss_title}</a></td>
			<td>${projIssMain.emp_info_name}</td>
			<td>${projIssMain.prog_title}</td>
			<td>${projIssMain.situ_title}</td>
		</tr>
	</c:forEach>
	</table>
		<!--  본문 종료 -->
			</div>
		</div>
		</div>


</body>
</html>