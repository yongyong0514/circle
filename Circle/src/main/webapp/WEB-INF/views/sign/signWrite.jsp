<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signWrite.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
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
				<form role="form" method="post" action="/sign/signWrite">
					<div class="contentBar">
						<jsp:include page="../sign/signWriteBar.jsp" />
						<div class="signHomeListBar">
							<button class="signListBtn" type="submit">작성하기</button>
						</div>
						<div class="content">
							<div class="formBox">
							<table>
								<tr>
									<th class="formBox1">작성자</th>
									<th class="formBox2"><input type="text" class="formInput1" id="emp_info_name" name="emp_info_name" value="" readonly></th>
									<th class="formBox1">직급</th>
									<th class="formBox2"><input type="text" class="formInput1" id="job_info_name" name="job_info_name" readonly></th>
								</tr>
								<tr>
									<th class="formBox1">보존 연한</th>
									<th class="formBox2">
										<select class="formSelect1" id="sign_keep" name="sign_keep">
											<option value="365">1 년</option>
											<option value="1095">3 년</option>
											<option value="1825">5 년</option>
											<option value="3650">10 년</option>
											<option value="null">영구</option>
										</select>
									</th>
									<th class="formBox1">보안 등급</th>
									<th class="formBox2">
										<select class="formSelect1" id="sign_acc" name="sign_acc">
											<option value="1">S 등급</option>
											<option value="2">A 등급</option>
											<option value="3">B 등급</option>
											<option value="4">C 등급</option>
										</select>
									</th>
								</tr>
								<tr>
									<th class="formBox1">문서 유형</th>
									<th class="formBox4" colspan="3">
										<select class="formSelect2" id="signType" name="signType">
												<option value="0">문서 유형을 선택하세요</option>
											<c:forEach var="item" items="${list}">
												<option value="${item.sign_type_code}">${item.sign_type_name}</option>
											</c:forEach>
										</select>
									</th>
								</tr>
								<tr>
									<th class="formBox1">제목</th>
									<th class="formBox4" colspan="3"><input type="text" class="formInput2" id="sign_title" name="sign_title"></th>
								</tr>
								<tr>
									<th class="formBox0"></th>
								</tr>
							</table>							
							<div class="formBox5" id="editor" class="sign_note">
							</div>
						</div>
						<div class="formRight">
						</div>
					</div>
				</div>
			</form>
		</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script>
        var editor = new toastui.Editor({
            el:document.querySelector("#editor"),
            height: "630px",
            initialEditType:"wysiwyg",
            hooks:{
                "addImageBlobHook":function(blob, callback){
                    var fd = new FormData();
                    fd.append("im", blob);

                    $.ajax({
                        url:"http://localhost:8089/spring18/toast/upload",
                        type:"post",
                        data:fd,
                        processData:false,
                        contentType:false,
                        success:function(result){
                            callback(result);
                        }
                    });
                }
            },
        });        
    </script>
<!-- 왼쪽바 고정 추가 옵션 시작 -->

	<script>
		$(function() {
    		var leftBar = $(".leftBar").offset().top;
    			$(window).scroll(function() {
    		var window = $(this).scrollTop();
    		if(leftBar <= window) {
    			$(".leftBar").addClass("fixed");
    		} else {
    			$(".leftBar").removeClass("fixed");
    			}
    		})
    	});
    </script>
<!-- 문서 종류 옵션 시작 -->

	<script>
			$("#signType").on("change", function() {
				var base = "${pageContext.request.contextPath}";				
				var typeCode = $("#signType").val();
				$.ajax({
					url: base + "/signResult/signTypeContent",
					type : "get",
					data : {typeCode : typeCode},
					success : function(data) {
						editor.setHtml(data.result);
					}
				});
			});
	</script>
<!-- 결재자 추가 시작 -->
	<script>
		function signJoiner() {
			$("#joinerSelect").fadeIn(100);
		};
	</script>
	<script>
	</script>
</body>
</html>