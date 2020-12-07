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
					<div class="signConfigBtnSet">
						<div class="signConfigArea" id="signPreview">
							<img class="imgBox" src=""/>
							<input type="file" name="fileUpload" id="fileUpload" accept="img/*">
						</div>
						<button class="signConfigBtn">결재 서명 등록</button>
						<ul id="signSelect">
							<li>
								<button class="submitAgree">이미지 선택<br><a class="fontSize1">선택한 이미지로 결재합니다</a></button>&nbsp;&nbsp;&nbsp;
								
								<button class="submitDenied">서명 작성하기<br><a class="fontSize1">입력한 서명으로 결재합니다</a></button>
							</li>
						</ul>
					</div>
					
					<div class="signConfigBtnSet">
						<div class="signConfigArea"></div>
						<button class="signConfigBtn">결재 문서 양식 등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- SCRIPT 영역 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

<!-- 첨부 파일 시작 -->
 	<script>
		$(".submitAgree").click(function(e){
			 $('input[type=file]').trigger('click');
		});
		
		$('input[type=file]').on('change', function(e) {
			var base = "${pageContext.request.contextPath}";
			var uploadURL = base + "/sign/signFilesSignature";
			var empCode = ${empInfo.emp_info_emp_no};
			var formData = new FormData();
			var reader = new FileReader;
			var inputFile = this.files;
			if(this.files && this.files[0]) {
				reader.onload = function(data) {
					$("#signPreview img").attr("src", data.target.result).width(100).height(100);        
				}
			}
			
			formData.append('file', inputFile[0]);
			
			console.log(formData);
			$.ajax({
				url : uploadURL,
				type: "POST",
                contentType:false,
                processData: false,
                cache: false,
                data: {formData
                	 , empCode: empCode}, 
                success: function(data){
                }
			});
		});
	</script>
</body>
</html>