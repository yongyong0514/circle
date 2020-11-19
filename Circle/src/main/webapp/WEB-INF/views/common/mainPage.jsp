<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
    
    
<!DOCTYPE html>
<html>
<head>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
		<div class="container">
			<div class="navLeft">
				<jsp:include page="../common/menuLeftBar.jsp" />
			</div>
			<div class="content">
	
	<c:if test="${member != null}">
			<div>
				<p>${member.EMP_INFO_NAME}님 환영 합니다잉.</p>
				  <a href="#" id="logout">로그아웃</a>
			</div>
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