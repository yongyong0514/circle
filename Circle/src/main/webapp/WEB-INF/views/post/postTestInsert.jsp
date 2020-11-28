<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Circle</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/post/postInsert.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

</head>
<body>

	<div class="wrap">
		<div class="header">
			<jsp:include page="../common/menuTopBar.jsp" />
			<jsp:include page="../common/menuAlertBar.jsp" />
		</div>
		<div class="leftBar">
			<jsp:include page="../post/postSidebar.jsp" />
		</div>
		<div class="container">
			<div class="contentBar">
				<jsp:include page="../post/postHomebar.jsp" />
	<script>
		// 넘어오는 변수으로 페이지 이동하기
		function moveurl(url) {
			location.href = url;
		}
	</script>
			</div>

			<div class="content">
<!--  본문 -->

				<div class="form">

					<div class="title">게시글 작성</div>

					 <form action="postTestInsert" id= "postForm" method="post" enctype="multipart/form-data">
						<div class="inputfield">
							<label for="post_title">제목</label> <input type="text"
								class="input" id="post_title" name="post_title"
								placeholder="제목을 작성해주세요">
						</div>
						<div class="inputfield">
							<label for="post_file">파일</label> <input name="post_file"
								id="post_file" type="file" class="input" accept="*.*" multiple="multiple">
						</div> 
						<div class="inputfield">
							<label for="post_comt">본문</label>
							<textarea class="textarea" id="post_comt" name="post_comt"></textarea>
						</div>

						<div class="inputfield">
							<label for="post_sec">공개</label>
							<div class="post_select">
								<label><input type="radio" name="post_sec" value="Y"checked>공개</label> 
								<label><input type="radio"  name="post_sec" value="N">비공개</label>
							</div>

						</div>
				
						<div class="inputfield">
							<input type="submit" value="글쓰기" class="btn" name="submit" id="btnSubmit" onclick="submit(); return false;">
							<input type="reset" value="초기화" class="btn" name="reset" id="reset"> 
							<input type="button" value="돌아가기" class="btn" name="return" id="return">

						</div>
					</form>
				</div>

<!-- 본문 종료" -->					
				</div>
			</div>
		</div>
		
		<script>
		$(document).ready(finction() {
			
			$("#btnSubmit").click(function (event) {
				
				event.preventDefault();
				var post_title = $("input[post_type='post_type']").val;
				alert(post_title);
				fir_ajax_submit(post_title);
			})
			
		});
		
		function fire_ajax_submit(submit)
		
		
		
		</script>
		
<script>

function submit(){
	var form = $("post")[0];
	var formData = new Post(form);
	
	$ajax({
		cache: false,
		url : "${pageContext.request.contextPath}/post/postTestPart",
		type : "POST",
		data:  {"post_title" : "post_title"}
		
		processData: false,
		contentType: false,
		data : postData,
		sucess : function(data) {
			var jsonObj = JSON.parse(data);
		},
		
		error : function(data) {
			alert("다시");
		}
		
	});
}
</script>
</body>
</html>