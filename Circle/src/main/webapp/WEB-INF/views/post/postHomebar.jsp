<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<style type="text/css">
hearder{
width: 20%;
text-align:left;
}



</style>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/post/postHomebar.css">
</head>
<body>
	<div class="postHomeBar">
		<div class="hearder">
		<c:forEach var="postSelect" items="${postSelect}">
		<p class="head">${postSelect.post_title}게시판에 오신 것을 환영합니다.</p>
		</c:forEach>
		</div>
		<div>


				<!-- 게시판 선택용 -->
				<div><p class="sub">이동할 게시판을 선택 하세요</p> </div>
			<select name="post_type" onchange="location.href=this.value">
				<option value="">이동할 게시판</option>
				<option  value="${pageContext.request.contextPath}/post/postMain?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">게시판 메인</option>
				<option  value="${pageContext.request.contextPath}/post/postList/notice?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">공지사항</option>
				<option  value="${pageContext.request.contextPath}/post/postList/employee?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">전사게시판</option>
				<option  value="${pageContext.request.contextPath}/post/postList/team?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">개발본부</option>
			<!--  선택이 안됨 -->
			
			</select>
			
			<button type="button" id="postInsert" onclick="location.href='${pageContext.request.contextPath}/post/postInsert'">글쓰기</button>
		</div>
		
	</div>


</body>
</html>
