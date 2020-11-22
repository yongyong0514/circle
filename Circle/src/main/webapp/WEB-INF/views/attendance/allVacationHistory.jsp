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
	href="${pageContext.request.contextPath}/resources/css/attendance/allVacationHistory.css">
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
			<jsp:include page="../common/menuOrganChart.jsp"/>
		</div>
		<div class="container">
			<div class="content">
				<h1>전사 연차 사용내역</h1>
				<br><br>
				<div class="selectDate">
					<span class="arrowBtn"> ◀ </span>	
					<span class="currentDate">2020-11</span>
					<span class="arrowBtn"> ▶ </span>
				</div>
				<br><br>
				<form action="#" method="POST">
					<!-- 검색조건 시작 -->
					<span>조건별 상세검색</span>
					<br><br>
					<div class="searchArea">
						<div>
							<span>기간</span>
							<br><br>
							<input type="date" name="sDate"/>~<input type="date" name="eDate"/>
						</div>
						<div>
							<span>이름</span>
							<br><br>
							<input type="text" name="name"/>
						</div>
						<div>
							<span>부서명</span>
							<br><br>
							<input type="text" name="dept"/>
						</div>
						<div>
							<input type="submit" value="검색">
						</div>
						<div>		
							<a href="#">검색조건 초기화</a>
						</div>
					</div>
					<!-- 검색조건 끝 -->
					
					<br><br>
					
					<div class="vacationList">
						<!-- 옵션 영역 시작 -->
						<div class="downloadOption">
							<button>목록 다운로드</button>
						</div>				
						<div class="listMaxNumber">
							<select>
								<option value="20">20</option>
								<option value="30">30</option>
								<option value="50">50</option>
							</select>
						</div>
						<!-- 옵션 영역 끝 -->
						<br><br>
						<!-- 연차 사용내역 시작 -->
						<table class="vacationListTable">
							<tr>
								<th><input type="checkbox"></th>
								<th>기간</th>
								<th>이름</th>
								<th>부서명</th>
								<th>사용일수</th>
								<th>분류</th>
							</tr>
							
							<!-- 예시데이터 시작 -->
							<tr>
								<td>2020-10-03 ~ 2020-10--4</td>
								<td>가나다</td>
								<td>유통팀</td>
								<td>유통팀</td>
								<td>1</td>
								<td>정기휴가</td>
							</tr>
							<tr>
								<td>가나다</td>
								<td>유통팀</td>
								<td>2019-11-12</td>
								<td>-</td>
								<td>1</td>
								<td>18</td>
								<td>1<td>
								<td>17</td>
							</tr>
							<tr>
								<td>가나다</td>
								<td>유통팀</td>
								<td>2019-11-12</td>
								<td>-</td>
								<td>1</td>
								<td>18</td>
								<td>1<td>
								<td>17</td>
							</tr>
							<tr>
								<td>가나다</td>
								<td>유통팀</td>
								<td>2019-11-12</td>
								<td>-</td>
								<td>1</td>
								<td>18</td>
								<td>1<td>
								<td>17</td>
							</tr>
							<tr>
								<td>가나다</td>
								<td>유통팀</td>
								<td>2019-11-12</td>
								<td>-</td>
								<td>1</td>
								<td>18</td>
								<td>1<td>
								<td>17</td>
							</tr>
							<tr>
								<td>가나다</td>
								<td>유통팀</td>
								<td>2019-11-12</td>
								<td>-</td>
								<td>1</td>
								<td>18</td>
								<td>1<td>
								<td>17</td>
							</tr>
							<tr>
								<td>가나다</td>
								<td>유통팀</td>
								<td>2019-11-12</td>
								<td>-</td>
								<td>1</td>
								<td>18</td>
								<td>1<td>
								<td>17</td>
							</tr>
							<tr>
								<td>가나다</td>
								<td>유통팀</td>
								<td>2019-11-12</td>
								<td>-</td>
								<td>1</td>
								<td>18</td>
								<td>1<td>
								<td>17</td>
							</tr>
							<!-- 예시데이터 끝 -->
							
						</table>
						
						<!-- 연차 사용내역 끝 -->
					</div>
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