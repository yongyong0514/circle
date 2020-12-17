<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signConfigTemplate.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css">
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">
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
			<form id="formArea" method="post">
				<div class="contentBar">
					<div class="signHomeBar">
						<ul>
							<li class="signHomeTitle">새 전자결재 양식</li>
						</ul>
					</div>
					<div class="signHomeListBar">
						<button class="signListBtn" type="submit">작성하기</button>
					</div>
					<div class="content">
						<div class="formBox">
							<table>
								<tr>
									<th class="formBox1">제목</th>
									<th class="formBox4" colspan="3">
										<input class="formSelect2" id="sign_type_name" name="sign_type_name">
									</th>
								</tr>
								<tr>
									<th class="formBox0"></th>
								</tr>
							</table>
							<div class="formBox5" id="editor"></div>
							<textarea id="sign_type_content" name="sign_type_content" readonly></textarea>
						</div>
					</div>
				</div>
			</form>		
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
	
<!-- TUI EDITOR -->
	<script>
		var editor = new toastui.Editor({
			el : document.querySelector("#editor"),
			height : "630px",
			initialEditType : "markdown",
			previewStyle : "vertical",
		});
	</script>
	
<!-- FORM 전송 시작 전 체크 -->
	<script>
		$("#formArea").submit(function(e) {
			var base = "${pageContext.request.contextPath}";
			e.preventDefault();

			/*Include field data*/
			var isSubmit = false;
			var editorValue = editor.getHtml();
			$("#sign_type_content").val(editorValue);
			
			/*Check empty field*/
			if($("#sign_type_name").val() != '') {
							
				if(editorValue != "") {
								
					isSubmit = true;
	
				} else {
					alert('문서 내용을 입력해주세요');
					return false;
				}
							
			} else {
				alert('문서 제목을 입력해주세요');
				$("#sign_type_name").focus();
				return false;
			}
			
 			if(isSubmit) this.submit();
 			
		});
	</script>
</body>
</html>