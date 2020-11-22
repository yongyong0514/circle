<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/project/projKanban.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

</head>
<body>


	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />

		<div class="navLeft">
			<jsp:include page="../project/projSidebar.jsp" />
		</div>
		<div class="content">
			<div>
				<jsp:include page="../project/projHomebar.jsp" />
			</div>

			<!-- 내용 -->

<div class="container">
			<div class="app">
				<header>
					<h1>DRAG n DROP</h1>
					<div>추가하기</div>
				</header>
				<div class="lists">
				<c:forEach   var="projKanban" items="${projKanban}">
					<div class="list">
						<div class="title">${projKanban.prog_title}</div>
						<div class="list-item" draggable="true">${projKanban.iss_title}</div>
						
					</div>
					</c:forEach>
								</div>
			</div>
</div>
		</div>



		<script src="<c:url value="/resources/js/project/projKanban.js" />"></script>
</body>
</html>