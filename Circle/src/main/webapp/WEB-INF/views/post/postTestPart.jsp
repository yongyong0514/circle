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
							<th>글번호</th>
							<th>분류</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
						<c:forEach var="postNoticeList" items="${postNoticeList}">
							<tr>
								<td>${postNoticeList.post_code}</td>
								<td>${postNoticeList.post_type_title}</td>
								<td>${postNoticeList.post_title}</td>
								<td>${postNoticeList.emp_info_name}</td>
								<td>${postNoticeList.post_wdat}</td>
								<td>${postNoticeList.post_cvp}</td>
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