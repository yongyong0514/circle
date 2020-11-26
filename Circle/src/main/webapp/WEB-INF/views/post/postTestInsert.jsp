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
			</div>

			<div class="content">


				<div class="form">

					<div class="title">게시글 작성</div>

					<form class=form name="postInsert" action="" id="postInsert" onsubmit = "return validate();">
						<div class="inputfield">
							<label for="post_title">제목</label> <input type="text"
								class="input" id="post_title" name="post_title"
								placeholder="제목을 작성해주세요">
						</div>

						<div class="inputfield">
							<label for="post_file">파일</label> <input name="post_file"
								id="post_file" type="file" class="input" multiple="multiple">
						</div>
						<div class="inputfield">
							<label for="post_comt">본문</label>
							<textarea class="textarea" id="post_comt" name="post_comt"></textarea>
						</div>

						<div class="inputfield">
							<label for="post_sec">공개</label>
							<div class="open_select">
								<label><input type="radio" name="post_sec" value="Y"
									checked>공개</label> <label><input type="radio"
									name="post_sec" value="N">비공개</label>

							</div>



						</div>
						<div class="inputfield">
							<select>
								<c:forEach var="postType" items="${postType}">
									<option id="postType" name="postType"
										value="${postType.post_type_code}">${postType.post_type_title}</option>
								</c:forEach>
							</select>
						</div>


						<div class="inputfield">
							<input type="submit" value="글쓰기" class="btn" name="submit"
								id="submit"> <input type="reset" "value="초기화"	class="btn" name="reset" id="reset"> 
								<input type="button" value="돌아가기" class="btn" name="return" id="return">

						</div>
					</form>
				</div>

					
				</div>
			</div>
		</div>
<script>
function validate(){
	  var name = document.getElementById("name").value;
	  var subject = document.getElementById("subject").value;
	  var phone = document.getElementById("phone").value;
	  var email = document.getElementById("email").value;
	  var message = document.getElementById("message").value;
	  var error_message = document.getElementById("error_message");
	  
	  error_message.style.padding = "10px";
	  
	  var text;
	  if(post_title.length < 0){
	    text = "Please Enter valid Name";
	    error_message.innerHTML = text;
	    return false;
	  }	  if(post_comt.length <= 0){
	    text = "Please Enter More Than 140 Characters";
	    error_message.innerHTML = text;
	    return false;
	  }
	  alert("Form Submitted Successfully!");
	  return true;
	}
</script>
</body>
</html>