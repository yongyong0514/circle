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

.postHomeBar {
	text-align: right;
	margin: 10px auto;
	display: flex;
}

h2 {
	font-size: 15px;
	text-align: left;
}

/*버튼 구현*/
.button-1 {
	position: absolute;
	width: 100px;
	height: 30px;
	padding: 8px 10px;
	font-size: 10px;
	border: 0px;
	background: #0072c6;
	color: #fff;
	cursor: pointer;
	border-radius: 3px;
	text-align: center;
	outline: none;
	overflow: hidden;
	top: 5%;
	left: 10%;
}

.button-1:hover {
	background: #dbe5f1;
}

.button-2 {
	position: absolute;
	width: 100px;
	height: 30px;
	padding: 8px 10px;
	font-size: 10px;
	border: 0px;
	background: #0072c6;
	color: #fff;
	cursor: pointer;
	border-radius: 3px;
	text-align: center;
	outline: none;
	overflow: hidden;
	top: 5%;
	left: 16%;
}

.button-2:hover {
	background: #dbe5f1;
}

.button-3 {
	position: absolute;
	width: 100px;
	height: 30px;
	padding: 8px 10px;
	font-size: 10px;
	border: 0px;
	background: #0072c6;
	color: #fff;
	cursor: pointer;
	border-radius: 3px;
	text-align: center;
	outline: none;
	overflow: hidden;
	top: 5%;
	left: 22%;
}

.button-3:hover {
	background: #dbe5f1;
}

.button-4 {
	position: absolute;
	width: 100px;
	height: 30px;
	padding: 8px 10px;
	font-size: 10px;
	border: 0px;
	background: #0072c6;
	color: #fff;
	cursor: pointer;
	border-radius: 3px;
	text-align: center;
	outline: none;
	overflow: hidden;
	top: 5%;
	left: 28%;
}

.button-4:hover {
	background: #dbe5f1;
}
</style>
<div class="postHomeBar">
	<div class="button-1">
		<a
			href="${pageContext.request.contextPath}/project/projMain?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">프로젝트
			리스트</a>
	</div>
	<div class="button-2">
		<a
			href="${pageContext.request.contextPath}/project/projIssAll?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">업무리스트</a>
	</div>
	<div class="button-3">
		<a href="${pageContext.request.contextPath}/project/projInsertProject">프로젝트
			생성</a>
	</div>
	<div class="button-4">
		<a href="${pageContext.request.contextPath}/project/projInsertIss">업무
			생성</a>

	</div>
</div>