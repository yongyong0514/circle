<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
    
    
<!DOCTYPE html>
<html>
<head>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signList.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<body>
<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
		<div class="container">
			<div class="navLeft">
				<%-- <jsp:include page="../common/menuLeftBar.jsp" /> --%>
			</div>
			<div class="content">
	
	<c:if test="${ empInfo != null}">
		 
		<form name="logout" action="${pageContext.request.contextPath}/empInfo/logout" method="GET">
		<p>${empInfo.emp_info_name} 님 환영합니다.</p>
			
			<button class="logout">로그아웃</button>
		</form>
		
		</c:if> 
		</div>
			</div>
			 	</div>
	<script>
	 $(function(){
			$("#logout").click(function(){
				location.href = "logout";
			})
     });
	</script>
</body>


</html>