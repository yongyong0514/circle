<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/addressBook/addressBookDetail.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="components/addressBookLeftBar.jsp" />
		</div>
		<div class="container">
			<div class="content">
				<form action="#" method="GET">
				
					<table class="detailTable">
						<tr>
							<td>사진</td>
							<td><img src="#">&nbsp;&nbsp;<button value="remove">삭제하기</button></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" value="가나다"></td>
						</tr>
						<tr>
							<td>휴대전화</td>
							<td><input type="text" value="010-1234-1234"></td>
						</tr>	
						<tr>
							<td>이메일</td>
							<td><input type="text" value="abc@gmail.com"></td>
						</tr>
						<tr>
							<td>회사</td>
							<td><input type="text" value="까까오컴퍼니"></td>
						</tr>
						<tr>
							<td>직위/직책</td>
							<td><input type="text" value="대리"></td>
						</tr>
						<tr>
							<td>주소록</td>
							<td><input type="text" value="협력업체" readonly></td>
						</tr>
						<tr>
							<td>비고</td>
							<td><textarea></textarea></td>
						</tr>
					</table>

					<!-- 액션버튼 시작 -->
					<br><br>
					<input class="actionBtn" id="edit" type="submit" value="수정"/>
					<input class="actionBtn" id="reset" type="reset" value="취소"/>
					<input class="actionBtn" id="goList" type="button" value="목록으로 이동"/>
					<input class="actionBtn" id="remove" type="button" value="삭제"/>
					<!-- 액션버튼 끝 -->
				</form>
			</div>
		</div>
	</div>

	<!-- 왼쪽바 고정 추가 옵션 시작-->
	<script>
		$(function() {
    		var leftBar = $(".leftBar").offset().top;
    			$(window).scroll(function() {
    		var window = $(this).scrollTop();
    		console.log(leftBar+"left");
    		console.log(window+"window");
    		if(leftBar <= window) {
    			$(".leftBar").addClass("fixed");
    		} else {
    			$(".leftBar").removeClass("fixed");
    			}
    		})
    	});
    </script>
</body>
</html>