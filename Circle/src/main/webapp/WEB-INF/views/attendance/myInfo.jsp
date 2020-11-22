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
	href="${pageContext.request.contextPath}/resources/css/attendance/myInfo.css">
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
				<h1>근태현황(메뉴명)</h1>
				<br><br>
				
				<!-- 대표정보 시작 -->
				<table class="infoMainTable">
					<tr>
						<td rowspan="3" class="photoCell"><img src=""></td>
						<td class="titleCell">이름</td>
						<td class="titleCell">소속</td>
						<td>영업팀</td>
						<td class="titleCell">직위/직책</td>
						<td>대리</td>
					</tr>
					<tr>
						<td rowspan="2">가나다</td>
						<td class="titleCell">사번</td>
						<td>202012120456</td>
						<td class="titleCell">내선번호</td>
						<td>0300-0102</td>
					</tr>								
					<tr>
						<td class="titleCell">이메일</td>
						<td>ganada@circle.com</td>
						<td class="titleCell">휴대번호</td>
						<td>010-9876-5432
					</tr>
				</table>	
				<!-- 대표정보 끝 -->
				<br><br>
				<!-- 상세정보 시작 -->
				<span>상세정보 열기 ▼▽</span>
				<br><br>
				<div class="detailInfo">
					<ul>
						<li>
							<span>사원정보</span>
							<table class="detailEmpInfoTable">
								<tr>
									<td class="titleCell">결혼여부</td>
									<td>미혼</td>
									<td class="titleCell">보훈번호</td>
									<td>13-123456</td>
									<td class="titleCell">관계</td>
									<td>조부</td>
								</tr>
								<tr>
									<td class="titleCell">장애종류</td>
									<td>-</td>
									<td class="titleCell">장애급수</td>
									<td>-</td>
									<td class="titleCell">병역여부</td>
									<td>만기전역</td>
								</tr>
								<tr>
									<td class="titleCell">주소</td>
									<td colspan=3">서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F</td>
									<td class="titleCell">주민등록번호</td>
									<td>900920-1******</td>
								</tr>
							</table>
						</li>
						<br>
						<li>
							<span>기본정보</span>
							<table class="detailPersonalInfoTable">
								<tr>
									<td class="titleCell">입사일</td>
									<td>2010-10-12</td>
									<td class="titleCell">퇴사일</td>
									<td>-</td>
									<td class="titleCell">비상연락처</td>
									<td>02-0304-5857</td>
								</tr>						
								<tr>
									<td class="titleCell">은행이름</td>
									<td>하나은행</td>
									<td class="titleCell">예금주명</td>
									<td>가나다(본인)</td>
									<td class="titleCell">계좌번호</td>
									<td>292-2324-23112</td>
								</tr>
							</table>
						</li>
						<br>
						<li>
							<span>자격정보</span>
							<table class="detailCertificationTable">
								<tr>
									<td class="titleCell">분류</td>
									<td>국가면허</td>
									<td class="titleCell">자격명</td>
									<td>자동차운전면허</td>
									<td class="titleCell">자격번호</td>
									<td>20-09-123123-08</td>
								</tr>
								<tr>
									<td class="titleCell">등급/점수</td>
									<td>1종보통</td>
									<td class="titleCell">발급기관</td>
									<td>서울지방경찰청</td>
									<td class="titleCell">비고</td>
									<td></td>
							</table>	
						</li>
						<br>
						<li>
							<span>경력이력</span>
							<table class="detailCareerTable">
								<tr>
									<th class="titleCell">순서</th>
									<th class="titleCell">시작일</th>
									<th class="titleCell">종료일</th>
									<th class="titleCell">부서명</th>
									<th class="titleCell">직위/직책명</th>
									<th class="titleCell">근속기간</th>
									<th class="titleCell">담당업무</th>
									<th class="titleCell">비고</th>
								</tr>
								<c:forEach var="이력" items="이력s">
									<tr>
										<td>1</td>
										<td>2011-03-02</td>
										<td>2013-02-28</td>
										<td>디자인팀</td>
										<td>사원</td>
										<td>2년</td>
										<td>신규 프로젝트 UI 디자인</td>
										<td></td>
									</tr>
								</c:forEach>
							</table>
						</li>
						<br>
						<li>
							<span>포상/징계이력</span>
							<table class="detailRewordDisciplineTable">
								<tr>
									<th class="titleCell">순서</th>
									<th class="titleCell">일자</td>
									<th class="titleCell">구분</td>
									<th class="titleCell">내용</td>
									<th class="titleCell">사유</td>
									<th class="titleCell">비고</td>
								</tr>
								<tr>
									<td>1</td>
									<td>2013-03-21</td>
									<td>포상</td>
									<td>성과급 지급</td>
									<td>Red Dot Design Award 수상</td>
									<td></td>
								</tr>
							</table>
						</li>
					</ul>
				</div>			
				<!-- 상제정보 끝 -->
				<br><br>				
				<!-- 변경이력 시작 -->
				<span>변경이력 열기 ▼▽</span>
				<br><br>
				<div class="changeList">
					<table class="changeListTable">
						<tr>
							<th class="titleCell">순서</th>
							<th class="titleCell">일자</th>
							<th class="titleCell">항목</th>
							<th class="titleCell">변경 전</th>
							<th class="titleCell">변경 후</th>
							<th class="titleCell">수정자</th>
							<th class="titleCell">변경사유</th>
						</tr>
						<tr>
							<td>1</td>
							<td>2020-07-02</td>
							<td>기본정보-주소</td>
							<td>경기도 남양주시</td>
							<td>서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F</td>
							<td>가나다</td>
							<td>주소이전</td>
						</tr>
						
						
						<tr>
							<td>1</td>
							<td>2020-07-02</td>
							<td>기본정보-주소</td>
							<td>서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F</td>
							<td>경기도 남양주시</td>
							<td>가나다</td>
							<td>주소이전</td>
						</tr>
						
						<c:forEach var="항목" items="항목s">
													
						</c:forEach>
					<!-- 변경이력 끝 -->
					</table>
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