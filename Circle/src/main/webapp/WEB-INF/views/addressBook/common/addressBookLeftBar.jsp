<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/addressBook/addressBookLeftBar.css">
</head>
<body>
	<div>
		<div class="menuLeftBar">
		
			<!-- 메뉴 시작 -->
			<div class="menuLeftListTop">주소록</div>
			<div class="menuLeftListBtn"><button class="menuLeftBtn">새 주소 추가</button></div>
			<div class="menuLeftList0"></div>

			<div class="menuLeftListTitle">공용주소록</div>
			<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/addressBook/allEmp'">전사 주소록</div>

			<div class="menuLeftListTitle">부서 주소록</div>		
			<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/  '">부서1 ...</div>
			<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/  '">부서2 ...</div>
			<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/  '">부서3 ...</div>

			<div class="menuLeftListTitle">개인 주소록</div>		
			<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/  '">목록1 ...</div>
			<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/  '">목록2 ...</div>
			<div class="menuLeftList" onclick="location.href='${ pageContext.request.contextPath }/  '">목록3 ...</div>
			<!-- 메뉴 끝 -->
		</div>
	</div>
</body>

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
</html>