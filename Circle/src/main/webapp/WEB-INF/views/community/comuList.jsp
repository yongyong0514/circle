<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/community/comuList.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<style>
#listArea{
 color:black;
 font-size: 17px;
	font-weight: bolder;
}
</style>

</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
		<div class="container">
			<div class="navLeft">
				<jsp:include page="../community/comuLeftBar.jsp" />
			</div>
			<div class="content">
				<div>
					<jsp:include page="../community/comuHomeBar.jsp"/>
					<jsp:include page="../community/comuHomeListBar.jsp"/>
				</div>
				<div class="resultArea1">
				
		
				<br>
							
			<table align="center" id="listArea">
				<tr>
					<th width="100px">글번호</th>
					<th width="100px">동호회</th>
					<th width="300px">글제목</th>
					<th width="100px">작성자</th>
					<th width="100px">조회수</th>
					<th width="150px">작성일</th>
				</tr>
				<c:forEach var="b" items="${ requestScope.list }">
					<tr>
						<td><c:out value="${ b.COMU_POST_ORDR }"/></td>
						<td><c:out value="${ b.COMU_POST_COMU_CODE }"/></td>
						<td><c:out value="${ b.COMU_POST_TITLE }"/></td>
						<td><c:out value="${ b.COMU_POST_WRTR_EMP_NO }"/></td>
						<td><c:out value="${ b.COMU_POST_VIEW }"/></td>
						<td><c:out value="${ b.COMU_POST_DAT }"/></td>
					</tr>
				</c:forEach>
			</table>
			
			
				</div>		
			</div>
		</div>
	</div>

</body>
</html>