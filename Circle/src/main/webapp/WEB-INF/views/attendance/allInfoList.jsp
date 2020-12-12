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
	href="${pageContext.request.contextPath}/resources/css/attendance/allInfoList.css">
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
				<h1>인사정보</h1>
				<br><br>
				<form action="empInfo/allInfoList" method="POST">
					<input type="text" name="empNo">
					<input type="text" name="name">
					<input type="text" name="deptName">
					<span class="totalNumber">전체 n명</span>
					<input type="button" name="pegPage" class="insertInfo" value="인사정보 추가"/>
					<select>
						<option value="10">10</option>
						<option value="20">20</option>
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
							<c:forEach var="EmpInfoAll" items="${empList }">
								<tr>
									<td><c:out value="${EmpInfoAll.emp_info_emp_no }"/></td>
									<td><c:out value="${EmpInfoAll.emp_info_name }"/></td>
									<td><c:out value="${EmpInfoAll.dept_info_name }"/></td>
									<td><c:out value="${EmpInfoAll.job_info_name }"/></td>
									<td><c:out value="${EmpInfoAll.emp_info_email }"/></td>
									<td><c:out value="${EmpInfoAll.emp_info_etel }"/></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<!-- 전체 인사정보(리스트) 끝 -->
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