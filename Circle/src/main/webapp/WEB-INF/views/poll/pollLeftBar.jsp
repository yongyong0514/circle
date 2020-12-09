<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/poll/pollLeftBar.css">
<script src='${pageContext.request.contextPath}/resources/js/poll/jquery.min.js'></script>
</head>

<body>
	<div class="menuLeftBar">
		<div class="menuLeftListTop" id="poll-top">설문</div>
		<div class="menuLeftListBtn"><button class="menuLeftBtn">새 설문 추가</button></div>
		<div class="menuLeftList" style="pointer-events: none;"></div>
		<div class="menuLeftListTitle">설문</div>
		<div class="menuLeftList" id="poll-progress">
			진행중인 설문
		</div>
		<div class="menuLeftList" id="poll-finished">마감된 설문</div>					
		<div class="menuLeftList" id="poll-my">내 설문</div>
	</div>
<script>
	$(document).ready(function(){
		/********************** 
		** 설문 메뉴 버튼 기능 
		***********************/
		
		//좌측메뉴 상단을 누르면 메인으로 가는 기능
		$("#poll-top").on("click", function(){
			location.href ="${pageContext.request.contextPath}/poll/pollMain";
		});
		
		$(".menuLeftBtn").on("click",function(){
			location.href ="${pageContext.request.contextPath}/poll/insert";
		})
		
		$('#poll-progress').on('click', function(){
			location.href = "${pageContext.request.contextPath}/poll/progress";
		});
		
 		$('#poll-finished').on('click', function(){
			location.href = "${pageContext.request.contextPath}/poll/finished";
		});
 		
		$('#poll-my').on('click', function(){
			location.href = "${pageContext.request.contextPath}/poll/my";
		});
		
	});
</script>
</body>
</html>