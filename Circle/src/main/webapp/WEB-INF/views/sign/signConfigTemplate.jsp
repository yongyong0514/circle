<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signConfigTemplate.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="../sign/signLeftBar.jsp" />
		</div>
		<div>
			<c:import url="/organChart/getInfo"/>
		</div>
		<div class="container">
			<div class="contentBar">
				<div class="signHomeBar">
					<ul>
						<li class="signHomeTitle">전자결재 문서 양식 등록</li>
					</ul>
				</div>
				<div class="signHomeListBar">
					<ul>
						<li>
							<button class="signMakeTemplate" onclick="location='${pageContext.request.contextPath}/sign/signConfigTemplateWrite'">새 전자결재 양식 만들기</button>
						<li>
					</ul>
				</div>
			</div>
			<div class="content">
				<div class="TemplateList">
					<table id="listArea">
						<c:forEach var="list1" items="${list1}">
							<tr class="result">
								<td class="textBox0"></td>
								<td class="imgBox1"><img src="${pageContext.request.contextPath}/resources/img/sign/wlist.png" class="img0"></td>
								<td class="textBox2" onclick="location='${pageContext.request.contextPath}/sign/signTemplateSelectOne?typeCode=<c:out value="${list1.sign_type_code}"/>'"><c:out value="${list1.sign_type_name}"/></td>
								<td class="test"><button class="delBtn" value="${list1.sign_type_code}">삭제</button></td>						
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
<!-- SCRIPT 영역 -->
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 왼쪽바 고정 추가 옵션 시작 -->
	<script>
		$(function() {
			var leftBar = $(".leftBar").offset().top;
			$(window).scroll(function() {
				var window = $(this).scrollTop();
				if (leftBar <= window) {
					$(".leftBar").addClass("fixed");
				} else {
					$(".leftBar").removeClass("fixed");
				}
			})
		});
	</script>
	
<!-- 타입 삭제 -->
	<script>
		$(document).on('click', '.delBtn', function(){
			var base = "${pageContext.request.contextPath}";
 			var typeCode = $(this).val();
 			
 			$.ajax({
				url: base + "/signResult/signTypeDelete",
				type: "post",
				data: {typeCode : typeCode},
				success: function(){
					location.reload(true);
				},
				error: function(){
					alert("error");
				}
			});
		});
	</script>
</body>
</html>