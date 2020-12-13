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
				<form action="${pageContext.request.contextPath }/empInfo/allInfoList" method="GET">
					<span class="totalNumber">전체 <c:out value="${map.pInfo.total }"/>명</span>
					&nbsp;
					<input type="button" class="insertInfo" value="인사정보 추가"/>
					<br><br>
					<input type="text" name="empNo" placeholder="사원번호" value="${empNo}">
					<input type="text" name="name" placeholder="이름" value="${name}">
					<input type="text" name="deptName" placeholder="부서명" value="${deptName}">
					&nbsp;
					<input type="submit" value="검색하기">&nbsp;
					<select name="perPage" class="perPage" onchange="movePerPage()">
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
							<c:forEach var="EmpInfoAll" items="${map.empList }">
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
				
				<!-- 페이지 이동 목록 시작 -->					
					<div class="changeBtn">
						<span onclick="moveAll( ${map.pInfo.minPage}, ${map.pInfo.perPage} )">
							<i class='fas fa-angle-double-left'></i>
						</span>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${map.pInfo.nowPage != 1 }">
							<span onclick="moveAll( ${map.pInfo.nowPage-1}, ${map.pInfo.perPage} );">
								<i class='fas fa-caret-left'></i>
							</span>			
						</c:if>
						&nbsp;&nbsp;
						<c:forEach var="page" begin="${map.pInfo.startPage }" end="${map.pInfo.endPage}">
							<c:choose>
								<c:when test="${ page eq map.pInfo.nowPage }">
									<span class="nowPageNum">${page}</span>
									&nbsp;
								</c:when>
								
								<c:when test="${ page != map.pInfo.nowPage }">
									<span onclick="moveAll( ${page}, ${map.pInfo.perPage} );">${page}</span>	
									&nbsp;
								</c:when>
							</c:choose>
						</c:forEach>
						&nbsp;		
						<c:if test="${map.pInfo.nowPage != map.pInfo.maxPage}">
							<span onclick="moveAll(${map.pInfo.nowPage+1},${map.pInfo.perPage}, ${index});">
								<i class='fas fa-caret-right'></i>
							</span>			
						</c:if>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<span onclick="moveAll( ${map.pInfo.maxPage}, ${map.pInfo.perPage} )">
							<i class='fas fa-angle-double-right'></i>
						</span>
					</div>
					<!-- 페이지 이동 목록 끝 -->	
				
			</div>
		</div>
	</div>

	<!-- 왼쪽바 고정 추가 옵션 시작-->
	<script>
		$(function() {
			var leftBar = $(".leftBar").offset().top;
			$(window).scroll(function() {
				var window = $(this).scrollTop();
				if (leftBar <= window) {
					$(".leftBar").addClass("fixed");
				} else {
					$(".leftBar").removeClass("fixed");
				}
			});
			
			<!-- 페이지 당 출력 개수 선택 표시 -->
			$(".perPage").val(${map.pInfo.perPage});
			
			<!-- 현재 페이지 강조 -->
			$(".nowPageNum").addClass("selectedNum");
		});
		
		
		// 페이지 당 출력 개수 변경 시
		function movePerPage(){
			var selectedValue = $(".perPage").val();
			
			var url = "nowPage=" + 1 + "&perPage=" + selectedValue;
			
			location.href="${pageContext.request.contextPath}/empInfo/allInfoList?" + url;
		};
		
		// 페이지 이동버튼(숫자 또는 화살표) 선택 시
		function moveAll(nowPage, perPage){
			var url = "nowPage=" + nowPage + "&perPage=" + perPage;
			
			if( !isNull('${name}') ){
				url += "&name=".concat('${name}');
			}
			
			if( !isNull('${empNo}') ){
				url += "&empNo=".concat('${empNo}');
			}
			
			if( !isNull('${deptName}') ){
				url += "&deptName=".concat('${deptName}');
			}
			
			location.href="${pageContext.request.contextPath}/empInfo/allInfoList?" + url;
		};
		
		function isNull(value){
			return ( value === undefined || value === null || value === "" ) ? true : false;
		};
		
	</script>
</body>
</html>