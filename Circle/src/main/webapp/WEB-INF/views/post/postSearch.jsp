<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
		
<!-- 개수로 보기 -->
<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div>
<!-- 게시판 불러오기 -->
<table class="postParts">
		<tr>
			<th class="post_codes">글번호</th>
			<th class="post_types">게시판명</th>
			<th class="post_writers">작성자</th>
			<th class="post_title">제 목</th>
			<th class="post_dates">작성일</th>
			<th class="post_cvps">조회수</th>
		</tr>
	<c:forEach var="getSearch" items="${getSearch}">
		<tr>
			<td>${getSearch.post_code}</td>
			<td><a href='<c:url value='/post/postView?post_code=${getSearch.post_code}'/>'>${getSearch.post_title}</a></td>
			<td>${getSearch.emp_info_name}</td>
			<td>${getSearch.post_wdat}</td>
			<td>${getSearch.post_cvp}</td>
		</tr>
	</c:forEach>
	</table>

<!--  뷰페이징처리 -->
<div>
<c:set var="Post"/>
<c:if test="${paging.startPage != 1}">
<a href="${pageContext.request.contextPath}/post/postList/${url}?nowPage=${paging.startPage - 1}&cntPerPage${paging.cntPerPage}">&lt;</a>
	<a href="post/postList/${url}?nowPage=${paging.startPage - 1}&cntPerPage${paging.cntPerPage}">&lt;</a>

</c:if>
<c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p">
<c:choose>
<c:when test="${p == paging.nowPage }">
<b>${p}</b>
</c:when>
<c:when test="${ p != paging.nowPage }">
<a href="${pageContext.request.contextPath}/post/postList/${url}?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
</c:when>

</c:choose>
</c:forEach>
<c:if test="${paging.endPage != paging.lastPage }">
	<a href="${pageContext.request.contextPath}/post/postList/${url}?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
</c:if>

</div>

<!-- 검색 -->
	
	<div id="postSearch">
	<form id="searchForm" method="get" action="${pageContext.request.contextPath}/post/postSearch">
	<select name="type">
	<option value="">선택하기</option>
	<option value="post_title">제목</option>
	<option value="post_comt">내용</option>
	<option value="emp_info_name">작성자</option>
	
	</select>
	<input type="text" name="keyword">
	<input type="submit" id="searchBtn" value="검색">
	</form>
	
	</div>


			<!-- 옵션선택 끝 -->


		</div>
	</div>
	</div>


	<script>
		$(function() {
			$('tbody tr[href]').click(function() {
				console.log($(this).attr('href'));
				//window.location = $(this).attr('href');
			}).find('a').hover(function() {
				$(this).parents('tr').unbind('click');
			}, function() {
				$(this).parents('tr').click(function() {
					console.log($(this).attr('href'));
					//window.location = $(this).attr('href');
				});
			});
		});
	</script>
</body>
</html>