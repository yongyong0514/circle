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
	href="${pageContext.request.contextPath}/resources/css/attendance/allAttendanceList.css">
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
		<div class="organChart">
			<c:import url="/organChart/getInfo"/>
		</div>
		<div class="container">
			<div class="content">
				<h1>전사 근태현황</h1>
				<br>
				<!-- 날짜선택 시작 -->
				<div class="dateSelectDiv">
					<div class="title">
						<div class="dateSelect">
							<button onclick="changeDate(0);" value="thisWeek">이번주</button>&nbsp;&nbsp;
							<button onclick="changeDate(0);" value="thisMonth">이번달</button>
							<br><br>
							<i onclick="changeDate(-1);" class='fas fa-angle-left'></i>
							<div>&nbsp;<c:out value="오늘날짜가 표시됩니다"/>&nbsp;</div>
							<i onclick="changeDate(1);" class='fas fa-angle-right'></i>
						</div>
					</div>
				</div>
				<!-- 날짜선택 끝 -->
				<br><br>
				<hr>
				<c:out value="${mapList }"/>
				
				
				
				<hr>
				
				<!-- 검색 시작 -->
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
				</form>
				<!-- 검색 끝 -->
				
					<!-- 주간 근태현황 리스트 시작 -->
					<br>
					<div class="weekAttendanceList">
						<table class="weekAttendanceListTable">
							<tr>
								<th>이름</th>
								<th>누적근무시간</th>
								<th>8(일)</th>
								<th>9()월)</th>
								<th>10(화)</th>
								<th>11(수)</th>
								<th>12(목)</th>
								<th>13(금)</th>
								<th>14(토)</th>
							</tr>
							<!-- 값 불러오기 시작 -->
							<c:forEach var="행" items="행s">
								<tr>
									<td>
										<div class="empInfo">
											<div class="left">
									 			<img src="#">
											</div>
											<div class="right">
												<span class="titleInfo">가나다</span>
												<span>대리</span>
												<span>영업팀</span>
											</div>
										</div>
									</td>
									<td>
										<div class="accumulativeWeekAttendanceTime">
											<span class="titleInfo">18h 2m</span>
											<span>기본: 18h 2m</span>
											<span>초과: 0h 0m</span>
										</div>
									</td>
									
									<!-- 요일 반복 시작 -->
									<c:forEach var="day" items="doys">
									</c:forEach>
									
									<td>
										<div class="dayAttendanceTime">
											<span class="titleInfo">08:59 - 18:00</span>
											<span>9h 1m</span>
										</div>
									</td>
									<td>
										<div class="dayAttendanceTime">
											<span class="titleInfo">08:59 - 18:00</span>
											<span>9h 1m</span>
										</div>
									</td>
									<td>
										<div class="dayAttendanceTime">
											<span class="titleInfo">08:59 - 18:00</span>
											<span>9h 1m</span>
										</div>
									</td>
									<td>
										<div class="dayAttendanceTime">
											<span class="titleInfo">08:59 - 18:00</span>
											<span>9h 1m</span>
										</div>
									</td>
									<td>
										<div class="dayAttendanceTime">
											<span class="titleInfo">08:59 - 18:00</span>
											<span>9h 1m</span>
										</div>
									</td>
									<td>
										<div class="dayAttendanceTime">
											<span class="titleInfo">08:59 - 18:00</span>
											<span>9h 1m</span>
										</div>
									</td>
									<td>
										<div class="dayAttendanceTime">
											<span class="titleInfo">08:59 - 18:00</span>
											<span>9h 1m</span>
										</div>
									</td>
									<!-- 요일 반복 끝 -->
								</tr>
							</c:forEach>
							<!-- 값 불러오기 끝 -->
						</table>
					</div>
					<!-- 주간 근태현황 리스트 끝 -->
					
					<!-- 월간 근태현황 리스트 시작 -->
					<br>
					<div class="monthAttendanceList">
						<table class="monthAttendanceListTable">
							<tr>
								<th>이름</th>
								<th>누적근무시간</th>
								<th>1주차</th>
								<th>2주차</th>
								<th>3주차</th>
								<th>4주차</th>
								<th>5주차</th>
								<th>6주차</th>
							</tr>
							<!-- 값 불러오기 시작 -->
							<c:forEach var="행" items="행s">
								<tr>
									<td>
										<div class="empInfo">
											<div class="left">
												<img src="#">
											</div>
											<div class="right">
												<span class="titleInfo">가나다</span>
												<span>대리</span>
												<span>영업팀</span>
											</div>
										</div>
									</td>
									<td>
										<div class="accumulativeMonthAttendanceTime">
											<span class="titleInfo">18h 2m</span>
											<span>기본: 18h 2m</span>
											<span>초과: 0h 0m</span>
										</div>
									</td>
									
									<!-- 요일 반복 시작 -->
									<c:forEach var="day" items="doys">
									</c:forEach>
									<td>
										<div class="accumulativeWeekAttendanceTime">
											<span class="titleInfo">18h 2m</span>
											<span>기본: 18h 2m</span>
											<span>초과: 0h 0m</span>
										</div>
									</td>
									<td>
										<div class="accumulativeWeekAttendanceTime">
											<span class="titleInfo">18h 2m</span>
											<span>기본: 18h 2m</span>
											<span>초과: 0h 0m</span>
										</div>
									</td>
									<td>
										<div class="accumulativeWeekAttendanceTime">
											<span class="titleInfo">18h 2m</span>
											<span>기본: 18h 2m</span>
											<span>초과: 0h 0m</span>
										</div>
									</td>
									<td>
										<div class="accumulativeWeekAttendanceTime">
											<span class="titleInfo">18h 2m</span>
											<span>기본: 18h 2m</span>
											<span>초과: 0h 0m</span>
										</div>
									</td>
									<td>
										<div class="accumulativeWeekAttendanceTime">
											<span class="titleInfo">18h 2m</span>
											<span>기본: 18h 2m</span>
											<span>초과: 0h 0m</span>
										</div>
									</td>
									<td>
										<div class="accumulativeWeekAttendanceTime">
											<span class="titleInfo">18h 2m</span>
											<span>기본: 18h 2m</span>
											<span>초과: 0h 0m</span>
										</div>
									</td>
									<!-- 요일 반복 끝 -->
								</tr>
							</c:forEach>
							<!-- 값 불러오기 끝 -->
						</table>
					</div>
					
					<!-- 월간 근태현황 리스트 끝 -->
			</div>
		</div>
	</div>

	<!-- 왼쪽바 고정 추가 옵션 시작-->
	<script>
		$(function() {
			var leftBar = $(".leftBar").offset().top;
			$(window).scroll(function() {
				var window = $(this).scrollTop();
				if (leftBar <= window) {
					$(".leftBar").addClass("fixed");
				} else {
					$(".leftBar").removeClass("fixed");
				}
			})
		});
		
		
		
		<!-- 날짜변경 옵션 시작 -->
		function changeDate(num){
			if(num == 0){
				var today = new Date();
			} else{
				var today = new Date("${today}");
			}
			var date = new Date(today.valueOf()+(24*60*60*1000)*num);
			
			var dateStr = getFormatDate(date);

			location.href = "${pageContext.request.contextPath}/attendance/myAttendance?dateStr=" + dateStr;
		};	
			
		<!-- 날짜변경 옵션 끝 -->
		
		<!-- 날짜포맷 변경 시작 -->
		function getFormatDate(date){
		    var year = date.getFullYear();				//yyyy
		    var month = (1 + date.getMonth());			//M
		    month = month >= 10 ? month : '0' + month;	//month 두자리로 저장
		    var day = date.getDate();					//d
		    day = day >= 10 ? day : '0' + day;			//day 두자리로 저장
		    return  year + '-' + month + '-' + day;		//형태 생성
		}
		<!-- 날짜포맷 변경 끝 -->
		
	</script>
</body>
</html>