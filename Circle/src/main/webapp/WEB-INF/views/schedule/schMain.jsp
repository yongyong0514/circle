<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/schedule/schMain.css">
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/schedule/schMain_docu.css"> --%>
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
		
		<!-- 좌측 메뉴바 시작 -->
		<div class="sch-navLeft">
			<jsp:include page="../schedule/schMainLeftBar.jsp" />
		</div>
		
		<!-- 컨텐츠 구현부분 -->
		<div class="sch-container">
		

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
	
	
	<!-- 왼쪽바 고정 추가 옵션 시작-->
<!-- 	<script>
		$(function() {
    		var leftBar = $(".leftBar").offset().top;
    			$(window).scroll(function() {
    		var window = $(this).scrollTop();
    		console.log(leftBar+"left");
    		console.log(window+"window");
    		if(leftBar <= window) {
    			$(".leftBar").addClass("fixed");
    		} else {
    			$(".leftBar").removeClass("fixed");
    			}
    		})
    	});
    </script> -->
</body>
</html>