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
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js'></script>
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
				<h1>근태현황(메뉴명)</h1>
				<br>
				<!--  근태이력(리스트) 시작 -->
				<div class="summary">
					<div class="title">
						<div class="dateSelect">
							<button onclick="changeDate(0);" value="today">오늘</button>
							<br><br>
							<i onclick="changeDate(-1);" class='fas fa-angle-left'></i>
							<div>&nbsp;<c:out value="${today}"/>&nbsp;</div>
							<i onclick="changeDate(1);" class='fas fa-angle-right'></i>
						</div>
					</div>
					<br><br>
					<table class="summaryTable">
						<tr>
							<th>기간</th>
							<th>이번주 누적</th>
							<th>이번주 초과</th>
							<th>이번주 잔여</th>
							<th>기준근무시간</th>
						</tr>
						<tr>
							<td>
 								<c:out value="${map.weekStackInfo.weekStartDate }"/>
								<span> ~ </span>
 								<c:out value="${map.weekStackInfo.weekEndDate }"/>
							</td>
							<td>
								<c:out value="${map.weekStackInfo.weekSumWorktimeHour }"/>h
								<c:out value="${map.weekStackInfo.weekSumWorktimeMinute }"/>m

							</td>
							<td>
								<c:out value="${map.weekStackInfo.weekOverWorktimeHour }"/>h 
								<c:out value="${map.weekStackInfo.weekOverWorktimeMinute }"/>m
							</td>
							<td>
								<c:out value="${map.weekStackInfo.weekRemainWorktimeHour }"/>h 
								<c:out value="${map.weekStackInfo.weekRemainWorktimeMinute }"/>m
							</td>
							<td>
								<c:out value="${map.weekStackInfo.worktimePerWeek }"/>h
							</td>
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
					<!-- 일간 근태내역 시작 -->
					<c:forEach var="AttendanceInfo" items="${map.weekAttList }">
						<tr>
							<td><c:out value="${AttendanceInfo.atdc_hstr_dat }"/></td>
							<td><c:out value="${AttendanceInfo.atdc_hstr_stim}"/></td>
							<td><c:out value="${AttendanceInfo.atdc_hstr_etim}"/></td>
							<td>
								<c:out value="${AttendanceInfo.workTimeHour }"/>h							
								<c:out value="${AttendanceInfo.workTimeMinute }"/>m						
							</td>
							<td><c:out value="${AttendanceInfo.atdc_hstr_writ_type}"/></td>
							<td><c:out value="${AttendanceInfo.atdc_hstr_type}"/></td>
							<td>휴게시간 1h 제외</td>
							<td></td>
						</tr>
					</c:forEach>
					<!-- 일간 근태내역 끝 -->
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
		
		<!-- 날짜변경 옵션 시작 -->
		function changeDate(num){
			if(num == 0){
				var today = new Date();
			} else{
				var today = new Date("${today}");
			}
			var date = new Date(today.valueOf()+(24*60*60*1000)*num);
			
			var dateStr = getFormatDate(date);

			location.href = "${pageContext.request.contextPath}/attendance/main?dateStr=" + dateStr;
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