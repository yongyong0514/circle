<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signSelectOne.css">

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
					<div>
						<jsp:include page="../sign/signHomeBar.jsp"/>
						<jsp:include page="../sign/signSelectOneListBar.jsp"/>
						<jsp:include page="../sign/signSelectOneBar.jsp"/>
					</div>
				<div class="formArea">
					<div class="formBox">
						<table>
							<tr>
								<td class="formBox0" colspan="2"></td>
							</tr>
							<tr>
								<td class="formBox2" rowspan="2"><%-- <img src="${pageContext.request.contextPath}/resources/img/sign/chat.png" class="img2"> --%></td>
								<td class="formBox3"><input type="text" class="formResult2" value="이름공간" readonly></td>
							</tr>
							<tr>
								<td class="formBox3"><input type="text" class="formResult2" value="부서/팀이름" readonly></td>
							</tr>
							<tr>
								<td class="formBox4" colspan="2">제목공간</td>
							</tr>
							<tr>
								<td class="formBox5" colspan="2">내용공간</td>
							</tr>
							<tr>
								<td class="formBox6" colspan="2">댓글 달리는 자리</td>
							</tr>
							<tr>
								<td class="formBox7" colspan="2">결재 진행 상태</td>
							</tr>
							<tr>
								<td class="formBox8" colspan="2">댓글 결제란</td>
							</tr>
						</table>
					</div>
					<div>
						<table>
							<tr>
								<th class="formBox1"><button class="formBtn1">결재자</button></th>
							</tr>
							<tr>
								<th class="formResult1"></th>
							</tr>
							<tr>
								<th class="formBox1"><button class="formBtn1">참조자</button></th>
							</tr>
							<tr>
								<th class="formResult1"></th>
							</tr>											
						</table>
					</div>					
				</div>

			</div>
		</div>
	</div>
</body>
</html>