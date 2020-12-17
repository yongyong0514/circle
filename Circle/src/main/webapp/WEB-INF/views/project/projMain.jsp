<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
	
	<style>
		hearder{

text-align:left;
font-size : 15pt;
}

h2 {
font-size: 15px;
text-align:left;
}


/*버튼 구현*/

.button-1{
  width:80px;
  height:30px;
  top:15%;
  left: 12%;
  border:2px solid #34495e;
  float:left;
  text-align:center;
  cursor:pointer;
  position:relative;
  head_sele-sizing:border-head_sele;
  overflow:hidden;
  margin:0 0 40px 0;
}
.button-1 a{
  font-family:arial;
  font-size:10px;
  top:-10px;
  color:#34495e;
  text-decoration:none;
  text-align:center;
  line-height:50px;
  transition:all .5s ease;
  position:relative;
}
.eff-1{
  width:120px;
  height:50px;
  top:-2px;
  right:-140px;
  background:#34495e;
  position:absolute;
  transition:all .5s ease;
  z-index:1;
}
.button-1:hover .eff-1{
  right:0;
}
.button-1:hover a{
  font-color:white;
}


table.projParts {
	border-collapse: collapse;
	text-align: left;
	width: 80%;
	lin-height: 1.5;
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
}

table.projParts thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.projParts tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.projParts td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

div.wrap {
	position: relative;
}

h1 {
	font-size: 25pt;
	text-align: center;
}

/* 검색 검색 버튼*/
.wrapper {
	position: absolute;
	top: 100%;
	left: 58%;
	transform: translate(-50%, -50%);
}

.container {
	position: relative;
	padding: 20px 50px;
}

.input {
	width: 200px;
	height: 10px;
	border: 3px solid #34495e;
	background: transparent;
	padding: 15px 30px;
	border-radius: 50px;
	outline: none;
	font-size: 18px;
	color: #34495e;
}

::-webkit-input-placeholder { /* Chrome/Opera/Safari */
	color: #34495e;
	font-family: Roboto;
	text-transform: uppercase;
}

::-moz-placeholder { /* Firefox 19+ */
	color: #34495e;
}

:-ms-input-placeholder { /* IE 10+ */
	color: #fff;
}

.close-btn {
	position: absolute;
	top: 25px;
	right: 52px;
	cursor: pointer;
	color: #34495e;
	background: #fff;
	border: 1px solid;
	width: 60px;
	height: 30px;
	border-radius: 20px;
	outline: none;
	text-transform: uppercase;
	font-weight: bold;
	transform: translateY(-2px);
}

/*select*/
/* 검색 박스 bodx*/
.projSearch {
	position: absolute;
	top: 100%;
	left: 48%;
	transform: translate(-50%, -50%);
}

.projSearch select {
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

.projSearch::before {
	color: #34495e;
	background-color: #34495e;
}

.projSearch select option {
	padding: 30px;
	font-size: 11px;
}

.projSearch select option {
	padding: 30px;
	font-size: 11px;
}

/* 개수 선택  se*/
.select {
	position: absolute;
	top: 15%;
	left: 90%;
	transform: translate(-50%, -50%);
}

.select select {
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

.select::before {
	color: #34495e;
	background-color: #34495e;
}

.select select option {
	padding: 30px;
	font-size: 11px;
}
	</style>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="../project/projSidebar.jsp" />
		</div>
		<div class="container">
			<div class="contentBar">
				<jsp:include page="../project/projHomebar.jsp" />
			</div>
			<div class="content">

				<!-- 본문 -->

				<!-- 개수로 보기 -->
				<!-- 개수로 보기 -->
				<div style="float: right; text-align: right;" class="select">
					<select id="cntPerPage" name="sel" onchange="selChange()">
						<option value="5" selected
							<c:if test="${projPartsCount.cntPerPage == 5}">selected</c:if>>5줄
							보기</option>
						<option value="10"
							<c:if test="${projPartsCount.cntPerPage == 10}">selected</c:if>>10줄
							보기</option>
						<option value="15"
							<c:if test="${projPartsCount.cntPerPage == 15}">selected</c:if>>15줄
							보기</option>
						<option value="20"
							<c:if test="${projPartsCount.cntPerPage == 20}">selected</c:if>>20줄
							보기</option>
					</select>
				</div>
				
				
				<!-- 전체 게시판 불러오기 -->
				<table class="projParts">
				<thead>
					<tr>
						<th class="proj_code"  scope="cols" style="width: 10%;">프로젝트 코드</th>
						<th class="proj_title" scope="cols" style="width: 40%;">프로젝트명</th>
						<th class="proj_manager" scope="cols" style="width: 10%;">담당자</th>
						<th class="proj_sdate" scope="cols" style="width: 10%;">프젝 시작일</th>
						<th class="proj_edate" scope="cols" style="width: 10%;">프젝 종료일</th>
						<th class="proj_kanban" scope="cols" style="width: 10%;">칸반보드</th>
						<th class="proj_detail" scope="cols" style="width: 10%;">자세히보기</th>
					</tr>
					</thead>


					<c:forEach var="projMain" items="${projMain}">
							<tbody>
						<tr>
							<td  scope="row">${projMain.pro_code}</td>
							<td>
								<a	href="${pageContext.request.contextPath}/project/projIssMain?pro_code=${projMain.pro_code}&nowPage=${paging.startPage}&cntPerPage=${paging.cntPerPage}">${projMain.pro_title}</a>
						
							<td>${projMain.emp_info_name}</td>
							<td>${projMain.pro_sdate}</td>
							<td>${projMain.pro_edate}</td>
							<td><a href='<c:url value='/project/projKanban?pro_code=${projMain.pro_code}'/>'>칸반보드</a></td>
							<td><a href='<c:url value='/project/projDetail?pro_code=${projMain.pro_code}'/>'>자세히보기</a></td>
						</tr>
						</tbody>
					</c:forEach>
				</table>


			<!-- 뷰 페이징 처리 -->
				<div style="text-align: center;" class="pagination">
					<c:set var="projParts" />
					<c:forEach begin="${paging.startPage }" end="${paging.endPage}"	var="p">
					<c:if test="${paging.startPage != 1}">
						<a
							href="${pageContext.request.contextPath}/projParts/projPartsMain?nowPage=${paging.startPage - 1}&cntPerPage${paging.cntPerPage}">◀</a>
					</c:if>
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p}</b>
							</c:when>
							<c:when test="${ p != paging.nowPage }">
								<a
									href="${pageContext.request.contextPath}/projParts/projPartsMain?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
							</c:when>

						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage }">
						<a
							href="${pageContext.request.contextPath}/projParts/projPartsMain?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">▶</a>
					</c:if>

				</div>
				<br>




				<!-- 검색 -->

				<div id="projSearch" style="text-align: center;">
					<form id="searchForm" method="get"
						action="${pageContext.request.contextPath}/project/projSearch">
						<div class="projSearch">
							<select name="type">
								<option value="" selected>선택하기</option>
								<option value="projParts_title">제목</option>
								<option value="projParts_comt">내용</option>
								<option value="emp_info_name">작성자</option>

							</select>
						</div>
						<div class="wrapper">
							<div class="container">
								<input type="search" class="input" name="keyword"
									placeholder="Search"> <input type="submit"
									id="searchBtn btn" class="close-btn" value="검색">
							</div>
						</div>

					</form>

				</div>



				</div>
				<!--  본문 종료 -->
			</div>
		</div>


</body>
</html>