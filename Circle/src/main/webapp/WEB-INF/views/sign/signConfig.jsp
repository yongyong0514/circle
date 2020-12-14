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
							<c:forEach var="file" items="${list2}">
								<div class="case2">
									<img class="imgSize3" src="${pageContext.request.contextPath}/sign/sfsDownload?fileCode=${file.files_code}">
								</div>
							</c:forEach>
							<img class="imgBox" src=""/>
							<input type="file" name="fileUpload" id="fileUpload" accept="img/*">
						</div>
						<button class="signConfigBtn1">결재 서명 등록</button>
						<ul id="signSelect">
							<li>
								<button class="submitAgree">이미지 선택<br><a class="fontSize1">선택한 이미지로 결재합니다</a></button>&nbsp;&nbsp;&nbsp;
								
								<button class="submitDefault">서명 작성하기<br><a class="fontSize1">입력한 서명으로 결재합니다</a></button>
							</li>
						</ul>
					</div>
					<div id="signModalForm">
						<div class="signModalArea">
							<table>
								<tr>
									<th>
										<div class="signModalTitle">${empInfo.emp_info_name}&nbsp;${empInfo.job_info_name}&nbsp;님께서 등록하신 결재 서명입니다(최대 5개까지 등록 가능합니다)</div>
									</th>
									<th>
										<div class="signModalClose">x</div>
									</th>
								</tr>
								<tr>
									<th colspan="2">
										<div class="signModalImgList">
											<div>&nbsp;</div>
											<c:forEach var="file" items="${list}">
												<div class="case1">
													<div class="imgDel">삭제</div>
													<img class="imgSize2" src="${pageContext.request.contextPath}/sign/sfsDownload?fileCode=${file.files_code}">
												</div>
											</c:forEach>
											<div class="casePlus">
												<img class="imgSize1" src="${pageContext.request.contextPath}/resources/img/sign/addImage.png">
												<br>
												<br>
												이미지 추가
											</div>
										</div>
									</th>
								</tr>
							</table>
						</div>
						<div class="signModalLayer"></div>
					</div>
					<div id="signModalForm1">
						<div class="signModalArea1">
							<div id="signature-pad" class="m-signature-pad">
								<div class="signModalClose1">x</div>
        						<div class="m-signature-pad--body">
        							<canvas></canvas>
								</div>
        						<div class="m-signature-pad--footer">
            					<div class="description">기본으로 사용할 서명을 작성해주세요</div>
            						<button type="button" class="button save" data-action="save">저장</button>
            						<button type="button" class="button clear" data-action="clear">지우기</button>
        						</div>
    						</div>
    					</div>
					</div>
					<div class="signConfigBtnSet">
						<div class="signConfigArea"></div>
						<button class="signConfigBtn2">결재 문서 양식 등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- SCRIPT 영역 -->
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery.min.js"></script>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/sign/signature_pad.min.js" type="text/javascript"></script>



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
    	$(".signConfigBtn1").click(function(){
    		$("#signSelect").fadeIn(100);
    	});
    </script>
    
    <script>
    	$("#signSelect").mouseleave(function(){
    		$("#signSelect").fadeOut(100);
    	});
    </script>

	
<!-- 결재 서명 파일 시작 -->
	<script>
		$(".submitAgree").click(function(){
			$("#signModalForm").attr("style", "display: block");
		});
	</script>
	
	<script>
		$(".signModalClose").click(function(){
			$("#signModalForm").attr("style", "display: none");
		});
	</script>
  	
  	<script>
		$(".casePlus").click(function(e){
			 $('input[type=file]').trigger('click');
		});
	</script>
	
	<script>
		$('input[type=file]').on('change', function(e) {
			if(this.files){
				var base = "${pageContext.request.contextPath}";
				var uploadURL = base + "/signResult/signFilesSignature";
				var empCode = ${empInfo.emp_info_emp_no};
				var inputFile = this.files;
				var formData = new FormData();
				
				formData.append('file', inputFile[0]);
				formData.append('empCode', empCode);
				
				$.ajax({
					url : uploadURL,
					type: "POST",
	                contentType:false,
	                processData: false,
	                cache: false,
	                data: formData, 
	                success: function(data){
	                	location.href = "${pageContext.request.contextPath}/sign/signConfig";
	                }, 
	                error: function(data){
	                	alert("error");
	                }
	            });
			}
		});
	</script>
	
 	<script>
		$(".imgDel").click(function(){
			var base = "${pageContext.request.contextPath}";
			var uploadURL = base + "/signResult/sfsDelete";
			var tag1 = $(this).next();
			var tag2 = tag1[0].currentSrc;
			var fileCode = tag2.split("=");
			
			$.ajax({
				url: uploadURL,
				type: "POST",
				data: {fileCode: fileCode[1]},
				success: function(){
					location.reload(true);
				}
			});
		});
	</script>
	<!-- 주석처리 -->


    
<!-- 결재 필수 서명 파일 시작 -->
	<script>
		$(".submitDefault").click(function(){
			$("#signModalForm1").attr("style", "display: block");
			signLaunch();
		});
	</script>
	
	<script>
		$(".signModalClose1").click(function(){
			$("#signModalForm1").attr("style", "display: none");
		});
	</script>
	
	<script>
		$("#signModalForm1").mouse
	</script>	
	<script>
		function signLaunch(){
    	    var canvas = $("#signature-pad canvas")[0];
    	    var sign = new SignaturePad(canvas, {
    	        minWidth: 5,
    	        maxWidth: 10,
   	       	 	penColor: "rgb(66, 133, 244)"
   	    	});
   	      
        	$("[data-action]").on("click", function(){
            	if ( $(this).data("action")=="clear" ){
                	sign.clear();
            	}
            	else if ( $(this).data("action")=="save" ){
                	if (sign.isEmpty()) {
                    	alert("서명을 작성해주세요");
                	} else {
                    	$.ajax({
                        	url : "save.jsp",
                        	method : "post",
                        	dataType : "json",
                        	data : {
                        	    sign : sign.toDataURL()
                        	},
                        	success : function(r){
                        	    alert("저장완료 : " + r.filename);
                        	    sign.clear();
                        	},
                        	error : function(res){
                        	    console.log(res);
                        	}
                    	});
                	}
            	}
        	});
         
         
        	function resizeCanvas(){
            	var canvas = $("#signature-pad canvas")[0];
     
            	var ratio =  Math.max(window.devicePixelRatio || 1, 1);
            	canvas.width = canvas.offsetWidth * ratio;
            	canvas.height = canvas.offsetHeight * ratio;
            	canvas.getContext("2d").scale(ratio, ratio);
        	}
         
        	$(window).on("resize", function(){
            	resizeCanvas();
        	});
 
        	resizeCanvas();
		}
    </script>
</body>
</html>