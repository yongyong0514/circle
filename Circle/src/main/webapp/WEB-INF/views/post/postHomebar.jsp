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
				<c:out value="전체 게시판"/>
			</c:otherwise>
			</c:choose>
		</div>
		<div>


				<!-- 게시판 선택용 -->
			<select name="post_type" onchange="location.href=this.value">
				<option value="">이동할 게시판</option>
				<option  value="${pageContext.request.contextPath}/post/postMain">게시판 메인</option>
				<option  value="${pageContext.request.contextPath}/post/postList/notice">공지사항</option>
				<option  value="${pageContext.request.contextPath}/post/postList/employee">전사게시판</option>
			</select>
			
			
			<button type="button" id="postInsert" onclick="location.href='${pageContext.request.contextPath}/post/postInsert'">글쓰기</button>
		</div>
	</div>

<script>

function insert() {
	
}

</script>

</body>
</html>
