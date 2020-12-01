<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/attendance/common/leftBar.css">
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js'></script>
</head>
<body>
	<div>
		<div class="menuLeftBar">
			<!-- 현재 근태현황 상태표시 시작 -->
			<div class="attendanceStatus">
				<table class="attendanceStatusTable">
					<tr>
						<th class="clock" colspan="2"></th>
					</tr>
					<tr>
						<td>출근시간</td>
						<td>08:57</td>
					</tr>
					<tr>
						<td>퇴근시간</td>
						<td>미등록</td>
					</tr>
					<tr>
						<td>누적</td>
						<td>18h 02m</td>
					</tr>
					<tr>
						<td colspan="2">34%</td>
				</table>
			</div>
			<!-- 현재 근태현황 상태표시 끝 -->

			<!-- 메뉴 시작 -->
			<div class="menuLeftListTitle">인사/근태관리</div>
			<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/main'">내 근태이력</div>
			<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/empInfo/myInfo'">내 인사정보</div>
			<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/vacation/myVacation'">내 연차이력</div>
			
			<!--
				근태/인사관리 메뉴 시작
				- 인사 담당자 확인 후 출력
			 -->
			<div class="menuLeftListTitle">전사근태관리</div>
				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/allAttendanceList'">전사 근태현황</div>
				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/allAttendanceStatistic'">전사 근태통계</div>
				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/empInfo/allInfoList'">전사 인사정보</div>
				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/allVacationList'">전사 연차현황</div>
				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/allVacationHistory'">전사 연차 사용내역</div>
			<!-- 근태/인사관리 메뉴 끝 -->
					
			<!-- 메뉴 끝 -->
		</div>
		
	</div>
</body>

<script>
	function displayTime() {
	    var time = moment().format('YYYY년 MM월 D일<br>HH시 mm분');
	    $('.clock').html(time);
	    setTimeout(displayTime, 1000);
	}
	
	$(document).ready(function() {
	    displayTime();
	});
	
</script>

</html>