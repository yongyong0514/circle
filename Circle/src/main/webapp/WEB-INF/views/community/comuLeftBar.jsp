<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common/menuBar/menuLeftBar.css">
</head>
<body>
	<div>
		<div class="menuLeftBar">
			<div class="menuLeftListTop" onclick="location.href='/circle/community/comuList'">동호회</div>
			
			<div class="menuLeftListBtn">
			<%-- <c:if test="${ !empty sessionScope.member }">  --%>
			<button class="menuLeftBtn" onclick="location.href='/circle/community/comuAdd'">글 작성</button>
			<%-- 	</c:if> --%>
			</div>
			
			<div class="menuLeftListBtn">
			<%-- <c:if test="${ !empty sessionScope.member }">  --%>
			<button class="menuLeftBtn" onclick="location.href='/circle/community/comuAppList'">가입신청서 보기</button>
			<%-- 	</c:if> --%>
			</div>
			
			<div class="menuLeftListBtn">
			<%-- <c:if test="${ !empty sessionScope.member }">  --%>
			<!-- <button class="menuLeftBtn" onclick="location.href='/circle/community/comuApp'">가입 신청</button> -->
			<%-- 	</c:if> --%>
			</div>
			
			<div class="menuLeftList"></div>
			
			<div class="menuLeftListTitle"># 가입 동호회</div>
				<form>
				<input type="hidden" class="formInput1" id="emp_info_name" value="${empInfo.emp_info_name}" readonly>
				<input type="hidden" class="formInput1" id="sign_emp_code" name="sign_emp_code" value="${empInfo.emp_info_emp_no}" readonly>
				
				<c:forEach var="leftList" items="${leftList}"> 
				<input type="hidden" name="emp_info_emp_no" value="${leftList.comu_info_emp_no}">
			<div class="menuLeftList"><span>${leftList.comu_list_name}</span></div>
			<!-- <div class="menuLeftList"></div>					
			<div class="menuLeftList"></div>
			<div class="menuLeftList"></div>
			<div class="menuLeftList"></div> -->
			</c:forEach>
			</form>
			<!-- <div class="menuLeftListTitle"># 가입 회원</div> -->
									
			<!-- <div class="menuLeftList">전체</div>
			<div class="menuLeftList"></div> -->															
		</div>
	</div>
</body>
</html>