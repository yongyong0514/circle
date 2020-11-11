<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<div class="container">
			<div class="navLeft">
				<jsp:include page="../sign/signLeftBar.jsp" />
			</div>
			<div class="content">
				<div>
					<jsp:include page="../sign/signWriteBar.jsp" />
					<jsp:include page="../sign/signHomeWriteBar.jsp" />
				</div>
				<div class="formArea">
					<div class="formBox">
						<table>
							<tr>
								<th class="formBox1">작성자</th>
								<th class="formBox2"><input type="text" class="formInput1" readonly></th>
								<th class="formBox1">직급</th>
								<th class="formBox2"><input type="text" class="formInput1" readonly></th>
							</tr>
							<tr>
								<th class="formBox1">보존 연한</th>
								<th class="formBox2"><select class="formSelect1"></select></th>
								<th class="formBox1">보안 등급</th>
								<th class="formBox2"><select class="formSelect1"></select></th>
							</tr>
							<tr>
								<th class="formBox1">문서 유형</th>
								<th class="formBox4" colspan="3"><select class="formSelect2"></select></th>
							</tr>
							<tr>
								<th class="formBox1">제목</th>
								<th class="formBox4" colspan="3"><input type="text" class="formInput2"></th>
							</tr>
							<tr>
								<th class="formBox0"></th>
							</tr>
						</table>							
						<div class="formBox5" id="editor">
						</div>
					</div>
					<div>
						<table>
							<tr>
								<th class="formBox6"><button class="formBtn1">결재자 추가</button></th>
							</tr>
							<tr>
								<th class="formResult1">
								</th>
							</tr>
							<tr>
								<th class="formBox6"><button class="formBtn1">참조자 추가</button></th>
							</tr>
							<tr>
								<th class="formResult1">
								</th>
							</tr>							
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script>
        var editor = new toastui.Editor({
            el:document.querySelector("#editor"),
            height:"630px",
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
</body>
</html>