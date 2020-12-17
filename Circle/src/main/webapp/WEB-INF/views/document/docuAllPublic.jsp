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
					<li class="signHomeListTitle"><img src="${pageContext.request.contextPath}/resources/img/sign/document.png" class="signHomeListTitleImg">전체 공용 문서</li>
					<li><button class="signListBtn3">작성일</button></li>
					<li><button class="signListBtn1">작성자</button></li>
					<li><button class="signListBtn0">제목</button></li>
				</ul>
			</div>		
			<div class="docuList1">
				<table id="listArea">
				<c:forEach var="list" items="${list}">
					<tr class="result" onclick="location='${pageContext.request.contextPath}/docu/docuSelectOne?docuCode=<c:out value="${list.docu_code}"/>'">
						<td class="textBox0"></td>
						<td class="imgBox1"><img src="${pageContext.request.contextPath}/resources/img/sign/file.png" class="img0"></td>
						<td><img src="${pageContext.request.contextPath}/resources/img/sign/public.png" class="img1"></td>
						<td class="textBox4"><br><c:out value="${list.docu_wdat}"/><br><br><c:out value="${list.docu_whour}"/></td>
						<td class="textBox1"><br><c:out value="${list.emp_info_name}"/><br><c:out value="${list.job_info_name}"/></td>
						<td class="textBox2"><c:out value="${list.docu_title}"/></td>						
					</tr>
				</c:forEach>
				</table>
			</div>
			</div>
				<div class="paging-area" align="center">
					<button id="paging" onclick="location.href='${pageContext.request.contextPath}/docu/docuAllPublic?currentPages=1'"><<</button>
			
						<c:if test="${ pi.currentPage <= 1 }">
							<button id="paging" disabled><</button>
						</c:if>
			
						<c:if test="${ pi.currentPage > 1 }">
							<button id="paging" onclick="location.href='${pageContext.request.contextPath}/docu/docuAllPublic?currentPages=<c:out value="${ pi.currentPage - 1 }"/>'"><</button>
						</c:if>
		
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
							<c:if test="${ pi.currentPage eq p }">
								<button id="paging" disabled><c:out value="${ p }"/></button>
							</c:if>
							<c:if test="${ pi.currentPage ne p }">
								<button id="paging" onclick="location.href='${pageContext.request.contextPath}/docu/docuAllPublic?currentPages=<c:out value="${ p }"/>'"><c:out value="${ p }"/></button>
							</c:if>
						</c:forEach>

						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<button id="paging" disabled>></button>
						</c:if>
						
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<button id="paging" onclick="location.href='${pageContext.request.contextPath}/docu/docuAllPublic?currentPages=<c:out value="${ pi.currentPage + 1 }"/>'">></button>
						</c:if>
						<button id="paging" onclick="location.href='${pageContext.request.contextPath}/docu/docuAllPublic?currentPages=<c:out value="${ pi.maxPage }"/>'">>></button>
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