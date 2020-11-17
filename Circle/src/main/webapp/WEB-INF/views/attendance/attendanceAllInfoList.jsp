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
	href="${pageContext.request.contextPath}/resources/css/attendance/attendanceAllInfoList.css">
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
				<h1>인사정보</h1>
				<br><br>
				<span>전체 n명</span>
				<select>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="50">50</option>
				</select>
				<br><br>
				<!--  전체 인사정보(리스트) 시작 -->
				<div class="infoList">
					<table class="infoListTable">
						<tr>
							<th>사번</th>
							<th>이름</th>
							<th>부서</th>
							<th>직위/직책</th>
							<th>이메일</th>
							<th>내선번호</th>
						</tr>
						<!-- 예시데이터 시작 -->
						<tr>
							<td>202011120123</td>
							<td>가나다</td>
							<td>유통팀</td>
							<td>대리</td>
							<td>ganada@circle.com</td>
							<td>0300-1023</td>
						</tr>
						<tr>
							<td>202011120123</td>
							<td>가나다</td>
							<td>유통팀</td>
							<td>대리</td>
							<td>ganada@circle.com</td>
							<td>0300-1023</td>
						</tr>
						<tr>
							<td>202011120123</td>
							<td>가나다</td>
							<td>유통팀</td>
							<td>대리</td>
							<td>ganada@circle.com</td>
							<td>0300-1023</td>
						</tr>
						<tr>
							<td>202011120123</td>
							<td>가나다</td>
							<td>유통팀</td>
							<td>대리</td>
							<td>ganada@circle.com</td>
							<td>0300-1023</td>
						</tr>
						<tr>
							<td>202011120123</td>
							<td>가나다</td>
							<td>유통팀</td>
							<td>대리</td>
							<td>ganada@circle.com</td>
							<td>0300-1023</td>
						</tr>
						<!-- 예시데이터 끝 -->
					</table>
				</div>
				<!-- 전체 인사정보(리스트) 끝 -->
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