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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/post/postList.css">


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
			<!-- 내용 -->

			<table class="post">

				<tr>
					<th class="code">글번호</th>
					<th class="type">분류</th>
					<th class="title">제목</th>
					<th class="writer">작성자</th>
					<th class="date">작성일</th>
					<th class="cvp">조회수</th>
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
			<input type="submit" value="글쓰기">


		
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