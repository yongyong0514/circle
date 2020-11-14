<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/storage/storageList.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="storageLeftBar.jsp" />
		</div>
		<div class="container">
			<div class="contentBar">
				<jsp:include page="storageHomeBar.jsp" />
			</div>	
			<div class="content">
				<div class="resultArea1">
					<table id="listArea">
						<c:forEach var="storage" items="${list}">
							<tr>
								<th></th>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div>
					<jsp:include page="storageHomeBar2.jsp" />
				</div>
				<div class="resultArea1">
				</div>
			</div>
		</div>
	</div>
<!-- 왼쪽바 고정 추가 옵션 시작-->
	<script>
		$(function() {
    		var leftBar = $(".leftBar").offset().top;
    			$(window).scroll(function() {
    		var window = $(this).scrollTop();
    		console.log(leftBar+"left");
    		console.log(window+"window");
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