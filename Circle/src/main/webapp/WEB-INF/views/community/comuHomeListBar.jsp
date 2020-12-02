<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/community/comuHomeListBar.css">
</head>
<body>
	<div class="comuHomeListBar">
		<ul>
			
			<li class="comuHomeListTitle" onclick="location.href='/circle/community/comuList'"><img src="${pageContext.request.contextPath}/resources/img/sign/document.png" class="comuHomeListTitleImg">최신글</li>
			
			<li class="comuHomeListTitle" onclick="location.href='/circle/community/comuListName'"><img src="${pageContext.request.contextPath}/resources/img/sign/document.png" class="comuHomeListTitleImg">전체 동호회</li>
			
			<!-- <li><button class="comuListBtn1">작성일</button></li> -->
		
		</ul>
	</div>
</body>
</html>