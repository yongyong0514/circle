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

<style>
table.postParts {
	border-collapse: collapse;
	text-align: left;
	width: 80%;
	lin-height: 1.5;
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
}

table.postParts thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.postParts tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.postParts td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

div.wrap {
	position: relative;
}

h1 {
	font-size: 25pt;
	text-align: center;
}

/* 검색 검색 버튼*/
.wrapper {
	position: absolute;
	top: 100%;
	left: 58%;
	transform: translate(-50%, -50%);
}

.container {
	position: relative;
	padding: 20px 50px;
}

.input {
	width: 200px;
	height: 10px;
	border: 3px solid #34495e;
	background: transparent;
	padding: 15px 30px;
	border-radius: 50px;
	outline: none;
	font-size: 18px;
	color: #34495e;
}

::-webkit-input-placeholder { /* Chrome/Opera/Safari */
	color: #34495e;
	font-family: Roboto;
	text-transform: uppercase;
}

::-moz-placeholder { /* Firefox 19+ */
	color: #34495e;
}

:-ms-input-placeholder { /* IE 10+ */
	color: #fff;
}

.close-btn {
	position: absolute;
	top: 25px;
	right: 52px;
	cursor: pointer;
	color: #34495e;
	background: #fff;
	border: 1px solid;
	width: 60px;
	height: 30px;
	border-radius: 20px;
	outline: none;
	text-transform: uppercase;
	font-weight: bold;
	transform: translateY(-2px);
}

/*select*/
/* 검색 박스 bodx*/
.postSearch {
	position: absolute;
	top: 100%;
	left: 48%;
	transform: translate(-50%, -50%);
}

.postSearch select {
	background-color: #fff;
	color: black;
	padding: 12px;
	width: 160px;
	height: 38px;
	border: 1px solid;
	border-radius: 3px;
	font-size: 11px;
	head_sele-shadow: 0 5px 25px rgba(0, 0, 0, 0.2);
	-webkit-appearance: button;
	appearance: button;
	outline: none;
}

.postSearch::before {
	color: #34495e;
	background-color: #34495e;
}

.postSearch select option {
	padding: 30px;
	font-size: 11px;
}

/* 개수 선택  se*/
.select {
	position: absolute;
	top: 15%;
	left: 90%;
	transform: translate(-50%, -50%);
}

.select select {
	background-color: #fff;
	color: black;
	padding: 12px;
	width: 160px;
	height: 38px;
	border: 1px solid;
	border-radius: 3px;
	font-size: 11px;
	head_sele-shadow: 0 5px 25px rgba(0, 0, 0, 0.2);
	-webkit-appearance: button;
	appearance: button;
	outline: none;
}

.select::before {
	color: #34495e;
	background-color: #34495e;
}

.select select option {
	padding: 30px;
	font-size: 11px;
}

</style>
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
	<br>
		<div class="content">
		
<!-- 개수로 보기 -->
<div style="float: right;" class="select">
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
			<th class="post_codes" scope="cols" style="width: 10%;">글번호</th>
			<th class="post_title" scope="cols" style="width: 50%;">제 목</th>
			<th class="post_writers" scope="cols" style="width: 10%;">작성자</th>
			<th class="post_dates" scope="cols" style="width: 10%;">작성일</th>
			<th class="post_cvps" scope="cols" style="width: 10%;">조회수</th>
		</tr>
	<c:forEach var="getSearch" items="${getSearch}">
		<tr>
			<td scope="row">${getSearch.post_code}</td>
			<td><a href='<c:url value='/post/postView?post_code=${getSearch.post_code}'/>'>${getSearch.post_title}</a></td>
			<td>${getSearch.emp_info_name}</td>
			<td>${getSearch.post_wdat}</td>
			<td>${getSearch.post_cvp}</td>
		</tr>
	</c:forEach>
	</table>

<!--  뷰페이징처리 -->
				<div style="text-align: center;" class="pagination">

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
<br>
<!-- 검색 -->
	
	<div id="postSearch" class="postSearch">
	<form id="searchForm" method="get" action="${pageContext.request.contextPath}/post/postSearch">
	<select name="type">
	<option value="">선택하기</option>
	<option value="post_title">제목</option>
	<option value="post_comt">내용</option>
	<option value="emp_info_name">작성자</option>
	
	</select>
	<input type="search" name="keyword">
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