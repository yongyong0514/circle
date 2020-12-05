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
	href="${pageContext.request.contextPath}/resources/css/addressBook/main.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="common/addressBookLeftBar.jsp" />
		</div>
		<div class="organChart">
			<c:import url="/organChart/getInfo" />
		</div>
		<div class="container">
			<div class="content">
				<!-- 주소록 이름 -->
				<h1>전사주소록(주소록 이름)</h1>
				<button value="alertAll">이 그룹에게 전체쪽지 보내기</button>
				<br>
				<br>
				<form class="searchAddress">
					<!-- 검색창 시작 -->
					<input class="searchBox" type="text" name="name"
						placeholder="이름(표시명)" /> <input class="searchBox" type="text"
						name="email" placeholder="이메일 주소" /> <input class="searchBox"
						type="text" name="tel" placeholder="휴대전화번호" /> <input
						type="submit" value="검색하기" />&nbsp; <input type="submit"
						value="추가하기" />
					<!-- 검색창 끝 -->

					&nbsp;
					<!-- 주소록 출력설정 시작-->
					<button value="field">필드설정</button>
					&nbsp; <label>페이지 당 출력개수</label> <select>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="50">50</option>
					</select>
					<!-- 주소록 출력설정 끝 -->

					<br> <br>
					<!-- 주소록 색인 시작 -->
					<table class="indexTable">
						<tr>
							<td><a class="index" href="#">전체</a></td>
							<td><a class="index" href="#">ㄱ</a></td>
							<td><a class="index" href="#">ㄴ</a></td>
							<td><a class="index" href="#">ㄷ</a></td>
							<td><a class="index" href="#">ㄹ</a></td>
							<td><a class="index" href="#">ㅁ</a></td>
							<td><a class="index" href="#">ㅂ</a></td>
							<td><a class="index" href="#">ㅅ</a></td>
							<td><a class="index" href="#">ㅇ</a></td>
							<td><a class="index" href="#">ㅈ</a></td>
							<td><a class="index" href="#">ㅊ</a></td>
							<td><a class="index" href="#">ㅋ</a></td>
							<td><a class="index" href="#">ㅌ</a></td>
							<td><a class="index" href="#">ㅍ</a></td>
							<td><a class="index" href="#">ㅎ</a></td>
							<td><a class="index" href="#">etc</a></td>
						<tr>
					</table>
					<!-- 주소록 색인 끝 -->

						<c:choose>
							<c:when test="${url == 'main' }">
								<c:import url="/addressBook/allEmp"/>
							</c:when>
						</c:choose>
						<!-- 주소 리스트 끝 -->
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