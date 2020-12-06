<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/mainPage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
	</div>
	<div class="leftBar">
		<jsp:include page="mainLeftBar.jsp" />
	</div>
	<div class="container">
		<div class="content">
			<div class="boardArea">
				<div class="boardList0">
					<div class="boardList0_1"></div>
				</div>
				
				<div class="boardList1">
					<div class="boardList1_1"></div>
				</div>
				
				<div class="boardList2">
					<div class="boardList2_1"></div>
				</div>
				<div class="boardList3">
					<div class="boardList3_1"></div>
				</div>
				
				<div class="boardList4">
					<div class="boardList4_1"></div>
				</div>
				<div class="boardList5">
					<div class="boardList5_1"></div>
				</div>
				<div class="boardList6">
					<div class="boardList6_1"></div>
				</div>
			</div>
		</div>
	</div>
<!-- SCRIPT 영역 -->
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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