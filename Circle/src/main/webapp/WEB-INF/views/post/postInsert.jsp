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
		<jsp:include page="../common/menuTopBar.jsp" />
		<jsp:include page="../common/menuAlertBar.jsp" />

		<div class="navLeft">
			<jsp:include page="../post/postSidebar.jsp" />
		</div>
		<div class="content">
			<div>
				<jsp:include page="../post/postHomebar.jsp" />
				<jsp:include page="../post/postType.jsp" />

			</div>
			<div class="wrapper">


				<form>
					<div class="form">

						<div class="title">게시글 작성</div>
						<div class="form">
							<div class="inputfield">
								<label for="post_title">제목</label> <input type="text"
									class="input" id="inputForm" name="post_title"
									placeholder="제목을 작성해주세요">
							</div>

							<div class="inputfield">
								<label for="post_file">파일</label> <input name="post_file"
									type="file" class="input" multiple="multiple">
							</div>
							<div class="inputfield">
								<label for="post_comt">본문</label>
								<textarea class="textarea" name="post_comt"></textarea>
							</div>

							<div class="inputfield">
								<label for="post_sec">공개</label>
								<div class="open_select">
									<select name="post_sec">
										<option value="open">공개</option>
										<option value="close">비공개</option>
									</select>
								</div>
								<div class="inputfield">
									<label for="post_type">게시판 선택</label>
									<div class="type_select">
										<select name="post_type">
											<option value="post_type">공개</option>
											<option value="close">비공개</option>
										</select>
									</div>

									<br>
									<div class="inputfield">
										<input type="submit" value="글쓰기" class="btn" name="submit"
											id="submit">
									</div>
								</div>
							</div>
						</div>
						</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>