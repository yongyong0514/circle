<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/post/postList.css">


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "PostList?nowPage=${paging.nowPage}&cntPerPage=" + sel;
	}
</script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
		<div class="container">
			<div class="navLeft">
				<jsp:include page="../post/postSidebar.jsp" />
			</div>
			<div class="content">

				<jsp:include page="../post/postHomebar.jsp" />
			</div>
			<!-- 내용 -->

			<div class="filter">
				
				<div>
					<table class="post">

						<tr>
							<th>글번호</th>
							<th>분류</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
						<c:forEach var="postList" items="${postList}">
							<tr>
								<td>${postList.post_code}</td>
								<td>${postList.post_type_title}</td>
								<td>${postList.post_title}</td>
								<td>${postList.emp_info_name}</td>
								<td>${postList.post_wdat}</td>
								<td>${postList.post_cvp}</td>
							</tr>
						</c:forEach>

					</table>
				
				<div>
					<c:if test="${paging.startPage != 1 }">
						<a
							href="/PostList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
						var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a href="/Postist?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a
							href="/PostList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>

			
			<!-- 옵션선택 끝 -->

		</div>
	</div>





</div>


<script>
	function goPage(url, pages, lines) {
		url += '?' + "pages=" + pages + "&lines=" lines;
		
		location.href = url;
	}
</script>

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