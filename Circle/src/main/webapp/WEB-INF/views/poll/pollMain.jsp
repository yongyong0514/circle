<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollMain.css">
</head>
<body>

	<!-- 전체 래핑 -->
	<div class="poll-wrap">
		
		<div class="poll-topMenu">
			<!-- 상단 메뉴바 -->
			<jsp:include page="../common/menuTopBar.jsp" />
			<!-- /상단 메뉴바 종료-->
			
			<!-- 상단 오버레이 팝업 바 -->
			<jsp:include page="../common/menuAlertBar.jsp" />
			<!-- /상단 오버레이 팝업 바 종료-->
		</div>
		
		<!-- 좌측 메뉴바 시작 -->
		<div class="poll-navLeft">
			<jsp:include page="../poll/pollLeftBar.jsp" />
		</div>
		
		<!-- 컨텐츠 구현부분 -->
		<div class="poll-container">
		

			<!-- 좌측 메뉴바 종료 -->
			
			<!-- 설문 구현부분 시작-->
			<div class="poll-content">
				<div>
					<jsp:include page="../poll/pollHome.jsp"/>
				</div>
			</div>
			<!-- 설문 구현부분 종료-->
			
		</div>
		<!-- /컨텐츠 구현부분 종료-->
		
	</div>
	<!-- /전체 래핑 종료 -->
</body>
</html>