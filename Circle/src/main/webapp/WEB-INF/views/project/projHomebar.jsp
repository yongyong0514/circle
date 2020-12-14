<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<style>
hearder {
	text-align: left;
	font-size: 15pt;
}

h2 {
	font-size: 15px;
	text-align: left;
}

/*버튼 구현*/
.button-1 {
	width: 80px;
	height: 30px;
	top: 15%;
	left: 10%;
	border: 2px solid #34495e;
	float: left;
	text-align: center;
	cursor: pointer;
	position: relative;
	head_sele-sizing: border-head_sele;
	overflow: hidden;
	margin: 0 0 40px 0;
}

.button-1 a {
	  background: #ffd658;
}


.button-1:hover a {
	font-color: white;
}

/* select bodx*/
.head_sele {
	position: absolute;
	top: 14%;
	left: 14%;
	transform: translate(-50%, -50%);
}

.head_sele select {
	background-color: #fff;
	color: bla;
	padding: 12px;
	width: 160px;
	height: 40px;
	border: none;
	font-size: 10px;
	head_sele-shadow: 0 5px 25px rgba(0, 0, 0, 0.2);
	-webkit-appearance: button;
	appearance: button;
	outline: none;
}

.head_sele:hover::before {
	color: #34495e;
	background-color: #34495e;
}

.head_sele select option {
	padding: 30px;
	font-size: 10px;
}
</style>
<script>


</script>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/post/postHomebar.css">
</head>
<body>
	<div class="postHomeBar">
		<div>
				<c:out value="프로젝트"/>
	
		</div>
		<div>
		<div>
<div class="button-1">
			<a	href="${pageContext.request.contextPath}/project/projMain?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">프로젝트 리스트</a>
		</div>
		<div class="button-1">
				<a	href="${pageContext.request.contextPath}/project/projIssAll?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">업무리스트</a>
		</div>
		<div class="button-1">
				<a	href="${pageContext.request.contextPath}/project//project/projInsertProject'">프로젝트 생성</a>
		</div>
		<div class="button-1">
				<a	href="${pageContext.request.contextPath}/project/projInsertIss">업무 생성</a>
		</div>
		


</div>
		</div>

	</div>


</body>
</html>
