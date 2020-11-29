<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signLeftBar.css">
</head>
<body>
	<div>
		<div class="menuLeftBar">
			<div class="menuLeftListTop" onclick="location='${pageContext.request.contextPath}/sign/signList'">전자결재</div>
			<div class="menuLeftListBtn"><button class="menuLeftBtn" onclick="location='${pageContext.request.contextPath}/sign/signWrite'">새 결재 작성</button></div>
			<div class="menuLeftList0"></div>
			<div class="menuLeftListTitle">진행 중인 결재</div>
			<div class="menuLeftList">전체</div>
			<div class="menuLeftList">임시 저장</div>					
			<div class="menuLeftList">대기</div>
			<div class="menuLeftList">진행</div>
			<div class="menuLeftList"></div>
			<div class="menuLeftListTitle">결재 문서함</div>						
			<div class="menuLeftList">전체</div>
			<div class="menuLeftList"></div>															
		</div>
	</div>
</body>
</html>