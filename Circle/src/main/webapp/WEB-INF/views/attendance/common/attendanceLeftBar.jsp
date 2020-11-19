<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/attendance/attendanceLeftBar.css">
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
			<a href="#"><div class="menuLeftList">내 근태이력</div></a>
			<a href="#"><div class="menuLeftList">내 인사정보</div></a>
			<a href="#"><div class="menuLeftList">내 연차이력</div></a>
			
			<!--
				근태/인사관리 메뉴 시작
				- 인사 담당자 확인 후 출력
			 -->
			<div class="menuLeftListTitle">전사근태관리</div>
				<a href="#"><div class="menuLeftList">전사 근태현황</div></a>
				<a href="#"><div class="menuLeftList">전사 근태통계</div></a>
				<a href="#"><div class="menuLeftList">전사 인사정보</div></a>
				<a href="#"><div class="menuLeftList">전사 연차현황</div></a>
				<a href="#"><div class="menuLeftList">전사 연차 사용내역</div></a>
			<!-- 근태/인사관리 메뉴 끝 -->
					
			<!-- 메뉴 끝 -->
		</div>
	</div>
</body>
</html>