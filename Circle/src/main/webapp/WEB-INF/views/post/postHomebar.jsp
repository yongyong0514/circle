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
			<c:if test="${! empty postName }">
				<c:out value="${postName }에 오신걸 환영합니다." />
			</c:if>
		</div>
		<div>
			<select name="post_type" onchange="location.href=this.value">
				<!-- 게시판 선택용으로 시도 -->
				<option>이동할 게시판</option>
				<option id="post_type">testpage</option>
				<option  value="${pageContext.request.contextPath}/post/postTestPart?type=notice">공지사항</option>
				<option 
					value="${pageContext.request.contextPath}/post/postTestPart?type=new">다음페이지</option>
				<option 
					value="${pageContext.request.contextPath}/post/postTestPart?type=test">테스트페이지</option>
			</select>
			<select id="post_type" name="post_type" onchange="location.href=this.value">
				<!-- 게시판 선택용으로 시도 -->
				<option>작성 게시판</option>
				<option value="${pageContext.request.contextPath}/post/postTestInsert">insertpage</option>
				<option
					value="${pageContext.request.contextPath}/post/postNoticeList">걍 넣어놈</option>
				<option
					value="${pageContext.request.contextPath}/post/postTestPart?type=test">테스트페이지</option>
			</select>
		</div>
	</div>

</body>
</html>
