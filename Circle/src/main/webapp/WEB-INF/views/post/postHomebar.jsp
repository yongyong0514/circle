<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/post/postHomebar.css">
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

  .btnm{
position: absolute;
  width: 100px;
  height:40px;
   padding: 8px 10px;
  font-size: 10px; 
  border: 0px;
  background:   #0072c6;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  text-align:center;
  outline: none;
  left: 19%;
  top: 9%;
}

.btnm:hover{
  background:#dbe5f1;
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
	color: black;
	padding: 12px;
	width: 160px;
	height: 38px;
	border: 1px solid;
	border-radius: 3px;
	font-size: 11px;
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
	font-size: 11px;
}
</style>

<div class="postHomeBar">
	<div>
		<!-- 게시판 선택용 -->
		<div class="head_sele">
			<select name="post_type" onchange="location.href=this.value">
				<option value="" selected>게시판 선택</option>
				<option
					value="${pageContext.request.contextPath}/post/postMain?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">게시판
					메인</option>
				<option
					value="${pageContext.request.contextPath}/post/postList/notice?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">공지사항</option>
				<option
					value="${pageContext.request.contextPath}/post/postList/employee?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">전사게시판</option>
				<option
					value="${pageContext.request.contextPath}/post/postList/team?nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">개발본부</option>
				<!--  선택이 안됨 -->

			</select>
		</div>
<input type="button" id="postInsert" class="btnm" onclick="location.href='${pageContext.request.contextPath}/post/postInsert'" value="글쓰기">
		</div>
	</div>


