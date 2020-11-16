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
	href="${pageContext.request.contextPath}/resources/css/post/postAdd.css">
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
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />

		<div class="navLeft">
			<jsp:include page="../post/postSidebar.jsp" />
		</div>
		<div class="content">
			<div>
				<jsp:include page="../post/postHomebar.jsp" />
			</div>

			<!-- 내용  1dd-->
			<form action="add" method="post">
			<div class="wrapper">
				<div class="title">
					<h1>게시글쓰기</h1>
				</div>
				<div class="contact-form">
					<div class="input-fields">
						<input type="text" class="input" placeholder="제목"> <br>
						<br>

						<!--  -->

						<div class="select-box">
							<div class="options-container">

								<div class="option">
									<input type="radio" class="radio" id="notice" name="category" />
									<label for="film">공지 게시판</label>
								</div>

								<div class="option">
									<input type="radio" class="radio" id="company" name="category" />
									<label for="science">전사 게시판</label>
								</div>

								<div class="option">
									<input type="radio" class="radio" id="employee" name="category" />
									<label for="art">사원 게시판</label>
								</div>


							</div>

							<div class="selected">게시판을 선택하시오</div>
						</div>
						<!--  -->

						<br>
						<!-- -->
						<br>

						<div class="radio-group">

							<label class="radio"> <input type="radio" value="open"
								name="post_sec"> 공개 <span></span>
							</label> <label class="radio"> <input type="radio" value="close"
								name="post_sec"> 비공개 <span></span>
							</label>
						</div>
						<br>
						<br>

						<div class="filebutton">
							<input type="file" class="upload-box" value="파일 선택" />
						</div>
						
					</div>
					<div class="msg">
						<textarea placeholder="내용을 작성하세요"></textarea>
						<input type="submit" class="btn" value="send" />
					</div>
				</div>
			</div>
			</form>


		</div>

</div>


		<script src="<c:url value="/resources/js/post/postAdd.js" />"></script>
</body>
</html>