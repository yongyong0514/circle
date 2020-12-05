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
	href="${pageContext.request.contextPath}/resources/css/addressBook/allEmp.css">
</head>
<body>
	<!-- 주소록 테이블 시작 -->
	<table class="addressListTable">
		<tr>
			<th><input type="checkbox"></th>

			<!-- c:forEach -->
			<!-- 사용자 필드 설정에 따라 변경 -->
			<th>이름(표시명)<a href="#">▲</a><a href="#">▼</a></th>
			<th>휴대전화<a href="#">▲</a><a href="#">▼</a></th>
			<th>이메일<a href="#">▲</a><a href="#">▼</a></th>
			<th>회사명<a href="#">▲</a><a href="#">▼</a></th>
		</tr>

		<!-- 주소 리스트 시작 -->
		<c:forEach var="AddressInfo" items="${aList }">
			<tr>
				<td><input type="checkbox"></td>
				<td><img class="thumbnail" src="#">&nbsp;
					<c:out value="${AddressInfo.name }"/>	
				</td>
				<td><c:out value="${AddressInfo.tel }"/></td>
				<td><c:out value="${AddressInfo.email}"/></td>
				<td><c:out value="${AddressInfo.cmpName}"/></td>
			</tr>
		</c:forEach>
		<!-- 주소 리스트 끝 -->

	</table>
	<!-- 주소록 테이블 끝 -->
</body>
</html>