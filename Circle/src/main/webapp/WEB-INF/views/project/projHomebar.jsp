<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<script>


</script>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/post/postHomebar.css">
</head>
<body>
	<div class="postHomeBar">
		<div>
		<c:choose>
		<c:when test="${! empty postName }">
			<c:if test="${! empty postName }">
				<c:out value="${postName }" />
			</c:if>
			</c:when>
			<c:otherwise>
				<c:out value="프로젝트"/>
			</c:otherwise>
			</c:choose>
		</div>

	</div>


</body>
</html>
