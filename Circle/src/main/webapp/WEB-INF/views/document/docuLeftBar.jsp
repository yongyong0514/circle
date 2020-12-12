<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/document/docuList.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/document/docuLeftBar.css">
</head>
<body>
	<div>
		<div class="menuLeftBar">
			<div class="menuLeftListTop">문서관리</div>
			<div class="menuLeftListBtn"><button class="menuLeftBtn" onclick="location='${pageContext.request.contextPath}/document/docuWrite'">새 문서 작성</button></div>
			<div class="menuLeftList0"></div>
			<div class="menuLeftListTitle">내 문서</div>
			<div class="menuLeftList">전체</div>
			<div class="menuLeftList"></div>					
			<div class="menuLeftList"></div>
			<div class="menuLeftList"></div>
			<div class="menuLeftList"></div>
			<div class="menuLeftListTitle">공용 문서</div>						
			<div class="menuLeftList">전체</div>
			<div class="menuLeftList"></div>															
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 왼쪽바 고정 추가 옵션 시작-->
	<script>
		$(function() {
    		var leftBar = $(".leftBar").offset().top;
    			$(window).scroll(function() {
    		var window = $(this).scrollTop();
    		if(leftBar <= window) {
    			$(".leftBar").addClass("fixed");
    		} else {
    			$(".leftBar").removeClass("fixed");
    			}
    		})
    	});
    </script>
</body>
</html>