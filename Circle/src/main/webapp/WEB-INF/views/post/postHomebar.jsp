<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/post/postHomebar.css">
</head>
<body>
	<div class="postHomeBar">
		<div>
		<c:import url="${pageContext.request.contextPath}/post/postNoticeList" var="test" />
		 <c:set var="url" value="${pageContext.request.requestURL}" />
		 <c:set var="notice" value="http://localhost:8888/circle/post/postList"/>
		 <c:choose>
		 <c:when test= "${url} == ${notice}">
		 test xxxx
		 
		 <c:url var="notice" value="http://localhost:8888/circle/post/postList"/>
		 
		 </c:when>
		 </c:choose>
		 <c:if test = "${url eq notice}">
		<label> 	1 게시판</label>
		 </c:if>
		 <c:if test="uri/post/postNoticeList">
		 <label>2 게시판</label>
		 </c:if>
		 <c:if test="uri/post/postTestPart">
		 <label> 3 board</label>
		 </c:if>
		</div>
	</div>
	<div>
	 
	 <select name="type">
	 <c:choose>
	 
	 <c:when test = "uri eq ${pageContext.request.contextPath}/post/postNoticeList">
	 공지사항
	 </c:when>
	 </c:choose>
	 
	 
	 
	 <c:forEach var="postTestPart2" items="${postTestPart2}">
	 
	 
	 
	 <c:if test="uri eq ${pageContext.request.contextPath}/post/postNoticeList">
	 <option value="${pageContext.request.contextPath}/post/postList" selected>공지사항</option>


	 </c:if>
	 </c:forEach>
	 </select>
	 
	
	</div>
		<select name="post_type" onchange="location.href=this.value">
					<!-- 게시판 선택용으로 시도 -->
					<option>이동할 페이지를 선택하세요</option>
					<option value="${pageContext.request.contextPath}/post/postList">공지사항</option>
					<option	value="${pageContext.request.contextPath}/post/postNoticeList">다음페이지</option>
					<option	value="${pageContext.request.contextPath}/post/postTestPart">테스트페이지</option>
			</select>
	<script>
		// 넘어오는 변수으로 페이지 이동하기
		function moveurl(url) {
			location.href = url;
		}
	</script>

</body>
</html>

