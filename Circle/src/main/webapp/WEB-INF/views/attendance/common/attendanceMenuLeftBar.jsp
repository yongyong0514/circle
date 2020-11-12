<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/attendance/attendanceMenuLeftBar.css">
</head>
<body>
	<div>
		<div class="menuLeftBar">
			<table class="statusTable">
				<tr>
					<td colspan="2">2020-11-12(목)</td>
				</tr>			
				<tr>
					<td colspan="2">09:30</td>
				</tr>
				<tr>
					<td>출근시간</td>
					<td>08:58:01</td>
				</tr>
				<tr>
					<td>퇴근시간</td>
					<td>미등록</td>
				</tr>			
				<tr>
					<td>누적 근무시간/주</td>
					<td>9:29</td>
				</tr>
			</table>
			<hr>
			<input type="button" class="attendanceBtn" value="출근하기">
			<input type="button" class="attendanceBtn" value="퇴근하기">
			<select class="attendanceStatus">근무상태변경
				<option value="내근"/>
				<option value="외근"/>
				<option value="출장"/>
				<option value="교육"/>
			</select>
			<div class="menuLeftList">출근시간</div>
			<div class="menuLeftList">퇴근시간</div>
			
			<div class="menuLeftListBtn"><button class="menuLeftBtn">새 주소 추가</button></div>
			<div class="menuLeftList"></div>
			<div class="menuLeftListTitle">공용주소록</div>
				<a href="#"><div class="menuLeftList down">전사 주소록</div></a>
			<div class="menuLeftListTitle">부서 주소록</div>		
			<c:forEach var="부서" items="부서들">
				<a href="#"><div class="menuLeftList">부서1....</div></a>
				<a href="#"><div class="menuLeftList">부서2....</div></a>
				<a href="#"><div class="menuLeftList">부서3....</div></a>
				<a href="#"><div class="menuLeftList">부서4....</div></a>
			</c:forEach>			
			<div class="menuLeftListTitle">개인주소록</div>
				<a href="#"><div class="menuLeftList">개인주소1</div></a>
				<a href="#"><div class="menuLeftList">개인주소2</div></a>
				<a href="#"><div class="menuLeftList">개인주소3</div></a>
		</div>
	</div>
</body>
</html>