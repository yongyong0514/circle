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
	href="${pageContext.request.contextPath}/resources/css/attendance/main.css">
</head>
<!-- 아이콘 참조 -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="common/leftBar.jsp" />
		</div>
		<div class="organChart">
			<jsp:include page="../common/menuOrganChart.jsp"/>
		</div>
		<div class="container">
			<div class="content">
			
			<c:out value="${map.weekAttList }"/>
			
				<h1>근태현황(메뉴명)</h1>
				<br>
				<!--  근태이력(리스트) 시작 -->
				<div class="summary">
					<div class="title">
						<h3 style="text-align:center"> 기준일 </h3>
						<br>
						<div class="dateSelect">
							<span><i class='fas fa-angle-left'></i></span>
							<c:out value="${today}"/>
							<span><i class='fas fa-angle-right'></i></span>
						</div>
						<h3>기준 근무시간: <c:out value="${map.worktimePerWeek }"/>h</h3>
					</div>
					<br><br>
					<table class="summaryTable">
						<tr>
							<th>기간</th>
							<th>이번주 누적</th>
							<th>이번주 초과</th>
							<th>이번주 잔여</th>
							<th>이번달 누적</th>
							<th>이번달 초과</th>
						</tr>
						<tr>
							<td>
 								<%-- <c:out value="${map.weekAttList.AttendanceInfo[0].weekStartDate }"/>
								<span> ~ </span>
 								<c:out value="${map.weekAttList.AttendanceInfo[0].weekEndDate }"/> --%>
							</td>
							<td>18h 2m</td>
							<td>0h</td>
							<td>33h 58m</td>
							<td>18h 2m</td>
							<td>0h</td>
						</tr>
					</table>
				</div>
				<!-- 현재(이번주) 근태현황 끝 -->
				<br><br>
				<!-- 근태이력(리스트) 시작 -->
				<table class="historyTable">
					<tr>
						<th>일자</th>
						<th>출근시간</th>
						<th>퇴근시간</th>
						<th>근무시간</th>
						<th>작성구분</th>
						<th>근무형태</th>
						<th>상세</th>
						<th>비고</th>
					</tr>			
					<!-- 주간 근태내역 시작 -->
					<c:forEach var="주차" items="주차s">
						<tr class="week">
							<td colspan="2">2020-11-08 ~ 2020-11-14</td>
							<td colspan="3">누적근무시간: 18h 2m</td>
							<td colspan="3">초과근무시간: 0h</td>
						</tr>
						
						<!-- 일간 근태내역 시작 -->
						<c:forEach var="AttendanceInfo" items="${map.list }">
							<tr>
								<td><c:out value="${AttendanceInfo.atdc_hstr_dat }"/></td>
								<td><c:out value="${AttendanceInfo.atdc_hstr_stim}"/></td>
								<td><c:out value="${AttendanceInfo.atdc_hstr_etim}"/></td>
								<td><c:out value="${AttendanceInfo.workTime }"/></td>
								<td><c:out value="${AttendanceInfo.atdc_hstr_writ_type}"/></td>
								<td><c:out value="${AttendanceInfo.atdc_hstr_type}"/></td>
								<td>휴게시간 1h 제외</td>
								<td></td>
							</tr>
						</c:forEach>
						<!-- 일간 근태내역 끝 -->
						
					</c:forEach>
					<!-- 주간 근태내역 끝 -->
					
				</table>
				<!-- 근태이력(리스트) 끝 -->
			</div>
		</div>
	</div>

	<script>
		$(function() {
			<!-- 왼쪽바 고정 추가 옵션 시작-->
			var leftBar = $(".leftBar").offset().top;
			$(window).scroll(function() {
				var window = $(this).scrollTop();
				if (leftBar <= window) {
					$(".leftBar").addClass("fixed");
				} else {
					$(".leftBar").removeClass("fixed");
				}
			})
			<!-- 왼쪽바 고정 추가 옵션 끝 -->
		});
	</script>
</body>
</html>