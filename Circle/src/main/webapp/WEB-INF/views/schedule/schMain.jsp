<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/schedule/schMain.css">
</head>
<body>

	<!-- 전체 래핑 -->
	<div class="sch-wrap">
		
		<div class="sch-topMenu">
			<!-- 상단 메뉴바 -->
			<jsp:include page="../common/menuTopBar.jsp" />
			<!-- /상단 메뉴바 종료-->
			
			<!-- 상단 오버레이 팝업 바 -->
			<jsp:include page="../common/menuAlertBar.jsp" />
			<!-- /상단 오버레이 팝업 바 종료-->
		</div>

		
		<!-- 컨텐츠 구현부분 -->
		<div class="sch-container">
		
			<!-- 좌측 메뉴바 시작 -->
			<div class="sch-navLeft">
				<jsp:include page="../schedule/schMainLeftBar.jsp" />
			</div>
			<!-- 좌측 메뉴바 종료 -->
			
			<!-- 캘린더 구현부분 시작-->
			<div class="sch-content">
				<div>
					<jsp:include page="../schedule/schMonth.jsp"/>
				</div>
			</div>
			<!-- 캘린더 구현부분 종료-->
			
		</div>
		<!-- /컨텐츠 구현부분 종료-->
		
	</div>
	<!-- /전체 래핑 종료 -->
</body>
</html>