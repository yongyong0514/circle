<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signConfig.css">
</head>
<body>
	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="../sign/signLeftBar.jsp" />
		</div>
		<div>
			<c:import url="/organChart/getInfo"/>
		</div>
		<div class="container">
			<div class="contentBar">
				<jsp:include page="../sign/signConfigBar.jsp" />
				<jsp:include page="../sign/signConfigListBar.jsp" />
			</div>
			<div class="content">
				<div class="signConfigBtnArea">
					<table>
						<tr>
							<td>
								<div class="signConfigArea"></div>
							</td>
							<td>
								<div class="signConfigArea"></div>
								</td>
						</tr>
						<tr>
							<td>
								<button class="signConfigBtn">결재 확인 인장 설정</button>
								<ul id="signSelect">
									<li>
										<button class="submitAgree">이미지 선택<br><a class="fontSize1">선택한 이미지로 결재합니다</a></button>&nbsp;&nbsp;&nbsp;
										<button class="submitDenied">서명 작성하기<br><a class="fontSize1">입력한 서명으로 결재합니다</a></button>
									</li>
								</ul>
							</td>
							<td>
								<button class="signConfigBtn">전자 결재 문서 등록</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
<!-- SCRIPT 영역 -->
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery.min.js"></script>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 왼쪽바 고정 추가 옵션 시작 -->
	<script>
		$(function() {
			var leftBar = $(".leftBar").offset().top;
			$(window).scroll(function() {
				var window = $(this).scrollTop();
				if (leftBar <= window) {
					$(".leftBar").addClass("fixed");
				} else {
					$(".leftBar").removeClass("fixed");
				}
			})
		});
	</script>
    <script>
    	$(".signConfigBtn").click(function(){
    		$("#signSelect").fadeIn(100);
    	});
    </script>
    
    <script>
    	$("#signSelect").mouseleave(function(){
    		$("#signSelect").fadeOut(100);
    	});
    </script>
</body>
</html>