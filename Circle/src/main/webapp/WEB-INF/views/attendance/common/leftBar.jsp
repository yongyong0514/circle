<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/attendance/common/leftBar.css">
</head>
<body>
	<div>
		<div class="menuLeftBar">
			<!-- 현재 근태현황 상태표시 시작 -->
			<div class="attendanceStatus">
				<table class="attendanceStatusTable">
					<tr>
						<th colspan="2">2020-11-13(금)</th>
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
			<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/myInfo'">내 인사정보</div>
			<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/myVacation'">내 연차이력</div>
			
			<!--
				근태/인사관리 메뉴 시작
				- 인사 담당자 확인 후 출력
			 -->
			<div class="menuLeftListTitle">전사근태관리</div>
				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/allAttendanceList'">전사 근태현황</div>
				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/allAttendanceStatistic'">전사 근태통계</div>
				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/allInfoList'">전사 인사정보</div>
				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/allVacationList'">전사 연차현황</div>
				<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/attendance/allVacationHistory'">전사 연차 사용내역</div>
			<!-- 근태/인사관리 메뉴 끝 -->
					
			<!-- 메뉴 끝 -->

			<!-- 조직도 버튼 시작 -->
			<div class="organChartBorder">
				<div class="organChart">조직도</div>
			</div>
			<!-- 조직도 버튼 끝 -->
		</div>
	</div>
	
	<!-- 조직도 패널 시작-->
	<div class="organPanel">
		<div class="topPanel">
			<div class="search">
				<input type="text" name="searchValue" placeholder="사번/이름/부서/직위/이메일"/>
			</div>
			<div class="closeBtn">
				<span>X</span>
			</div>
		</div>
		<div class="members">
			<ul>
				<li>
					<ul>
						<li>대표이사
							<ul>
								<li>김대표</li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
			
			<ul>
				<li>사업본부</li>
			</ul>
			
			<ul>
				<li>경영지원본부
					<ul>
						<li>인사팀
							<ul>
								<li>가나다</li>
								<li>이순신</li>
							</ul>
						</li>
						<li>경영팀
							<ul>
								<li>고길동</li>
								<li>둘리</li>
							</ul>
						</li>
						<li>총무팀</li>
					</ul>
				</li>
			</ul>
			
			<ul>
				<li>개발본부
					<ul>
						<li>디자인팀</li>
						<li>서비스개발팀</li>
						<li>플랫폼운영팀</li>
					</ul>
				</li>
			</ul>
			
			<ul>
				<li>영업본부
					<ul>
						<li>마케팅팀</li>
						<li>영업팀</li>
						<li>유통팀</li>
					</ul>
				</li>
			</ul>
			
			<!-- 부서등급이 2인 부서 -->
			<c:forEach var="부서2" items="부서2s">
				<ul>
					<li>개발본부
						<ul>
							<!-- 부서등급이 2인 부서 -->
							<c:forEach var="부서3" items="부서3s">
								<li>디자인팀</li>
								<li>서비스개발팀</li>
								<li>플랫폼운영팀</li>
							</c:forEach>
						</ul>
					</li>
				</ul>
			</c:forEach>
		</div>
	</div>
	<!-- 조직도 버튼 끝 -->
</body>

<!-- 조직도 스크립트 시작 -->
<script>
	$(function(){
		$(".organChart").hover(function(){
			$(".organChart").addClass("activeBtn");
		}, function(){
			$(".organChart").removeClass("activeBtn");
		});
	});
	
	
</script>
<!-- 조직도 스크립트 끝 -->
</html>