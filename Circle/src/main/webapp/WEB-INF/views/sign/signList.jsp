<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signList.css">
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
	</div>
	<div class="leftBar">
		<jsp:include page="../sign/signLeftBar.jsp" />
	</div>
	<div class="container">
		<div class="contentBar">
			<jsp:include page="../sign/signHomeBar.jsp" />
			<jsp:include page="../sign/signHomeListBar.jsp" />
		</div>
		<div class="content">
			<div class="resultArea1">
				<table id="listArea">
					<c:forEach var="sign" items="${list}">
						<tr id="result">
							<th class="imgBox1" rowspan="2"><img src="${pageContext.request.contextPath}/resources/img/sign/chat.png" class="img1"></td>
							<th class="textBox1"><c:out value="${sign.sign_type_name}"/></th>
							<th rowspan="2"></th>
							<th rowspan="2"></th>
							<th><c:out value="${sign.emp_info_name}"/></th>							
							<th><c:out value="${sign.sign_wdat}"/></th>
							<th><c:out value="${sign.sign_edat}"/></th>							
						</tr>
						<tr>
							<th class="textBox2"><c:out value="${sign.sign_title}"/></th>
							<th><c:out value="${sign.emp_info_name}"/></th>
							<th></th>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div>
				<jsp:include page="../sign/signHomeListBar2.jsp" />
			</div>
			<div class="resultArea1"></div>
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