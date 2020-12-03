<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollMain.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		<div class="organChart">
			<c:import url="/organChart/getInfo"/>
		</div>
		<!-- 컨텐츠 구현부분 -->
		<div class="poll-container">
		

			<!-- 좌측 메뉴바 종료 -->
			
			<!-- 설문 구현부분 시작-->
			<div class="poll-content">
				<div id="content-box">
					
					<c:choose>
						<c:when test="${url eq 'home'}">
							<jsp:include page="contentArea/pollHome.jsp"/>
						</c:when>
						<c:when test="${url eq 'post'}">
							<jsp:include page="contentArea/pollPost.jsp"/>
						</c:when>
						<c:when test="${url eq 'result'}">
							<jsp:include page="contentArea/pollResult.jsp"/>
						</c:when>
						<c:when test="${url eq 'progress'}">
							<jsp:include page="contentArea/pollProgress.jsp"/>
						</c:when>
						<c:when test="${url eq 'finished'}">
							<jsp:include page="contentArea/pollFinished.jsp"/>
						</c:when>
						<c:when test="${url eq 'my'}">
							<jsp:include page="contentArea/pollMy.jsp"/>
						</c:when>
						<c:when test="${url eq 'insert'}">
							<jsp:include page="contentArea/pollInsert.jsp"/>
						</c:when>
						<c:when test="${url eq 'insertQuestion'}">
							<jsp:include page="contentArea/pollQuestionInsert.jsp"/>
						</c:when>
						<c:otherwise>
							<jsp:include page="contentArea/pollHome.jsp"/>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- 설문 구현부분 종료-->
			
		</div>
		<!-- /컨텐츠 구현부분 종료-->
		
	</div>
	<!-- /전체 래핑 종료 -->
</body>
</html>