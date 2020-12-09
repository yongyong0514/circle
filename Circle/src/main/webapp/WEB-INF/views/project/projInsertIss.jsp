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
			<jsp:include page="../iss/issSidebar.jsp" />
		</div>
		<div class="container">
			<div class="contentBar">
				<jsp:include page="../iss/issHomebar.jsp" />
				<jsp:include page="../project/projConsole.jsp" />

			</div>
			<div class="content">

				<!-- 본문 -->
				<!-- 전체 게시판 불러오기 -->

				<div class="form" id="iss">

					<div class="title">업무 생성</div>
					<form name="issInsertiss" id="postInsert"
						action="${pageContext.request.contextPath}/project/projInsertIss"
						method="POST" enctype="multipart/form-data">
						<div class="inputfield">
							<label for="iss_title">업무 명</label> <input type="text"
								class="input" id="post_title" name="post_title"
								placeholder="이름을 입력하세요">
							<div class="inputfield">
								<label for="iss_sdate">프로젝트 선택 </label>
								<select>
								<c:forEach var="projMain" items="${projMain}">
									<option id="iss_pro_code" value="${projMain.iss_pro_code }">${projMain.pro_title}
									</option>
								</c:forEach>
								</select>
							</div>
							<div class="inputfield">
								<label for="iss_file">파일</label> <input name="iss_file"
									id="iss_file" type="file" class="input" accept="*.*"
									multiple="multiple">
							</div>
							<div class="inputfield">
								<label for="iss_sdate">진행단계 </label>
								<select>
								<c:forEach var="issProg" items="${issProg}">
									<option id="iss_prog_code" value="${issProg.prog_code }">${issProg.prog_title}
										${issMember.emp_info_name }</option>
								</c:forEach>
								</select>
							</div>
							<div class="inputfield">
								<label for="iss_sdate">업무상황</label>
								<select>
								<c:forEach var="issSitu" items="${issSitu}">
									<option id="iss_situ_code" value="${issSitu.situ_code }">${issSitu.situ_title}
								</option>
								</c:forEach>
								</select>
							</div>
 
							<div class="inputfield">
								<label for="iss_intro">본문</label>
								<textarea class="textarea" id="iss_intro" name="iss_intro"></textarea>
							</div>
							<div class="inputfield">
								<label for="iss_sdate">시작일 </label> <label>날짜 선택 <!-- 만약 체크가 되어있다면 -->
									<input type="date" id="iss_sdate" name="iss_sdate"></label>

							</div>


							<div class="inputfield">
								<label for="iss_edate">종료일 </label>
								<!-- 만약 체크가 되어있다면 -->
								<label for="iss_edate">날짜 선택 <input type="date"
									id="iss_edate" name="iss_edate"></label>
							</div>
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