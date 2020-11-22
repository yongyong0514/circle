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
	href="${pageContext.request.contextPath}/resources/css/attendance/myVacation.css">
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
				<h1>내 연차이력</h1>
				<br>
				<br>
				<!-- 연사 사용내역 요약 시작 -->
				<div class="summary">
					<h2>2020-11-14</h2>
					<br>
					<br>
					<table class="summaryTable">
						<tr>
							<th></th>
							<th>총 연차</th>
							<th>지급연차</th>
							<th>지급월차</th>
							<!-- 1년 미만은 근무개월수*2 월차 발생 -->
							<th>사용연차</th>
							<th>잔여연차</th>
						</tr>
						<!-- 값 불러오기 -->
						<tr>
							<td>가나다 대리</td>
							<td>18</td>
							<td>18</td>
							<td>-</td>
							<td>2</td>
							<td>16</td>
						</tr>
						<!-- 값 불러오기 끝 -->
					</table>
				</div>
				<br>
				<br>
				<!-- 연차 사용내역 요약 끝 -->
				<div class="vacationHistory">
					<h2>연차 사용내역</h2>
					<br>
					<br>
					<table class="vacationHistoryTable">
						<tr>
							<th>순서</th>
							<th>신청일</th>
							<th>구분</th>
							<th>시작일</th>
							<th>종료일</th>
							<th>일수</th>
							<th>내용</th>
							<th>결재상태</th>
							<th>승인여부</th>
							<th>관련서류</th>
						</tr>
						<!-- 반복 불러오기 시작 -->
						<c:forEach var="항목" items="항목s">
							<!-- 예시 데이터 시작 -->
							<tr>
								<td>1</td>
								<td>2020-08-12</td>
								<td>연차</td>
								<td>2020-09-30</td>
								<td>2020-10-02</td>
								<td>3</td>
								<td>정기휴가</td>
								<td>결재완료</td>
								<td>Y</td>
								<td><input type="button" value="전자결재" /></td>
							</tr>
							<tr>
								<td>2</td>
								<td>2020-10-07</td>
								<td>병가</td>
								<td>2020-10-08</td>
								<td>2020-10-08</td>
								<td>1</td>
								<td>병가</td>
								<td>결재완료</td>
								<td>Y</td>
								<td><input type="button" value="전자결재" /></td>
							</tr>
							<tr>
								<td>3</td>
								<td>2020-11-12</td>
								<td>연차</td>
								<td>2020-11-26</td>
								<td>2020-11-27</td>
								<td>2</td>
								<td>정기휴가</td>
								<td>결재대기</td>
								<td>N</td>
								<td><input type="button" value="전자결재" /></td>
							</tr>
							<!-- 예시 데이터 끝 -->
						</c:forEach>
						<!-- 반복 불러오기 끝 -->
					</table>
					<br>
					<br>
					<!-- 연차 신청하기 시작 -->
					<div class="vacationApply">
						<h2>연차신청</h2>
						<br>
						<br>
						<form action="#" method="GET">
							<table class="vacationApplyTable">
								<tr>
									<td>휴가신청일</td>
									<td><input type="date" readonly></td>
									<td>구분</td>
									<td><select name="vacationType">
											<option value="annual" selected>연차</option>
											<option value="half">반차</option>
											<option value="bereavement">경조사</option>
											<option value="maternity">출산/육아</option>
											<option value="menstrual">보건휴가</option>
											<option value="militaryServ">예비군/민방위</option>
											<option value="sick">병가</option>
											<option value="etc">기타</option>
									</select></td>
									<td>전일/반일</td>
									<td><select name="isHalf">
											<option value="full" selected>전일</option>
											<option value="amHalf">오전반차</option>
											<option value="pmHalf">오후반차</option>
									</select></td>
								</tr>
								<tr>
									<td>휴가기간</td>
									<td><input name="StartDate" type="date">~<input
										name="endDate" type="date"> (일수: <input id="calcDate"
										type="text" value="1" readonly />) <!-- 일수는 바로 계산 --></td>
									<td>전자결제상태</td>
									<td><input type="text" id="permissionStatus"
										name="permission" readonly value="결제대기"></td>
									<td>실제사용여부</td>
									<td><input type="checkbox" name="used" readonly></td>
									<!-- 결재완료/해당 일자 지남 -->
								</tr>
								<tr>
									<td>내용</td>
									<td colspan="5"><textarea></textarea></td>
								</tr>
							</table>
							<br>
							<br>
							<div class="selectBtn">
								<input type="button" value="신규" />
								<!-- 항목이 선택된 경우. 시작 -->
								<c:if test="">
									<input type="button" value="수정" />
									<input type="button" value="삭제" />
								</c:if>
								<!-- 항목이 선택된 경우. 끝 -->
								<input type="reset" value="초기화" /> <input type="submit"
									value="저장" />
							</div>
						</form>
						<!-- 연차 신청사기 끝 -->
					</div>
				</div>
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