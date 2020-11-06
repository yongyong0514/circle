<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signHomeListBar.css">
</head>
<body>
	<div class="signHomeListBar">
		<ul>
			<li class="signHomeListTitle"><img src="${pageContext.request.contextPath}/resources/img/sign/document.png" class="signHomeListTitleImg">나의 결재</li>
			<li><button class="signListBtn1">작성자</button></li>
			<li><button class="signListBtn2">남은결재</button></li>
			<li><button class="signListBtn2">결재자</button></li>
			<li><button class="signListBtn2">참조자</button></li>
			<li><button class="signListBtn2">수정</button></li>
			<li><button class="signListBtn1">작성일</button></li>
		</ul>
	</div>
</body>
</html>