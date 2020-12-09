<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/resources/css/poll/part/insertMemberOrganChart.css">
</head>
<body>
	<!-- 조직도 버튼 시작 -->
	<div class="insert-organChartBorder">
		<div class="insert-organChartBtn">조직도</div>
	</div>
	<!-- 조직도 버튼 끝 -->

	<!-- 조직도 패널 시작-->
	<div class="insert-organPanel">
		<div class="topPanel">
			<div class="search">
				<form action="$" method="POST">
					<input type="text" name="searchValue" placeholder="사번/이름/부서/직위/이메일" />
					<button type="submit"><i class='fas fa-level-down-alt'></i></script></button>
				</form>
			</div>
			<div class="insert-closeBtnArea">
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
		<!-- 조직도 확인/닫기 버튼 -->
		<div class="insert-button">
			<a id="insert-organ-confirm"class="main-btn">확인</a>
			<a id="insert-organ-cancle"class="sub-btn">닫기</a>
		</div>
		
	</div>
	<!-- 조직도 버튼 끝 -->

	<!-- 개인 인적사항 시작 -->

	<!-- 개인 인적사항 끝 -->
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/poll/insertMemberOrganChart.js"></script>

<script>
	$(document).ready(function(){
		
		
		$(".empBtn").on('click',function(){
			var location = $(event.target).text();
			console.log(location);
		});
		
		$('#insert-organ-confirm').on('click', function(){
			var checked = $('ul.tree .empBtn input[type=checkbox]:checked').parent().text();
			console.log(checked);
		});		
		
		
	});
</script>

</html>