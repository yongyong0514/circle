<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signList.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signSelectOne.css">
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />
	</div>
	<div class="leftBar">
		<jsp:include page="../sign/signLeftBar.jsp" />
	</div>
	<div class="container">
		<div class="contentBar">
			<jsp:include page="../sign/signHomeBar.jsp" />
			<jsp:include page="../sign/signHomeListBar.jsp" />
		</div>
		<div class="content">
			<div class="resultArea1">
				<div class="signBar1">
					<ul>
						<li class="resultBox4">
							<input type="text" class="signDate" value="2020-11-11" readonly> 
							<input type="text" class="signDate" value="09:50E" readonly>
						</li>
						<li class="resultBox4">
							<input type="text" class="signDate" value="2020-11-11" readonly>
							<input type="text" class="signDate" value="10:50S" readonly>
						</li>
						<li class="resultBox3">
							<button class="signSee">
								<img src="${pageContext.request.contextPath}/resources/img/sign/share.png" class="imgSize">
							</button>
						</li>
						<li class="resultBox3">
							<button class="signJoin">
								<img src="${pageContext.request.contextPath}/resources/img/sign/add-contact.png" class="imgSize">
							</button>
						</li>
						<li class="imgBox2">
							<input type="text" class="signCount" value="4" readonly>
						</li>
						<li class="resultBox2">
							<input type="text" class="signWriter" value="작성자" readonly>
							<input type="text" class="signWriter" value="직위" readonly>
						</li>
						<li class="imgBox1">
							<img src="${pageContext.request.contextPath}/resources/img/sign/chat.png" class="img1">
						</li>
						<li class="resultBox1">
							<input type="text" class="signType" value="기안문서" readonly>
							<input type="text" class="signTitle" value="기안 바랍니다아아아아앙아아아아아sfdsdfs앙아아앙앙" readonly>
						</li>
					</ul>
				</div>
			</div>
			<div>
				<jsp:include page="../sign/signHomeListBar2.jsp" />
			</div>
			<div class="resultArea1"></div>
		</div>
	</div>
</body>
</html>