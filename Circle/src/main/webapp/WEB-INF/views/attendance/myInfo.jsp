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
			<jsp:include page="../common/menuOrganChart.jsp" />
		</div>
		<div class="container">
			<div class="content">
				<h1>근태현황(메뉴명)</h1>
				<br>
				<br>
				<!-- 정보 수정용 form 시작 -->
				<form action="#" method="post">
					<!-- 대표정보 시작 -->
					<table class="infoMainTable">
						<tr>
							<td rowspan="4" class="photoCell"><img src=""></td>
							<td class="titleCell">이름</td>
							<td class="titleCell">소속</td>
							<td><input type="text"
								value="<c:out value='${map.empInfoOne.dept_info_name }'/>"
								readonly></td>
							<td class="titleCell">직위/직책</td>
							<td><input type="text"
								value="<c:out value='${map.empInfoOne.job_info_name }'/>"
								readonly></td>
						</tr>
						<tr>
							<td class="setCenter" rowspan="3"><input type="text"
								value="<c:out value='${map.empInfoOne.emp_info_name }'/>"
								readonly></td>
							<td class="titleCell">사번</td>
							<td><input type="text"
								value="<c:out value='${map.empInfoOne.emp_info_emp_no }'/>"
								readonly></td>
							<td class="titleCell">내선번호</td>
							<td><input type="text"
								value="<c:out value='${map.empInfoOne.emp_info_etel }'/>"
								readonly></td>
						</tr>
						<tr>
							<td class="titleCell">이메일</td>
							<td><input type="text"
								value="<c:out value='${map.empInfoOne.emp_info_email }'/>"></td>
							<td class="titleCell">휴대번호</td>
							<td><input type="text"
								value="<c:out value='${map.empInfoOne.emp_info_mtel }'/>"></td>
						</tr>
						<tr>
							<td class="titleCell">비밀번호 수정</td>
							<td><input name="changePwd" type="password"></td>
							<td class="titleCell">현재 비밀번호</td>
							<td><input name="curPwd" type="password"> <input
								type="submit" value="수정하기"></td>
						</tr>
					</table>
					<!-- 대표정보 끝 -->
					<br>
					<br>
					<!-- 상세정보 시작 -->
					<span>상세정보 열기 ▼▽</span> <br>
					<br>
					<div class="detailInfo">
						<ul>
							<li><span>사원정보</span>
								<table class="detailEmpInfoTable">
									<tr>
										<td class="titleCell">결혼여부</td>
										<td><input type="text"
											value="<c:out value='${map.empInfoOne.emp_info_mrrg }'/>"></td>
										<td class="titleCell">보훈번호</td>
										<td><input type="text"
											value="<c:out value='${map.empInfoOne.emp_info_vetr_no }'/>"
											readonly></td>
										<td class="titleCell">관계</td>
										<td><input type="text"
											value="<c:out value='${map.empInfoOne.emp_info_vetr_rel }'/>"
											readonly></td>
									</tr>
									<tr>
										<td class="titleCell">장애종류</td>
										<td><input type="text"
											value="<c:out value='${map.empInfoOne.emp_info_impd_type }'/>"></td>
										<td class="titleCell">장애급수</td>
										<td><input type="text"
											value="<c:out value='${map.empInfoOne.emp_info_impd_levl }'/>"></td>
										<td class="titleCell">병역여부</td>
										<td><input type="text"
											value="<c:out value='${map.empInfoOne.emp_info_mils }'/>"></td>
									</tr>
									<tr>
										<td class="titleCell">주소</td>
										<td colspan=3"><input type="text"
											value="<c:out value='${map.empInfoOne.emp_info_adr }'/>"></td>
										<td class="titleCell">주민등록번호</td>
										<td><input type="text"
											value="<c:out value='${map.empInfoOne.emp_info_id_no }'/>"
											readonly></td>
									</tr>
								</table></li>
							<br>
							<li><span>기본정보</span>
								<table class="detailPersonalInfoTable">
									<tr>
										<td class="titleCell">입사일</td>
										<td><input type="text"
											value="<c:out value='${map.empInfoOne.emp_info_edat }'/>"
											readonly></td>
										<td class="titleCell">퇴사일</td>
										<td><input type="text"
											value="<c:out value='${map.empInfoOne.emp_info_sdat }'/>"
											readonly></td>
										<td class="titleCell">비상연락처</td>
										<td><input type="text"
											value="<c:out value='${map.empInfoOne.emp_info_emrg_tel }'/>"></td>
									</tr>
									<tr>
										<td class="titleCell">은행이름</td>
										<td><input type="text"
											value="<c:out value='${map.empInfoOne.emp_info_bank_name }'/>"></td>
										<td class="titleCell">예금주명</td>
										<td><input type="text"
											value="<c:out value='${map.empInfoOne.emp_info_acnt_name }'/>"></td>
										<td class="titleCell">계좌번호</td>
										<td><input type="text"
											value="<c:out value='${map.empInfoOne.emp_info_acnt_no }'/>"></td>
									</tr>
								</table></li>
							<br>
							<li><span>자격정보</span>
								<table class="detailCertificationTable">
									<tr>
										<th class="titleCell">분류</th>
										<th class="titleCell">자격명</th>
										<th class="titleCell">자격번호</th>
										<th class="titleCell">발급일</th>
										<th class="titleCell">등급/점수</th>
										<th class="titleCell">발급기관</th>
										<th class="titleCell">만료일</th>
										<th class="titleCell">비고</th>
									</tr>
									<c:forEach var="CertificateInfo" items="${map.crtfInfoList }">
										<tr>
											<td><c:out value="${CertificateInfo.crtf_info_type }"/></td>
											<td><c:out value="${CertificateInfo.crtf_info_crtf_name }"/></td>
											<td><c:out value="${CertificateInfo.crtf_info_crtf_no }"/></td>
											<td><c:out value="${CertificateInfo.crtf_info_sdat }"/></td>
											<td><c:out value="${CertificateInfo.crtf_info_crtf_levl }"/></td>
											<td><c:out value="${CertificateInfo.crtf_info_inst }"/></td>
											<td><c:out value="${CertificateInfo.crtf_info_edat }"/></td>
											<td><c:out value="${CertificateInfo.crtf_info_rm }"/></td>
										</tr>
									</c:forEach>
								</table></li>
							<br>
							<li><span>경력이력</span>
								<table class="detailCareerTable">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="15%">
									<col width="30%">
									<col width="15%">
									<tr>
										<th class="titleCell">시작일</th>
										<th class="titleCell">종료일</th>
										<th class="titleCell">부서명</th>
										<th class="titleCell">직위/직책명</th>
										<th class="titleCell">근속기간</th>
										<th class="titleCell">담당업무</th>
										<th class="titleCell rm">비고</th>
									</tr>
									<c:forEach var="careerInfo" items="${map.careerInfoList}">
										<tr>
											<td><c:out value="${careerInfo.carr_hstr_sdat}" /></td>
											<td><c:out value="${careerInfo.carr_hstr_edat}" /></td>
											<td><c:out value="${careerInfo.dept_info_name}" /></td>
											<td><c:out value="${careerInfo.job_info_name}" /></td>
											<td><c:if test="${!empty careerInfo.year_term }">
													<c:out value="${careerInfo.year_term}" />
													<span>년 </span>
												</c:if>
												<c:out value="${careerInfo.month_term}" />
													<span> 개월</span>
											</td>
											<td><c:out value="${careerInfo.carr_hstr_job_type}" /></td>
											<td><c:out value="${careerInfo.carr_hstr_rm}" /></td>
										</tr>
									</c:forEach>
								</table></li>
							<br>
							<li><span>포상/징계이력</span>
								<table class="detailRewordDisciplineTable">
									<col width="15%">
									<col width="15%">
									<col width="40%">
									<col width="15%">
									<col width="15%">
									<tr>
										<th class="titleCell">일자</th>
										<th class="titleCell">구분</th>
										<th class="titleCell">내용</th>
										<th class="titleCell">사유</th>
										<th class="titleCell">비고</th>
									</tr>
									<c:forEach var="RewardDiscipline" items="${map.rdInfoList }">
										<tr>
											<td><c:out value="${RewardDiscipline.rwdp_hstr_dat }" /></td>
											<td><c:out value="${RewardDiscipline.rwdp_hstr_type }" /></td>
											<td><c:out value="${RewardDiscipline.rwdp_hstr_cont }" /></td>
											<td><c:out value="${RewardDiscipline.rwdp_hstr_resn }" /></td>
											<td><c:out value="${RewardDiscipline.rwdp_hstr_rm }" /></td>
										</tr>
									</c:forEach>
								</table></li>
							<br>
							<li><span>인사평가이력</span>
								<table class="detailRewordDisciplineTable">
									<col width="15%">
									<col width="15%">
									<col width="20%">
									<col width="20%">
									<col width="15%">
									<col width="15%">
									<tr>
										<th class="titleCell">일자</th>
										<th class="titleCell">소속부서</th>
										<th class="titleCell">성과</th>
										<th class="titleCell">평가내용</th>
										<th class="titleCell">평가자</th>
										<th class="titleCell">비고</th>
									</tr>
									<c:forEach var="HREvaluation" items="${map.hREvaluationList }">
										<tr>
											<td><c:out value="${HREvaluation.hrev_info_dat }" /></td>
											<td><c:out value="${HREvaluation.dept_info_name }" /></td>
											<td><c:out value="${HREvaluation.hrev_info_achv }" /></td>
											<td><c:out value="${HREvaluation.hrev_info_eval }" /></td>
											<td><c:out value="${HREvaluation.emp_info_name }" /></td>
											<td><c:out value="${HREvaluation.hrev_info_rm }" /></td>
										</tr>
									</c:forEach>
								</table></li>
							<br>
							<li><span>정보변경이력</span>
								<table class="changeListTable">
									<tr>
										<th class="titleCell">일자</th>
										<th class="titleCell">항목</th>
										<th class="titleCell">변경 전</th>
										<th class="titleCell">변경 후</th>
										<th class="titleCell">수정자</th>
										<th class="titleCell">변경사유</th>
									</tr>
									<tr>
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
								</table></li>
						</ul>
					</div>
					<!-- 상세정보 끝 -->
				</form>
				<!-- 정보 수정용 form 끝 -->
			</div>
		</div>
	</div>

	<script>
		$(function() {
			<!-- 왼쪽바 고정 추가 옵션 시작-->
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
			<!-- 왼쪽바 고정 추가 옵션 끝 -->
			
			<!-- 변경 불가능한 컬럼 표시 시작-->
			if($("input[type=text]").attr("readonly", true)){
				$("input[type=text]").addClass("grey");
			};
			<!-- 변경 불가능한 컬럼 표시 시작-->
		
		
		});
	</script>
</body>
</html>