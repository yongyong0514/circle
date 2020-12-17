<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/addressBook/detail.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="common/addressBookLeftBar.jsp" />
		</div>
		<div class="organChart">
			<c:import url="/organChart/getInfo"/>
 		</div>
		<div class="container">
			<div class="content">
				<table class="detailTable">
					<tr>
						<td>사진</td>
						<td>
						 	<img src="" onerror="this.src='https://conservation-innovations.org/wp-content/uploads/2019/09/Dummy-Person.png'">&nbsp;&nbsp;
							<c:if test="${detailEmpInfo.emp_info_emp_no eq sessionScope.empInfo.emp_info_emp_no }">
								<button value="remove">삭제하기</button>
							</c:if>
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" value="${detailEmpInfo.emp_info_name }"></td>
					</tr>
					<tr>
						<td>휴대전화</td>
						<td><input type="text" value="${detailEmpInfo.emp_info_mtel }"></td>
					</tr>	
					<tr>
						<td>내선전화</td>
						<td><input type="text" value="${detailEmpInfo.emp_info_etel }"></td>
					</tr>	
					<tr>
						<td>이메일</td>
						<td><input type="text" value="${detailEmpInfo.emp_info_email }"></td>
					</tr>
					<tr>
						<td>부서명</td>
						<td><input type="text" value="${detailEmpInfo.dept_info_name }"></td>
					</tr>
					<tr>
						<td>직위/직책</td>
						<td><input type="text" value="${detailEmpInfo.job_info_name }"></td>
					</tr>
					<tr>
						<td>회사</td>
						<td><input type="text" value="${detailEmpInfo.cmp_info_name }"></td>
					</tr>
				</table>
				<br><br>
				<!-- 관리자 여부 확인 후 노출 -->
				<c:if test="${detailEmpInfo.emp_info_emp_no eq sessionScope.empInfo.emp_info_emp_no}">
					<input class="actionBtn" id="edit" type="submit" value="수정"/>
					<input class="actionBtn" id="reset" type="reset" value="원래대로"/>
					<input class="actionBtn" id="remove" type="button" value="삭제"/>
				</c:if>
				<input class="actionBtn" id="goList" type="button" value="목록으로 이동"
					onclick="history.back();"/>
			</div>
		</div>
	</div>

	<script>
		
	</script>
</body>
</html>