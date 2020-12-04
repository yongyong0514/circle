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
			<c:import url="/organChart/getInfo"/>
		</div>
		<div class="container">
			<div class="content">
				<h1>내 연차이력</h1>
				<br>
				<br>
				<!-- 연사 사용내역 요약 시작 -->
				<div class="summary">
					<table class="summaryTable">
						<tr>
							<th></th>
							<!-- 1년 미만은 근무개월수*2 월차 발생 -->
							<th>총 연차</th>
							<th>사용연차</th>
							<th>잔여연차</th>
						</tr>
						<!-- 값 불러오기 -->
						<tr>
							<td><c:out value="${sessionScope.empInfo.emp_info_name}"/></td>
							<td><c:out value="${map.annualLeave }"/></td>
							<td><c:out value="${map.usedVacationDays }"/></td>
							<td><c:out value="${map.leftVacationDays }"/></td>
						</tr>
						<!-- 값 불러오기 끝 -->
					</table>
				</div>
				<br>
				<br>
				<!-- 연차 사용내역 요약 끝 -->
				
				<div class="vacationHistory">
					<!-- 연차 사용내역 상세 시작 -->
					<h2>연차 사용내역</h2>
					<br>
					<br>
					<table class="vacationHistoryTable">
						<tr>
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
						<c:if test="${!empty map.vList }">
							<c:forEach var="Vacation" items="${map.vList }">
								<tr>
									<td><c:out value="${Vacation.anva_hstr_rdat }"/></td>
									<td><c:out value="${Vacation.anva_hstr_type }"/></td>
									<td><c:out value="${Vacation.anva_hstr_sdat }"/></td>
									<td><c:out value="${Vacation.anva_hstr_edat }"/></td>
									<td>
										<c:out value="${Vacation.nights }"/>박
										<c:out value="${Vacation.days }"/>일
									</td>
									<td><c:out value="${Vacation.anva_hstr_cont }"/></td>
									<td></td>
									<td><c:out value="${Vacation.anva_hstr_conf }"/></td>
									<td><input type="button" value="전자결재" /></td>
								</tr>
							</c:forEach>
						</c:if>
						<!-- 반복 불러오기 끝 -->
					</table>
					<!-- 연차 사용내역 상세 끝 -->
					<br>
					<br>
					<!-- 연차 신청하기 시작 -->
					<div class="vacationApply">
						<h2>연차신청</h2>
						<br>
						<br>
						<form action="/vacation/addVacation" method="GET">
							<table class="vacationApplyTable">
								<tr>
									<td>휴가신청일</td>
									<td><input class="regitDate" name="regitDate" type="date" readonly></td>
									<td>구분</td>
									<td><select class="vacationType" name="vacationType">
											<option value="annual">연차</option>
											<option value="half">반차</option>
											<option value="bereavement">경조사</option>
											<option value="maternity">출산/육아</option>
											<option value="menstrual">보건</option>
											<option value="militaryServ">예비군/민방위</option>
											<option value="sick">병가</option>
											<option value="etc">기타</option>
									</select></td>
									<td>전일/반일</td>
									<td><select class="isHalf" name="isHalf">
											<option value="full">전일</option>
											<option value="amHalf">오전반차</option>
											<option value="pmHalf">오후반차</option>
									</select></td>
								</tr>
								<tr>
									<td>휴가기간</td>
									<td>
									<input class="startDate" name="startDate" type="date">
									~
									<input class="endDate" name="endDate" type="date">
									&nbsp;&nbsp;&nbsp;&nbsp;일수: 
									<input class="calcDate" name="calcDate" type="text" value="1" readonly />
									<!-- 일수는 바로 계산 --></td>
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

	<script>
		$(function() {
			var today = getFormatDate(new Date());
			var sDate = new Date($(".startDate").val());
			var eDate = new Date($(".endDate").val());
			var resultDays = 0;
			
			/* 왼쪽바 고정 추가 옵션 시작 */
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
			});
			
			
			/* 휴가신청일: 오늘날짜로 초기화 */
			$(".regitDate").val(today);
			
			
			/* 휴가기간 선택 날짜 제한 */
			$(".startDate").prop("min", today);

			
			/* 휴가 계산일 수 초기화 */
			$(".calcDate").val(resultDays);
			
			
			/* 휴가 구분 선택 시 */
			$(".vacationType").change(function(){
				sDate = new Date($(".startDate").val());
				eDate = new Date($(".endDate").val());
				resultDays = 0;
				
				var isSameDate = ( $(".startDate").val() === $(".endDate").val() ? true : false );
				
				// "반차"가 선택된 경우
				if($(".vacationType option:selected").val() == "half"){
					// "전일" 선택 제한
					$(".isHalf option[value!='full']").prop("disabled", false);
					$(".isHalf option[value='full']").prop("disabled", true);
					
					// 기본 선택값(오전 반차) 선택
					$(".isHalf option[value='amHalf']").prop("selected", true);
					
					// 휴가기간 옵션과 연계
					// 휴가기간 중 선택되지 않은 값이 있는 경우 -> 기본값(0) 출력
					if(isNull(sDate) || isNull(eDate)){
						$(".calcDate").val(resultDays);
					}
					// 시작일과 종료일이 모두 선택된 경우
					else{
						// 1. 두 값이 같을 경우 -> 0.5 출력
						if(isSameDate){
							resultDays = 0.5;
							$(".calcDate").val(resultDays);
						}						
						// 2. 두 값이 다를 경우 -> 종료일을 시작일로 변경 후 일수 계산
						else{
							$(".endDate").val(sDate);
							resultDays = (eDate - sDate) / (24 * 60 * 60 * 1000) + 0.5;
							$(".calcDate").val(resultDays);
						}						
					}
				}
				// "반차"가 아닌 경우
				else{
					// "오전/오후 반차" 선택 제한
					
					$(".isHalf option[value='full']").prop("disabled", false);					
					$(".isHalf option[value!='full']").prop("disabled", true);

					// 기본 선택값(전일) 선택
					$(".isHalf option[value='full']").prop("selected", true);
					
					// 휴가기간 옵션과 연계
					// 휴가기간 중 선택되지 않은 값이 있는 경우
					if(isNull(sDate) || isNull(eDate)){
						resultDays = (eDate - sDate) / (24 * 60 * 60 * 1000);
						$(".calcDate").val(resultDays);
					}
					// 시작일과 종료일이 모두 선택된 경우
					else{
						// 1. 두 값이 같을 경우 -> 종료일을 null값으로 변환
						if(isSameDate){
							$(".endDate").val("");
							resultDays = 0;
							$(".calcDate").val(resultDays);
						}
						// 2. 두 값이 다를 경우 -> 계산 후 출력
						else{
							resultDays = (eDate - sDate) / (24 * 60 * 60 * 1000);
							$(".calcDate").val(resultDays);
						}
					}
				}
			});
			
			
			/* 휴가 기간 선택 시 */
			
			// 시작일 선택 시
			$(".startDate").change(function(){
				sDate = new Date($(".startDate").val());
				eDate = new Date($(".endDate").val());
				
				// 종료일 제한
				$(".endDate").prop("min", $(".startDate").val());
				console.log($(".startDate").val());
				console.log($(".endDate").prop("min"));
				
				// 종료일이 선택되어 있지 않다면
				if( isNull($(".endDate").val()) ){
					return;
				}
				// 종료일이 선택되어 있다면
				else{
					// isSameDate = 시작일과 종료일이 동일한가 ? true		
					var isSameDate = ( $(".startDate").val() === $(".endDate").val() ? true : false );
					
					// 휴가일수 계산
					// 시작일과 종료일이 동일 -> 휴가일수를 0.5일로 변경
					if(isSameDate){
						resultDays = 0.5;
						$(".calcDate").val(resultDays);
						
						// 휴가구분 옵션을 "반차"로 변경
						$(".vacationType option[value='half']").prop("selected", true);

						// .change 함수가 작동될까? -> 안됨
						// 기본 선택값(오전반차)로 변경
						$(".isHalf option").prop("selected", false);
						$(".isHalf option").prop("disabled", true);
						$(".isHalf option[value!='full']").prop("disabled", false);
						$(".isHalf option[value='amHalf']").prop("selected", true);
						
					}
					// 시작일과 종료일이 상이 -> 휴가일수 정상계산
					else{
						resultDays = (eDate - sDate) / (24 * 60 * 60 * 1000);
						$(".calcDate").val(resultDays);		
						
						// 휴가 구분이 "반차"로 저장된 경우 -> 기본값("연차")로 변경
						if($(".vacationType option[value='half']").prop("selected", true)){
							$(".vacationType option[value='half']").prop("selected", false);
							$(".vacationType option[value='annual']").prop("selected", true);
						}
					}
				}
			});
			
			// 종료일 선택 시
			$(".endDate").change(function(){
				sDate = new Date($(".startDate").val());
				eDate = new Date($(".endDate").val());
				
				// 시작일 제한
				$(".startDate").prop("max", $(".endDate").val());
				
				// 시작일이 선택되어 있지 않다면
				if( isNull($(".startDate").val()) ){
					return;
				}
				// 시작일이 선택되어 있다면
				else{
					// isSameDate = 시작일과 종료일이 동일한가 ? true		
					var isSameDate = ( $(".startDate").val() === $(".endDate").val() ? true : false );
					
					// 휴가일수 계산
					// 시작일과 종료일이 동일 -> 휴가일수를 0.5일로 변경
					if(isSameDate){
						resultDays = 0.5;
						$(".calcDate").val(resultDays);
						
						// 휴가구분 옵션을 "반차"로 변경
						$(".vacationType option[value='half']").prop("selected", true);

						// .change 함수가 작동될까? -> 안됨
						// 기본 선택값(오전반차)로 변경
						$(".isHalf option").prop("selected", false);
						$(".isHalf option").prop("disabled", true);
						$(".isHalf option[value!='full']").prop("disabled", false);
						$(".isHalf option[value='amHalf']").prop("selected", true);
						
					}
					// 시작일과 종료일이 상이 -> 휴가일수 정상계산
					else{
						resultDays = (eDate - sDate) / (24 * 60 * 60 * 1000);
						$(".calcDate").val(resultDays);		
						
						// 휴가 구분이 "반차"로 저장된 경우 -> 기본값("연차")로 변경
						if($(".vacationType option[value='half']").prop("selected", true)){
							$(".vacationType option[value='half']").prop("selected", false);
							$(".vacationType option[value='annual']").prop("selected", true);
							
							// .change 함수가 작동될까? -> 안됨
							// 기본 선택값(전일)로 변경
							$(".isHalf option").prop("selected", false);
							$(".isHalf option").prop("disabled", true);
							$(".isHalf option[value='full']").prop("disabled", false);
							$(".isHalf option[value='full']").prop("selected", true);
						}
					}
				}
			});
		});

		
		/* 날짜포맷 변경 */
		function getFormatDate(date){
		    var year = date.getFullYear();				//yyyy
		    var month = (1 + date.getMonth());			//M
		    month = month >= 10 ? month : '0' + month;	//month 두자리로 저장
		    var day = date.getDate();					//d
		    day = day >= 10 ? day : '0' + day;			//day 두자리로 저장
		    return  year + '-' + month + '-' + day;		//형태 생성
		}
		
		/* null 체크 */
		function isNull(value){
			return (value === undefined || value === null || value === "") ? true : false;
		}
		
	</script>
</body>
</html>