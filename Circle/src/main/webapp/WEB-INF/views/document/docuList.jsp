<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/document/docuList.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="docuLeftBar.jsp" />
		</div>
		<div class="container">
			<div class="contentBar">
				<jsp:include page="docuHomeBar.jsp" />
			</div>
			<div class="content">
			<div class="signHomeListBar">
				<ul>
					<li class="signHomeListTitle"><img src="${pageContext.request.contextPath}/resources/img/sign/document.png" class="signHomeListTitleImg">최근 등록 나의 문서</li>
					<li><button class="signListBtn3">작성일</button></li>
					<li><button class="signListBtn1">작성자</button></li>
					<li><button class="signListBtn0">제목</button></li>
				</ul>
			</div>		
			<div class="docuList">
				<table id="listArea">
				<c:forEach var="list1" items="${list1}">
					<tr class="result" onclick="location='${pageContext.request.contextPath}/docu/docuSelectOne?docuCode=<c:out value="${list1.docu_code}"/>'">
						<td class="textBox0"></td>
						<td class="imgBox1"><img src="${pageContext.request.contextPath}/resources/img/sign/chat.png" class="img0"></td>
						<td><img src="${pageContext.request.contextPath}/resources/img/sign/process_ready.png" class="img1"></td>
						<td class="textBox4"><br><c:out value="${list1.docu_wdat}"/><br><br><c:out value="${list1.docu_whour}"/></td>
						<td class="textBox1"><br><c:out value="${list1.emp_info_name}"/><br><c:out value="${list1.job_info_name}"/></td>
						<td class="textBox2"><c:out value="${list1.docu_title}"/></td>						
					</tr>
				</c:forEach>
				</table>
			</div>
			<div class="signHomeListBar">
				<ul>
					<li class="signHomeListTitle"><img src="${pageContext.request.contextPath}/resources/img/sign/document.png" class="signHomeListTitleImg">최근 등록 공용 문서</li>
					<li><button class="signListBtn3">작성일</button></li>
					<li><button class="signListBtn1">작성자</button></li>
					<li><button class="signListBtn0">제목</button></li>
				</ul>
			</div>
			<div class="docuList">
				<table id="listArea">
				<c:forEach var="list2" items="${list2}">
					<tr class="result" onclick="location='${pageContext.request.contextPath}/docu/docuSelectOne?docuCode=<c:out value="${list2.docu_code}"/>'">
						<td class="textBox0"><c:out value="${list2.docu_code}"/></td>
						<td class="imgBox1"><img src="${pageContext.request.contextPath}/resources/img/sign/chat.png" class="img0"></td>
						<td><img src="${pageContext.request.contextPath}/resources/img/sign/process_ready.png" class="img1"></td>
						<td class="textBox4"><br><c:out value="${list2.docu_wdat}"/><br><br><c:out value="${list2.docu_whour}"/></td>
						<td class="textBox1"><br><c:out value="${list2.emp_info_name}"/><br><c:out value="${list2.job_info_name}"/></td>
						<td class="textBox2"><c:out value="${list2.docu_title}"/></td>						
					</tr>
				</c:forEach>
				</table>
			</div>
			</div>
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