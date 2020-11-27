<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollLeftBar.css">
</head>
<script>
	$(document).ready(function(){
		//좌측메뉴 상단을 누르면 메인으로 가는 기능
		$(".menuLeftListTop").on("click", function(){
			location.replace("${pageContext.request.contextPath}/poll/pollMain");
		})
	});
</script>
<body>
	<div class="menuLeftBar">
		<div class="menuLeftListTop">설문</div>
		<div class="menuLeftListBtn"><button class="menuLeftBtn">새 설문 추가</button></div>
		<div class="menuLeftList" style="pointer-events: none;"></div>
		<div class="menuLeftListTitle">설문</div>
		<div class="menuLeftList">진행중인 설문</div>
		<div class="menuLeftList">마감된 설문</div>					
		<div class="menuLeftList">내 설문</div>
	</div>
</body>
</html>