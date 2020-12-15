<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.body {

	max-width: 500px;
	width: 100%;
	background: #fff;
	margin: 50px auto;
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.125);
	padding: 30px;
}

.body .titleb {
	font-size: 24px;
	font-weight: 700;
	margin-bottom: 25px;
	color: #34495e;
	text-transform: uppercase;
	text-align: center;
}

.body .headb {
	font-size: 14px;
	font-weight: 700;
	margin-bottom: 25px;
	color: #34495e;
	text-transform: uppercase;
	text-align: right;
}

.body .headb2 {
	font-size: 16px;
	left: 90%;
	font-weight: 700;
	margin-bottom: 25px;
	color: #34495e;
	text-transform: uppercase;
	text-align: center;
}
.body .headb3 {
font-size: 15px;
	font-weight: 700;
	margin-bottom: 25px;
	color: #34495e;
	text-transform: uppercase;
	text-align: right;
}

.body  .no {
	position: absolute;
	width: 100px;
	padding: 8px 10px;
	font-size: 15px;
	border: 0px;
	background: #0072c6;
	color: #fff;
	cursor: pointer;
	border-radius: 3px;
	outline: none;
	left: 58%
}

.body.no:hover {
	background: #dbe5f1;
}

/*버튼 구현*/



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


table.projParts2 {
	border-collapse: collapse;
	text-align: left;
	width: 80%;
	lin-height: 1.5;
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
}

table.projParts2 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.projParts2 tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.projParts2 td {
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
	top: 23.5px;
	right: 53px;
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
	color: bla;
	padding: 12px;
	height: 25px;
	width: 120px;
	font-size: 15pt;
	border: none;
	font-size: 10px;
	box-shadow: 0 5px 25px rgba(0, 0, 0, 0.2);
	-webkit-appearance: button;
	appearance: button;
	outline: none;
	width: 120px;
	font-size: 15pt;
}

.projSearch::before {
	color: #34495e;
	background-color: #34495e;
}

.projSearch select option {
	padding: 30px;
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
	color: bla;
	padding: 12px;
	height: 30px;
	width: 120px;
	font-size: 10pt;
	border: none;
	font-size: 10px;
	box-shadow: 0 5px 25px rgba(0, 0, 0, 0.2);
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
}
</style>

<!--  본문 -->

<!-- 헤드 -->


<div class="body">

	<c:forEach var="projDetail" items="${projDetail}">
		<div class="titleb">
			<label>제목</label>
			<h2>${projDetail.pro_title}</h2>
		</div>
		<div class="headb">
			<label>담당자</label>
			<h5>${projDetail.emp_info_name}</h5>
		 <label> 시작일 : <fmt:formatDate
					value="${projDetail.pro_sdate}" pattern="yyyy.MM.dd" /></label> <label>
					<br>
				종료일 : <fmt:formatDate value="${projDetail.pro_edate}"
					pattern="yyyy.MM.dd" />
			</label>
		</div>
		<div class="headb2">
			${projDetail.pro_intro}</div>
	</c:forEach>
	<br>
	<div class="headb3">
		<label>프로젝트 맴버 리스트</label>
<br>	
		<c:forEach var="projMemberlist" items="${projMemberlist}">
		${projMemberlist.emp_info_name }
		</c:forEach>
	</div>
	
		<button class="no">변경하기</button>
</div>


<div>
	<table class="projParts">
		<tr>
			<th class="iss_title" scope="cols" style="width: 50%;">참여 업무명</th>
			<th class="emp_info_name" scope="cols" style="width: 10%;" >담당자</th>
			<th class="prog_title" scope="cols" style="width: 20%;" >업무 진행단계</th>
			<th class="situ_title" scope="cols" style="width: 20%;">업무 상황</th>

		</tr>

		<c:forEach var="projDetail2" items="${projDetail2}">
			<tr>

				<td cope="row" ><a
					href='<c:url value='/project/projIssDetail?iss_code=${projDetail2.iss_code}'/>'>${projDetail2.iss_title}</a></td>
				<td >${projDetail2.emp_info_name}</td>
				<td>${projDetail2.prog_title}</td>
				<td >${projDetail2.situ_title}</td>
			</tr>
		</c:forEach>


	</table>
</div>

<!-- 바디 -->
<div>

	<table class="projParts">
		<tr>
			<th class="iss_title"  scope="cols" style="width: 50%;">관련 업무명</th>
			<th class="pro_title" scope="cols" style="width: 20%;">작성자</th>
			<th class="prog_title" scope="cols" style="width: 30%;">파일명</th>
		</tr>
		<c:forEach var="projDetail3" items="${projDetail3}">
			<tr>
				<td  cope="row"><a
					href='<c:url value='/project/projIssDetail?iss_code=${projDetail3.iss_code}'/>'>${projDetail3.iss_title}</a></td>
				<td>
				<td>${projDetail3.emp_info_name }</td>
				<td><a
					href='<c:url value='/project/projDownload?files_code=${projDetail3.files_code}'/>'>${projDetail3.files_oname}</a></td>
			</tr>
		</c:forEach>
	</table>

</div>



