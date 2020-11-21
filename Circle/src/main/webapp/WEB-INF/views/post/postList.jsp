<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
		<div class="container">
			<div class="navLeft">
				<jsp:include page="../post/postSidebar.jsp" />
			</div>
			<div class="content">

				<div>
					<jsp:include page="../post/postHomebar.jsp" />
				</div>
				<!-- 내용 -->



				<div class="filter"></div>

				<table class="post">

					<tr>
						<th>글번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>

					<tr>
						<td>1</td>
						<td>Jean</td>
						<td>leBon</td>
						<td>1368</td>
						<td>18 Nov 1962</td>
						<td>5000$</td>
					</tr>
					<tr>
						<td>2</td>
						<td>jack</td>
						<td>Duppont</td>
						<td>1368</td>
						<td>18 Dec 1962</td>
						<td>2000$</td>
					</tr>
					<tr>
						<td>3</td>
						<td>Jean</td>
						<td>leBon</td>
						<td>1368</td>
						<td>18 Nov 1972</td>
						<td>4200$</td>
					</tr>
					<tr>
						<td>4</td>
						<td>Nadia</td>
						<td>leBon</td>
						<td>1368</td>
						<td>18 Mar 1982</td>
						<td>6300$</td>
					</tr>
					<tr>
						<td>5</td>
						<td>Nadia</td>
						<td>leBon</td>
						<td>1368</td>
						<td>18 Mar 1982</td>
						<td>6300$</td>
					</tr>
					<tr>
						<td>6</td>
						<td>Nadia</td>
						<td>leBon</td>
						<td>1368</td>
						<td>18 Mar 1982</td>
						<td>6300$</td>
					</tr>
					<tr>
						<td>7</td>
						<td>Nadia</td>
						<td>leBon</td>
						<td>1368</td>
						<td>18 Mar 1982</td>
						<td>6300$</td>
					</tr>
					<tr>
						<td>8</td>
						<td>Nadia</td>
						<td>leBon</td>
						<td>1368</td>
						<td>18 Mar 1982</td>
						<td>6300$</td>
					</tr>

				</table>
				</div>
				</div>
				</div>

</body>
</html>