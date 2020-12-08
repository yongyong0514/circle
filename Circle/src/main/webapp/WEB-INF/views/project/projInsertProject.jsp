<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="../project/projSidebar.jsp" />
		</div>
		<div class="container">
			<div class="contentBar">
				<jsp:include page="../project/projHomebar.jsp" />
				<jsp:include page="../project/projConsole.jsp" />

			</div>
			<div class="content">

				<!-- 본문 -->
				<!-- 전체 게시판 불러오기 -->

				<div class="form" id="project">

					<div class="title">프로젝트 생성</div>
					<form name="projInsertProject" id="postInsert"
						action="${pageContext.request.contextPath}/project/projInsertProject"
						method="POST">
						<div class="inputfield">
							<label for="pro_title">프로젝트 명</label> <input type="text"
								class="input" id="pro_title" name="pro_title"
								placeholder="이름을 입력하세요">
							<div class="inputfield">
								<label for="pro_intro">본문</label>
								<textarea class="textarea" id="pro_intro" name="pro_intro"></textarea>
							</div>
							<div class="inputfield">
							
							<!--  오늘 이전 선택 불가 + 시작일 선택 -> 종료일 그 이전 선택 불가 -->
								<label for="pro_sdate">시작일 </label> <label>날짜 선택 <!-- 만약 체크가 되어있다면 -->
									<input type="date" id="pro_sdate" name="pro_sdate"></label>

							</div>

							<div class="inputfield">
								<label for="pro_edate">종료일 </label>
								<!-- 만약 체크가 되어있다면 -->
								<label for="pro_edate">날짜 선택 <input type="date"
									id="pro_edate" name="pro_edate" ></label>
							</div>
						</div>
						<div class="inputfield">
							<label for="pro_manager">담당자 </label> <select id="pro_manager"
								name="pro_manager">
								<option>담당자 선택</option>

								<option id="pro_manager" value="${empNo}">작성자</option>
								<c:forEach var="projMember" items="${projMember }">
									<option id="pro_manager" value="${projMember.emp_info_emp_no }">${projMember.dept_info_name}
										${projMember.emp_info_name }</option>
								</c:forEach>
							</select>
						</div>

						<div class="inputfield">
							<input type="submit" value="글쓰기" class="btn" name="submit"
								id="submit"> <input type="reset" value="초기화" class="btn"
								name="reset" id="reset"> <input type="button"
								value="돌아가기" class="btn" name="return" id="return">

						</div>
					</form>
				</div>

				<!--  본문 종료 -->
			</div>
		</div>
	</div>


</body>
</html>