<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css">
</head>
<body>
	<div class="wrap">
		<form name="homeForm" action="${pageContext.request.contextPath}/empInfo/login" method="POST" >
		<c:if test="${!empty empInfo}">
			<script>
				location.href="${pageContext.request.contextPath}/common/mainPage";
			</script>
		</c:if>
		<div class="loginBox">
			<table>
				<tr>
					<th class="row1"><img class="imgSize1" src="${pageContext.request.contextPath}/resources/img/common/circle.png">Circle Professional&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
				</tr>
				<tr>
					<th class="row2">&nbsp;&nbsp;&nbsp;&nbsp;로그인</th>
				</tr>
				<tr>
					<th class="row3">서비스를 이용하시려면 로그인이 필요합니다</th>
				</tr>
				<tr>
					<th class="row4">&nbsp;&nbsp;&nbsp;&nbsp;소속</th>
				</tr>
				<tr>
					<th class="row5"><img class="imgSize2" src="${pageContext.request.contextPath}/resources/img/common/paperlogo.png">&nbsp;&nbsp;페이퍼컴퍼니</th>
				</tr>
				<tr>
					<th class="row0"></th>
				</tr>
				<tr>
					<th class="row4">&nbsp;&nbsp;&nbsp;&nbsp;사원번호</th>
				</tr>
				<tr>
					<th class="row6">
						<input class="input" type="text" name="emp_info_emp_no">
					</th>
				</tr>
				<tr>
					<th class="row4">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</th>
				</tr>
				<tr>
					<th class="row6">
						<input class="input" type="password" name="emp_info_pwd">
					</th>
				</tr>
				<tr>
					<th class="row7" onclick="pwdfind();">&nbsp;&nbsp;&nbsp;&nbsp;사원번호나 비밀번호를 잊어버린 경우 문의주세요.<br>&nbsp;&nbsp;&nbsp;&nbsp;010-5766-1187</th>
				</tr>
				<tr>
					<th class="row6">
						<input class="submit" type="submit" value="로그인">
					</th>
				</tr>
				<tr>
					<th class="row0"></th>
				</tr>
				<tr>
					<th class="row8" onclick="join();">서비스 이용약관</th>
				</tr>
			</table>
		</div>
		<c:if test="${message == false}">
			<p>로그인실패: 사원번호 비밀번호가 틀렸습니다</p>
		</c:if>
		</form>
	</div>

<!-- SCRIPT 영역 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	<script>
	</script>
</body>
</html>