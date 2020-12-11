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
		<div>
		<div>

		<div>
			<button class="buttonSize"
				onclick="location='${pageContext.request.contextPath}/project/projInsertProject'">신규
				프로젝트 생성</button>
		</div>
		<div>
			<button class="buttonSize"
				onclick="location='${pageContext.request.contextPath}/project/projInsertIss'">신규
				업무 생성</button>
		</div>
		<div>
			<button class="buttonSize"
				onclick="location='${pageContext.request.contextPath}/project/projMain'">프로젝트
				리스트</button>
		</div>
		<div>
			<button class="buttonSize"
				onclick="location='${pageContext.request.contextPath}/project/projIssAll'">업무
				리스트</button>
		</div>
	<div>
			<button class="buttonSize"
				onclick="location='${pageContext.request.contextPath}/project/projKanban'">Kanban Board</button>
		</div>
			<div>
			<button class="buttonSize"
				onclick="location='${pageContext.request.contextPath}/project/projTodo'">To-Do List</button>
		</div>
		


</div>
		</div>

	</div>


</body>
</html>
