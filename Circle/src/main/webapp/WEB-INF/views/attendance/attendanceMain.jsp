<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/attendance/attendanceMain.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="components/attendanceLeftBar.jsp" />
		</div>
		<div class="container">
			<div class="content">
				<h1>근태현황(메뉴명)</h1>
				<br><br>
				<!-- 현재(이번주) 근태현황 시작 -->
				<div class="summary">
					<div class="title">
						<h3>기준일: 2020-11-13(금)</h3>
						<h3>기준 근무시간: 52h</h3>
					</div>
					<br><br>
					<table class="summaryTable">
						<tr>
							<th>이번주 누적</th>
							<th>이번주 초과</th>
							<th>이번주 잔여</th>
							<th>이번달 누적</th>
							<th>이번달 초과</th>
						</tr>
						<!-- 값 불러오기 -->
						<tr>
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
						<th>상세</th>
						<th>비고</th>
					</tr>			
					
					<!--
						리스트 형식으로 출력
						1. 동기(c:forEach)
						2. 비동기(aJax)		-> 실시간 반영할 부분 없음
					-->
					
					<!-- 주간 근태내역 시작 -->
					<c:forEach var="" items="">
						<tr class="">
							<td colspan="2">2020-11-08 ~ 2020-11-14</td>
							<td colspan="2">누적근무시간: 18h 2m</td>
							<td colspan="2">초과근무시간: 0h</td>
						</tr>
						
						<!-- 일간 근태내역 시작 -->
						<c:forEach var="" items="">

							<!-- 예시용 시작 -->
							<tr>
								<td>2020-11-12(목)</td>
								<td>09:00</td>
								<td>18:00</td>
								<td>08:00</td>
								<td>휴게시간 1h 제외</td>
								<td></td>
							</tr>

							<tr>
								<td>2020-11-13(목)</td>
								<td>09:00</td>
								<td>18:00</td>
								<td>08:00</td>
								<td>휴게시간 1h 제외</td>
								<td></td>
							</tr>
							
							<!-- 예시용 끝 -->
							
						</c:forEach>
						<!-- 일간 근태내역 끝 -->
						
					</c:forEach>
					<!-- 주간 근태내역 끝 -->
					
				</table>
				<!-- 근태이력(리스트) 끝 -->
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