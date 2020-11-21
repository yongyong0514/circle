<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/attendance/allAttendanceStatistic.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="common/leftBar.jsp" />
		</div>
		<div class="container">
			<div class="content">
				<h1>전사 근태통계</h1>
				<br><br>
				<!-- 근태통계 요약 시작 -->
				<div class="summary">
					<div class="title">
						<span class="arrowBtn"> ◀ </span>	
						<span class="currentDate">2020-11</span>
						<span class="arrowBtn"> ▶ </span>
					</div>
					<br><br>
					<table class="summaryTable">
						<tr>
							<th>출근</th>
							<th>퇴근</th>
							<th>출근 미체크</th>
							<th>퇴근 미체크</th>
							<th>지각</th>
							<th>휴가</th>
							<th>결근</th>
							<th>자동퇴근</th>
						</tr>
						<!-- 값 불러오기 -->
						<tr>
							<td>20</td>
							<td>2</td>
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>1</td>
							<td>1</td>
							<td>5</td>
						</tr>
					</table>
				</div>
				<!-- 근태통계 요약 끝 -->
				<br><br>
				<!-- 근태통계 그래프 시작 -->
				<div class="graph">
					그래프영역
					
								
				</div>
				<!-- 근태통계 그래프 끝 -->
			</div>
		</div>
	</div>

	<!-- 왼쪽바 고정 추가 옵션 시작-->
	<script>
		$(function() {
			var leftBar = $(".leftBar").offset().top;
			$(window).scroll(function() {
				var window = $(this).scrollTop();
				console.log(leftBar + "left");
				console.log(window + "window");
				if (leftBar <= window) {
					$(".leftBar").addClass("fixed");
				} else {
					$(".leftBar").removeClass("fixed");
				}
			})
		});
	</script>
</body>
</html>