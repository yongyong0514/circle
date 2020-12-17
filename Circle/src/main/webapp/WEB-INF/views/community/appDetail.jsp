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
				<div>
					<jsp:include page="../community/comuHomeBar.jsp"/>
					<jsp:include page="../community/comuHomeListBar.jsp"/>
				</div>
			<div class="content">
				<jsp:include page="../community/appDetailPart.jsp"/>
				
				<!--  본문  -->
				
				
				
				
				<!--  시작  -->
				
		</div>		
			</div>
		</div>
</body>
</html>