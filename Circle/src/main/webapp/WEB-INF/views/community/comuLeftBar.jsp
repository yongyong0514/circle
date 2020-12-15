<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/menuBar/menuLeftBar.css">
<style>
	a:hover{
	color:black;
	}
</style>
</head>
<body>
	<div>
		<div class="menuLeftBar">
			<div class="menuLeftListTop" onclick="location.href='/circle/community/comuList'">
			<a>동호회</a>
			</div>
			
			<div class="menuLeftListBtn">
			
			<button class="menuLeftBtn" onclick="location.href='/circle/community/comuAdd'">글 작성</button>
			
			</div>
			
			<div class="menuLeftListBtn">
		 	<%-- <c:if test="${ !empty sessionScope.member }"> --%>
			<button class="menuLeftBtn" onclick="location.href='/circle/community/comuAppList'">가입신청서 보기</button>
			<%-- 	</c:if> --%>
			</div>
			
			<div class="menuLeftListBtn">
			<%-- <c:if test="${ !empty sessionScope.member }">  --%>
			<!-- <button class="menuLeftBtn" onclick="location.href='/circle/community/comuApp'">가입 신청</button> -->
			<%-- 	</c:if> --%>
			</div>
			<%-- <c:if test="${ !empty empInfo}"> --%>
			<!-- <div class="menuLeftList"></div> -->
		
			
			<%-- <form action="${pageContext.request.contextPath}/community/comuLeftBar"
						method="post"> --%>
			<div class="menuLeftListTitle"># 가입 동호회</div>
			<%--  <c:forEach var="empNo" items="${empNo}"> 
			<div class="menuLeftList">${empNo.comu_list_name}</div>
				<input type="hidden" value="${empNo.comu_list_code}">
			 </c:forEach>  --%>
			<!-- </form> -->
			<!-- <div class="menuLeftListTitle"># 가입 회원</div> -->
			<%-- </c:if> --%>		
			<!-- <div class="menuLeftList">전체</div>
			<div class="menuLeftList"></div> -->															
		</div>
	</div>
</body>
</html>