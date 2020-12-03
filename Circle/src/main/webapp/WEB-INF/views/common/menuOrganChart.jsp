<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common/menuBar/menuOrganChart.css">
</head>
<body>
	<!-- 조직도 버튼 시작 -->
	<div class="organChartBorder">
		<div class="organChartBtn">조직도</div>
	</div>
	<!-- 조직도 버튼 끝 -->

	<!-- 조직도 패널 시작-->
	<div class="organPanel">
		<div class="topPanel">
			<div class="search">
				<form action="$" method="POST">
					<input type="text" name="searchValue" placeholder="사번/이름/부서/직위/이메일" />
					<button type="submit"><i class='fas fa-level-down-alt'></i></script></button>
				</form>
			</div>
			<div class="closeBtnArea">
				<input type="button" name="closeBtn" value="X" />
			</div>
		</div> 
		<div class="members">
			<!-- 조직도 트리구조 시작 -->
			<ul class="tree">
				<c:forEach var="OrganDept" items="${oDList }">
					<c:if test="${OrganDept.lvl == 1 or OrganDept.lvl == 2 }">
						<li>
							<div class="deptBtn">
								<input type="checkbox" name="select">
								<c:out value="${ OrganDept.dept_info_name }" />
							</div>
					
							<ul>
								<c:if test="${!empty OrganDept.empList }">
									<c:forEach var="OrganEmp" items="${OrganDept.empList }">
										<li>
											<div class="empBtn">
												<input type="checkbox" name="select">
												<c:out value="${OrganEmp.emp_info_name }" />
											</div>
										</li>
									</c:forEach>
								</c:if>
							
								<c:forEach var="OrganDept2" items="${oDList }">
									<c:if test="${OrganDept2.lvl == 3 and OrganDept.dept_info_code == OrganDept2.dept_info_uper }">
										<li>
											<div class="deptBtn">
												<input type="checkbox" name="select">
												<c:out value="${ OrganDept2.dept_info_name }" />
											</div>
											
											<ul>
												<c:forEach var="OrganEmp" items="${OrganDept2.empList }">
													<li>
														<div class="empBtn">
															<input type="checkbox" name="select">
															<c:out value="${OrganEmp.emp_info_name }" />
														</div>
													</li>
												</c:forEach>
											</ul>
											
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</li>
					</c:if>
				</c:forEach>
			</ul>
			<!-- 조직도 트리구조 시작 -->
		</div>
	</div>
	<!-- 조직도 버튼 끝 -->

	<!-- 개인 인적사항 시작 -->

	<!-- 개인 인적사항 끝 -->
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common/menuOrganChart.js"></script>

</html>