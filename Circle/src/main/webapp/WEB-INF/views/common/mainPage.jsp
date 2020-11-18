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
	<c:if test="${member != null}">
			<div>
				<p>${member.EMP_INFO_NAME}님 환영 합니다.</p>
				  <a href="#" id="logout">로그아웃</a>
			</div>
	</c:if>	
	
	<script>
	 $(function(){
			$("#logout").click(function(){
				location.href = "logout";
			})
     });
	</script>
</body>


</html>