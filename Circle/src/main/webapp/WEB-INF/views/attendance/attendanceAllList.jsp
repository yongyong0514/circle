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
	href="${pageContext.request.contextPath}/resources/css/attendance/attendanceAllList.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="common/attendanceLeftBar.jsp" />
		</div>
		<div class="container">
			<div class="content">
				<h1>전사 근태현황</h1>
				<br><br>
				<form action="#" method="POST">
					<div class="attendanceListTitle">
						<div class="dateType">
							<span class="arrowBtn"> ◀ </span>	
								<c:if test="true">	<!-- 주 선택 시 -->
									<span class="currentDate">2020-11-08 ~ 2020-11-14</span>
								</c:if>
	
								<c:if test="">	<!-- 달 선택 시 -->
									<span class="currentDate">2020-11</span>
								</c:if>
							<span class="arrowBtn"> ▶ </span>
						</div>
						<br><br>
						<button class="selectBtn" value="today">오늘</button>
						&nbsp;
						<button class="selectBtn" value="week">주간</button>
						<button class="selectBtn" value="month">월간</button>
						<br><br>
						<select name="seachValue">
							<option value="default">검색조건선택</option>
							<option value="weekTime">누적근무시간</option>
							<option value="deptName">부서명</option>
							<option value="empName">사원명</option>
							<option value="jobName">직급명</option>
						</select>
					</div>
					<br>
					<!-- 근태현황 리스트 시작 -->
					<div class="attendanceList">
						<table class="attendanceListTable">
							<tr>
								<th>이름</th>
								<th>누적근무시간</th>
								<th>일</th>
								<th>월</th>
								<th>화</th>
								<th>수</th>
								<th>목</th>
								<th>금</th>
								<th>토</th>
							</tr>
							<!-- 값 불러오기 시작 -->
							<c:forEach var="행" items="행s">
								<tr>
									<td>가나다</td>
									
								</tr>
							</c:forEach>
							<!-- 값 불러오기 끝 -->
						</table>
					</div>
				</form>
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