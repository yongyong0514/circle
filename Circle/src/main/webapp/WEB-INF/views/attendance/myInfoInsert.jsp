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
	href="${pageContext.request.contextPath}/resources/css/attendance/myInfoInsert.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
				<form action="${pageContext.request.contextPath}/empInfo/myInfoInsert" method="post">
				<h1>근태현황(메뉴명)</h1>
				<br>
				<input type="submit" value="작성완료">
				<br><br>
				<!-- 정보 수정용 form 시작 -->
					<!-- 대표정보 시작 -->
					<table class="infoMainTable">
						<tr>
							<td rowspan="4" class="photoCell"><img src="" onerror="this.src='https://conservation-innovations.org/wp-content/uploads/2019/09/Dummy-Person.png'" ></td>
							<td class="titleCell">이름</td>
							<td class="titleCell">소속</td>
							<td>
								<select name="emp_info_dept_code">
									<c:forEach items="${dMap.dCodeList}" varStatus="status">
										<option value="${dMap.dCodeList[status.index] }">
											<c:out value="${dMap.dNameList[status.index] }"/>
										</option>					
									</c:forEach>
								</select>
							</td>
							<td class="titleCell">직위/직책</td>
							<td>
								<select name="emp_info_job_code">
									<c:forEach items="${jMap.jCodeList}" varStatus="status">
										<option value="${jMap.jCodeList[status.index] }">
											<c:out value="${jMap.jNameList[status.index] }"/>
										</option>						
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td class="setCenter" rowspan="3">
								<input type="text" name="emp_info_name" required>
							</td>
							<td class="titleCell">사번</td>
							<td>
								<input type="text" name="emp_info_emp_no" placeholder="예) 202012120123" required>
							</td>
							<td class="titleCell">내선번호</td>
							<td>
							<input name="emp_info_etel" type="text" placeholder="예) 0000-1234" required>
							</td>
						</tr>
						<tr>
							<td class="titleCell">이메일</td>
							<td>
								<input name="emp_info_email" type="text" required>
							</td>
							<td class="titleCell">휴대번호</td>
							<td>
								<input name="emp_info_mtel" type="text" required>
							</td>
						</tr>
						<tr>
							<td class="titleCell">
								<label>
									<input type="checkbox" class="changePwd" checked disabled>
									<span>비밀번호 수정</span><br><br>
								</label>
								<span>2차 확인</span>
							</td>
							<td>
								<input class="marginbox pwd1" name="changePwd" type="password" placeholder="비밀번호 입력" required><br>
								<input class="marginbox pwd2" name="changePwd2" type="password" placeholder="비밀번호 확인" required><br>
								<span class="pwdCheckMsg xSmallInfo"><br></span>
							</td>
							<td class="titleCell">현재 비밀번호</td>
							<td><input class="marginbox curPwd" name="curPwd" type="password" disabled> <br>
								<input class="marginbox editBtn" type="submit" value="수정하기" disabled><br>
								<span class="userPwdCheckMsg xSmallInfo"></span>
							</td>
						</tr>
					</table>
					<!-- 대표정보 끝 -->
					<br> <br>
					<!-- 상세정보 시작 -->
					<div class="detailInfo">
						<ul>
							<li><span>사원정보</span>
								<table class="detailEmpInfoTable">
									<tr>
										<td class="titleCell">결혼여부</td>
										<td><input name="emp_info_mrrg" type="text" placeholder="Y/N" required></td>
										<td class="titleCell">보훈번호</td>
										<td><input name="emp_info_vetr_no" type="text"></td>
										<td class="titleCell">관계</td>
										<td><input name="emp_info_vetr_rel" type="text"></td>
									</tr>
									<tr>
										<td class="titleCell">장애종류</td>
										<td><input name="emp_info_impd_type" type="text"></td>
										<td class="titleCell">장애급수</td>
										<td><input name="emp_info_impd_levl" type="text"></td>
										<td class="titleCell">병역여부</td>
										<td><input name="emp_info_mils" type="text" placeholder="Y/N" required></td>
									</tr>
									<tr>
										<td class="titleCell">주소</td>
										<td colspan="3"><input name="emp_info_adr" type="text"></td>
										<td class="titleCell">주민등록번호</td>
										<td><input type="text" name="emp_info_id_no" placeholder="123456-1234567" required></td>
									</tr>
								</table></li>
							<br>
							<li><span>기본정보</span>
								<table class="detailPersonalInfoTable">
									<tr>
										<td class="titleCell">입사일</td>
										<td><input type="text" name="emp_info_sdat" placeholder="예) 2020-12-12" required></td>
										<td class="titleCell">퇴사일</td>
										<td><input type="text" name="emp_info_edat" readonly></td>
										<td class="titleCell">비상연락처</td>
										<td><input name="emp_info_emrg_tel" type="text" required></td>
									</tr>
									<tr>
										<td class="titleCell">은행이름</td>
										<td><input name="emp_info_bank_name" type="text" required></td>
										<td class="titleCell">예금주명</td>
										<td><input name="emp_info_acnt_name" type="text" required></td>
										<td class="titleCell">계좌번호</td>
										<td><input name="emp_info_acnt_no" type="text" required></td>
									</tr>
								</table>
							</li>
							<br>
							<span class="openClose">상세정보 열기 <i onclick="moreView();" class='far fa-caret-square-down'></i></span>
							<br> <br>
							<div class="more hideInfo">
								<ul>
									<li>
										<div class="infoTableDiv">
											<span>자격정보</span>
											<span class="xSmallInfo">(값을 입력한 뒤 상단의 "작성완료" 버튼을 클릭하세요.)</span>
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
												<!-- 입력부분 시작 -->
												<tr class="crtfInput">
													<td><input class="newInput" type="text" placeholder="국가/민간 + 자격/면허/어학" name="crtfList[0].crtf_info_type"></td>
													<td><input class="newInput" type="text" placeholder="입력" name="crtfList[0].crtf_info_crtf_name"></td>
													<td><input class="newInput" type="text" placeholder="입력" name="crtfList[0].crtf_info_crtf_no"></td>
													<td><input class="newInput" type="text" placeholder="예) 2020-12-12" name="crtfList[0].crtf_info_sdat"></td>
													<td><input class="newInput" type="text" placeholder="입력" name="crtfList[0].crtf_info_crtf_levl"></td>
													<td><input class="newInput" type="text" placeholder="입력" name="crtfList[0].crtf_info_inst"></td>
													<td><input class="newInput" type="text" placeholder="예) 2020-12-12" name="crtfList[0].crtf_info_edat"></td>
													<td><input class="newInput" type="text" name="crtfList[0].crtf_info_rm"></td>
												</tr>
												<!-- 입력부분 끝 -->
											</table>
										</div>
									</li>
									<br>
									<li>
										<div class="infoTableDiv">
											<span>경력이력</span>
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
												<tr>
													<td><input class="newInput" type="text" placeholder="예) 2020-12-12" name="carrList[0].carr_hstr_sdat"></td>
													<td><input class="newInput" type="text" placeholder="예) 2020-12-15" name="carrList[0].carr_hstr_edat"></td>
													<td><input class="newInput" type="text" placeholder="입력" name="carrList[0].dept_info_name"></td>
													<td><input class="newInput" type="text" placeholder="입력" name="carrList[0].job_info_name"></td>
													<td>
														<input hidden class="newInput" type="text" name="carrList[0].year_term" disabled>
														<input class="newInput" type="text" placeholder="미입력" name="carrList[0].month_term" disabled>
													</td>
													<td><input class="newInput" type="text" placeholder="입력" name="carrList[0].carr_hstr_job_type"></td>
													<td><input class="newInput" type="text" name="carrList[0].carr_hstr_rm"></td>
												</tr>
											</table>
										</div>
									</li>
									<br>
									<li>
										<div class="infoTableDiv">
											<span>포상/징계이력</span>
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
												<tr>
													<td><input class="newInput" type="text" placeholder="예) 2020-12-12" name="hrevList[0].rwdp_hstr_dat"></td>
													<td><input class="newInput" type="text" placeholder="입력" name="hrevList[0].rwdp_hstr_type"></td>
													<td><input class="newInput" type="text" placeholder="입력" name="hrevList[0].rwdp_hstr_cont"></td>
													<td><input class="newInput" type="text" placeholder="" name="hrevList[0].rwdp_hstr_resn"></td>
													<td><input class="newInput" type="text" name="hrevList[0].rwdp_hstr_rm"></td>
												</tr>
											</table>
										</div>
									</li>
									<br>
									<li>
									<div class="infoTableDiv">
										<span>인사평가이력</span>
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
											<tr>
												<td><input class="newInput" type="text" placeholder="입력" name="rediList[0].hrev_info_dat "></td>
												<td><input class="newInput" type="text" placeholder="입력" name="rediList[0].dept_info_name"></td>
												<td><input class="newInput" type="text" placeholder="입력" name="rediList[0].hrev_info_achv"></td>
												<td><input class="newInput" type="text" placeholder="입력" name="rediList[0].hrev_info_eval"></td>
												<td><input class="newInput" type="text" placeholder="입력" name="rediList[0].emp_info_name"></td>
												<td><input class="newInput" type="text" placeholder="입력" name="rediList[0].hrev_info_rm"></td>
											</tr>
										</table>
									</div>
									</li>
									<br>
								</ul>
							</div>
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
				if (leftBar <= window) {
					$(".leftBar").addClass("fixed");
				} else {
					$(".leftBar").removeClass("fixed");
				}
			});
			<!-- 왼쪽바 고정 추가 옵션 끝 -->
			
			<!-- 비밀번호 일치여부 확인 시작 -->
			$(".pwd1").on("change", function(){
				var p1 = $(".pwd1").val();
				var p2 = $(".pwd2").val();
				
				if( !isNull(p1) && !isNull(p2) && (p1 == p2) ){
					$(".pwdCheckMsg").text("확인 완료");
					$(".pwdCheckMsg").removeClass("wrongPwd");
				} else if(!isNull(p1) && !isNull(p2) && (p1 != p2)){
					$(".pwdCheckMsg").text("비밀번호가 일치하지 않습니다.");
					$(".pwdCheckMsg").addClass("wrongPwd");
				} else{
					$(".pwdCheckMsg").text("비밀번호를 입력하세요.");
					$(".pwdCheckMsg").addClass("wrongPwd");
				}
			});
			
			$(".pwd2").on("change", function(){
				var p1 = $(".pwd1").val();
				var p2 = $(".pwd2").val();
				
				if( !isNull(p1) && !isNull(p2) && (p1 == p2) ){
					$(".pwdCheckMsg").text("확인 완료");
					$(".pwdCheckMsg").removeClass("wrongPwd");
				} else if(!isNull(p1) && !isNull(p2) && (p1 != p2)){
					$(".pwdCheckMsg").text("비밀번호가 일치하지 않습니다.");
					$(".pwdCheckMsg").addClass("wrongPwd");
				} else{
					$(".pwdCheckMsg").text("비밀번호를 입력하세요.");
					$(".pwdCheckMsg").addClass("wrongPwd");
				}
			});
			<!-- 비밀번호 일치여부 확인 끝 -->
			
		});

		<!-- 더보기 열기/닫기 시작 -->
		function moreView(){
			if($(".more").hasClass("hideInfo")){
				$(".more").removeClass("hideInfo").addClass("showInfo");
				$(".openClose").html('상세정보 닫기 <i onclick="moreView();" class="far fa-caret-square-up"></i>');
			
			} else if($(".more").hasClass("showInfo")){
				$(".more").removeClass("showInfo").addClass("hideInfo");
				$(".openClose").html('상세정보 열기 <i onclick="moreView();" class="far fa-caret-square-down"></i>');
			}
		};
		<!-- 더보기 열기/닫기 끝 -->
		
		function isNull(value){
			return ( value === undefined || value === null || value === "" ) ? true : false;
		};
		
	</script>
</body>
</html>