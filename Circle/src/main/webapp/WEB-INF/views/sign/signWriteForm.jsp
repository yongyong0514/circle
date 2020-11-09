<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sign/signWriteForm.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
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
			<div class="signWriteFormBar1">
				<ul>
					<li class="signWriteTitle">새 전자결재 문서 유형</li>
				</ul>
			</div>
			<div class="signWriteFormBar2">
				<ul>
					<li><button class="signWriteFormBtn">작성하기</button></li>
				</ul>
			</div>
				<div class="formArea">
					<div class="formBox">
						<table>
							<tr>
								<th class="formBox1">문서 유형</th>
								<th class="formBox4"><input type="text" class="formInput2"></th>
							</tr>
							<tr>
								<th class="formBox1">제목</th>
								<th class="formBox4"><input type="text" class="formInput2"></th>
							</tr>
							<tr>
								<th class="formBox0"></th>
							</tr>
						</table>							
						<div class="formBox5" id="editor">
						</div>
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